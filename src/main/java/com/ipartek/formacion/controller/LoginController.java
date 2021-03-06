package com.ipartek.formacion.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ipartek.formacion.controller.pojo.Alert;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		String usuario = request.getParameter("usuario");
		String password = request.getParameter("pass");
		
		HttpSession session = request.getSession();
		
		String ultimaURL = (String) session.getAttribute("callback");
		
		if("admin".equals(usuario) && "admin".equals(password)) {
			
			//HttpSession session = request.getSession(); // Recojo la sesion del cliente logueado
			
			// session.setMaxInactiveInterval(60 * 5); // 5 min, tiempo de sesion o expirara (mejor en web.xml)
			
			session.setAttribute("usuario", usuario);
			session.setAttribute("nuevoUsuario", "Usuario conectado (IP remota) --> " + request.getRemoteAddr()); //recojo Ip de la sesion actual
			
			request.setAttribute("mensaje", "<p>ONGI ETORRI, "+usuario+"</p>");
			
			
			
			if(ultimaURL == null) {
				//request.getRequestDispatcher("backoffice/index.jsp").forward(request, response);
				response.sendRedirect("backoffice/index.jsp");
			}else {
				
				response.sendRedirect(ultimaURL);
				//request.getRequestDispatcher(ultimaURL).forward(request, response);
				session.removeAttribute("callback");
			}
			
			
			
		}else {
			
			request.setAttribute("mensaje", new Alert("danger", "Acceso denegado, credenciales incorrectas."));
		
		request.getRequestDispatcher("login.jsp").forward(request, response);
		
		}

		
	}

}
