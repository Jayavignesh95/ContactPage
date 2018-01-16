package com.app;

import java.util.List;
import java.util.Random;

import javax.jdo.JDOHelper;
import javax.jdo.PersistenceManager;

import model.ResetCodes;
import model.User;

public class UserFunction {
	static PersistenceManager pm = JDOHelper.getPersistenceManagerFactory("transactions-optional").getPersistenceManager();

	public static User searchByEmail(String email) {

		javax.jdo.Query q = pm.newQuery(User.class, "userName == lastNameParam");
		q.declareParameters("String lastNameParam");

		List<User> results = (List<User>) q.execute(email);
		if(results.isEmpty()){
			return null;
		}else
		{
		System.out.println(results.get(0).getPassword());
		return results.get(0);
		}
	}

	public static String RandomString() {
		Random rd = new Random();
		String tmp = "abcdefghijklmnopqrstuvqxyz123456789";
		char ctmp[] = tmp.toCharArray();
		char rnd[] = new char[16];

		for (int i = 0; i < 16; i++)

			rnd[i] = ctmp[rd.nextInt(ctmp.length)];
		return new String(rnd);

	}
	
	public static void addPassID(String username, String passID)
	{
		ResetCodes rstUser= new ResetCodes();
		rstUser.setUserName(username);
		rstUser.setPassID(passID);
		pm.makePersistent(rstUser);
		System.out.println("ADDED IN DB");

		
	}
}
