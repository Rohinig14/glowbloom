<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ page
        import="com.rohini.service.impl.*, com.rohini.service.*,com.rohini.beans.*,java.util.*,javax.servlet.ServletOutputStream,java.io.*" %>
<%@ page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<html>

<head>
    <!-- Basic -->
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <!-- Site Metas -->
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <link rel="shortcut icon" href="images/favicon.png" type="image/x-icon">

    <title>
        Online Cosmetics Shopping Portal
    </title>

    <!-- slider stylesheet -->
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css"/>

    <!-- bootstrap core css -->
    <link rel="stylesheet" type="text/css" href="user/css/bootstrap.css"/>

    <!-- Custom styles for this template -->
    <link href="user/css/style.css" rel="stylesheet"/>
    <!-- responsive style -->
    <link href="user/css/responsive.css" rel="stylesheet"/>
</head>
<style>
    .contact_section input {
        margin-bottom: 0px;
        padding: 0px;
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

    String addS = request.getParameter("add");
    if (addS != null) {

        int add = Integer.parseInt(addS);
        String uid = request.getParameter("uid");
        String pid = request.getParameter("pid");
        int avail = Integer.parseInt(request.getParameter("avail"));
        int cartQty = Integer.parseInt(request.getParameter("qty"));
        CartServiceImpl cart = new CartServiceImpl();

        if (add == 1) {
            //Add Product into the cart
            cartQty += 1;
            if (cartQty <= avail) {
                cart.addProductToCart(uid, pid, 1);
            } else {
                response.sendRedirect("./AddtoCart?pid=" + pid + "&pqty=" + cartQty);
            }
        } else if (add == 0) {
            //Remove Product from the cart
            cart.removeProductFromCart(uid, pid);
        }
    }
%>
<div class="hero_area">
    <jsp:include page="header.jsp"/>
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
                        <th>Item</th>
                        <th>ProductName</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Amount</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        CartServiceImpl cart = new CartServiceImpl();
                        List<CartBean> cartItems;
                        cartItems = cart.getAllCartItems(userName);
                        double totAmount = 0.00;
                        for (CartBean item : cartItems) {

                            String prodId = item.getProdId();

                            int prodQuantity = item.getQuantity();

                            ProductBean product = new ProductServiceImpl().getProductDetails(prodId);

                            double currAmount = product.getProdPrice() * prodQuantity;

                            totAmount += currAmount;

                            if (prodQuantity > 0) {
                    %>

                    <tr>
                        <td><img src="./ShowImage?pid=<%=product.getProdId()%>"
                                 style="width: 50px; height: 50px;"></td>
                        <td><%=product.getProdName()%>
                        </td>
                        <td>$<%=product.getProdPrice()%>
                        </td>
                        <td>
                            <form style="padding:0px;" method="post" action="./UpdateToCart">
                                <input class="mb-0" type="number" type="submit" name="pqty" value="<%=prodQuantity%>"
                                       style="max-width: 70px;" min="0">
                                <input class="mb-0" type="hidden" name="pid" value="<%=product.getProdId()%>">
                                <input class="mb-0 btn btn-primary" type="hidden" name="Update" value="Update"
                                       style="max-width: 80px;">
                            </form>
                        </td>
                        <td>$<%=currAmount%>
                        </td>
                    </tr>

                    <%
                            }
                        }
                    %>

                    <tr>
                        <td colspan="5" style="text-align: center;">Estimated Total</td>
                        <td>$<%=totAmount%>
                        </td>
                    </tr>
                    <%
                        if (totAmount != 0) {
                    %>
                    <tr>
                        <td colspan="3" style="text-align: center;">
                        <td>
                            <form method="post">
                                <button formaction="userHome.jsp"
                                        style="background-color: black; color: white;">Cancel
                                </button>
                            </form>
                        </td>
                        <td colspan="2" align="center">
                            <form method="post">
                                <button style="background-color: blue; color: white;"
                                        formaction="payment.jsp?amount=<%=totAmount%>">Pay Now
                                </button>
                            </form>
                        </td>

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
<jsp:include page="footer.jsp"/>

<!-- end info section -->


<script src="user/js/jquery-3.4.1.min.js"></script>
<script src="user/js/bootstrap.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js">
</script>
<script src="js/custom.js"></script>

</body>

</html>