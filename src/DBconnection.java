

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconnection {
	public static Connection connect(){
		Connection con=null;
		try {
			//System.out.println("Loading drivers..");
			Class.forName("com.mysql.jdbc.Driver");
			//System.out.println("Driver Loaded..");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/constructionerp","root","");
			//System.out.println("Connection established Successfully");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return(con);

}
}