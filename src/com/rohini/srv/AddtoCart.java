package com.rohini.srv;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rohini.beans.DemandBean;
import com.rohini.beans.ProductBean;
import com.rohini.service.impl.CartServiceImpl;
import com.rohini.service.impl.DemandServiceImpl;
import com.rohini.service.impl.ProductServiceImpl;

/**
 * Servlet implementation class AddtoCart
 */
@WebServlet("/AddtoCart")
public class AddtoCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddtoCart() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String userName = (String) session.getAttribute("username");
		String password = (String) session.getAttribute("password");
		String usertype = (String) session.getAttribute("usertype");
		if (userName == null || password == null || usertype == null || !usertype.equalsIgnoreCase("customer")) {
			response.sendRedirect("login.jsp?message=Session Expired, Login Again to Continue!");
			return;
		}

		// login Check Successfull

		String userId = userName;
		String prodId = request.getParameter("pid");
		int pQty = Integer.parseInt(request.getParameter("pqty")); // 1
		int type = Integer.parseInt(request.getParameter("type")); 
		int page = Integer.parseInt(request.getParameter("page")); 
		

		CartServiceImpl cart = new CartServiceImpl();

		ProductServiceImpl productDao = new ProductServiceImpl();

		ProductBean product = productDao.getProductDetails(prodId);

		int availableQty = product.getProdQuantity();

		int cartQty = cart.getProductCount(userId, prodId);

		pQty += cartQty;

		PrintWriter pw = response.getWriter();

		response.setContentType("text/html");
		if (pQty == cartQty) {
			String status = cart.removeProductFromCart(userId, prodId);

			//RequestDispatcher rd = request.getRequestDispatcher("userHome.jsp");
			pw.println("<script>document.getElementById('message').innerHTML='" + status + "'</script>");
			//rd.include(request, response);
			if(page == 1) {
				response.sendRedirect("userHome.jsp?type="+type);
				}else if(page == 0) {
					response.sendRedirect("shop.jsp");
				}else if(page == 2) {
					response.sendRedirect("index.jsp");
				}

			
		} else if (availableQty < pQty) {

			String status = null;

			if (availableQty == 0) {
				status = "Product is Out of Stock!";
			} else {

				cart.updateProductToCart(userId, prodId, availableQty);

				status = "Only " + availableQty + " no of " + product.getProdName()
						+ " are available in the shop! So we are adding only " + availableQty
						+ " products into Your Cart" + "";
			}
			DemandBean demandBean = new DemandBean(userName, product.getProdId(), pQty - availableQty);

			DemandServiceImpl demand = new DemandServiceImpl();

			boolean flag = demand.addProduct(demandBean);

			if (flag)
				status += "<br/>Later, We Will Mail You when " + product.getProdName()
						+ " will be available into the Store!";

			pw.println("<script>document.getElementById('message').innerHTML='" + status + "'</script>");
			response.sendRedirect("cartDetails.jsp");

		} else {
			String status = cart.updateProductToCart(userId, prodId, pQty);
			pw.println("<script>document.getElementById('message').innerHTML='" + status + "'</script>");
			if(page == 1) {
			response.sendRedirect("userHome.jsp?type="+type);
			}else if(page == 0) {
				response.sendRedirect("shop.jsp");
			}else if(page == 2) {
				response.sendRedirect("index.jsp");
			}
			
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
