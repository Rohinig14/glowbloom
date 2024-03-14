<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.rohini.utility.DBUtil" %>
<%
Connection conn = null;
conn = DBUtil.provideConnection();

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
            <h1 class="m-0">Dashboard</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="adminDashboard.jsp">Home</a></li>
              <li class="breadcrumb-item active">Dashboard</li>
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
          <div class="col-lg-6 col-6">
            <!-- small box -->
            <div class="small-box bg-info">
              <div class="inner">
              <%
              int OrderCount = 0;
              PreparedStatement ps = null;
           // Create a statement
              ps = conn.prepareStatement("SELECT COUNT(*) AS total FROM orders");
              ResultSet rs = ps.executeQuery();
              
              // Extract data from result set
              if(rs.next()) {
            	  OrderCount = rs.getInt("total");
              }
              
              // Clean-up environment
              rs.close();
              ps.close();
              %>
                <h3><%=OrderCount%></h3>

                <p>New Orders</p>
              </div>
              <div class="icon">
                <i class="ion ion-bag"></i>
              </div>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-6 col-6">
            <!-- small box -->
            <div class="small-box bg-success">
              <div class="inner">
               <%
              int TransactionCount = 0;
              PreparedStatement psT = null;
           // Create a statement
              psT = conn.prepareStatement("SELECT COUNT(*) AS total FROM transactions");
              ResultSet rsT = psT.executeQuery();
              
              // Extract data from result set
              if(rsT.next()) {
            	  TransactionCount = rsT.getInt("total");
              }
              
              // Clean-up environment
              rsT.close();
              psT.close();
              %>
                <h3><%=TransactionCount%></h3>

                <p>Transactions</p>
              </div>
              <div class="icon">
                <i class="ion ion-stats-bars"></i>
              </div>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-6 col-6">
            <!-- small box -->
            <div class="small-box bg-warning">
              <div class="inner">
              <%
              int UsersCount = 0;
              PreparedStatement psU = null;
           // Create a statement
              psU = conn.prepareStatement("SELECT COUNT(*) AS total FROM user WHERE role='customer'");
              ResultSet rsU = psU.executeQuery();
              
              // Extract data from result set
              if(rsU.next()) {
            	  UsersCount = rsU.getInt("total");
              }
              
              // Clean-up environment
              rsU.close();
              psU.close();
              %>
                <h3><%=UsersCount%></h3>

                <p>User Registrations</p>
              </div>
              <div class="icon">
                <i class="ion ion-person-add"></i>
              </div>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-6 col-6">
            <!-- small box -->
            <div class="small-box bg-danger">
              <div class="inner">
                <%
              int ProductsCount = 0;
              PreparedStatement psP = null;
           // Create a statement
              psP = conn.prepareStatement("SELECT COUNT(*) AS total FROM product");
              ResultSet rsP = psP.executeQuery();
              
              // Extract data from result set
              if(rsP.next()) {
            	  ProductsCount = rsP.getInt("total");
              }
              
              // Clean-up environment
              rsP.close();
              psP.close();
              %>
                <h3><%=ProductsCount%></h3>

                <p>Products</p>
              </div>
              <div class="icon">
                <i class="ion ion-pie-graph"></i>
              </div>
            </div>
          </div>
          <!-- ./col -->
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
