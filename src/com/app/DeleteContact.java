package com.app;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.List;

import javax.jdo.JDOHelper;
import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.appengine.labs.repackaged.org.json.JSONException;
import com.google.appengine.labs.repackaged.org.json.JSONObject;

import model.Contact2;

public class DeleteContact extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		String data1 = "";
		StringBuilder builder = new StringBuilder();
		BufferedReader reader = req.getReader();
		String line,sessionkey = null;
		
		while ((line = reader.readLine()) != null) {
			builder.append(line);
		}
		data1 = builder.toString();
		

	System.out.println("Hello");
	System.out.println(data1);
	PersistenceManager pm = JDOHelper.getPersistenceManagerFactory("transactions-optional").getPersistenceManager();
	JSONObject json = null;

	try {
		json = new JSONObject(data1);
		System.out.println("customer email in delete servlet ( json ) :" + json);
		String customerEmail = json.get("userKey").toString();
		String conName =json.get("contactName").toString();
		System.out.println("customer email in delete servlet " + customerEmail);
		javax.jdo.Query q = pm.newQuery(Contact2.class);
		q.setFilter("userKey =='" + customerEmail + "' && contactName =='"
				+ conName + "'");
		List<Contact2> result = (List<Contact2>) q.execute();
		Contact2 customer = pm.getObjectById(Contact2.class, result.get(0).getKey());
		pm.deletePersistent(customer);
		res.getWriter().write("200");

	} catch (JSONException e) {
		res.getWriter().write("500");
		e.printStackTrace();
	} finally {
		pm.close();
	}

	}
}
