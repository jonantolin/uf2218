package com.ipartek.formacion.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ipartek.formacion.model.dao.VideoDAO;
import com.ipartek.formacion.model.pojo.Video;

/**
 * Servlet implementation class VideoController
 */
@WebServlet("/videos")
public class VideoController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private static VideoDAO videoDAO;
	
	private static final String OP_LISTAR = "1";
	private static final String OP_DETALLE = "2";
	private static final String OP_CREAR = "3";
	
	public static final String VIEW_INDEX = "youtube/index.jsp";
	public static final String VIEW_FORMU = "youtube/formulario.jsp";
	public static String view = VIEW_INDEX;
	
	@Override
		public void init() throws ServletException {
			videoDAO  = VideoDAO.getInstance();
			super.init();
		}
	
	protected void doProccess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		VideoDAO videoDAO = VideoDAO.getInstance();
		
		String vieneDeFormu = request.getParameter("porformu");
		
		if(vieneDeFormu != null && "1".equals(vieneDeFormu)) { //Si entra, vendrá desde formulario.jsp
			
			// Si se ha mandado id en el input hidden, sera para modificar, si se ha mandado vacio sera para crear
			
			String idMandado = request.getParameter("idMandado");
			
			if("".equals(idMandado)) { //Crear nuevo video
				
				
				
			}else { // Modificar video
				
				int id = Integer.parseInt(idMandado);
				Video videoNuevo = new Video();
				videoNuevo.setId(id);
				videoNuevo.setNombre(request.getParameter("nombre"));
				videoNuevo.setCodigo(request.getParameter("codigo"));
				
				if(videoDAO.modificar(videoNuevo)) {
					request.setAttribute("modificado", " Modificado con éxito");
				}
			}
			
		}else { // NO vendra desde formulario,jsp
			
			String op = request.getParameter("op");
			
			if(op == null) {
				op = OP_LISTAR;
			}
			switch(op) {
			
				case OP_LISTAR: 
					request.setAttribute("videos", videoDAO.getAll());
					
					view = VIEW_INDEX;
					request.getRequestDispatcher(view).forward(request, response);
					break;
				
				case OP_DETALLE:
					int id = Integer.parseInt(request.getParameter("id"));
					request.setAttribute("video", videoDAO.getById(id));
					request.setAttribute("modificar", "si");
					view = VIEW_FORMU;
					request.getRequestDispatcher(view).forward(request, response);
					break;
					
				default:
					request.getRequestDispatcher("youtube/index.jsp").forward(request, response);
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
