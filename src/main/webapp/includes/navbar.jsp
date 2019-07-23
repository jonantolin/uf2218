	
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				<li class="nav-item"><a class="nav-link" href="index.jsp">Inicio
						
				</a></li>
				<li class="nav-item"><a class="nav-link" href="backoffice/videos">Videos
						
				</a></li>
				<c:if test="${usuario == null }">
					<li class="nav-item"><a class="nav-link" href="login.jsp">Login
	
					</a></li>
				</c:if>
				<c:if test="${usuario != null }">
					<li class="nav-item"><a class="nav-link" href="logout">Logout
			${usuario }
					</a></li>
					<li class="nav-item"><a class="nav-link" href="backoffice/index.jsp">BackOffice
			
					</a></li>
				</c:if>
			</ul>
		</div>
	</nav> <!-- end navbar -->

	<main class="container">