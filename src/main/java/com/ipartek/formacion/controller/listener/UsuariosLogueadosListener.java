package com.ipartek.formacion.controller.listener;

import java.util.ArrayList;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.omg.CORBA.Request;

/**
 * Application Lifecycle Listener implementation class UsuariosLogueadosListener
 *
 */
@WebListener
public class UsuariosLogueadosListener implements HttpSessionListener, HttpSessionAttributeListener {

	public static String nombre; //TODO lo mismo para una coleccion
	//public static String pruebaIp = "";
	public static ArrayList<String> usuarios = new ArrayList<String>();
	HttpSession session;
    /**
     * Default constructor. 
     */
    public UsuariosLogueadosListener() {
       
    }

	/**
     * @see HttpSessionListener#sessionCreated(HttpSessionEvent)
     */
    public void sessionCreated(HttpSessionEvent se)  { 
         // sesion creada
    	
    	session = se.getSession(); //Recupero la sesion la primera vez que entra

    }

	/**
     * @see HttpSessionListener#sessionDestroyed(HttpSessionEvent)
     */
    public void sessionDestroyed(HttpSessionEvent se)  { 
    	//session.setAttribute("mensaje", "<p>La sesión ha caducado. Vuelve a entrar.</p>");
    
    }

	/**
     * @see HttpSessionAttributeListener#attributeAdded(HttpSessionBindingEvent)
     */
    public void attributeAdded(HttpSessionBindingEvent event)  { 
    	
    	Object recuperado = session.getAttribute("nuevoUsuario");
    	
    	if(recuperado != null) {
    		
    		nombre = (String)session.getAttribute("nuevoUsuario");
 	
            usuarios.add(nombre);	

    	}
 
    }

	/**
     * @see HttpSessionAttributeListener#attributeRemoved(HttpSessionBindingEvent)
     */
    public void attributeRemoved(HttpSessionBindingEvent event)  { 
    
    	String deslogueado = (String)event.getValue();
    	
    	if("nuevoUsuario".equals(event.getName())) {
    		
    		usuarios.remove(deslogueado);
    	}
    }

	/**
     * @see HttpSessionAttributeListener#attributeReplaced(HttpSessionBindingEvent)
     */
    public void attributeReplaced(HttpSessionBindingEvent event)  { 
    	 System.out.println("vacio");
    }
	
}
