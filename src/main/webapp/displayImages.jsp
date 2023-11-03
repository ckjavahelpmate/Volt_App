<%@page import="java.util.Arrays"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.coyote.http11.HeadersTooLargeException"%>
<%@page import="java.sql.Blob"%>
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
<title>Images</title>
<style type="text/css">
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
	margin: 0;
	padding: 0;
	background-color: #f0f0f0;
	font-family: Arial, sans-serif;
}

.container {
	text-align: center;
	padding: 20px 100px;
}

.about-content {
	background-color: white;
	padding: 20px;
	border-radius: 5px;
}

.about-text {
	text-align: left;
	font-size: 16px;
	margin: 0;
}

table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: left;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

th {
	background-color: #4CAF50;
	color: white;
}

img {
	max-width: 100px;
	max-height: 100px;
}
<%
if (session.getAttribute("profile") == null) {

	response.sendRedirect("index.jsp");
}
%>
</style>
</head>
<body>
	<div class="navbar">

		<a href="home.jsp">Home</a> <a href="about.jsp">About</a> <a
			href="displayVideos.jsp">Videos</a> <a href="logout.jsp">Logout</a>
			 <a href="profile.jsp"
			style="float: right; border: groove; margin-right: 50px "><%=session.getAttribute("profile")%></a>
			<a style="float: right;">Welocme | </a>
	</div>

	<div class="container">

		<%
		Connection connection;
		PreparedStatement preparedStatement;
		String query;
		ResultSet rs;
		RequestDispatcher dispatcher;
		int userid = (int) session.getAttribute("id");

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/volt", "root", "root");
			query = "Select * from files where userid = ? && filetype='image'";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, userid);
			rs = preparedStatement.executeQuery();
			boolean available = rs.next();
			if (available) {
		%>
		<table>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Image</th>
				<th>Dowload Link</th>
			</tr>
			<%
			while (available) {
				int id = rs.getInt("fileid");
				String filename = rs.getString("filename");
			%>
			<tr>
				<td><%=id%></td>
				<td><%=filename%></td>
				<%
				Blob blob = rs.getBlob("file");
				byte[] b = blob.getBytes(1, (int) blob.length());
				String path = "C:/Users/QJspiders/eclipse-workspace/Personal/Volt App/src/main/webapp/images/"
						+ rs.getString("filename");
				FileOutputStream fout = new FileOutputStream(path);
				fout.write(b);
				fout.close();
				%>
				<td><img src="./images/<%=filename%>" alt="Volt App"></td>
				<td> <a href="./images/<%=filename%>" download > <%=filename %> </a></td>
			</tr>

			<%
			available = rs.next();
			}
			%>

		</table>

		<%
		} else {
		%>

		<img alt="Image Available" src="./images/notavailable.jpg"
			align="middle">

		<%
		}

		} catch (Exception e) {
		session.setAttribute("e", e);
		dispatcher = request.getRequestDispatcher("exception.jsp");
		dispatcher.forward(request, response);
		}
		%>



	</div>

</body>
</html>