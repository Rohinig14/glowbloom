package com.rohini.srv;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rohini.beans.ProductBean;
import com.rohini.beans.ProductCreationBean;
import com.rohini.service.impl.ProductServiceImpl;

/**
 * Servlet implementation class UpdateProductSrv
 */
@WebServlet("/UpdateProductSrv")
public class UpdateProductSrv extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpdateProductSrv() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String userType = (String) session.getAttribute("usertype");
		String userName = (String) session.getAttribute("username");
		String password = (String) session.getAttribute("password");

		if (userType == null || !userType.equals("admin")) {

			response.sendRedirect("login.jsp?message=Access Denied, Login As Admin!!");
			return;

		} else if (userName == null || password == null) {

			response.sendRedirect("login.jsp?message=Session Expired, Login Again!!");
			return;
		}

		// Login success

		String prodId = request.getParameter("pid");
		String prodName = request.getParameter("name");
		Integer prodType = Integer.parseInt(request.getParameter("type"));
		String prodInfo = request.getParameter("info");
		Double prodPrice = Double.parseDouble(request.getParameter("price"));
		Integer prodQuantity = Integer.parseInt(request.getParameter("quantity"));

		ProductCreationBean product = new ProductCreationBean();
		product.setProdId(prodId);
		product.setProdName(prodName);
		product.setProdInfo(prodInfo);
		product.setProdPrice(prodPrice);
		product.setProdQuantity(prodQuantity);
		product.setProdType(prodType);

		ProductServiceImpl dao = new ProductServiceImpl();

		String status = dao.updateProductWithoutImage(prodId, product);
		response.sendRedirect("updateProductAdmin.jsp?prodid=" + prodId + "&message=" + status);
		//RequestDispatcher rd = request.getRequestDispatcher("updateProductAdmin.jsp?prodid=" + prodId + "&message=" + status);
		//rd.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
