<%@page import="java.util.ArrayList"%>
<jsp:include page="/includes/header.jsp"></jsp:include>
<jsp:include page="/includes/navbar.jsp"></jsp:include>

<h1>Listado de nombres</h1>

<div class="row">
	<div class="caja-listado col-8">
		
		<form action="nombres" method="get">
			<input type="search" name="buscar" placeholder="Buscar nombre..."><br>
		</form>
		
	
		<ul>
			<%
				ArrayList<String> listado =(ArrayList<String>) request.getAttribute("listaNombres");
		
				for(String nombre : listado){
		
			%>

			<li>
				<%=nombre %>
			</li>

			<% 
					} //end for

			%>
		</ul>
		
		<p>${busqueda} </p>

	</div>
	<div class="caja-nuevo col-4 bg-dark text-white p-3">
		
		<form action="nombres" method="post">
			<input type="text" name="nombre" placeholder="Introduce nuevo nombre"><br>
			<input type="submit">
		</form>
		
	</div>

<jsp:include page="/includes/footer.jsp"></jsp:include>