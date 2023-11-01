<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login Page</title>
<style>
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

.container {
	background-color: #fff;
	border-radius: 8px;
	margin: 10% auto;
	max-width: 400px;
	padding: 20px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

h1 {
	color: #333;
}

label {
	color: #555;
}

input[type="email"], input[type="password"] {
	width: 100%;
	padding: 10px;
	margin: 8px 0;
	border: 1px solid #ccc;
	border-radius: 5px;
}

.button {
	padding: 10px 20px;
	background-color: #007bff;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.button:hover {
	background-color: #0056b3;
}
</style>
</head>
<body>
	<% session.removeAttribute("profile"); %>
	<% session.removeAttribute("id"); %>

	<div class="navbar">
		<a href="index.jsp">Home</a> <a href="about.jsp">About</a>
	</div>
	<div class="container">
		<h1>Login</h1>
		<form action="login-servlet">
			<label for="username">Email:</label> <input type="email"
				id="username" name="user-email" required> <label
				for="password">Password:</label> <input type="password"
				id="password" name="user-password" required>
			<button class="button" type="submit">Login</button>
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
