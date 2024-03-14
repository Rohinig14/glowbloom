<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

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
            <h1 class="m-0">All Products</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="adminDashboard.jsp">Home</a></li>
              <li class="breadcrumb-item active">All Products</li>
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
          <div class="col-sm-12">
            <div class="card card-primary card-tabs">
              <div class="card-header p-0 pt-1">
                <ul class="nav nav-tabs" id="custom-tabs-one-tab" role="tablist">
                  <li class="nav-item">
                    <a class="nav-link active" id="makeup-tab" data-toggle="pill" href="#makeup" role="tab" aria-controls="custom-tabs-one-home" aria-selected="true">MAKEUP</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" id="skin-tab" data-toggle="pill" href="#skin" role="tab" aria-controls="custom-tabs-one-profile" aria-selected="false">SKIN</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" id="hair-tab" data-toggle="pill" href="#hair" role="tab" aria-controls="custom-tabs-one-messages" aria-selected="false">HAIR</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" id="bathBody-tab" data-toggle="pill" href="#bathBody" role="tab" aria-controls="custom-tabs-one-settings" aria-selected="false">BATH & BODY</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" id="fragrance-tab" data-toggle="pill" href="#fragrance" role="tab" aria-controls="custom-tabs-one-settings" aria-selected="false">FRAGRANCE</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" id="menGroomin-tab" data-toggle="pill" href="#menGroomin" role="tab" aria-controls="custom-tabs-one-settings" aria-selected="false">MEN GROOMING</a>
                  </li>
                </ul>
              </div>
              <div class="card-body">
                <div class="tab-content" id="custom-tabs-one-tabContent">
                  <div class="tab-pane fade show active" id="makeup" role="tabpanel" aria-labelledby="custom-tabs-one-home-tab">
                  	
                  	<jsp:include page="productsTable.jsp">
					    <jsp:param name="id" value="1" />
					</jsp:include>
                  
                  </div>
                  <div class="tab-pane fade" id="skin" role="tabpanel" aria-labelledby="custom-tabs-one-profile-tab">
                   <jsp:include page="productsTable.jsp">
					    <jsp:param name="id" value="2" />
					</jsp:include>
                   </div>
                  <div class="tab-pane fade" id="hair" role="tabpanel" aria-labelledby="custom-tabs-one-messages-tab">
                  	<jsp:include page="productsTable.jsp">
					    <jsp:param name="id" value="3" />
					</jsp:include>
                  </div>
                  <div class="tab-pane fade" id="bathBody" role="tabpanel" aria-labelledby="custom-tabs-one-settings-tab">
                  	<jsp:include page="productsTable.jsp">
					    <jsp:param name="id" value="4" />
					</jsp:include>
                  </div>
                  <div class="tab-pane fade" id="fragrance" role="tabpanel" aria-labelledby="custom-tabs-one-settings-tab">
                  	<jsp:include page="productsTable.jsp">
					    <jsp:param name="id" value="5" />
					</jsp:include>
                  </div>
                  <div class="tab-pane fade" id="menGroomin" role="tabpanel" aria-labelledby="custom-tabs-one-settings-tab">
                  	<jsp:include page="productsTable.jsp">
					    <jsp:param name="id" value="6" />
					</jsp:include>
                  </div>
                </div>
              </div>
              <!-- /.card -->
            </div>
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

