package com.app;

import java.io.IOException;
import java.util.ArrayList;
import java.util.StringTokenizer;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UserFilter implements Filter {
private ServletContext context;
	
	public void init(FilterConfig fConfig) throws ServletException {
		this.context = fConfig.getServletContext();
		this.context.log("AuthenticationFilter initialized");
	}
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		
		String uri = req.getRequestURI();
		this.context.log("Requested Resource::"+uri);
		
		HttpSession session = req.getSession(false);
		
		if(session == null || session.getAttribute("user")==null ){
			//System.out.println(session.getId());
			//this.context.log(session.toString());
			this.context.log("Unauthorized access request");
			res.sendRedirect("/index.jsp");
			chain.doFilter(req,res);
		}else{
			
			System.out.println(session.getId());
			System.out.println("Session is available");
			chain.doFilter(req,res);

		}
		
		
	}

	

	public void destroy() {
	}

//	private ArrayList<String> urlList;
//	
//	public void destroy() {
//	}
//
//	public void doFilter(ServletRequest req, ServletResponse res,
//			FilterChain chain) throws IOException, ServletException {
//		HttpServletRequest request = (HttpServletRequest) req;
//		HttpServletResponse response = (HttpServletResponse) res;
//		String url = request.getServletPath();
//		boolean allowedRequest = false;
//		
//		if(urlList.contains(url)) {
//			allowedRequest = true;
//		}
//			
//		if (!allowedRequest) {
//			HttpSession session = request.getSession(false);
//			if (session == null) {
//				
//				System.out.println("Filter is blocked "+req.getLocalAddr());
//				((HttpServletResponse) res).sendRedirect("/index2.html");
//			}
//		}
//		
//		chain.doFilter(request, response);
//	}
//
//	public void init(FilterConfig config) throws ServletException {
//			}
}