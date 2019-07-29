package com.ipartek.formacion.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ipartek.formacion.controller.pojo.Alert;




/**
 * Servlet implementation class CalculadoraServlet
 */
@WebServlet("/calculadora")
public class CalculadoraServlet extends HttpServlet {
	
	
	private static final String OP_SUMAR = "sumar";
	private static final String OP_RESTAR = "restar";
	private static final String OP_MULTIPLICAR = "multiplicar";
	private static final String OP_DIVIDIR = "dividir";
	
	
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String sNum1 = request.getParameter("num1").replace(",", ".");
		String sNum2 = request.getParameter("num2").replace(",", ".");
		
		request.setAttribute("numero1", sNum1);
		request.setAttribute("numero2", sNum2);
		
		double num1=0;
		double num2=0;
		boolean numsValidos = false;
		
		try {
			
			num1 = Double.parseDouble(sNum1);
			numsValidos = true;
			
		}catch(Exception e) {
			request.setAttribute("num1", new Alert("danger", "Debes introducir un número") );
			
		}
		
		try {
			
			num2 = Double.parseDouble(sNum2);
			numsValidos = true;
			
		}catch(Exception e) {
			request.setAttribute("num2", new Alert("danger", "Debes introducir un número") );
			numsValidos = false;
		}finally {
			
		
	
		String operacion = request.getParameter("operacion");
		
		request.setAttribute("operacion", operacion);
		double resultado=0;
		
		
		if(operacion == null) {
			request.setAttribute("mensaje", new Alert("danger", "Debes seleccionar una operación.") );
		}else if(numsValidos) {
			
			
			switch(operacion) {
			
			case OP_SUMAR:
					
				resultado = num1 + num2;
				break;
				
			case OP_RESTAR:
				
				resultado = num1 - num2;
				break;	
			
			case OP_MULTIPLICAR:
				
				resultado = num1 * num2;
				break;
			
			case OP_DIVIDIR:
				if(num2 == 0) {
					request.setAttribute("resul", new Alert("warning", "Dividido por cero, no se puede o infinito") );
				}
				resultado = num1 / num2;
				break;
				
			default:
				request.setAttribute("mensaje", new Alert("danger", "Debes seleccionar una operación.") );
			}
			
			
			request.setAttribute("resultado", resultado );
		}
		
		
		request.getRequestDispatcher("ejemplos/calculadora.jsp").forward(request, response);
		
		}
		
	}

}
