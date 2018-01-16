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

import org.apache.jasper.tagplugins.jstl.core.Out;

import model.User;

public class ForgetPassword extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String UserEmail = req.getParameter("user");
		String PassLink = "";
		User user = UserFunction.searchByEmail(UserEmail);
		if (user != null) {
			String passID = UserFunction.RandomString();
			System.out.println(passID);
			UserFunction.addPassID(UserEmail, passID);
			PassLink = "app/ResetPass?id=" + passID;
			System.out.println(PassLink);
			MailServices.sendSimpleMail(UserEmail, PassLink);
			PrintWriter out = resp.getWriter();
			out.println("<h1>Password reset email sent</h1>");

		} else {
			System.out.println("No account exists");
			req.setAttribute("message", "Your Account  doesn't exists. ");
			req.getRequestDispatcher("/forgtpassword.jsp").forward(req, resp);

		}
		
		// req.getRequestDispatcher("/"+PassLink).forward(req, resp);

	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
}
