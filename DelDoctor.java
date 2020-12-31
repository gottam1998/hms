

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DelDoctor")
public class DelDoctor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DelDoctor() {
        super();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con = DatabaseCollector.getCon();
		String dlt = request.getParameter("id");
		java.sql.Statement st = null;
		try {
			st = con.createStatement();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		int i = 0;
		try {
			i = st.executeUpdate("delete from doctortable where id=" + Integer.valueOf(dlt));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (i != 0) {
		    response.sendRedirect("ViewDoctors");
		} else {
		
		  System.out.println("Data not deleted successfully");
		}
	}
}
