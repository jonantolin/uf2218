package com.ipartek.formacion.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ipartek.formacion.controller.pojo.Alert;

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
		
		
		if(busqueda != null) {
			
			for(String nombre : listaNombres){
				
				if(nombre.equals(busqueda)) {
					
					encontrado += busqueda + " ha sido encontrado en la lista"+"<br>";
					noEncontrado = false;
				}
			}
			
			
			
			if(noEncontrado) {
				request.setAttribute("noEncontrado", new Alert("danger", busqueda+" no ha sido encontrado en la lista.") );
			}else {
				
				request.setAttribute("encontrado", new Alert("success", encontrado) );
			}
			request.setAttribute("busqueda", busqueda);
		}
		
		request.setAttribute("listaNombres", listaNombres);
		
		request.getRequestDispatcher("ejemplos/nombres.jsp").forward(request, response);
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String nombreNuevo = request.getParameter("nombre");
		
		if(nombreNuevo != null) {
			
			if("".equals(nombreNuevo)) {
				
				request.setAttribute("mensaje", new Alert("warning", "Campo vacío"));
			}else {
				listaNombres.add(nombreNuevo);
			}

		}
		
		
		doGet(request, response);
		
	}

}
