<%@page import="java.util.ArrayList"%>
<jsp:include page="/includes/header.jsp"></jsp:include>
<jsp:include page="/includes/navbar.jsp"></jsp:include>

<h1 class="">Listado de nombres</h1>

<div class="row">
	<div class="caja-listado col-8">
		
		<form action="nombres" method="get">
			<label for="buscar"><i class="fas fa-search"></i></label>
			<input class="mb-2" type="search" name="buscar" placeholder="Buscar nombre..." value="${busqueda }"><br>
		</form>
		
	
		
			<%
				ArrayList<String> listado =(ArrayList<String>) request.getAttribute("listaNombres");
				
				Object encontrado = request.getAttribute("encontrado");
				
				
				if(encontrado == null){
					
			%>
			${noEncontrado }
			<ul class="list-group">
			<%
					for(String nombre : listado){
		
			%>

			<li class="list-group-item">
				<%=nombre %>
			</li>

			<% 
					} //end for
			%>
			</ul>
			<%
				}else{
			%>
			
			<p>${encontrado}</p>
			<ul class="list-group">
				<li class="list-group-item">${busqueda } </li>
			</ul>
			<a class="btn btn-primary mt-3" href="nombres">Volver al listado</a>
			
			<% 
				} //end else
			%>

	</div>
	<div class="caja-nuevo col-4 p-3 rounded border-left">
		
		<h4>Nuevo</h4>
		${mensaje }
		<form action="nombres" method="post" class="bg-dark text-white p-2 my-2">
			<input type="text" name="nombre" placeholder="Introduce nombre"><br>
			<input class="btn btn-success my-1" type="submit" value="Dar de alta">
		</form>
		
	</div>
</div>
<jsp:include page="/includes/footer.jsp"></jsp:include>