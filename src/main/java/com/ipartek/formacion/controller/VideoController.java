package com.ipartek.formacion.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;

import com.ipartek.formacion.model.dao.VideoDAO;
import com.ipartek.formacion.model.pojo.Video;

/**
 * Servlet implementation class VideoController
 */
@WebServlet("/backoffice/videos")
public class VideoController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private static VideoDAO videoDAO;
	
	//Crear Factoria y Validador
	 private ValidatorFactory factory;
	 private Validator validator;
	
	public static final String OP_LISTAR = "1";
	public static final String OP_DETALLE = "2";
	public static final String OP_INSERTAR = "3";
	public static final String OP_MODIFICAR = "4";
	public static final String OP_NUEVO_VIDEO = "5";
	public static final String OP_ELIMINAR = "6";
	
	public static final String VIEW_INDEX = "/backoffice/youtube/index.jsp";
	public static final String VIEW_FORMU = "/backoffice/youtube/formulario.jsp";
	public static String view = VIEW_INDEX;
	
	@Override
		public void init() throws ServletException {
			videoDAO  = VideoDAO.getInstance();
			factory = Validation.buildDefaultValidatorFactory();
			validator = factory.getValidator();
			super.init();
		}
	
	protected void doProccess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		VideoDAO videoDAO = VideoDAO.getInstance();
		
			
			String op = request.getParameter("op");
			
			if(op == null) {
				op = OP_LISTAR;
			}
			switch(op) {
			
				case OP_LISTAR: 
					request.setAttribute("videos", videoDAO.getAll());
					view = VIEW_INDEX;
					break;
				
				case OP_DETALLE:
					
					int id = Integer.parseInt(request.getParameter("id"));
					
					Video video = videoDAO.getById(id);
					request.setAttribute("video", video);
					//visitados.add()
					request.setAttribute("op", OP_MODIFICAR); //lo uso para que se envie como input hidden en el formur si se quiere modificar
					
					HttpSession session = request.getSession();
					
					HashMap<Integer, Video> videosVistos = (HashMap<Integer, Video>) session.getAttribute("videosVistos");
					
					if(videosVistos == null) {
						
						videosVistos = new HashMap<Integer, Video>();
					}
					
					videosVistos.put(video.getId(), video);
					session.setAttribute("videosVistos", videosVistos);
					
					view = VIEW_FORMU;
					break;
					
				case OP_NUEVO_VIDEO: // va al formu vacio para insertar nuevo video
					
					request.setAttribute("op", OP_INSERTAR); //lo uso para que se envie como input hidden en el formur si se quiere modificar
					
					view = VIEW_FORMU;
					break;
				
				case OP_INSERTAR: // Cuando se envia el nuevo video desde el formu
					
					crear(request, response);
						
					// <div class="alert alert-success" role="alert"></div>
					view = VIEW_FORMU;
					break;
					
				case OP_MODIFICAR: 
					
					modificar(request, response);
					
					
					view = VIEW_FORMU;
					break;	
					
				case OP_ELIMINAR: 
					
					if(eliminar(request, response)) {
						
						request.setAttribute("op", OP_INSERTAR);
						request.setAttribute("mensaje", "<div class=\"alert alert-success\" role=\"alert\"> Video eliminado con éxito</div>");
						
					}else {
						request.setAttribute("mensaje", "<div class=\"alert alert-danger\" role=\"alert\">No ha sido posible eliminarlo</div>");
					}
					
					view = VIEW_FORMU;
					break;				
				default:
					view = VIEW_INDEX;
			}
			
		request.getRequestDispatcher(view).forward(request, response);
	}

	private boolean eliminar(HttpServletRequest request, HttpServletResponse response) {
		
		boolean eliminado = false;
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		if(videoDAO.eliminar(id)) {
			eliminado = true;
		}
		
		
		return eliminado;
	}

	private boolean crear(HttpServletRequest request, HttpServletResponse response) {
		boolean creado = false;
		
		Video videoNuevo = new Video();

		videoNuevo.setNombre(request.getParameter("nombre"));
		videoNuevo.setCodigo(request.getParameter("codigo"));
		
		Set<ConstraintViolation<Video>> violations = validator.validate(videoNuevo);
		
		if(violations.isEmpty()) {
			
			int idRecuperado = videoDAO.crear(videoNuevo);
		
			if(idRecuperado != -1) {
				creado = true;
				videoNuevo.setId(idRecuperado);
				
			}
			
			request.setAttribute("op", OP_MODIFICAR); // para recoger en en el value del input hidden una vez creado
			request.setAttribute("mensaje", " <div class=\"alert alert-success\" role=\"alert\">Nuevo video registrado con éxito</div>");
			
			
		}else {
			
			String mensaje = "<div class=\"alert alert-danger\" role=\"alert\">";
			
			for (ConstraintViolation<Video> violation : violations) {

				mensaje += violation.getPropertyPath()+": "+violation.getMessage()+"<br>";
			}
			
			mensaje += "</div>";
			
			
			request.setAttribute("op", OP_INSERTAR);
			request.setAttribute("mensaje", mensaje);
			
		}
		request.setAttribute("video", videoNuevo);
		
		return creado;
	}

	private boolean modificar(HttpServletRequest request, HttpServletResponse response) {
		
		boolean modificado = false;
		
		String idMandado = request.getParameter("id");

		int id = Integer.parseInt(idMandado);
		
		Video videoNuevo = new Video();
		videoNuevo.setId(id);
		videoNuevo.setNombre(request.getParameter("nombre"));
		videoNuevo.setCodigo(request.getParameter("codigo"));
		
		Set<ConstraintViolation<Video>> violations = validator.validate(videoNuevo); 
		
		if(violations.isEmpty()) {
		
			if(videoDAO.modificar(videoNuevo)) {
				modificado = true;
			}
			request.setAttribute("mensaje", "<div class=\"alert alert-success\" role=\"alert\"> Video modificado con éxito</div>");
		}else {
			
			String mensaje = "<div class=\"alert alert-danger\" role=\"alert\">";
			
			for (ConstraintViolation<Video> violation : violations) {

				mensaje += violation.getPropertyPath()+": "+violation.getMessage()+"<br>";
			}
			
			mensaje += "</div>";
			
			request.setAttribute("mensaje", mensaje);
			
		}
		
		request.setAttribute("op", OP_MODIFICAR);
		request.setAttribute("video", videoNuevo);
		return modificado;
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doProccess(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		doProccess(request, response);
	}
//TODO implementar mensaje de alerta con el pojo Alert
}
