
   <%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<!DOCTYPE html>
<html>
   <head>
   <title>viewLibrarians</title>
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
      <link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap.min.js"></script>
      <style>
     
       body {background-image: url('bg11.jpg');
background-repeat: no-repeat;
background-size:cover;
}

ul.topnav {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
}

ul.topnav li {float: left;}

ul.topnav li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-family:"Times New Roman";
}

ul.topnav li a:hover:not(.active) {background-color: #111;}

ul.topnav li a.active {background-color: #4CAF50;}

ul.topnav li.right {float: right;}

@media screen and (max-width: 600px) {
  ul.topnav li.right, 
  ul.topnav li {float: none;}
}

table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
th {
  padding: 5px;
}
th {
  text-align: left;
}


</style>
</head>
<body>

<%
	response.setHeader("Cache-Control","no-cache");
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragma","no-cache");
	response.setDateHeader("Expires",0);
	if(session.getAttribute("username")==null)
	{
		response.sendRedirect("index.jsp");
	}

%>

<h1 align="center" style="font-family:Times New Roman;">HOSPITAL</h1>
<ul class="topnav">
  <li><a  href="admin.jsp">HOME</a></li>
  <li><a href="adddoctor.jsp">ADD DOCTOR</a></li>
  <li><a class="active" href="ViewDoctors">VIEW DOCTORS</a></li>
  <li class="right"><a href="LogoutController">LOGOUT</a></li>
  <li class="right"><a>${admin.username}</a></li>
</ul>

   </head>

   <body>
   
  
      <table id="example" class="table table-striped table-bordered" width = "100%">
      <thead>
         <tr>
         	<th>ID</th>
            <th>NAME </th>
            <th>SURNAME</th>
            <th>GENDER</th>
            <th>EXPERIENCE</th>
            <th>SPECIALIZATION</th>
            <th>EMAIL</th>
            <th>PHONE NO</th>
            <th>USER NAME</th>
            <th>PASSWORD</th>
            <th>ACTIONS</th>
         </tr>
         </thead>
         <tbody>
         <c:forEach var = "doctor" items = "${doctor}">
            <tr>
               <td>${doctor.id}</td>
               <td>${doctor.name}</td>
               <td>${doctor.surname}</td>
               <td>${doctor.gender}</td>
               <td>${doctor.experience}</td>
                <td>${doctor.specilaization}</td>
                <td>${doctor.email}</td>
                <td>${doctor.phoneNo}</td>
               <td>${doctor.username}</td>
               <td>${doctor.password}</td>
               <td><a href="EditDoctor?id=${doctor.id}" >Edit</a>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="DelDoctor?id=${doctor.id}">Delete</a> 
              </td>
            </tr>
         </c:forEach>
         </tbody>
      </table>
<script>
$(document).ready(function() {
    $('#example').DataTable();
} );
</script>
   </body>
</html>