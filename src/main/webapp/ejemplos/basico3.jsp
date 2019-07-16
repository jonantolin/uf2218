<jsp:include page="/includes/header.jsp"></jsp:include>
<jsp:include page="/includes/navbar.jsp"></jsp:include>

<h1>Ejemplo básico Servlet modificando el content-type</h1>
	
	<p>Un Servlet de java siempre responde por defecto como "text/html" pero podemos cambiar el content-type</p>
	<a href="https://developer.mozilla.org/es/docs/Web/HTTP/Basics_of_HTTP/MIME_types/Lista_completa_de_tipos_MIME" target="_blank">Listado de los conten-types que soporta un navegador</a>
	
	<p>Vamos a responder desde el Servlet los mismos datos pero con diferente content-type</p>
	
	<p>DATOS: perro [nombre= 'bubba', raza= 'boxer']</p>
	
	<a class="btn btn-success" href="servlet3?p=1">Respuesta text/plain</a>
	<a class="btn btn-success" href="servlet3?p=2">Respuesta text/html</a>
	<a class="btn btn-success" href="servlet3?p=3">Respuesta application/json</a>
	<a class="btn btn-success" href="servlet3?p=4">Respuesta application/pdf</a>

<jsp:include page="/includes/footer.jsp"></jsp:include>