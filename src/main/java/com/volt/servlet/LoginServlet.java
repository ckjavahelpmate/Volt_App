package com.volt.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/login-servlet")
public class LoginServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	Connection connection ;
	String query ;
	PreparedStatement preparedStatement ;
	ResultSet  resultSet ;
	RequestDispatcher dispatcher ;
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		HttpSession session = request.getSession();
		String email = request.getParameter("user-email");
		String password = request.getParameter("user-password");
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/volt","root", "root");
			query = "Select * From user where email=? && password=?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, email);
			preparedStatement.setString(2, password);
			resultSet = preparedStatement.executeQuery();
			if( resultSet.next() )
			{
				session.setAttribute("profile", "loged-in");
				session.setAttribute("id", resultSet.getInt("id"));
				dispatcher = request.getRequestDispatcher("home.jsp");
				dispatcher.forward(request, response);
			}
			else
			{
				dispatcher = request.getRequestDispatcher("login.jsp");
				dispatcher.include(request, response);
				response.getWriter().print("<h4 style='color:red' align='center' > invalid email or password<h4>");
			}
		}
		catch (Exception e) 
		{
			session.setAttribute("e", e);
			dispatcher = request.getRequestDispatcher("exception.jsp");
			dispatcher.forward(request, response);
		}
	}

}
