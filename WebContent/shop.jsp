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
  <style>
  .layout_padding {
    padding-top: 20px;
    padding-bottom: 20px;
}
  </style>
</head>

<body>
  <div class="hero_area">
    <jsp:include page="header.jsp" />
    
  </div>
  
  <%
  String typeParam = request.getParameter("type");
  int type = 0; // Default value if parameter does not exist or is not a valid integer

  if (typeParam != null && !typeParam.isEmpty()) {
	  type = Integer.parseInt(typeParam);
     
  }
  %>
  <!-- end hero area -->
	<section class="shop_section mt-3">
		<div class="container ">
			<div class="row">
				<form class="col-md-4" action="">
				 	<select class="form-control" name="type" required>
				 		<option value="">Select Category</option>
				 		<option value="1" <%= (type == 1) ? "selected" : "" %>>MAKEUP</option>
					    <option value="2" <%= (type == 2) ? "selected" : "" %>>SKIN</option>
					    <option value="3" <%= (type == 3) ? "selected" : "" %>>HAIR</option>
					    <option value="4" <%= (type == 4) ? "selected" : "" %>>BATH & BODY</option>
					    <option value="5" <%= (type == 5) ? "selected" : "" %>>FRAGRANCE</option>
					    <option value="6" <%= (type == 6) ? "selected" : "" %>>MEN GROOMING</option>
				 	</select>
				 	<button class="btn btn-info" type="submit"> Search </button>
				</form>
			</div>
			
		</div>
	</section>
  <!-- shop section -->
 <%
 String userName = (String) session.getAttribute("username");
 ProductServiceImpl prodDao = new ProductServiceImpl();
 String typeName = "All Products";
 List<ProductBean> allProducts = null;
 if (typeParam != null && !typeParam.isEmpty()) {
	 
  	type = Integer.parseInt(typeParam);
  	int[] productTypeIds = {1, 2, 3, 4, 5, 6};
    String[] productTypeNames = {"MAKE-UP", "SKIN", "HAIR", "BATH & BODY", "FRAGRANCE", "MEN GROOMING"};
    
    /* Find the typeName based on type */
    for (int i = 0; i < productTypeIds.length; i++) {
    	if (productTypeIds[i] == type) {
            typeName = productTypeNames[i];
            break; // Stop the loop once the type name is found
        }
    }
    /* Assuming userName is defined somewhere above, otherwise you need to define or fetch it */
     // example, adjust according to your actual session attribute
    
    
    allProducts = prodDao.getAllProductsByType(type);
    
 }else{
 	allProducts = prodDao.getAllProducts();
 }
 
 // Fetch all products
 
    if (!allProducts.isEmpty()) {
%>
  <section class="shop_section layout_padding">
    <div class="container">
      <div class="heading_container heading_center">
        <h2>
          
          <%= typeName %>
        </h2>
      </div>
      <div class="row">
      <%
      
  	for (ProductBean product : allProducts) {
		int cartQty = new CartServiceImpl().getCartItemCount(userName, product.getProdId());
		
		String description = product.getProdInfo();
		description = description.substring(0, Math.min(description.length(), 100));
		
      %>
        <div class="col-sm-6 col-md-4 col-lg-3">
          <div class="box">
            <a href="">
              <div class="img-box">
                <img src="./ShowImage?pid=<%=product.getProdId()%>" alt="Product">
              </div>
              <div class="detail-box">
                <h6>
                  <%=description%>..
                </h6>
                <h6>
                  Price
                  <span>
                    $<%=product.getProdPrice()%>
                  </span>
                </h6>
              </div>
              <form method="post">
				<%
				if (cartQty == 0) {
				%>
				<button type="submit"
					formaction="./AddtoCart?uid=<%=userName%>&pid=<%=product.getProdId()%>&pqty=1&type=<%= product.getProdType() %>&page=0"
					class="btn btn-success">Add to Cart</button>
				&nbsp;&nbsp;&nbsp;
				<button type="submit"
					formaction="./AddtoCart?uid=<%=userName%>&pid=<%=product.getProdId()%>&pqty=1&type=<%= product.getProdType() %>&page=0"
					class="btn btn-primary">Buy Now</button>
				<%
				} else {
				%>
				<button type="submit"
					formaction="./AddtoCart?uid=<%=userName%>&pid=<%=product.getProdId()%>&pqty=0&type=<%= product.getProdType() %>&page=0"
					class="btn btn-danger">Remove From Cart</button>
				&nbsp;&nbsp;&nbsp;
				<button type="submit"formaction="cartDetails.jsp"
					class="btn btn-success">Checkout</button>
				<%
				}
				%>
			</form>
              <div class="new">
                <span>
                  New
                </span>
              </div>
            </a>
          </div>
        </div>
        
        <%
  	}
        %>
        
      </div>
    </div>
  </section>

  <!-- end shop section -->
<%  } %>
 

  <!-- info section -->

  <jsp:include page="footer.jsp" />

  <!-- end info section -->


  <script src="user/js/jquery-3.4.1.min.js"></script>
  <script src="user/js/bootstrap.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js">
  </script>
  <script src="js/custom.js"></script>

</body>

</html>