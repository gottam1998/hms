

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L ;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String username = request.getParameter("username");
	String password = request.getParameter("password");
	Admin admin=null;
	
	try{
	PreparedStatement ps=DatabaseCollector.getCon().prepareStatement("select * from admin where username=? and password=?");
	ps.setString(1, username);
	ps.setString(2, password);
	ResultSet res=ps.executeQuery();
	if(res.next())
	{
	admin= new Admin();
	admin.setUsername(res.getString(1));
	admin.setPassword(res.getString(2));

	}
	if(admin!=null) {
	System.out.println("success");
	HttpSession session = request.getSession();
	session.setAttribute("username", admin);
	session.setAttribute("admin", admin);

	request.getRequestDispatcher("admin.jsp").forward(request, response);
	}
	
	else {
	request.setAttribute("Error", "Error");
	request.getRequestDispatcher("index.jsp").forward(request, response);
	System.out.println("Error");
	}
	
	
	}
	catch (SQLException e) {
	e.printStackTrace();
	}  

	}
	}

