<jsp:include page="/includes/header.jsp"></jsp:include>
<jsp:include page="/includes/navbar.jsp"></jsp:include>

<h1>Ejemplo básico Servlet sin JSP</h1>
<p>Vamos a crear un servlet para mostrar la REQUEST y RESPONSE</p>
<p>El Servlet será el encargado de pintar la respuesta a pelo, sin usar una JSP.</p>

<a class="btn btn-primary d-block mb-2" href="controlador1">PETICION GET</a>

<a class="btn btn-primary d-block mb-2" href="controlador1?nombre=Jon&edad=32&prof=programador">PETICION GET con parámetros</a>

<a class="btn btn-danger d-block mb-2" href="controlador1234">PETICION GET - Response 404</a>

<jsp:include page="/includes/footer.jsp"></jsp:include>