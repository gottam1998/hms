<!DOCTYPE html>
<html> 
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<head>
  <title>loginPage</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
body{
background-image: url('bg4.jpg');
background-repeat: no-repeat;
background-size:cover;
}
.form-box
{
	width: 380px;
	height: 380px;
	position: relative;
	margin: 9% auto;
	background: #fff;
	padding: 5px;
	overflow: hidden;
}
h2{
	margin: 35px auto;
}
input[type=text], [type=password]{
  width: 300px;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;

}
input[type=submit] {
  width: 340px;
  padding: 12px 20px;
  margin: 10px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;

}
p{
font-family: arial;
}
</style>

</head>
<body>
<% session.invalidate(); %>
<form action="LoginController" method="post">
<div class="form-box" align="center">
<h2 align="center" > Login </h2>
<div class="input">
<tr>
<td><input type="text" name="username" placeholder="Username"></td><br>
</tr>
<tr>
<td><input type="password" name="password" placeholder="Password"></td>
	<c:if test="${Error eq 'Error'}">
	<span style="color:red">Invalid user name / password entered <br> NOTE: If you forgot your username or password please meet respective admin</span>
	</c:if>

</tr>
<input type="submit" value="login">
</div>
</div>
</form>
</body>
</html>

