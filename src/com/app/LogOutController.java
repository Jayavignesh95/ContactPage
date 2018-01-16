package com.app;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogOutController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		  resp.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
		  System.out.println("Session invalidated");
		  req.getSession().setAttribute("name",null);
		  req.getSession().invalidate(); 
		  
		  RequestDispatcher dispatcher = req.getRequestDispatcher("/index.jsp");
			 dispatcher.forward(req, resp);
			 return; 
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	   System.out.println("GET");
	      doPost(req, resp);
	}

}
