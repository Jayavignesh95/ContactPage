package com.app;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.jdo.JDOHelper;
import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.User;

public class LoginController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("HELLO LOGIN SERVLET");
		String userName = req.getParameter("user");
		String passWord = req.getParameter("password");
		System.out.println(userName + passWord);
		PersistenceManager pm = JDOHelper.getPersistenceManagerFactory("transactions-optional").getPersistenceManager();
		javax.jdo.Query q = pm.newQuery(User.class);
		List<User> results = null;
		User user = new User();
		boolean loginFlag = false;
		try {
			results = (List<User>) q.execute();
			for (Iterator iterator = results.iterator(); iterator.hasNext();) {
				user = (User) iterator.next();
				if (userName.equals(user.getUserName())) {

					if (passWord.equals(user.getPassword())) {
						System.out.println(user + "Logged in ");
						loginFlag = true;
					}
				} else {
				}

			}
			HttpSession session = req.getSession();
			session.setAttribute("user", userName);
			if (loginFlag == true) {
				System.out.println("Redirecting..... to Profile");
				resp.sendRedirect("/web/jcontact2.jsp");
			} else {
				System.out.println("Redirecting..... to Login Page");
				req.setAttribute("message", "Incorrect Password");

				RequestDispatcher rd = req.getRequestDispatcher("/index.jsp");
				rd.include(req, resp);
			}

		} finally {
			q.closeAll();
			pm.close();
		}

	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doPost(req, resp);
	}

}
