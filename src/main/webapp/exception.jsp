<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Exception</title>

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
</style>

</head>
<body>
	<div class="navbar">
		<a href="home.jsp">Home</a> 
		<a href="about.jsp">About</a>
		<a href="logout.jsp">Logout</a>
	</div>


	<%
	if (session.getAttribute("e") == null) {
	%>

	<div
		style="background-image: url('./images/something-went-wrong.webp'); background-size: 100% 100%; background-repeat: no-repeat; height: 70vh">


	</div>
	<%
	} else {
	%>
	<div
		style="background-image: url('./images/something-went-wrong.webp'); background-size: 100% 100%; background-repeat: no-repeat; height: 70vh">


	</div>
	<h1 style="color: red; text-align: center;"><%=((Exception) session.getAttribute("e")).getClass().getSimpleName()%></h1>
	<h4 style="color: maroon;; text-align: center;">
		Reason ::
		<%=((Exception) session.getAttribute("e")).getMessage()%></h4>
	<%
	}
	%>

</body>
</html>