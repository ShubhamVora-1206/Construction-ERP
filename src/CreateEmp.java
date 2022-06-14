

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CreateAccount
 */
public class CreateEmp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateEmp() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection con = DBconnection.connect();
		try {
			//get and set values for Customer
			 
			String sql = "insert into employee values(?,?,?,?,?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(sql);
			String name = request.getParameter("name");
			String contact = request.getParameter("contact");
			String email= request.getParameter("email");
			String emcontact = request.getParameter("emcontact");
			String dept = request.getParameter("dept");
			String role = request.getParameter("role");
			String password = request.getParameter("password");
			int ac_no=0;
			pstmt.setInt(1, ac_no);
			pstmt.setString(2, name);
			pstmt.setString(3, email);
			pstmt.setString(4, contact);
			pstmt.setString(5,emcontact);
			pstmt.setString(6, dept);
			pstmt.setString(7, role);
			pstmt.setString(8, password);
			int i=pstmt.executeUpdate();
			if(i>0){
				
				response.sendRedirect("admin.html");
			}
			else{
				response.sendRedirect("error.html");
			}
			//account number showing sql
//			String sql1 = "select AccountNumber from customer where name=?";
//			PreparedStatement pstmt4 = con.prepareStatement(sql1);
//			pstmt4.setString(1, customer_name);
//			ResultSet rs = pstmt4.executeQuery();
//			while(rs.next()){
//				System.out.println("Your Account Number is: "+rs.getInt(1));
//			}
			
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
