<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>About Us - Locker App</title>
<style>
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
</style>

<%
if (session.getAttribute("profile") != null) {
%>
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
</style>

<%
} else {
%>
<style type="text/css">
.navbar {
	background-color: #007BFF;
	color: white;
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
	background-color: #0056b3;
}
</style>

<%
}
%>

</head>
<body>
	<div class="navbar">
		<%
		if (session.getAttribute("profile") == null) {
		%>
		<a href="index.jsp">Home</a> <a href="about.jsp">About</a> <a
			href="login.jsp">Login</a> <a href="register.jsp">Register</a>
		<%
		} else {
		%>
		<a href="home.jsp">Home</a> 
		<a href="about.jsp">About</a>
		<a href="displayImages.jsp">Images</a>
		<a href="displayImages.jsp">Videos</a>
		<a href="logout.jsp">Logout</a>
		 <a href="profile.jsp"
			style="float: right; border: groove; margin-right: 50px "><%=session.getAttribute("profile")%></a>
			<a style="float: right;">Welocme | </a>
		<% 
		}
		%>
	</div>

	<div class="container">
		<h1>About Us</h1>

		<div class="about-content">
			<p class="about-text">Welcome to Locker App, your trusted
				solution for storing your valuables securely. Our mission is to
				provide a reliable and convenient locker service to keep your
				belongings safe.</p>

			<p class="about-text">Our state-of-the-art lockers are equipped
				with cutting-edge security features to ensure the safety of your
				items. Whether you need short-term or long-term storage, we've got
				you covered.</p>

			<p class="about-text">We pride ourselves on our commitment to
				customer satisfaction and the security of your items. If you have
				any questions or need assistance, feel free to contact us.</p>
		</div>
	</div>
</body>
</html>
