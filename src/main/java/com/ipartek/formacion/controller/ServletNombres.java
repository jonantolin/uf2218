package com.ipartek.formacion.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ServletNombres
 */
@WebServlet("/nombres")
public class ServletNombres extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ArrayList<String> listaNombres;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String primera = request.getParameter("iniciar");
		
		if(primera != null && "1".equals(primera)) {
			
			listaNombres = new ArrayList<String>();
			
			listaNombres.add("Manolo");
			listaNombres.add("Pepito");
			listaNombres.add("Ursiciano");
			listaNombres.add("Agapito");
		} // Solo para rellenar la primera vez, cuando viene desde el enlace
		
		String busqueda = request.getParameter("buscar");
		
		String encontrado ="";
		for(String nombre : listaNombres){
			
			if(nombre.equals(busqueda)) {
				
				encontrado = busqueda + " ha sido encontrado en la lista";
				
			}
		}
		
		request.setAttribute("busqueda",encontrado );
		
		request.setAttribute("listaNombres", listaNombres);
		
		request.getRequestDispatcher("ejemplos/nombres.jsp").forward(request, response);
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		listaNombres.add((String) request.getParameter("nombre"));
		doGet(request, response);
		
	}

}
