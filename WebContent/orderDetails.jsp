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
.contact_section input{
margin-bottom:0px;
padding:0px;
height: unset;
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

	OrderService dao = new OrderServiceImpl();
	List<OrderDetails> orders = dao.getAllOrderDetails(userName);
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
          Cart
		Items
        </h2>
      </div>
    </div>
    <div class="container container-bg">
      <div class="row">
        <div class="col-lg-12 col-md-12 px-0">
         <table class="table">
         	<thead>
         		<tr>
					<th>Picture</th>
					<th>ProductName</th>
					<th>OrderId</th>
					<th>Quantity</th>
					<th>Price</th>
					<th>Time</th>
					<th>Status</th>
				</tr>
         	</thead>
         	<tbody>
         	<%
					for (OrderDetails order : orders) {
					%>

					<tr>
						<td><img src="./ShowImage?pid=<%=order.getProductId()%>"
							style="width: 50px; height: 50px;"></td>
						<td><%=order.getProdName()%></td>
						<td><%=order.getOrderId()%></td>
						<td><%=order.getQty()%></td>
						<td><%=order.getAmount()%></td>
						<td><%=order.getTime()%></td>
						<td class="text-success"><%=order.getShipped() == 0 ? "ORDER_PLACED" : "ORDER_SHIPPED"%></td>
					</tr>

					<%
					}
					%>
         	</tbody>
         </table>
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