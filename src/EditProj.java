
import com.cred.*;
import java.io.IOException;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


/**
 * Servlet implementation class EditProj
 */
public class EditProj extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditProj() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			Connection con= DBconnection.connect();
	    int pid = com.cred.Credentials.getPid();
		int eid=Integer.parseInt(request.getParameter("empid"));
	       PreparedStatement pstmt0 = con.prepareStatement("select name,email from employee where empid=?");
	       pstmt0.setInt(1,eid);
	       ResultSet rs = pstmt0.executeQuery();
	       String ename="";
	       String email="";
	       if(rs.next()){
	    	  ename = rs.getString(1);
	    	  email = rs.getString(2);
	       }
	       PreparedStatement pstmt1 = con.prepareStatement("select name from project where pid=?");
	       pstmt1.setInt(1,pid);
	       ResultSet rs1 = pstmt1.executeQuery();
	       String pname="";
	       if(rs1.next()){
	    	  pname = rs1.getString(1);
	       }
	       PreparedStatement pstmt3 = con.prepareStatement("insert into task values(?,?,?,?,?,?,?,?,?,?,?,?,?)") ;
	       int tid=0;
	       String title=request.getParameter("title");
	       String assigner = request.getParameter("assigner");
	       String priority=request.getParameter("priority");
	       String loc=request.getParameter("location");
	       String start=request.getParameter("start");
	       String end=request.getParameter("end");
	       int manpower = Integer.parseInt(request.getParameter("manpower"));
	       int empid = Integer.parseInt(request.getParameter("empid"));
	       int deptid =Integer.parseInt(request.getParameter("deptid"));
	       String comment = request.getParameter("comment");
	       Part image = request.getPart("image");
	       pstmt3.setInt(1, tid);
	       pstmt3.setInt(2, pid);
	       pstmt3.setString(3, title);
	       pstmt3.setString(4, assigner);
	       pstmt3.setString(5, priority);
	       pstmt3.setString(6, loc);
	       pstmt3.setString(7, start);
	       pstmt3.setString(8, end);
	       pstmt3.setInt(9, manpower);
	       pstmt3.setInt(10,empid);
	       pstmt3.setInt(11, deptid);
	       pstmt3.setString(12, comment);
	       pstmt3.setBlob(13, (Blob) image);
	       int i = pstmt3.executeUpdate();
	       if(i>0){
	    	   System.out.println("task added");
	       }
	       PreparedStatement pstmt = con.prepareStatement("insert into responsibility values(?,?,?,?,?)") ;
	       int rid=0;
	       pstmt.setInt(1,rid);
	       pstmt.setInt(2,eid);
	       pstmt.setInt(3,pid);
	       pstmt.setString(4,ename);
	       pstmt.setString(5,pname);
	       int a= pstmt.executeUpdate();
	       String subject = title;
	       String msg = title+" "+tid+" "+assigner+" Start Date: "+start+" End Date: "+end;
	       Mailer mail=new Mailer();
	       mail.send(email, subject, msg);
	       if(a>0){
	    	   System.out.println("edited from project table");
	    	  response.sendRedirect("viewproj.jsp");
	       }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	       
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
