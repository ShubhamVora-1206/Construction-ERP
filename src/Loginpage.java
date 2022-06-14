import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class First
 */
public class Loginpage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Loginpage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con = DBconnection.connect();
//		
		String uname = request.getParameter("email");
		String upass = request.getParameter("password");
		String role = request.getParameter("role");
		try {
			PreparedStatement pstmt = con.prepareStatement("select * from employee where email =? and password=? and role=?");
			pstmt.setString(1, uname);
			pstmt.setString(2, upass);
			pstmt.setString(3, role);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				if(role.equals("admin")){
					
					com.cred.Credentials.setEmpid(rs.getInt(1));
					com.cred.Credentials.setEmail(rs.getString(3));
					response.sendRedirect("admin.html");
					
				}
				else if(role.equals("architect")){
					com.cred.Credentials.setEmpid(rs.getInt(1));
					com.cred.Credentials.setEmail(rs.getString(3));

					response.sendRedirect("architect.html");
				}
				else if(role.equals("civil")){
					com.cred.Credentials.setEmpid(rs.getInt(1));
					com.cred.Credentials.setEmail(rs.getString(3));

					response.sendRedirect("architect.html");
				}
				else if(role.equals("department")){
					com.cred.Credentials.setEmpid(rs.getInt(1));
					com.cred.Credentials.setEmail(rs.getString(3));

					response.sendRedirect("employee.html");
				}
				else if(role.equals("employee")){
					com.cred.Credentials.setEmpid(rs.getInt(1));
					com.cred.Credentials.setEmail(rs.getString(3));

					response.sendRedirect("employee.html");
				}
				else if(role.equals("sub-employee")){
					com.cred.Credentials.setEmpid(rs.getInt(1));
					com.cred.Credentials.setEmail(rs.getString(3));

					response.sendRedirect("employee.html");
				}
				else{
					
				response.sendRedirect("login.html");
				}
		}else{
			response.sendRedirect("error.html");
		}
			}
			catch(Exception e){
				e.printStackTrace();
			}
			
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
