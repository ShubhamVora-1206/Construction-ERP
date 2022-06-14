
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
       PreparedStatement pstmt = con.prepareStatement("delete from employee where empid=?") ;
       pstmt.setInt(1,id);
       int i= pstmt.executeUpdate();
       if(i>0){
    	   response.sendRedirect("viewemp.jsp");
       }
       %>
    
  
     </BODY>
</HTML>