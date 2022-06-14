<%@ page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@ page import="com.cred.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Construction ERP</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
</head>
<body class="hold-transition dark-mode sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed">
<div class="wrapper">

  <!-- Preloader -->
  <div class="preloader flex-column justify-content-center align-items-center">
    <img class="animation__wobble" src="dist/img/AdminLTELogo.png" alt="AdminLTELogo" height="60" width="60">
  </div>

  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-dark">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
      
    </ul>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
      <!-- Navbar Search -->
      
      <!-- Messages Dropdown Menu -->
      
      <li class="nav-item">
        <a class="nav-link" data-widget="fullscreen" href="#" role="button">
          <i class="fas fa-expand-arrows-alt"></i>
        </a>
      </li>
      
    </ul>
  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="index2.html" class="brand-link">
      <img src="dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
      <span class="brand-text font-weight-light">ERP</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="architect.html" class="d-block">Architect\Civil</a>
        </div>
      </div>

      <!-- SidebarSearch Form -->
     

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item menu-open">
            
            <ul class="nav nav-treeview">
              
              <li class="nav-item">
                <a href="architect.html" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Dashboard</p>
                </a>
              </li>
        
            </ul>
          </li>
          <li class="nav-item">
            <a href="archiCreateEmp.html" class="nav-link">
              <i class="nav-icon fas fa-th"></i>
              <p>
                Create Employee
                <span class="right badge badge-danger"></span>
              </p>
            </a>
          </li>
         
          <li class="nav-item">
            <a href="archiViewEmp.jsp" class="nav-link">
              <i class="nav-icon fas fa-th"></i>
              <p>
                View Employee
                
              </p>
            </a>
            
          </li>
          
          <li class="nav-item">
            <a href="archViewProj.jsp" class="nav-link">
              <i class="nav-icon fas fa-th"></i>
              <p>
                View Projects
                <span class="right badge badge-danger"></span>
              </p>
            </a>
          </li>
            </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">Architect/Civil Dashboard</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="architect.html">Dashboard</a></li>
              <li class="breadcrumb-item active">Architect/Civil</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    
  <section class="content">
      <div class="container-fluid">
        <div class="row">
          <!-- left column -->
          <div class="col-md-12">
            <!-- general form elements -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">View Projects</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <%
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/constructionerp","root","");
              PreparedStatement pstmt = con.prepareStatement("select pid from responsibility where eid=?") ;
          	  int eid=Credentials.getEmpid();
          	  pstmt.setInt(1,eid);
              ResultSet rs= pstmt.executeQuery();
          	  while(rs.next()){
          		int pid = rs.getInt(1);
          		PreparedStatement pstmt2 = con.prepareStatement("select * from project where pid=?") ;
            	pstmt2.setInt(1,pid);  
          		ResultSet rs2= pstmt2.executeQuery();
          	  
          %>
      <TABLE border="1">
      <TR>
      <TH>    Project ID</TH>
      <TH>    Name</TH>
      <TH>    Address</TH>
      <TH>    Image</TH>
		<th>Edit</th>
      <!-- <th> 	  Delete</th> -->
      <!-- <TH>Interest in Game</TH> -->
      </TR>
      <% while(rs2.next()){ %>
      <TR>
       <TD> <%= rs2.getInt(1) %></td>
       <TD> <%= rs2.getString(2) %></TD>
       <TD> <%= rs2.getString(3) %></TD>
       <td><a href="archViewimage.jsp?id=<%= rs.getInt(1) %>">View</a></td>
       <td><a href="archEditProj.jsp?id=<%= rs.getInt(1) %>">Edit</a> </td>
       <%-- <TD> <%= rs2.getString(6) %></TD> --%>
       
	      <%--  <td></td>
	       <TD> <a href="deleteProj.jsp?id=<%= rs.getInt(1) %>">delete</a></TD> --%>
      </TR>
      <% }} %>
     </TABLE>
                </div></div>
                <!-- /.card-body -->

            </div>

              <!-- /.card-footer -->
            
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->

  <!-- Main Footer -->
  <footer class="main-footer">
    <strong>Xerox-right &copy; 2022-1947 <a href="#">Construction ERP</a>.</strong>
    All rights reserved.
    <div class="float-right d-none d-sm-inline-block">
      <b>Version</b> 6.6.6
    </div>
  </footer>
</div>
<!-- ./wrapper -->

<!-- REQUIRED SCRIPTS -->
<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- overlayScrollbars -->
<script src="plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.js"></script>

<!-- PAGE PLUGINS -->
<!-- jQuery Mapael -->
<script src="plugins/jquery-mousewheel/jquery.mousewheel.js"></script>
<script src="plugins/raphael/raphael.min.js"></script>
<script src="plugins/jquery-mapael/jquery.mapael.min.js"></script>
<script src="plugins/jquery-mapael/maps/usa_states.min.js"></script>
<!-- ChartJS -->
<script src="plugins/chart.js/Chart.min.js"></script>

<!-- AdminLTE for demo purposes -->
<!-- <script src="dist/js/demo.js"></script> -->
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="dist/js/pages/dashboard2.js"></script>
</body>
</html>
