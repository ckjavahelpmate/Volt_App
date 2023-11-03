package com.volt.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/register-servlet")
public class RegisterServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	private Connection connection ;
	String query ;
	private PreparedStatement preparedStatement ;
	RequestDispatcher dispatcher ;

	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession session = request.getSession();
		
		int id = Integer.parseInt(request.getParameter("user-id"));
		String username = request.getParameter("user-name");
		String email = request.getParameter("user-email");
		String password = request.getParameter("user-password");
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/volt","root", "root");
			query = "insert into user values( ?, ?, ?, ? )";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, id);
			preparedStatement.setString(2, username);
			preparedStatement.setString(3, email);
			preparedStatement.setString(4, password);
			int row = preparedStatement.executeUpdate();
			if( row != 0 )
			{
				request.setAttribute("status", email +" Registered successfully");
				dispatcher = request.getRequestDispatcher("login.jsp");
				dispatcher.forward(request, response);
			}
			else
			{
				session.setAttribute("status", email +" Registration failed");
				dispatcher = request.getRequestDispatcher("login.jsp");
				dispatcher.forward(request, response);
			}
		}
		catch (Exception e) 
		{
			e.printStackTrace();
			session.setAttribute("e", e);
			dispatcher = request.getRequestDispatcher("exception.jsp");
			dispatcher.forward(request, response);
		}
	}
	
	

}
