package com.rohini.srv;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rohini.beans.TestimonialBean;
import com.rohini.service.TestimonialService;
import com.rohini.service.impl.TestimonialServiceImpl;
import com.rohini.utility.DBUtil;
import com.rohini.utility.MailMessage;


/**
 * Servlet implementation class fansMessage
 */
@WebServlet("/fansMessage")
public class FansMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String comments = request.getParameter("comments");
		TestimonialBean testmessage = new TestimonialBean();
		testmessage.setName(name);
		testmessage.setMail(email);
		testmessage.setMessage(comments);
		TestimonialServiceImpl test = new TestimonialServiceImpl();
		boolean flag = test.addTestimonial(testmessage);
		if (flag) {
			response.sendRedirect("contact.jsp");
		}else {
			response.sendRedirect("error.jsp");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
