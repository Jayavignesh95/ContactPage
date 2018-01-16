package com.app;

import java.io.IOException;
import java.util.List;

import javax.jdo.JDOHelper;
import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.org.glassfish.gmbal.ManagedOperation;

import model.ResetCodes;
import model.User;

public class RegisterController extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User reg_user = new User();
		String name = req.getParameter("user");
		String password = req.getParameter("password");
		reg_user.setUserName(name);
		reg_user.setPassword(password);
		System.out.println(name + password);
		PersistenceManager pm = JDOHelper.getPersistenceManagerFactory("transactions-optional").getPersistenceManager();

		// pm.makePersistent(user);
		// Check if there is already there is a user;
		boolean regFlag = true;
		javax.jdo.Query q = pm.newQuery(User.class, "userName == uname ");
		q.declareParameters("String uname");

		List<User> results = (List<User>) q.execute(name);
		if (results.size() == 0) {
			regFlag = true;
		} else {
			regFlag = false;
		}

		if (regFlag == true) {
			System.out.println("New Registration");
			pm.makePersistent(reg_user);
			HttpSession session = req.getSession();
			session.setAttribute("user", name);
			System.out.println(session.getAttribute("user"));
			resp.sendRedirect("/web/jcontact2.jsp");
		} else {
			System.out.println("Alrady Existing");

			System.out.println("Redirecting..... to Login Page");
			req.setAttribute("message", "Account already exsits");

			RequestDispatcher rd = req.getRequestDispatcher("/index.jsp");
			rd.include(req, resp);

		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}

}
