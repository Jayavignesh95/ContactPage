package com.app;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.jdo.JDOHelper;
import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ResetCodes;
import model.User;

public class UpdateNewPassController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userName = req.getParameter("user");
		String password = req.getParameter("password");
		PrintWriter out = resp.getWriter();
		PersistenceManager pm = JDOHelper.getPersistenceManagerFactory("transactions-optional").getPersistenceManager();
		javax.jdo.Query q = pm.newQuery(User.class, "userName == uName");
		q.declareParameters("String uName");
		List<User> UserList = (List<User>) q.execute(userName);
		User user = UserList.get(0);
		user.setPassword(password);
		javax.jdo.Query q1 = pm.newQuery(ResetCodes.class, "userName == uName");
		q.declareParameters("String uName");
		List<ResetCodes> ResetList = (List<ResetCodes>) q1.execute(userName);
		if (!ResetList.isEmpty()) {
			ResetCodes rst = ResetList.get(0);
			pm.deletePersistentAll(ResetList);
			
			out.println("<h1>Password updated</h1>");

		} else {
			out.println("<h1>Link Expired</h1>");

		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}
