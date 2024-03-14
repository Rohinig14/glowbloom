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

<body>
  <div class="hero_area">
    <jsp:include page="header.jsp" />
    
  </div>
  <!-- end hero area -->

  <!-- shop section -->
 <%
	/* Checking the user credentials */
	    String typeName = "";
    int type = Integer.parseInt(request.getParameter("type"));
    
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
    String userName = (String) session.getAttribute("username"); // example, adjust according to your actual session attribute
    
    ProductServiceImpl prodDao = new ProductServiceImpl();
    List<ProductBean> productsByType = prodDao.getAllProductsByType(type);
    if (!productsByType.isEmpty()) {
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
      
  	for (ProductBean product : productsByType) {
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
              
				<%
				if (cartQty == 0) {
				%>
				<a href="./AddtoCart?uid=<%=userName%>&pid=<%=product.getProdId()%>&pqty=1&type=<%= type %>&page=1"
					class="btn btn-success">Add to Cart</a>
				&nbsp;&nbsp;&nbsp;
				<a href="./AddtoCart?uid=<%=userName%>&pid=<%=product.getProdId()%>&pqty=1&type=<%= type %>&page=1"
					class="btn btn-primary">Buy Now</a>
				<%
				} else {
				%>
				<a href="./AddtoCart?uid=<%=userName%>&pid=<%=product.getProdId()%>&pqty=0&type=<%= type %>&page=1"
					class="btn btn-danger">Remove From Cart</a>
				&nbsp;&nbsp;&nbsp;
				<a href="cartDetails.jsp"
					class="btn btn-success">Checkout</a>
				<%
				}
				%>
			
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