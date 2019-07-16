package com.ipartek.formacion.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UserAgentController
 */
@WebServlet("/UserAgentController")
public class UserAgentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doProcess(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doProcess(request, response);
	}

	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String agente = request.getHeader("user-agent");
		String navegador = "no coincide";
		String dispositivo = "";
		
		//Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; InfoPath.3; rv:11.0) like Gecko
		
		if(agente.indexOf("OPR") != -1) {
			
			navegador = "<i class=\"fab fa-opera fa-2x\"></i> Opera";
		}
		
		else if(agente.indexOf("Chrome") != -1) {
			
			navegador = "<i class=\"fab fa-chrome fa-2x\"></i> Chrome";
			
		}else if(agente.indexOf("Firefox") != -1) {
			
			navegador = "<i class=\"fab fa-firefox fa-2x\"></i> Firefox";
		}else if(agente.indexOf("Trident") != -1) {
			
			navegador = "<i class=\"fab fa-internet-explorer fa-2x\"></i> Internet Explorer";
		}
		
		if(agente.indexOf("Mobile") != -1) {
			
			dispositivo = "<i class=\"fas fa-mobile-alt fa-2x\"></i> Móvil";
		}else {
			dispositivo = "<i class=\"fas fa-tv fa-2x\"></i> Ordenador";
		}
		
		request.setAttribute("navegador", navegador);
		request.setAttribute("dispositivo", dispositivo);
		
		
		request.getRequestDispatcher("ejemplos/basico2.jsp").forward(request, response);
		
		
		
		
	}
	
	

}
