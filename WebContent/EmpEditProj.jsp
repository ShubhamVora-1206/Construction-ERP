<%@ page import="java.sql.*" %>
<%@ page import="com.cred.Credentials" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
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
    <a href="employee.html" class="brand-link">
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
          <a href="employee.html" class="d-block">Emp\Dept</a>
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
                <a href="employee.html" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Dashboard</p>
                </a>
              </li>
        
            </ul>
          </li>
          <li class="nav-item">
            <a href="EmpViewProj.jsp" class="nav-link">
              <i class="nav-icon fas fa-th"></i>
              <p>
                View Projects
                <span class="right badge badge-danger"></span>
              </p>
            </a>
          </li>
          
          <li class="nav-item">
            <a href="report.jsp" class="nav-link">
              <i class="nav-icon fas fa-copy"></i>
              <p>
                Report
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
            <h1 class="m-0">Emp\Dept Dashboard</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="architect.html">Dashboard</a></li>
              <li class="breadcrumb-item active">Emp\Dept</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
           <!-- form start -->
             
     <section class="content">
      <div class="container-fluid">
        <div class="row">
          <!-- left column -->
          <div class="col-md-12">
            <!-- general form elements -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">View Tasks</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
                <%
          Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/constructionerp","root","");
          int pid=com.cred.Credentials.getPid();
          try{
        	
          pid = Integer.parseInt(request.getParameter("id"));
        }catch(Exception e){
      	  e.printStackTrace();
        }
          com.cred.Credentials.setPid(pid);
          System.out.println(pid);
         
          PreparedStatement pstmt = con.prepareStatement("select * from task where pid=?") ;
       	  pstmt.setInt(1,pid);	
          ResultSet rs= pstmt.executeQuery();    
          %>
      <% while(rs.next()){ %>
      <TABLE border="0">
      <TR>
       <td>    <b>Task ID:</b>  <%= rs.getInt(1) %></td>
        
     <%--  <TH>    Task ID</TH>
        <TD> <%= rs.getInt(1) %></td> --%>
      </TR>
      <tr>
      <Td>    <b>Project ID:</b>   <%= rs.getInt(2) %></Td>
        <TD> </TD>
       </tr>
       <tr>
      <Td>    <b>Title:</b> <%= rs.getString(3) %></Td>
        <TD> </TD>
       </tr>
       <tr>
      <Td>    <b>Assigner:</b> <%= rs.getString(4) %></Td>
        <TD> </TD>
      </tr>
      <tr>
     <Td>    <b>Priority:</b> <%= rs.getString(5) %></Td>
        <TD> </TD>
     </tr>
     <tr>
     <Td>    <b>Location:</b> <%= rs.getString(6) %></Td>
        <TD> </TD>
     </tr>
     <tr>
     <Td>    <b>Start Date:</b> <%= rs.getString(7) %></Td>
        <TD> </TD>
     </tr>
     <tr>
     <Td>    <b>End Date:</b> <%= rs.getString(8) %></Td>
        <TD> </TD>
     </tr>
     <tr>
     <Td>    <b>Manpower: </b><%= rs.getInt(9) %></Td>
        <TD> </TD>
     </tr>
     <tr>
     <Td>   <b> Employee ID:</b> <%= rs.getInt(10) %></Td>
        <TD> </TD>
     </tr>
     <tr>
     <Td>    <b>Comments: </b><%= rs.getString(12) %></Td>
        <TD> </TD>
     </tr>
     <tr>
      <td>	 <b>Plan Image: </b><%= rs.getBlob(13) %></td>
        <TD> </TD> 
      </tr>
     </TABLE>
     <br>
     <table>
     <%PreparedStatement pstmt3 = con.prepareStatement("select comment from comments where tid=?") ;
  	 int tid = rs.getInt(1); 
     pstmt3.setInt(1,tid);	
     ResultSet rs2= pstmt3.executeQuery();%>
     <th>Previous comments</th>
     <%while(rs2.next()){%>
     <tr>
     <td><%= rs2.getString(1) %></td>
     </tr>
     <%} %>
     </table>
     <form action="EmpEditProj.jsp"> 
     <label for="comm">Comments:</label>
     <div class="form-group"> 
     <input type="text" name="comm" placeholder="enter your comments">
     </div>
     <div class="card-footer" onclick="myFunction()">
       <button type="submit" class="btn btn-primary">Submit</button>
     </div>
     <%
     
  	 String comment = request.getParameter("comm");
     if(comment!=null){
     PreparedStatement pstmt2 = con.prepareStatement("insert into comments values(?,?,?,?)") ;
  	 int cid=0;
  	 int eid=0;
  	 eid = Credentials.getEmpid();
  	 
  	 tid = rs.getInt(1);
  	 System.out.println(tid);
     pstmt2.setInt(1,cid);
     pstmt2.setInt(2,eid);
     pstmt2.setInt(3,tid);
     pstmt2.setString(4, comment);
     int i =pstmt2.executeUpdate();
     // if(i>0){
    	//  response.sendRedirect("EmpViewProj.jsp");
      //}
     }
    %>
     </form>
   
      <% 
      }
      /* Credentials cd = new Credentials();
      int tid = Integer.parseInt(request.getParameter("id"));
     cd.setTid(tid); */
          %>
              
          </div>
                 
                  
                  <script>
							// When the user clicks on <div>, open the popup
						function myFunction() {
						  alert("Successfully Updated Project");
						}
					</script>
            
                
             
                </div></div>
                <!-- /.card-body -->

            </div>

              <!-- /.card-footer -->
            
    </section>

      
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
