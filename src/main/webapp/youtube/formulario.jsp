<jsp:include page="../includes/header.jsp"></jsp:include>
<jsp:include page="../includes/navbar.jsp"></jsp:include>

	<h1>Nuevo vídeo</h1>
	
	<form action="VideoServlet" method="GET">
		<div class="form-group">
			<label for="id">Id: </label>
			 <input
				type="text" class="form-control" id="id"
				placeholder="Introduce id" name="id"> 
		</div>
	
		<div class="form-group">
			<label for="titulo">Titulo: </label> <input
				type="text" class="form-control" id="titulo"
				placeholder="Titulo, 3-150 caracteres" name="titulo"> 
		</div>
		<div class="form-group">
			<label for="codigo">Código</label> <input
				type="text" class="form-control" id="codigo"
				placeholder="11 caracteres" name="codigo">
		</div>

		<button type="submit" class="btn btn-primary">Submit</button>
	</form>



<jsp:include page="../includes/footer.jsp"></jsp:include>