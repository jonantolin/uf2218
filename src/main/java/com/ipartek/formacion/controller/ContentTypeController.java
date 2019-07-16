package com.ipartek.formacion.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ContentTypeController
 */
@WebServlet("/servlet3")
public class ContentTypeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setCharacterEncoding("UTF-8");
		String tipo = request.getParameter("p");
		String responseContent = "";
		
		
		switch(tipo) {
		
		case "1":
			response.setContentType("text/plain");
			responseContent = "<h2>Bubba</h2><p>raza boxer</p>";
			break;

		case "2":
			response.setContentType("text/html");
			responseContent = "<h2>Bubba</h2><p>raza boxer</p>";
			break;
			
		case "3":
			response.setContentType("application/json");
			responseContent += "{";
			responseContent += "\"nombre\":\"bubba\",";
			responseContent += "\"raza\":\"boxer\"";
			responseContent += "}";
			break;
			
		case "4":
			response.setContentType("application/pdf");
			// TODO crear y escribir en un fichero pdf
			break;
		
		default:
			break;
		
		}
		
		
		PrintWriter out = response.getWriter();
		out.print(responseContent);
		
		out.flush();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
