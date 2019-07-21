<jsp:include page="/includes/header.jsp"></jsp:include>
<jsp:include page="/includes/navbar.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<h1>Ciclo de vida de un Servlet</h1>
	
	<section class="p-3 bg-light">
	
		<p>Un servlet ejecuta una serie de funciones antes de mostrar resultados. Normalmente usamos las funciones <code>doGet</code> y <code>doPost</code>, pero existen otras funciones <b>impl�citas</b> que se ejecutan en alg�n momento del ciclo de vida y que podemos personalizar</p>
		<p>Cuando creamos un nuevo Servlet con el asistente de Eclipse, tras definir el nombre, paquete y mapeo, podemos darle a "Siguiente" para elegir qu� funciones queremos que nos pinte Eclipse en el editor para poder luego hacer algo en ellas.</p>
		<p>La m�s importante sin duda es <code>init</code>, que es la encargada de ejecutarse nada m�s llamarse al Servlet por primera vez y que podemos usar para ejecutar aquellas operaciones que queramos que solo se ejecuten con el "nacimiento" del Servlet. Por ejemplo: Instanciar objetos de una clase externa o crear una ArrayList (y rellenarla con algunos datos si queremos) con la que trabajeremos en posteriores peticiones al Servlet.</p>
		<p>Otra que puede sernos �til es <code>service</code> que se ejecutar� justo antes de las funciones <code>doGet</code> y <code>doPost</code> , es decir, cada vez que el Servlet reciba una petici�n (request).</p>
		<p>Existen algunas funciones m�s, pero esas son sin duda las m�s utilizadas.</p>
		
		<img src="resources/img/ciclo_vida_servlet.jpg" alt="ciclo-vida">
	
	</section>
	
<jsp:include page="/includes/footer.jsp"></jsp:include>