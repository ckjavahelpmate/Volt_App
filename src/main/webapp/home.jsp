<%@page import="java.io.InputStream"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<style type="text/css">
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f2f2f2;
}

.navbar {
	background-color: #333;
	overflow: hidden;
}

.navbar a {
	float: left;
	display: block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

.navbar #file {
	float: right;
	display: block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

.navbar #submit {
	float: right;
	display: block;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

.navbar a:hover {
	background-color: #ddd;
	color: black;
}

.navbar #file:hover {
	background-color: #ddd;
	color: black;
}

.navbar #submit:hover {
	background-color: #ddd;
	color: black;
}

.container {
	text-align: center;
	padding: 100px;
}
</style>
</head>
<body>
	<div class="navbar">
		<a href="home.jsp">Home</a> 
		<a href="about.jsp">About</a>
		<a href="logout.jsp">Logout</a>
		<a href="#">Images</a>
		<a href="#">Videos</a>
		<form action="upload-servlet" method="post" enctype="multipart/form-data">
			<input id="file" type="file" name="filename" placeholder="Choose file"
				required="required" accept="image/*"> <input id="submit"
				type="submit" value="Image Upload">
		</form>
		<form action="#" method="post" enctype="multipart/form-data">
			<input id="file" type="file" name="filename" placeholder="Choose file"
				required="required" accept="video/*"> <input id="submit"
				type="submit" value="Video Upload">
		</form>
	</div>
	
	
	<h1 id="status" style="display: none;"><%=request.getAttribute("status")%></h1>

	<script async="false">
		var str = document.getElementById("status").textContent
		if (str !== "null") {
			window.onload = function() {
				window.alert(str);
			}
		}
	</script>
</body>
</html>