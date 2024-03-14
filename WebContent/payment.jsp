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
    display: flex; 
    justify-content: center; 
    align-items: center; 
    min-height: 100vh; 
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

	String sAmount = request.getParameter("amount");

	double amount = 0;

	if (sAmount != null) {
		amount = Double.parseDouble(sAmount);
	}
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
          Payment Gateway
        </h2>
      </div>
    </div>
    <div class="container container-bg paymentGatewayFrom">
      <div class="row">
        <div class="col-lg-12 col-md-12 px-0">
         <form action="./OrderServlet" method="post">
				<div class="row">
					<div class="col-md-12 form-group">
						<label for="last_name">Name of Card Holder</label> <input
							type="text" placeholder="Enter Card Holder Name"
							name="cardholder" class="form-control" id="last_name" required>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 form-group">
						<label for="last_name">Enter Credit Card Number</label> <input
							type="number" placeholder="4242-4242-4242-4242" name="cardnumber"
							class="form-control" id="last_name" required>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6 form-group">
						<label for="last_name">Expiry Month</label> <input type="number"
							placeholder="MM" name="expmonth" class="form-control" size="2"
							max="12" min="00" id="last_name" required>
					</div>
					<div class="col-md-6 form-group">
						<label for="last_name">Expiry Year</label> <input type="number"
							placeholder="YYYY" class="form-control" size="4" id="last_name"
							name="expyear" required>
					</div>
				</div>
				<div class="row text-center">
					<div class="col-md-6 form-group">
						<label for="last_name">Enter CVV</label> <input type="number"
							placeholder="123" class="form-control" size="3" id="last_name"
							name="expyear" required> <input type="hidden"
							name="amount" value="<%=amount%>">

					</div>
					<div class="col-md-6 form-group">
						<button type="submit" class="form-control btn btn-success">
							Pay :Rs
							<%=amount%></button>
					</div>
				</div>
			</form>
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