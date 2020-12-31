

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/AddDoctor")
public class AddDoctor extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public AddDoctor() {
        super();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("adddoctor.jsp").forward(request, response);
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		System.out.println("id ::" +id);
		String name =request.getParameter("name");
		String surname =request.getParameter("surname");
		String gender =request.getParameter("gender");
		String experience =request.getParameter("experience");
		String specilaization =request.getParameter("specilaization");
		String email =request.getParameter("email");
		String phoneNo=request.getParameter("phoneNo");
		String username =request.getParameter("username");
		String password =request.getParameter("password");
		if(id!=null && !id.equalsIgnoreCase("")) {
			PreparedStatement ps;
		try {
			ps = DatabaseCollector.getCon().prepareStatement("update doctortable set name=?,surname=?,gender=?,experience=?,specilaization=?,email=?,phoneNo=?,username=?,password=? where id="+Integer.valueOf(id));
			ps.setString(1, name);
			ps.setString(2, surname);
			ps.setString(3, gender);
			ps.setString(4, experience);
			ps.setString(5, specilaization);
			ps.setString(6, email);
			ps.setString(7, phoneNo);
			ps.setString(8, username);
			ps.setString(9, password);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}  
		}
		else {
			System.out.println("name :: "+request.getParameter("name"));
			System.out.println("surname::"+request.getParameter("surname"));
			PrintWriter w=response.getWriter();
			w.println("your name:"+name);
		try {
			PreparedStatement ps = DatabaseCollector.getCon().prepareStatement("insert into doctortable (name,surname,gender,experience,specilaization,email,phoneNo,username,password)values (?,?,?,?,?,?,?,?,?)");
			ps.setString(1, name);
			ps.setString(2, surname);
			ps.setString(3, gender);
			ps.setString(4, experience);
			ps.setString(5, specilaization);
			ps.setString(6, email);
			ps.setString(7, phoneNo);
			ps.setString(8, username);
			ps.setString(9, password);
			ps.executeUpdate();	
		} catch (SQLException e) {
			e.printStackTrace();
		}  
		}
		 response.sendRedirect("adddoctor.jsp");
	}

}
