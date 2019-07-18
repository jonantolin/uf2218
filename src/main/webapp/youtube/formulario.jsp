<jsp:include page="../includes/header.jsp"></jsp:include>
<jsp:include page="../includes/navbar.jsp"></jsp:include>

<h1>Vídeo</h1>

<form action="videos" method="GET">
	<div class="form-group">
		<label for="titulo">Titulo: </label> <input type="text"
			class="form-control" id="titulo"
			placeholder="Titulo, 3-150 caracteres" name="titulo"
			value="${video.nombre }">
	</div>

	<div class="form-group">
		<label for="codigo">Código</label> <input type="text"
			class="form-control" id="codigo" placeholder="11 caracteres"
			name="codigo" value="${video.codigo }">
	</div>
	
	<div class="form-group">
		<label for="id">Id: </label> <input type="text" class="form-control"
			id="id" placeholder="Introduce id" name="id" disabled value="${video.id }">
	</div>
	
	<div class="form-group">
	<input class="btn btn-primary d-inline" type="submit" value="Guardar datos">
		<label for="id">¿Guardar como nuevo registro? (marcar casilla) </label>
		 <input type="checkbox" 
			id="nuevo" placeholder="Introduce id" name="nuevo">
	</div>
	<input type="hidden" name="porformu" value="1">
</form>



<jsp:include page="../includes/footer.jsp"></jsp:include>