<%@page import="com.ipartek.formacion.controller.listener.UsuariosLogueadosListener"%>
<jsp:include page="/includes/header.jsp"></jsp:include>
<jsp:include page="/includes/navbar.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- meta http-equiv="refresh" content=3   // refresca la pagina cada 3 seg -->

<meta http-equiv="refresh" content=3> 
	<h1>BACKOFFICE</h1>
	
	
	<h3>Conexiones que han entrado</h3>
	
	<ol class="list-group">
		<c:forEach items="<%=UsuariosLogueadosListener.usuarios %>" var="usuario">
			<li class="list-item">${usuario }</li>
		
		</c:forEach>
	</ol>
	
<jsp:include page="/includes/footer.jsp"></jsp:include>