package com.event;

import java.util.List;

import javax.jdo.JDOHelper;
import javax.jdo.PersistenceManager;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import model.Contact2;
import model.Event;

public class SlotGenerator {
	public void check(String contactkey, String Date) {
		PersistenceManager pm = JDOHelper.getPersistenceManagerFactory("transactions-optional").getPersistenceManager();
		javax.jdo.Query q = pm.newQuery(Event.class);
		q.setFilter("contactKey == contactkey && date == Date");
		q.declareParameters("String contactKey,String date");
		List<Contact2> results = null;
		String json1;
		Gson a = new GsonBuilder().disableHtmlEscaping().create();
		try {
			results = (List<Contact2>)q.execute(contactkey,Date);
			json1 = a.toJson(results);
			System.out.println(json1);
			
		} finally {
			q.closeAll();
			pm.close();
		}

	}
}
