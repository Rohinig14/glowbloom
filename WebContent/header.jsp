<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.rohini.service.impl.*, com.rohini.service.*"%>
<!-- header section strats -->
    <header class="header_section">
      <nav class="navbar navbar-expand-lg custom_nav-container ">
        <a class="navbar-brand" href="index.html">
          <span>
            Glow<span class="headerSpan">Bloom</span>
          </span>
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class=""></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
        
          <ul class="navbar-nav  ">
            <li class="nav-item ">
              <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="shop.jsp">
                Shop
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="why.jsp">
                Why Us
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="testimonial.jsp">
                Testimonial
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="contact.jsp">Contact Us</a>
            </li>
         
          </ul>
          <div class="user_option">
            <%
	/* Checking the user credentials */
	String userType = (String) session.getAttribute("usertype");
	if (userType == null) { //LOGGED OUT
	%>
            <a href="login.jsp">
              <i class="fa fa-user" aria-hidden="true"></i>
              <span>
                Login
              </span>
            </a>
             <%
	}else if ("customer".equalsIgnoreCase(userType)) { //CUSTOMER HEADER

		int notf = new CartServiceImpl().getCartCount((String) session.getAttribute("username"));
          %>
            <a href="orderDetails.jsp">
              Orders
            </a>
            <a href="userProfile.jsp">
              Profile
            </a>
            <a href="./LogoutSrv">
              Logout
            </a>
            <%
            
            }
            %>
          </div>
        </div>
      </nav>
    </header>
    <!-- end header section -->