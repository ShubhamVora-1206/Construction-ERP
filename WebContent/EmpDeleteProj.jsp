
<%@ page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<HTML>
       <HEAD>
       <TITLE>delete </TITLE>
       </HEAD>
       <BODY>
       <H1> </H1>
       <%
     //System.out.println("Driver Loaded..");
       Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/constructionerp","root","");
       int id = Integer.parseInt(request.getParameter("id"));   
       PreparedStatement pstmt = con.prepareStatement("delete from project where pid=?") ;
       pstmt.setInt(1,id);
       int i= pstmt.executeUpdate();
       if(i>0){
    	   System.out.println("deleted from project table");
    	   //response.sendRedirect("viewproj.jsp");
       }
       PreparedStatement pstmt2 = con.prepareStatement("delete from responsibility where pid=?") ;
       pstmt2.setInt(1,id);
       int a= pstmt2.executeUpdate();
       if(a>0){
    	   response.sendRedirect("EmpViewProj.jsp");
       }
       %>
    
  
     </BODY>
</HTML>