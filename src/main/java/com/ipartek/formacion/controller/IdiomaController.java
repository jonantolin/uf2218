package com.ipartek.formacion.controller;

import java.io.IOException;
import java.util.Locale;
import java.util.ResourceBundle;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class IdiomaController
 */
@WebServlet("/i18n")
public class IdiomaController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String idiomaSeleccionado = request.getParameter("idiomaSeleccionado");
		
		String idioma="es";
		String pais = "ES";
		if(idiomaSeleccionado != null) {
			idioma = idiomaSeleccionado.split("_")[0];
			pais = idiomaSeleccionado.split("_")[1];
			
		}
		HttpSession session = request.getSession();
		session.setAttribute("locale", idiomaSeleccionado);
		
		String ruta = request.getParameter("ruta");
		
		Locale locale = new Locale(idioma, pais);	
		
		ResourceBundle properties = ResourceBundle.getBundle ( "i18n/i18nmessages", locale );
		
		request.setAttribute("mensajeIdioma", properties.getString("menu.inicio"));
		
		request.getRequestDispatcher("i18n.jsp").forward(request, response);
		/*if(ruta != null) {
			request.getRequestDispatcher(ruta).forward(request, response);
		}else {
			request.getRequestDispatcher("i18n.jsp").forward(request, response);
		}*/
		
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
