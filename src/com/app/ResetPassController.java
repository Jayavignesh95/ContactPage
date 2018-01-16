package com.app;

import java.io.IOException;
import java.util.List;

import javax.jdo.JDOHelper;
import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ResetCodes;
import model.User;

public class ResetPassController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String param = req.getParameter("id");
		PersistenceManager pm = JDOHelper.getPersistenceManagerFactory("transactions-optional").getPersistenceManager();

		javax.jdo.Query q = pm.newQuery(ResetCodes.class, "passID == idfromURL");
		q.declareParameters("String idfromURL");

		List<ResetCodes> results = (List<ResetCodes>) q.execute(param);
		System.out.println(results.get(0).getUserName());
		ResetCodes resetUser = results.get(0);
		System.out.println(results.size());
		if (!results.isEmpty()) {
			req.setAttribute("userName", resetUser.getUserName());
			req.setAttribute("ResetStatus", "");
			System.out.println("Matched");
			req.getRequestDispatcher("/ChangePassword.jsp").forward(req, resp);
		} else {
			req.setAttribute("ResetStatus", "Your Link has expired");

		}

	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}
