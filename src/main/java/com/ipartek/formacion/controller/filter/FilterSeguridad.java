package com.ipartek.formacion.controller.filter;

import java.io.IOException;
import javax.servlet.DispatcherType;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class FilterSeguridad
 */
@WebFilter(dispatcherTypes = {
				DispatcherType.REQUEST, 
				DispatcherType.FORWARD, 
				DispatcherType.INCLUDE, 
				DispatcherType.ERROR
		}
					, urlPatterns = { "/backoffice/*" }) // Este filtro se aplica a cualquier peticion a esta ruta
public class FilterSeguridad implements Filter {

	
	public void destroy() {
		
	}



	/**
	 * Lo unico que hago es redireccionar al login,
	 * si no pasa el filtro -> va a login.jsp
	 * si lo pasa (el atributo "usuario" existe) -> va a la ruta a la que iba (que recojo previamente)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		

		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse res = (HttpServletResponse)response;
		
		HttpSession session = req.getSession();
		
		session.setAttribute("callback", req.getRequestURI()); // "coloco" este atributo en la request q mandaré si pasa el filtro
		
		if(session.getAttribute("usuario") != null) {
			
			if("admin".equals(session.getAttribute("usuario"))) {
				chain.doFilter(request, response); // Pasa el filtro y continua (o accede al siguiente filtro si lo hubiera)
				
			}
			
			
		}else {
			// response redireccionar a login
			
			// res.sendRedirect(req.getContextPath() + "/login.jsp"); // No, porque perderia la pagina solicitada (callback)
			
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}
		
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		
	}

}
