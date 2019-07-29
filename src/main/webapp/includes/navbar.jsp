<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	<%@page import="com.ipartek.formacion.controller.VideoController"%>
	<c:set var="locale" value="${not empty sessionScope.locale ? sessionScope.locale : 'eu_ES'}" scope="session" />
<fmt:setLocale value="${locale}" />
<fmt:setBundle basename="i18n.i18nmessages" /> 

	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<a class="navbar-brand" href="#">JEE</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li><a href="i18n?idiomaSeleccionado=es_ES&ruta=${pageContext.request.requestURL} "><img width="24px"
			src="resources/img/espana.png"></a></li>
			<li><a href="i18n?idiomaSeleccionado=en_EN&ruta=${pageContext.request.requestURL}"><img width="24px"
			src="resources/img/uk.png"></a></li>
			<li><a href="i18n?idiomaSeleccionado=eu_ES&ruta=${pageContext.request.requestURL}"><img width="24px"
			src="resources/img/ikurrina.png"></a></li>
				<li class="nav-item"><a class="nav-link" href="index.jsp"><fmt:message key="menu.inicio" /></a></li>

				<li class="nav-item"><a class="nav-link" href="ejemplos/calculadora.jsp">Calculadora</a></li>
				
				<c:if test="${usuario == null }">
									
					<li class="nav-item"><a class="nav-link" href="login.jsp"><fmt:message key="menu.login" /></a></li>
				
				</c:if>
				
				<c:if test="${usuario != null }">
				
					<li class="nav-item"><a class="nav-link" href="backoffice/videos"><fmt:message key="menu.videos" /></a></li>			
				
					<li class="nav-item"><a class="nav-link" href="logout"><fmt:message key="menu.logout" /> ${usuario }</a></li>
					
					<li class="nav-item"><a class="nav-link" href="backoffice/index.jsp">BackOffice</a></li>
					
					<li class="nav-item">
		     			<div class="dropdown">
				 			<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				   			 Videos Visualizados
				  			</button>
				 			 <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
					  			 <c:forEach items="${videosVistos}" var="vv"> 
					    			<a class="dropdown-item" href="backoffice/videos?op=<%=VideoController.OP_DETALLE%>&id=${vv.value.id}">(${vv.key}) ${vv.value.nombre}</a>
					    		 </c:forEach>				    
				 			 </div>
						</div>
	     			</li>
	
				</c:if>
			</ul>
		</div>
	</nav> <!-- end navbar -->


	<main class="container">