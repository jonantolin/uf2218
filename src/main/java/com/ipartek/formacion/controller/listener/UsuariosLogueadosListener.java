package com.ipartek.formacion.controller.listener;

import java.util.ArrayList;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;



/**
 * Application Lifecycle Listener implementation class UsuariosLogueadosListener
 *
 */
@WebListener
public class UsuariosLogueadosListener implements HttpSessionListener, HttpSessionAttributeListener {

	public static String nombre; 
	public static ArrayList<String> usuarios = new ArrayList<String>();
	public HttpSession session;
	
	
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
    	
    	//String estaSesion = session.getId();


    }

	/**
     * @see HttpSessionListener#sessionDestroyed(HttpSessionEvent)
     */
    public void sessionDestroyed(HttpSessionEvent se)  { 
    	
    	
    	 	
    }


    /**
     * HttpSessionBindingEvent event contiene la sesion, el nombre y el valor del atributo agregado
     * event.getSession() / event.getName() / event.getValue()
     */
    public void attributeAdded(HttpSessionBindingEvent event)  { 
    		
    	if("nuevoUsuario".equals(event.getName())) {
    		usuarios.add((String)event.getValue());
    	}
    }


    /**
     * HttpSessionBindingEvent event contiene la sesion, el nombre y el valor del atributo borrado
     * event.getSession() / event.getName() / event.getValue()
     */
    public void attributeRemoved(HttpSessionBindingEvent event)  { 
    	
    	if("nuevoUsuario".equals(event.getName())) {
    		
    		usuarios.remove((String)event.getValue());
    	}
    }

    /**
     * HttpSessionBindingEvent event contiene la sesion, el nombre y el valor del atributo cambiado
     * event.getSession() / event.getName() / event.getValue()
     */
    public void attributeReplaced(HttpSessionBindingEvent event)  { 
    	// System.out.println("vacio");
    }
	
}
