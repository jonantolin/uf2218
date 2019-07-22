<%@page import="com.ipartek.formacion.controller.VideoController"%>
<jsp:include page="../includes/header.jsp"></jsp:include>
<jsp:include page="../includes/navbar.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<h1>Sección youtube</h1>
	<!-- <a class="btn btn-primary" href="youtube/formulario.jsp">Crear vídeo</a>  -->
	
	
	<a class="btn btn-info mb-3" href="backoffice/videos?op=<%=VideoController.OP_NUEVO_VIDEO %>"><i class="fab fa-youtube mr-3"></i>Nuevo vídeo</a>
	
	<ol class="list-group w-75">
		<c:forEach items="${videos }" var="video">
			<li class="list-group-item d-flex justify-content-between">
				<img width="50px" height="35px"src="https://img.youtube.com/vi/${video.codigo }/hqdefault.jpg">
				<div>${video.nombre }</div>
				<div> <a class="btn btn-success" href="https://www.youtube.com/watch?v=${video.codigo }" target="_blank">Ver vídeo</a>
				<a class="btn btn-primary" href="backoffice/videos?op=<%=VideoController.OP_DETALLE %>&id=${video.id }">Ver detalle</a></div>
			</li>
		</c:forEach>
	</ol>
	
<jsp:include page="../includes/footer.jsp"></jsp:include>