package com.volt.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
@MultipartConfig
@WebServlet("/upload-servlet")
public class UploadServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	Connection connection;
	String query;
	PreparedStatement preparedStatement;
	RequestDispatcher dispatcher;
	ResultSet rs;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{

		HttpSession session = request.getSession() ;
		int userid = (int) session.getAttribute("id");
		Part part = request.getPart("filename");
		String filename = part.getSubmittedFileName();
		InputStream file = part.getInputStream();
		
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/volt", "root", "root");
			query = "insert into files values( ?, ?, ? )";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, filename);
			preparedStatement.setBlob(2, file);
			preparedStatement.setInt(3, userid);
			int row = preparedStatement.executeUpdate();
			if( row != 0 )
			{
				request.setAttribute("status", filename +" is Added to database");
				dispatcher = request.getRequestDispatcher("home.jsp");
				dispatcher.forward(request, response);
			}

		} catch (Exception e) {
			session.setAttribute("e", e);
			dispatcher = request.getRequestDispatcher("exception.jsp");
			dispatcher.forward(request, response);
		}

	}

}
