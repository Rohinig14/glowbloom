package com.rohini.srv;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rohini.beans.UserBean;
import com.rohini.beans.UserRegisterBean;
import com.rohini.service.impl.UserServiceImpl;

/**
 * Servlet implementation class LoginSrv
 */
@WebServlet("/LoginSrv")
public class LoginSrv extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginSrv() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String userName = request.getParameter("username");
		String password = request.getParameter("password");

		response.setContentType("text/html");

		String status = "Login Denied! Invalid Username or password.";
		
		UserServiceImpl udao = new UserServiceImpl();

		status = udao.isValidCredential(userName, password);
		if (status.equals("valid")) {
			UserRegisterBean user = udao.getUserDetails(userName, password);
			HttpSession session = request.getSession();
			String userRole = user.getRole();
			session.setAttribute("userdata", user);

			session.setAttribute("username", userName);
			session.setAttribute("password", password);
			session.setAttribute("usertype", userRole);
			
			if(userRole.equals("admin")) {
				response.sendRedirect("adminDashboard.jsp");
				//RequestDispatcher rd = request.getRequestDispatcher("adminViewProduct.jsp");
				//rd.forward(request, response);
			}else if(userRole.equals("customer")){
				//RequestDispatcher rd = request.getRequestDispatcher("userHome.jsp");

				//rd.forward(request, response);
				response.sendRedirect("index.jsp");
			}
			

		} else {
			// invalid user;

			RequestDispatcher rd = request.getRequestDispatcher("login.jsp?message=" + status);

			rd.forward(request, response);

		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
