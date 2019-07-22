<jsp:include page="includes/header.jsp"></jsp:include>
<jsp:include page="includes/navbar.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<h1>Login</h1>
	
	${mensaje }
	
	<form action="login" method="POST">
			
		<div class="form-group">
			<label for="usuario">Nombre de usuario </label> <input type="text"
				class="form-control" id="usuario"
				placeholder="Tu nombre de usuario" name="usuario">
		</div>
	
		<div class="form-group">
			<label for="pass">Contraseña</label> <input type="password"
				class="form-control" id="pass" placeholder="Contraseña"
				name="pass">
		</div>
		
		<div class="form-group">
					<input class="btn btn-primary d-inline" type="submit" value="Entrar">			
				</div>
	</form>
<jsp:include page="includes/footer.jsp"></jsp:include>