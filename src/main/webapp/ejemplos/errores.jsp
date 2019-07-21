<jsp:include page="../includes/header.jsp"></jsp:include>
<jsp:include page="../includes/navbar.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<h1>Páginas de error personalizadas</h1>
	
	<section class="p-3 bg-light">
	
		<p>Los servidores web, en nuestro caso Tomcat, están provistos de una serie de páginas que mostrarán al usuario si se produce un error.</p>
		<p>Un error muy habitual es el llamado error 404, que se produce cuando el usuario/cliente intenta acceder a una web/recurso del dominio que no existe. En ese momento el servidor Tomcat redirige por defecto la navegación hacia una página estándar que informa del error producido.</p>
		<p>Este comportamiento es funcional pero no es la solución más elegante, pues la página estándar del servidor rompe completamente el diseño del sitio o aplicación web.</p>
		<p>Lo mejor que podemos hacer es que cuando se produzca un error, Tomcat redirija al usuario a una página que nosotros hayamos diseñado previamente que mantendrá el diseño (y la navegación) de nuestra web/app y en la que además, podamos ofrecer algunas soluciones. Veamos como hacerlo: </p>
		
		<h3>Descriptor de despliegue (web.xml)</h3>
		<p>Un descriptor de despliegue de aplicación es un archivo xml que establece cómo será desplegada nuestra aplicación web y con qué recursos contará. En versiones anteriores del módulo web dinámico era obligatorio implementar este archivo. A partir de la versión 3.0 se puede obviar este paso, pero es imprescindible para definir qué archivos (html, jsp) se cargarán al producirse un error.</p>
	
		<p>Para definirlo crearemos una carpeta llamada <code>WEB-INF</code> en nuestro directorio raíz de la aplicación web y en ella crearemos el archivo <code>web.xml</code> con el siguiente contenido: </p>
		
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
	
		<p>En <code>&lt;error-code&gt;</code> escribimos el código de error (Ver -> <a href="https://es.wikipedia.org/wiki/Anexo:C%C3%B3digos_de_estado_HTTP" target="_blank">Códigos de estado HTTP</a>) y en <code>&lt;location&gt;</code> definimos la ruta de la página que queramos mostrar al usuario</p>

		<!-- 
			https://stackoverflow.com/questions/15987212/custom-error-page-in-tomcat-7-for-error-code-500
		 -->

	</section>

<jsp:include page="../includes/footer.jsp"></jsp:include>