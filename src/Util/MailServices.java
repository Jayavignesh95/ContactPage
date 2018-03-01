package com.app;

import java.io.IOException;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
// [END simple_includes]

// [START multipart_includes]
import java.io.InputStream;
import java.io.ByteArrayInputStream;
import java.io.UnsupportedEncodingException;
import javax.activation.DataHandler;
import javax.mail.Multipart;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMultipart;
// [END multipart_includes]
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class MailServices{
	
	public static void sendSimpleMail(String usereMail,String URL) {
		String appUrl; 
		String environment = System.getProperty("com.google.appengine.runtime.environment");
		if (environment.equals("Production")) {
		    String applicationId = System.getProperty("com.google.appengine.application.id");
		    String version = System.getProperty("com.google.appengine.application.version");
		    appUrl = "http://"+version+"."+applicationId+".appspot.com/"+URL;
		} else {
		    appUrl = "http://localhost:8888";
		}

		Properties props = new Properties();
		Session session = Session.getDefaultInstance(props, null);

		try {
			Message msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress("jayavignesh.rajen@a-cti.com", "Test Email"));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(usereMail, "Mr. User"));
			msg.setSubject("Password Retest Request");
			msg.setText("Please use the following link to reset the password. "
					+appUrl); 
			
			Transport.send(msg);
			System.out.println("Email Sent");
		} catch (Exception e) {
		    	
		} 

	}


}
