package com.app;

import java.io.IOException;
import java.util.List;

import javax.jdo.JDOHelper;
import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.Query;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import model.Contact;
import model.Contact2;

public class getContacts extends HttpServlet {
	@SuppressWarnings("unchecked")
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PersistenceManager pm = JDOHelper.getPersistenceManagerFactory("transactions-optional").getPersistenceManager();
		
		javax.jdo.Query q = pm.newQuery(Contact2.class);
		q.setFilter("userKey == ukey ");
		q.declareParameters("String ukey");
		
		String userName = req.getParameter("user");

		List<Contact2> results = null;
		String json1;
		System.out.println(userName);
		Gson a = new GsonBuilder().disableHtmlEscaping().create();

		try {
			results = (List<Contact2>) q.execute(userName);
			json1 = a.toJson(results);
			System.out.println(json1);
		    resp.setContentType("application/json");
		    resp.setCharacterEncoding("UTF-8");
		    resp.getWriter().write(json1);


		} finally {
			q.closeAll();
			pm.close();
		}

	}
}
