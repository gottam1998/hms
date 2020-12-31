<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<title>addDoctor</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
body {background-image: url('bg4.jpg');
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
}

ul.topnav li a:hover:not(.active) {background-color: #111;}

ul.topnav li a.active {background-color: #4CAF50;}

ul.topnav li.right {float: right;}

@media screen and (max-width: 600px) {
  ul.topnav li.right, 
  ul.topnav li {float: none;}
}

input[type=text], [type=password],[type=email],[type=number],[type=tel]{
  width: 200px;
  padding: 12px 12px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
}

select{
  width: 225px;
  padding: 12px 12px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
}
input[type=radio]{
  padding: 12px 12px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
}



input[type=submit] ,[type=reset]{
  width: 100px;
  padding: 12px 20px;
  margin: 10px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;

}


</style>


<script type="text/javascript">

function checkEmail() {
	if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(form1.email.value)){
	return true;
	}
	return false;
	}
    	
</script>

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


<h1 align="center" >HOSPITAL</h1>
<ul class="topnav">
  <li><a  href="admin.jsp">HOME</a></li>
  <li><a class="active" href="adddoctor.jsp">ADD DOCTOR</a></li>
  <li><a href="ViewDoctors">VIEW DOCTOR</a></li>
  <li class="right"><a href="LogoutController">LOGOUT</a></li>
  <li class="right"><a>${admin.username}</a></li>
</ul>

<form name="form1" action="AddDoctor">

<table align="center">

<tr>
<td><b>NAME<b></td>
<td>
<input type="hidden"name="id"  value="${doctor.id}">
<input type="text" name="name" class="form-control" value="${doctor.name}" required></td>
</tr>

<tr>
<td><b>SURNAME<b></td>
<td><input type="text" name="surname" value="${doctor.surname}" required></td>
</tr>

<tr>
<td><b>GENDER<b></td>
<td>

 <c:forTokens items = "MALE,FEMALE" delims = "," var = "name">
  <c:choose>
   <c:when test="${doctor.gender eq name}">
   <input type="radio" name="gender" value="${name}" checked required> ${name}
   </c:when>
   <c:otherwise>
   <input type="radio" name="gender" value="${name}"  required> ${name}
   </c:otherwise>
   </c:choose>
</c:forTokens>


</td>
</tr>

<tr>
<td><b>EXPERIENCE<b></td>
<td><input type="text" name="experience" value="${doctor.experience}" required ></td>
</tr>

<tr>
<td><b>SPECIALIZATION<b></td>
<td><input type="text" name="specilaization" value="${doctor.specilaization}" required ></td>
</tr>

<tr>
<td><b>EMAIL<b></td>
<td><input type="email" name="email" value="${doctor.email}" required></td>
</tr>

<tr>
<td><b>PHONENO<b></td>
<td><input type="text" name="phoneNo" pattern="[6-9]{1}[0-9]{9}" title="Enter 10 digit number and 1st digit between 6-9" value="${librarian.phoneNo}" required></td>
</tr>

<tr>
<td><b>USERNAME<b></td>
<%-- <td><input type="text" name="username" value="${librarian.username}"  onkeyup="check(this.value);" required><font color="red"><div id="mydiv"></div></font></td> --%>
<td><input type="text" name="username" value="${doctor.username}"/></td>
</tr>

<tr>
<td><b>PASSWORD<b></td>
<td><input type="text" name="password" value="${doctor.password}" required></td>
</tr>

<tr>
<td><input type="reset" value="RESET">
<input type="submit" value="SUBMIT"></td>


</tr>

</table>
</form>
</body>
</html>
