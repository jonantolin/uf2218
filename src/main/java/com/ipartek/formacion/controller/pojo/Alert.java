package com.ipartek.formacion.controller.pojo;

public class Alert {
	
	private String tipo;
	private String texto;
	
	public Alert(String tipo, String texto) {
		super();
		this.tipo = tipo;
		this.texto = texto;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public String getTexto() {
		return texto;
	}

	public void setTexto(String texto) {
		this.texto = texto;
	}
	
	
	// TODO implementar ciclo de vida
	
	// TODO porbar cagada adrede creando una página de error y mostrandola cuando casque

}
