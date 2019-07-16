<jsp:include page="/includes/header.jsp"></jsp:include>
<jsp:include page="/includes/navbar.jsp"></jsp:include>

<h1>Ejemplo básico Servlet con JSP</h1>
	
	<p>Envía una petición al servlet de tipo GET con el botón y este detecta en el user-agent si es Chrome/Firefox/Internet Explorer y si es Móvil</p>
	<a class="btn btn-primary" href="UserAgentController">Detectar navegador y dispositivo</a>
	
	<h2>Respuesta</h2>
	<p>Navegador usado: ${navegador }</p>
	<p>Dispositivo: ${dispositivo }</p>

<jsp:include page="/includes/footer.jsp"></jsp:include>