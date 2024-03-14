<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="com.rohini.service.impl.*, com.rohini.service.*,com.rohini.beans.*,java.util.*,javax.servlet.ServletOutputStream,java.io.*"%>
<!DOCTYPE html>
<html>

<head>
  <!-- Basic -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- Site Metas -->
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <link rel="shortcut icon" href="images/favicon.png" type="image/x-icon">

  <title>
    Online Cosmetics Shopping Portal
  </title>

  <!-- slider stylesheet -->
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />

  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="user/css/bootstrap.css" />

  <!-- Custom styles for this template -->
  <link href="user/css/style.css" rel="stylesheet" />
  <!-- responsive style -->
  <link href="user/css/responsive.css" rel="stylesheet" />
</head>
<style>
.paymentGatewayFrom { 
    justify-content: center; 
    align-items: center; 
    padding: 25px; 
    background: #d6eef1; 
} 
  
.paymentGatewayFrom form { 
    width: 700px; 
    padding: 20px; 
    background: #fff; 
    box-shadow: 5px 5px 30px rgba(0, 0, 0, 0.2); 
} 
</style>
<body>
<%
	/* Checking the user credentials */
	String userName = (String) session.getAttribute("username");
	String password = (String) session.getAttribute("password");

	if (userName == null || password == null) {

		response.sendRedirect("login.jsp?message=Session Expired, Login Again!!");
	}

	UserServiceImpl udao = new UserServiceImpl();
	UserRegisterBean user = udao.getUserDetails(userName, password);
	if (user == null)
		user = new UserRegisterBean("Test User", 98765498765L, "test@gmail.com", "customer", "Tirupati", 87659, "lksdjf");
	%>
  <div class="hero_area">
    <jsp:include page="header.jsp" />
     </div>
       <!-- info section -->

  <!-- contact section -->

  <section class="contact_section layout_padding">
    <div class="container px-0">
      <div class="heading_container ">
        <h2 class="">
          Hello <%=user.getName()%>
							here!!
        </h2>
      </div>
    </div>
    <div class="container container-bg paymentGatewayFrom">
      <div class="row">
        <div class="col-lg-12 col-md-12 px-0">
         <div class="row">
							<div class="col-sm-3">
								<p class="mb-0">Full Name</p>
							</div>
							<div class="col-sm-9">
								<p class="text-muted mb-0"><%=user.getName()%></p>
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-sm-3">
								<p class="mb-0">Email</p>
							</div>
							<div class="col-sm-9">
								<p class="text-muted mb-0"><%=user.getEmail()%>
								</p>
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-sm-3">
								<p class="mb-0">Phone</p>
							</div>
							<div class="col-sm-9">
								<p class="text-muted mb-0"><%=user.getMobile()%>
								</p>
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-sm-3">
								<p class="mb-0">Address</p>
							</div>
							<div class="col-sm-9">
								<p class="text-muted mb-0"><%=user.getAddress()%>
								</p>
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-sm-3">
								<p class="mb-0">PinCode</p>
							</div>
							<div class="col-sm-9">
								<p class="text-muted mb-0"><%=user.getPinCode()%>
								</p>
							</div>
						</div>
        </div>
      </div>
    </div>
  </section>

  <!-- end contact section -->
  <jsp:include page="footer.jsp" />

  <!-- end info section -->


  <script src="user/js/jquery-3.4.1.min.js"></script>
  <script src="user/js/bootstrap.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js">
  </script>
  <script src="js/custom.js"></script>

</body>

</html>