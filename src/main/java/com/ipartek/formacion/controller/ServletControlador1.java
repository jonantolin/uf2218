package com.ipartek.formacion.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ServletControlador1
 */
@WebServlet("/controlador1")
public class ServletControlador1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// obtener datos del cliente a traves de la request
		
		
		// dar una respuesta a traves de la response

		
		PrintWriter out = response.getWriter();
		out.print("<h1>Respuesta desde ServetControlador1</h1>");
		
		
		// mirar version HTTP y mas cosas
		
		// todos los datos de la cabecera
		Enumeration<String> nombresCabecera = request.getHeaderNames();
		
		while(nombresCabecera.hasMoreElements()) {
			out.print(nombresCabecera.nextElement()+" - ");
		}
		
		out.print("<p>host <b>"+request.getHeader("host")+ "</b></p>");
		out.print("<p>connection <b>"+request.getHeader("connection")+ "</b></p>");
		out.print("<p>pragma <b>"+request.getHeader("pragma")+ "</b></p>");
		out.print("<p>cache-control <b>"+request.getHeader("cache-control")+ "</b></p>");
		out.print("<p>upgrade-insecure-request <b>"+request.getHeader("upgrade-insecure-request")+ "</b></p>");
		out.print("<p>User-Agent <b>"+request.getHeader("user-agent")+ "</b></p>");
		out.print("<p>accept <b>"+request.getHeader("accept")+ "</b></p>");
		out.print("<p>refered <b>"+request.getHeader("refered")+ "</b></p>");
		out.print("<p>accept-encoding <b>"+request.getHeader("accept-encoding")+ "</b></p>");
		out.print("<p>accept-lenguaje <b>"+request.getHeader("accept-lenguaje")+ "</b></p>");
		out.print("<p>cookie <b>"+request.getHeader("cookie")+ "</b></p>");
		
		// todos los parametros que envie el usuario 
		
		// request.getParameterNames();  -> Obtengo nombres de los parametros
		
		out.print("<h2>Datos tomados de los parámetros:</h2>");
		out.print("<p>Nombre: "+request.getParameter("nombre")+"</p>");
		out.print("<p>Edad: "+request.getParameter("edad")+"</p>");
		out.print("<p>Profesión: "+request.getParameter("prof")+"</p>");
		
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
