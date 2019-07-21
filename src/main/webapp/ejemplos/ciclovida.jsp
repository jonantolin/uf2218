<jsp:include page="/includes/header.jsp"></jsp:include>
<jsp:include page="/includes/navbar.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<h1>Ciclo de vida de un Servlet</h1>
	
	<section class="p-3 bg-light">
	
		<p>Un servlet ejecuta una serie de funciones antes de mostrar resultados. Normalmente usamos las funciones <code>doGet</code> y <code>doPost</code>, pero existen otras funciones <b>implícitas</b> que se ejecutan en algún momento del ciclo de vida y que podemos personalizar</p>
		<p>Cuando creamos un nuevo Servlet con el asistente de Eclipse, tras definir el nombre, paquete y mapeo, podemos darle a "Siguiente" para elegir qué funciones queremos que nos pinte Eclipse en el editor para poder luego hacer algo en ellas.</p>
		<p>La más importante sin duda es <code>init</code>, que es la encargada de ejecutarse nada más llamarse al Servlet por primera vez y que podemos usar para ejecutar aquellas operaciones que queramos que solo se ejecuten con el "nacimiento" del Servlet. Por ejemplo: Instanciar objetos de una clase externa o crear una ArrayList (y rellenarla con algunos datos si queremos) con la que trabajeremos en posteriores peticiones al Servlet.</p>
		<p>Otra que puede sernos útil es <code>service</code> que se ejecutará justo antes de las funciones <code>doGet</code> y <code>doPost</code> , es decir, cada vez que el Servlet reciba una petición (request).</p>
		<p>Existen algunas funciones más, pero esas son sin duda las más utilizadas.</p>
		
		<img src="resources/img/ciclo_vida_servlet.jpg" alt="ciclo-vida">
	
	</section>
	
<jsp:include page="/includes/footer.jsp"></jsp:include>