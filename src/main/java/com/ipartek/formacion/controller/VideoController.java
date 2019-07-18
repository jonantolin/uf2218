package com.ipartek.formacion.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ipartek.formacion.model.dao.VideoDAO;

/**
 * Servlet implementation class VideoController
 */
@WebServlet("/videos")
public class VideoController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doProccess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		VideoDAO videoDAO = VideoDAO.getInstance();
		
		String vieneDeFormu = request.getParameter("porFormu");
		
		if(vieneDeFormu != null && "1".equals(vieneDeFormu)) { //Si entra, vendrá desde formulario.jsp
			
			// TODO si esta marcado input checkbox nuevo, insert-values 
			// si no esta marcado, Update 
			
			
			
		}else {
			
			String op = request.getParameter("op");
			
			if(op == null || op == "1") { // Listar 
				request.setAttribute("videos", videoDAO.getAll());
		
				request.getRequestDispatcher("youtube/index.jsp").forward(request, response);
			}else if("2".equals(op) ) { // Ver detalle, ira a formulario
				
				int id = Integer.parseInt(request.getParameter("id"));
				request.setAttribute("video", videoDAO.getById(id));
				request.getRequestDispatcher("youtube/formulario.jsp").forward(request, response);
			}
			
		}
	
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doProccess(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProccess(request, response);
	}

}
