

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EditDoctor")
public class EditDoctor extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public EditDoctor() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con = DatabaseCollector.getCon();
		String edit = request.getParameter("id");
		Doctor doctor =null;
		java.sql.Statement st = null;
		try {
			st = con.createStatement();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			ResultSet rs = st.executeQuery("select * from doctortable where id="+ Integer.valueOf(edit));
			while(rs.next())
			{
				doctor = new Doctor();
				doctor.setId(rs.getInt(1));
				doctor.setName(rs.getString(2));
				doctor.setSurname(rs.getString(3));
				doctor.setGender(rs.getString(4));
				doctor.setExperience(rs.getString(5));
				doctor.setSpecilaization(rs.getString(6));
				doctor.setEmail(rs.getString(7));
				doctor.setPhoneNo(rs.getString(8));
				doctor.setUsername(rs.getString(9));
				doctor.setPassword(rs.getString(10));
			}
			if(doctor!=null) {
				request.setAttribute("doctor", doctor);
				request.getRequestDispatcher("adddoctor.jsp").forward(request, response);
			}
			} 
		catch (SQLException e) {
			e.printStackTrace();
		}	
	}
}
