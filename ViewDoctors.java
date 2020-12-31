

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ViewDoctors")
public class ViewDoctors extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public ViewDoctors() {
        super();
    }
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("ViewLibrarians  start");
	List<Doctor> doctor_list = new ArrayList<Doctor>();
	
	try {
		Connection con = DatabaseCollector.getCon();
		PreparedStatement ps = con.prepareStatement("select * from doctortable");
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			
			Doctor doctor =new Doctor();
		//	System.out.println(rs.getInt(1));
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
			//System.out.println("Name :: "+rs.getString(1));
			doctor_list.add(doctor);
		}
		
		if(doctor_list.size()>0) {
			
			System.out.println("doctor_list size :: "+doctor_list.size());
			
			request.setAttribute("doctor", doctor_list);
	
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	request.getRequestDispatcher("viewdoctor.jsp").forward(request, response);
	}


}
