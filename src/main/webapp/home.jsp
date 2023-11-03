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

.navbar a:hover {
	background-color: #ddd;
	color: black;
}

#submit:hover {
	background-color: #ddd;
	color: black;
}

.container {
	text-align: center;
	padding: 100px;
}

.upload-container {
	text-align: center;
	margin-top: 150px
}

.custom-upload {
	background-color: #007bff;
	color: #fff;
	padding: 10px 20px;
	border: none;
	cursor: pointer;
}
</style>
</head>
<body>
	<div class="navbar">
		<a href="home.jsp">Home</a> <a href="about.jsp">About</a> <a
			href="displayImages.jsp">Images</a> <a href="displayVideos.jsp">Videos</a> <a
			href="logout.jsp">Logout</a>
			 <a href="profile.jsp"
			style="float: right; border: groove; margin-right: 50px "><%=session.getAttribute("profile")%></a>
			<a style="float: right;">Welocme | </a>
	</div>

	<div class="upload-container">
		<form action="image-upload-servlet" method="post"
			enctype="multipart/form-data">
			<h1>
				<label class="custom-upload">Image Video</label>
			</h1>
			<input type="file" id="video" name="filename" class="upload-input" style="margin-left: 80px"
				required="required" accept="image/*"> <input type="text"
				name="filetype" value="image" hidden="true">
				<br> <br> <input type="submit" value="Upload" id="submit">	
		</form>
	</div>
	<div class="upload-container">
		<form action="video-upload-servlet" method="post"
			enctype="multipart/form-data">
			<h1>
				<label class="custom-upload"> Upload Video</label>
			</h1>
			<input type="file" id="file" name="filename" class="upload-input"
				style="margin-left: 80px" required="required" accept="video/*">
			<br> <br> <input type="submit" value="Upload" id="submit">
			<input type="text" name="filetype" value="video" hidden="true">
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