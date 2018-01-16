package com.app;

import java.io.IOException;
import java.lang.reflect.Type;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

public class GsonTest extends HttpServlet {
  @Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	   Gson gson = new Gson();
	   
	  Type type = new TypeToken<Map<String, String>>(){}.getType();
	  Map<String, String> myMap = gson.fromJson("{'k1':'apple','k2':'orange'}", type);
	  System.out.println(myMap.toString());

	  
}
}
