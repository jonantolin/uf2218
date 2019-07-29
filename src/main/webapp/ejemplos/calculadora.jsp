<jsp:include page="/includes/header.jsp"></jsp:include>
<jsp:include page="/includes/navbar.jsp"></jsp:include>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>

	<!-- pattern="[-+]?[0-9]*[.,]?[0-9]+" -->
	
	
	
	<h1>Calculadora</h1>

	<form action="calculadora" method="POST">
			
		<div class="form-group w-25">
			<label for="num1">Número 1 </label> <input type="text"
				class="form-control" id="num1"
				placeholder="Introduce número" name="num1" value="${numero1 }"  title="Un número, sin letras" required pattern="[-+]?[0-9]*[.,]?[0-9]+">${num1 }
		</div>
	
		<div class="form-group w-25">
			<label for="num2">Número 2</label> <input type="text"
				class="form-control" id="num2" placeholder="Introduce número"
				name="num2" value="${numero2 }" required title="Un número, sin letras" pattern="[-+]?[0-9]*[.,]?[0-9]+">${num2 }
		</div>
		
		<div class="form-group">
			<label for="operacion">Operación</label> 
			<select id="operacion" name="operacion" >
				<option value="-1" selected>Seleccione operación...</option>
				<option value="sumar" ${(operacion == "sumar")?"selected":"" }>Sumar</option>
				<option value="restar" ${(operacion == "restar")?"selected":"" }>Restar</option>
				<option value="multiplicar" ${(operacion == "multiplicar")?"selected":"" }>Multiplicar</option>
				<option value="dividir" ${(operacion == "dividir")?"selected":"" }>Dividir</option>
			</select> ${mensaje }
		</div>
		
		<div class="form-group">
					<input class="btn btn-primary d-inline" type="submit" value="Calcular">	
						
				</div>
		</form>
		<button class="btn btn-info" onclick="limpiar()">Limpiar</button>
		<div>Resultado <div class="border border-success p-3 w-25 rounded" id="resultado">${resul }
		 
		<c:set var = "resultado" value = "${resultado }" />
		<!-- <fmt:setLocale value = "es_ES"/>  YA ESTA EN CASTELLANO EL LOCALE DE TOMCAT, en caso contrario, descomentar -->
         <fmt:formatNumber value = "${resultado}" type = "number" maxFractionDigits = "2"/>
		
		
		</div></div>
		
		<script>
		function limpiar(event){
			
			document.getElementById("num1").value = "";
			document.getElementById("num2").value = "";
			document.getElementById("operacion").value = "";
			document.getElementById("resultado").innerHTML = "";
		}
	
	</script>
<jsp:include page="/includes/footer.jsp"></jsp:include>