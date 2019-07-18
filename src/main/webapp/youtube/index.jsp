<jsp:include page="../includes/header.jsp"></jsp:include>
<jsp:include page="../includes/navbar.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<h1>Sección youtube</h1>
	<!-- <a class="btn btn-primary" href="youtube/formulario.jsp">Crear vídeo</a>  -->
	
	
	
	<ol class="list-group">
		<c:forEach items="${videos }" var="video">
			<li class="list-group-item">${video.nombre } <a class="btn btn-success" href="https://www.youtube.com/watch?v=${video.codigo }" target="_blank">Ver vídeo</a>
				<a class="btn btn-primary" href="videos?op=2&id=${video.id }">Ver detalle</a>
			</li>
		</c:forEach>
	</ol>

<jsp:include page="../includes/footer.jsp"></jsp:include>