<jsp:include page="../includes/header.jsp"></jsp:include>
<jsp:include page="../includes/navbar.jsp"></jsp:include>

	<h1>Vídeo</h1>
	
	<form action="videos" method="POST">
	
		<div class="form-group">
			<label for="titulo">Titulo: </label> <input type="text"
				class="form-control" id="nombre"
				placeholder="Titulo, 3-150 caracteres" name="nombre"
				value="${video.nombre }">
		</div>
	
		<div class="form-group">
			<label for="codigo">Código</label> <input type="text"
				class="form-control" id="codigo" placeholder="11 caracteres"
				name="codigo" value="${video.codigo }">
		</div>
		
		<div class="form-group">
			<label for="id">Id: </label> <input type="text" class="form-control"
				id="id" placeholder="id" name="id" readonly value="${video.id }">			
		</div>
		
		<div class="form-group">
			<input class="btn btn-primary d-inline" type="submit" value="${(op == 4)?'Modificar':'Crear' }">
			<a class="btn btn-success" href="videos">Volver al listado</a>
		</div>
		
		<input type="hidden" name="op" value="${op }">
	</form>
	
	<p>${mensaje }</p>


<jsp:include page="../includes/footer.jsp"></jsp:include>