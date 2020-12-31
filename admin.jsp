<!DOCTYPE html>
<html>
<head>
<title>adminiPage</title>
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

<h1 align="center">HOSPITAL</h1>
<ul class="topnav">
  <li><a class="active" href="admin.jsp">HOME</a></li>
  <li><a href="adddoctor.jsp">ADD DOCTOR</a></li>
  <li><a href="ViewDoctors">VIEW DOCTORS</a></li>
  <li class="right"><a href="LogoutController">LOGOUT</a></li>
  <li class="right"><a>${admin.username}</a></li>
</ul>

<div style="padding:0 16px;">
  <h2 align="center"> ADMIN DASHBOARD</h2>
  
</div>

</body>
</html>
