import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/CreateProj")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)
/**
 * Servlet implementation class CreateAccount
 */

public class CreateProj extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateProj() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	 public static final String UPLOAD_DIR = "images";
	    public String dbFileName = "";

	    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con = DBconnection.connect();
		try {
			//get and set values for Customer
			 
			
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			
			
			Part part = request.getPart("file");//
			String fileName = extractFileName(part);//file name
			
			/**
			 * *** Get The Absolute Path Of The Web Application ****
			 */
			String applicationPath = getServletContext().getRealPath("");
			String uploadPath = applicationPath + File.separator + UPLOAD_DIR;
			System.out.println("applicationPath:" + applicationPath);
			File fileUploadDirectory = new File(uploadPath);
			if (!fileUploadDirectory.exists()) {
				fileUploadDirectory.mkdirs();
			}
			String savePath = uploadPath + File.separator + fileName;
			System.out.println("savePath: " + savePath);
			String sRootPath = new File(savePath).getAbsolutePath();
			System.out.println("sRootPath: " + sRootPath);
			part.write(savePath + File.separator);
			File fileSaveDir1 = new File(savePath);
			/*if you may have more than one files with same name then you can calculate some random characters
	         and append that characters in fileName so that it will  make your each image name identical.*/
			dbFileName = UPLOAD_DIR + File.separator + fileName;
			part.write(savePath + File.separator);
			//out.println(id+" "+firstName+" "+lastName+" "+fileName+" "+savePath);
			/*
	         You need this loop if you submitted more than one file
	         for (Part part : request.getParts()) {
	         String fileName = extractFileName(part);
	         part.write(savePath + File.separator + fileName);
	         }*/
			String sql = "insert into project values(?,?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(sql);
			String name = request.getParameter("name");
			String address = request.getParameter("address");
			
			int ac_no=0;
			pstmt.setInt(1, ac_no);
			pstmt.setString(2, name);
			pstmt.setString(3, address);
			pstmt.setString(4, dbFileName);
			pstmt.setString(5, savePath);
			int i=pstmt.executeUpdate();
			if(i>0){
				
				response.sendRedirect("admin.html");
			}
			else{
				response.sendRedirect("error.html");
			}   
	           
	        
//	            out.println("<center><h1>Image inserted Succesfully......</h1></center>");
//	            out.println("<center><a href='display.jsp?id=" + id + "'>Display</a></center>");
	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	    }
	    // file name of the upload file is included in content-disposition header like this:
	    //form-data; name="dataFile"; filename="PHOTO.JPG"

	    private String extractFileName(Part part) {//This method will print the file name.
	        String contentDisp = part.getHeader("content-disposition");
	        String[] items = contentDisp.split(";");
	        for (String s : items) {
	            if (s.trim().startsWith("filename")) {
	                return s.substring(s.indexOf("=") + 2, s.length() - 1);
	            }
	        }
	        return "";
	    }

		//response.getWriter().append("Served at: ").append(request.getContextPath());

	}


