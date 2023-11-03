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
<title>Profile</title>
<%
if (session.getAttribute("profile") == null) {

	response.sendRedirect("index.jsp");
}
%>
<style type="text/css">
table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: left;
	font-size: 20px
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

th {
	background-color: gray;
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
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f2f2f2;
}

</style>
</head>
<body
	style="background-image: url('./images/profile-background-image.jpg'); background-repeat: no-repeat; background-size: cover;">
	<div class="navbar">
		<a href="home.jsp">Home</a> <a href="about.jsp">About</a> <a
			href="displayImages.jsp">Images</a> <a href="displayImages.jsp">Videos</a>
		<a href="logout.jsp">Logout</a>
		
		 <a href="profile.jsp"
			style="float: right; border: groove; margin-right: 50px "><%=session.getAttribute("profile")%></a>
			<a style="float: right;">Welocme | </a>
	</div>


		<%
		RequestDispatcher dispatcher = null;
		String profile = (String) session.getAttribute("profile");
		ResultSet rs = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/volt", "root", "root");
			String query = "select * from user where username = ?";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, profile);
			rs = preparedStatement.executeQuery();

			rs.next();
		%>
		<table style="align-self: center; margin-top: 30px">
			<tr>
				<th>Id ::</th>
				<td><%=rs.getInt("id")%></td>
			</tr>
			<tr>
				<th>Name ::</th>
				<td><%=rs.getString("username")%></td>
			</tr>
			<tr>
				<th>Email ::</th>
				<td><%=rs.getString("email")%></td>
			</tr>
			<tr>
				<th>Password ::</th>
				<td><%=rs.getString("password")%></td>
			</tr>
			<tr>
				<th>Photo ::</th>
				<td><img alt="<%=rs.getString("username")%>>"
					src="./images/profile.png" style="border-radius: 50%"></td>
			</tr>

		</table>
		<%
		} catch (Exception e) {
		session.setAttribute("e", e);
		dispatcher = request.getRequestDispatcher("exception.jsp");
		dispatcher.forward(request, response);
		}
		%>





</body>
</html>