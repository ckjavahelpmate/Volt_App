<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Page</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-image: url('background-image.jpg'); /* Replace 'background-image.jpg' with your image file */
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            font-family: Arial, sans-serif;
        }

        .navbar {
            background-color: rgba(0, 0, 0, 0.5); /* Semi-transparent black background */
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
            background-color: rgba(255, 255, 255, 0.2); /* Semi-transparent white on hover */
        }

        .container {
            text-align: center;
            padding: 100px;
        }

        .form-container {
            background-color: rgba(0, 0, 0, 0.5); /* Semi-transparent black background for forms */
            color: white;
            padding: 20px;
            border-radius: 10px;
        }

        .form-container h2 {
            margin-bottom: 20px;
        }

        .form-container input[type="number"],
        .form-container input[type="text"],
        .form-container input[type="email"],
        .form-container input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: none;
            background-color: rgba(255, 255, 255, 0.1); /* Semi-transparent white background for input fields */
            color: white;
        }

        .form-container button {
            background-color: #007BFF; /* Button background color */
            color: white;
            border: none;
            padding: 10px 20px;
            margin-top: 10px;
            border-radius: 5px;
            cursor: pointer;
        }

        /* Style the button on hover */
        .form-container button:hover {
            background-color: #0056b3; /* Darker blue on hover */
        }
    </style>
</head>
<body>
<% session.removeAttribute("profile"); %>
<% session.removeAttribute("id"); %>
    <div class="navbar">
        <a href="index.jsp">Home</a>
        <a href="about.jsp">About</a>
        <a href="login.jsp">Login</a>
    </div>

    <div class="container">
        <div class="form-container">
            <h2>Registration</h2>
            <form action="register-servlet" method="post">
                <input type="number" placeholder="User Id" name="user-id" required><br><br>
                <input type="text" placeholder="User name" name="user-name" required><br><br>
                <input type="email" placeholder="Email" name="user-email" required><br><br>
                <input type="password" placeholder="Password" name="user-password" required><br><br>
                <button type="submit">Register</button>
            </form>
        </div>
    </div>
</body>
</html>
