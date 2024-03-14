<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page
	import="com.rohini.service.impl.*, com.rohini.service.*,com.rohini.beans.*,java.util.*,javax.servlet.ServletOutputStream,java.io.*"%>
	
<%
	/* Checking the user credentials */

	String prodid = request.getParameter("prodid");
	ProductBean product = new ProductServiceImpl().getProductDetails(prodid);
	/*if (prodid == null || product == null) {
		response.sendRedirect("updateProductAdmin.jsp?message=Please Enter a valid product Id");
		return;
	} */
	%>
<!DOCTYPE html>
<html lang="en">

<jsp:include page="adminParticals/adminHeader.jsp" />

<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

	<jsp:include page="adminParticals/adminNavbar.jsp" />
  <jsp:include page="adminParticals/adminSidebar.jsp" />

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">Add Products</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="adminDashboard.jsp">Home</a></li>
              <li class="breadcrumb-item active">Add Products</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <!-- Small boxes (Stat box) -->
        <div class="row">
          <div class="col-md-6">
            <!-- general form elements -->
             <%
	String message = request.getParameter("message");
	%>
					<%
					if (message != null) {
					%>
					<p style="color: blue;">
						<%=message%>
					</p>
					<%
					}
					%>
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Product</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form action="./UpdateProductSrv" method="post">
                <div class="row card-body">
               
					<input type="hidden" name="pid" class="form-control"
						value="<%=prodid%>" id="last_name" required>
					<div class="col-md-6">
						<div class="form-group">
	                    <label for="productName">Product Name:</label>
	                    <input type="text" class="form-control" id="productName" name="name" value="<%=product.getProdName()%>" placeholder="Enter Product Name" required>
	                  </div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
						<%
						int ptype = product.getProdType();
						%>
	                    <label for="productType">Product Type:</label>
	                    <select class="form-control" name="type" required>
	                    	<option value="0">Select Product Type</option>
				            <option <%= ptype == 1 ? "selected" : "" %> value="1">MAKEUP</option>
				            <option <%= ptype == 2 ? "selected" : "" %> value="2">SKIN</option>
				            <option <%= ptype == 3 ? "selected" : "" %> value="3">HAIR</option>
				            <option <%= ptype == 4 ? "selected" : "" %> value="4">BATH & BODY</option>
				            <option <%= ptype == 5 ? "selected" : "" %> value="5">FRAGRANCE</option>
				            <option <%= ptype == 6 ? "selected" : "" %> value="6">MEN GROOMING</option>
	                    </select>
	                  </div>
					</div>
                  <div class="col-md-12">
                  	<div class="form-group">
	                    <label for="productDesc">Product Description:</label>
	                    <textarea class="form-control" id="productDesc" name="info" placeholder="Enter Product Desc" required><%=product.getProdInfo()%></textarea>
	                  </div>
                  </div>
             
					<div class="col-md-6">
						<div class="form-group">
	                    <label for="unitPrice">Unit Price:</label>
	                    <input type="number" class="form-control" id="unitPrice" name="price" placeholder="Enter Unit Price" required value="<%=product.getProdPrice()%>" />
	                  </div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
	                    <label for="stockQty">Stock Quantity:</label>
	                    <input type="number" class="form-control" id="stockQty" name="quantity" placeholder="Enter Unit Price" required value="<%=product.getProdQuantity()%>" />
	                  </div>
					</div>
                  
                </div>
                <!-- /.card-body -->

                <div class="card-footer">
                  <button type="submit" class="btn btn-primary">Submit</button>
                </div>
              </form>
            </div>
            <!-- /.card -->

          </div>
          <div class="col-md-6">
          <img src="./ShowImage?pid=<%=product.getProdId()%>"
						width="100%"	alt="Product Image"/>
          </div>
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>

  <jsp:include page="adminParticals/adminFooterCopyRight.jsp" />


</div>
<!-- ./wrapper -->
<jsp:include page="adminParticals/adminFooterScripts.jsp" />
</body>
</html>
