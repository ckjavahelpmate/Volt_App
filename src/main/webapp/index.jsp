<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Locker App</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #f0f0f0; /* Background color for the page */
            font-family: Arial, sans-serif;
        }

        .navbar {
            background-color: #007BFF; /* Navbar background color */
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
            background-color: #0056b3; /* Darker blue on hover */
        }

        .container {
            text-align: center;
            padding: 100px;
        }

        .welcome-message {
            font-size: 24px;
        }

        .button-container {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .button {
            padding: 10px 20px;
            margin: 0 10px;
            background-color: #007BFF;
            color: white;
            text-decoration: none;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
    
</head>
<body>
<% session.removeAttribute("profile"); %>
<% session.removeAttribute("id"); %>
    <div class="navbar">
        <a href="#home">Home</a>
        <a href="about.jsp">About</a>
    </div>

    <div class="container">
        <h1>Welcome to the Secure Volt</h1>
        <p class="welcome-message">Store your valuables securely with our locker service.</p>

        <div class="button-container">
            <a href="login.jsp" class="button">Login</a>
            <a href="register.jsp" class="button">Register</a>
        </div>
    </div>
</body>
</html>
