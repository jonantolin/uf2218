<%@page import="com.ipartek.formacion.controller.VideoController"%>
<jsp:include page="../includes/header.jsp"></jsp:include>
<jsp:include page="../includes/navbar.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<h1>Vídeo</h1>
	
	<div class="row">
		<div class="formulario col-12 col-md-6">
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
			
			<c:if test="${op == 4 }"> <!-- Si se cumple, pintara boton ELIMINAR -->

				<!-- Button trigger modal -->
				  
				<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#eliminar">
				  Eliminar
				</button>
		  
				<!-- Modal -->
				
				<div class="modal fade" id="eliminar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLabel">¿Está seguro que desea eliminar el vídeo?</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				        <p>Esta operación es irreversible</p>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
				        <form action="videos" method="post" class="d-inline">
								<input type="hidden" name="op" value="<%=VideoController.OP_ELIMINAR %>"> 
								<input type="hidden" name="id" value="${video.id }">
								<input type="submit" class="btn btn-danger" value="Eliminar">
							</form>
				      </div>
				    </div>
				  </div>
				</div>
		
			</c:if>
		</div>
		
		<div class="video col-12 col-md-6">
		<iframe width="560" height="315" src="https://www.youtube.com/embed/${video.codigo }" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		</div>
	</div>

<jsp:include page="../includes/footer.jsp"></jsp:include>