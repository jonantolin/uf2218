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
       

	public ServletNombres() {
		
		listaNombres = new ArrayList<String>();
		
		listaNombres.add("Manolo");
		listaNombres.add("Pepito");
		listaNombres.add("Ursiciano");
		listaNombres.add("Agapito");
		
		
	}
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String busqueda = request.getParameter("buscar");
		
		String encontrado ="";
		boolean noEncontrado = true;
		for(String nombre : listaNombres){
			
			if(nombre.equals(busqueda)) {
				
				encontrado = busqueda + " ha sido encontrado en la lista";
				noEncontrado = false;
			}
		}
		
		request.setAttribute("busqueda", busqueda);
		request.setAttribute("encontrado", encontrado );
		
		if(busqueda != null) {
			request.setAttribute("noEncontrado", "<div role=\"alert\" class=\"alert alert-danger\">\""+busqueda+"\" no ha sido encontrado</div>" );
		}
		request.setAttribute("listaNombres", listaNombres);
		
		request.getRequestDispatcher("ejemplos/nombres.jsp").forward(request, response);
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String nombreNuevo = request.getParameter("nombre");
		String mensaje;
		if(nombreNuevo != null) {
			
			if("".equals(nombreNuevo)) {
				mensaje="<span class=\"text-danger\">Campo vacío</span>";
				request.setAttribute("mensaje", mensaje);
			}else {
				listaNombres.add(nombreNuevo);
			}

		}
		
		
		doGet(request, response);
		
	}

}
