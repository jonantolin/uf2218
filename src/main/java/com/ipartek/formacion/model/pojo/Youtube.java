package com.ipartek.formacion.model.pojo;

public class Youtube {

	// propiedades
	
	private static final int LONGITUD_CODIGO = 11;
	private static final int LONGITUD_MIN_TITULO = 2;
	private static final int LONGITUD_MAX_TITULO = 150;
	private static final String URL = "https://www.youtube.com/embed/";
	
	private int id;
	private String titulo;
	private String codigo;
	private int reproducciones; // >= 0
	
	// HACER TEST Y PRUEBAS JUNIT
	
	//constructores
	
	public Youtube(int id, String titulo, String codigo) throws Exception {
		/* this.titulo = titulo; // min 2 letras maximo 150
		this.codigo = codigo; // exactamente 11 */
		this.setId(id);
		this.setTitulo(titulo);
		this.setCodigo(codigo);
		this.reproducciones = 0;
	}
	
	public Youtube(String titulo, String codigo) throws Exception {
		/* this.titulo = titulo; // min 2 letras maximo 150
		this.codigo = codigo; // exactamente 11 */
		this.id= 12345;
		this.setTitulo(titulo);
		this.setCodigo(codigo);
		this.reproducciones = 0;
	}
	
	// getters y setters
	
	
	
	
	public String getTitulo() {
		return titulo;
	}
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setTitulo(String titulo) throws Exception {
		
		if(titulo != null && 
				titulo.length() >= LONGITUD_MIN_TITULO
				&& titulo.length() <= LONGITUD_MAX_TITULO) {
			
			this.titulo = titulo;
			
		}else {
			String msg = String.format("titulo debe ser entre" +
					LONGITUD_MIN_TITULO + " y " +
					LONGITUD_MAX_TITULO);
			throw new Exception(msg);
		}
		
		
	}
	public String getCodigo() {
		return codigo;
	}
	
	/**
	 * 
	 * @param codigo String debe ser de tamaño 11 caracteres
	 * @throws Exception si el codigo tiene una longitud distinta a 11 o es null
	 */
	public void setCodigo(String codigo) throws Exception {
		
		if(codigo != null && codigo.length() == LONGITUD_CODIGO) {
			this.codigo = codigo;
			
		}else {
			throw new Exception("Longitud codigo debe ser "+ LONGITUD_CODIGO);
		}

	}
	
	public int getReproducciones() {
		return reproducciones;
	}
	
	/**
	 * 
	 * @param int reproducciones numero de reproducciones debe ser mayor de 0
	 * @throws Exception si reproducciones es <= 0 
	 */
	public void setReproducciones(int reproducciones) throws Exception {
		this.reproducciones = reproducciones;
		
		if(this.reproducciones <= 0) {
			throw new Exception("Debe tener reproducciones, un numero postivo");
		}
	}

	// metodos
	
	@Override
	public String toString() {
		return "Youtube [titulo=" + titulo + ", codigo=" + codigo + ", reproducciones=" + reproducciones + "]";
	}
	
	public String getURL() {
		return URL + codigo;
	}


}

