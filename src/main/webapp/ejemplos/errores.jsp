<jsp:include page="../includes/header.jsp"></jsp:include>
<jsp:include page="../includes/navbar.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<h1>P�ginas de error personalizadas</h1>
	
	<section class="p-3 bg-light">
	
		<p>Los servidores web, en nuestro caso Tomcat, est�n provistos de una serie de p�ginas que mostrar�n al usuario si se produce un error.</p>
		<p>Un error muy habitual es el llamado error 404, que se produce cuando el usuario/cliente intenta acceder a una web/recurso del dominio que no existe. En ese momento el servidor Tomcat redirige por defecto la navegaci�n hacia una p�gina est�ndar que informa del error producido.</p>
		<p>Este comportamiento es funcional pero no es la soluci�n m�s elegante, pues la p�gina est�ndar del servidor rompe completamente el dise�o del sitio o aplicaci�n web.</p>
		<p>Lo mejor que podemos hacer es que cuando se produzca un error, Tomcat redirija al usuario a una p�gina que nosotros hayamos dise�ado previamente que mantendr� el dise�o (y la navegaci�n) de nuestra web/app y en la que adem�s, podamos ofrecer algunas soluciones. Veamos como hacerlo: </p>
		
		<h3>Descriptor de despliegue (web.xml)</h3>
		<p>Un descriptor de despliegue de aplicaci�n es un archivo xml que establece c�mo ser� desplegada nuestra aplicaci�n web y con qu� recursos contar�. En versiones anteriores del m�dulo web din�mico era obligatorio implementar este archivo. A partir de la versi�n 3.0 se puede obviar este paso, pero es imprescindible para definir qu� archivos (html, jsp) se cargar�n al producirse un error.</p>
	
		<p>Para definirlo crearemos una carpeta llamada <code>WEB-INF</code> en nuestro directorio ra�z de la aplicaci�n web y en ella crearemos el archivo <code>web.xml</code> con el siguiente contenido: </p>
		
		<pre><code>
		
		&lt;web-app xmlns="http://xmlns.jcp.org/xml/ns/javaee"
	         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	         xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee 
			 http://xmlns.jcp.org/xml/ns/javaee/web-app_3_1.xsd"
	         version="3.1"&gt;
	         
	         
		         &lt;error-page&gt;
			         &lt;error-code&gt;404&lt;/error-code&gt;
			         &lt;location&gt;/404.jsp&lt;/location&gt;
		         &lt;/error-page&gt;
				         
				         
		&lt;/web-app&gt;
		
		
		</code></pre>
	
		<p>En <code>&lt;error-code&gt;</code> escribimos el c�digo de error (Ver -> <a href="https://es.wikipedia.org/wiki/Anexo:C%C3%B3digos_de_estado_HTTP" target="_blank">C�digos de estado HTTP</a>) y en <code>&lt;location&gt;</code> definimos la ruta de la p�gina que queramos mostrar al usuario</p>

		<!-- 
			https://stackoverflow.com/questions/15987212/custom-error-page-in-tomcat-7-for-error-code-500
		 -->

	</section>

<jsp:include page="../includes/footer.jsp"></jsp:include>