package com.app;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.jdo.JDOHelper;
import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.labs.repackaged.org.json.JSONArray;
import com.google.appengine.labs.repackaged.org.json.JSONException;
import com.google.appengine.labs.repackaged.org.json.JSONObject;
import com.google.cloud.sql.jdbc.Connection;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import model.Contact;
import model.Contact2;

public class CreateContact2 extends HttpServlet {

	public boolean checkContact(String key, String con) {
		boolean contactFlag = false;
		PersistenceManager pm = JDOHelper.getPersistenceManagerFactory("transactions-optional").getPersistenceManager();

		javax.jdo.Query q = pm.newQuery(Contact.class);
		q.setFilter("userKey == ukey && contactName == contactname");
		q.declareParameters("String ukey,String contactname");

		String userName = con;

		List<Contact2> results = null;
		String json1;
		System.out.println(userName);
		Gson a = new GsonBuilder().disableHtmlEscaping().create();

		try {
			results = (List<Contact2>) q.execute(key, con);
			if (results.size() == 0) {
				contactFlag = true;
			} else {
				contactFlag = false;
			}
		} catch (Exception e) {

		}

		return contactFlag;
	}

	private static Map getMap(JSONObject object) {
		Map<String, Object> map = new HashMap<String, Object>();

		Object jsonObject = null;
		String key = null;
		Object value = null;

		try {
			Iterator<String> keys = object.keys();
			while (keys.hasNext()) {

				key = null;
				value = null;

				key = keys.next();

				if (null != key && !object.isNull(key)) {
					value = object.get(key);
				}

				if (value instanceof JSONObject) {
					map.put(key, getMap((JSONObject) value));
					continue;
				}

				if (value instanceof JSONArray) {
					JSONArray array = ((JSONArray) value);
					List list = new ArrayList();
					for (int i = 0; i < array.length(); i++) {
						jsonObject = array.get(i);
						if (jsonObject instanceof JSONObject) {
							list.add(getMap((JSONObject) jsonObject));
						} else {
							list.add(jsonObject);
						}
					}
					map.put(key, list);
					continue;
				}

				map.put(key, value);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return map;
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("init");

		String data = "";
		HashMap<String, ArrayList> MobileNo = new HashMap<String, ArrayList>();
		HashMap<String, ArrayList> EmailID = new HashMap<String, ArrayList>();

		StringBuilder builder = new StringBuilder();
		BufferedReader reader = req.getReader();
		String line, sessionkey = null;

		while ((line = reader.readLine()) != null) {
			builder.append(line);
		}
		data = builder.toString();
		try {
			System.out.println(data);
			JSONObject object = new JSONObject(data);
			System.out.println("Printing Email from json object" + object.getJSONObject("mobile"));

			MobileNo = (HashMap<String, ArrayList>) getMap(object.getJSONObject("mobile"));
			EmailID = (HashMap<String, ArrayList>) getMap(object.getJSONObject("email"));

			System.out.println("Testing with New COntact Design");
			System.out.println(MobileNo);
			System.out.println("Map to String " + MobileNo.toString());
			Gson g2 = new Gson();
			System.out.println("JSON from MAP " + g2.toJson(MobileNo));
			String jsonText = object.toString();

			Contact2 contact = new Contact2();
			Gson s = new Gson();
			contact = s.fromJson(jsonText, Contact2.class);

			contact.setEmail(EmailID);
			contact.setMobileNo(MobileNo);
			contact.makeString();
			PersistenceManager pm = JDOHelper.getPersistenceManagerFactory("transactions-optional")
					.getPersistenceManager();
			try {
				pm.makePersistent(contact);
				System.out.println("ADDED");
				resp.getWriter().write("200");

			} finally {
				pm.close();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		System.out.println("Trigger from CreateContact Servlet");
	}
}
