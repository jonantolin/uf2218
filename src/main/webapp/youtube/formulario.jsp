<%@page import="com.ipartek.formacion.controller.VideoController"%>
<jsp:include page="../includes/header.jsp"></jsp:include>
<jsp:include page="../includes/navbar.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
		${mensaje }
		<div class="form-group">
			<input class="btn btn-primary d-inline" type="submit" value="${(op == 4)?'Modificar':'Crear' }">
			<a class="btn btn-info" href="videos">Volver al listado</a>
					
		</div>
		
		<input type="hidden" name="op" value="${op }">
	</form>
	
	<c:if test="${op == 4 }">
		<form action="videos" method="post" class="d-inline">
			<input type="hidden" name="op" value="<%=VideoController.OP_ELIMINAR %>"> 
			<input type="hidden" name="id" value="${video.id }">
			<input type="submit" class="btn btn-danger" value="Eliminar">
		</form>
	</c:if>
	


<jsp:include page="../includes/footer.jsp"></jsp:include>