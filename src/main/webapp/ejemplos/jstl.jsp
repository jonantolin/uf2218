<jsp:include page="/includes/header.jsp"></jsp:include>
<jsp:include page="/includes/navbar.jsp"></jsp:include>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>


	<h1>JSTL - Java Server Tag Library</h1>

	<section class="p-3 bg-light">
		<p>La tecnología JavaServer Pages Standard Tag Library (JSTL) es un componente de Java EE. Extiende las ya conocidas JavaServer Pages (JSP) proporcionando cuatro bibliotecas de etiquetas (Tag Libraries) con utilidades ampliamente utilizadas en el desarrollo de páginas web dinámicas.</p>
		<p>Estas bibliotecas de etiquetas extienden de la especificación de JSP (la cual a su vez extiende de la especificación de Servlet). Su API nos permite además desarrollar nuestras propias bibliotecas de etiquetas.</p>
		<p>Sun provee de unas librerías que son estándar como las tags del core que veremos ahora</p>
		<p class="text-danger">*recordar que hay que importar los tag libraries</p>
		<a href="https://www.tutorialspoint.com/jsp/jsp_standard_tag_library" target="_blank">Documentación y ejemplos</a>
		
	</section>
	
	<section class="p-3 bg-light">
		<h2 class="border-bottom">&lt;c:foreach &gt;</h2>
		<p>Sirve para iterar sobre una colección sin tener que usar <code>&lt;% ... %&gt;</code> scriptlets</p>
		<p>Usando EL (Expression Lenguage) <code>&dollar;{colores}</code></p>
		
		<ol>
			<c:forEach items="${colores }" var="color">
				<li>${color }</li>
			</c:forEach>
		</ol>
		
		<h2 class="border-bottom">&lt;c:if &gt;</h2>
		<p>Es el equivalente a un if sin los <code>&lt;% ... %&gt;</code> scriptlets</p>
		<p>Usando EL (Expression Lenguage) <code>&dollar;{condicion/atributoBooleano}</code> en el atributo <code>test</code></p>
		<p>No hay <code>else if</code> pero se puede evaluar el caso contrario con la exclamación ! dentro de las llaves<code>&dollar;{!atributoBooleano}</code></p>
		
		<p>&dollar;{!isLunes} se evalua en la linea de abajo. "isLunes" es mandado como false desde el servlet</p>
		<p><code>&lt;c:if test="&dollar;{!isLunes }"&gt;No es lunes&lt;/c:if&gt;</code></p>
		<c:if test="${!isLunes }">No es lunes</c:if>
		
		<p><code>&lt;c:if test="&dollar;{(2+2) == 4 }"&gt;Cierto&lt;/c:if&gt;</code></p>
		<c:if test="${(2+2) == 4 }">Cierto</c:if>
		
		<p><code>&lt;c:if test="&dollar;{!(2+2 == 5)}"&gt;Nunca 2+2 será 5, se imprime esto&lt;/c:if&gt;</code></p>
		<c:if test="${!(2+2 == 5) }">Nunca 2+2 será 5, como uso la exclamación ! se imprime esto</c:if>
		
		
		<h2 class="border-bottom">&lt;c:choose &gt;</h2>
		<p>Es el equivalente a un if/if else sin los <code>&lt;% ... %&gt;</code> scriptlets</p>
		<p>Se usa junto a <bold>&lt;c:when&gt;</bold> a modo de if, y <bold>&lt;c:otherwise&gt;</bold> como si fueran else if</p>
		<p>Usando EL (Expression Lenguage) <code>&dollar;{condicion/atributoBooleano}</code> en el atributo <code>test</code> de when y de otherwhise</p>
		<p>No hay <code>else if</code> pero se puede evaluar el caso contrario con la exclamación ! dentro de las llaves <code>&dollar;{!atributoBooleano}</code></p>
		
		<c:choose>
			<c:when test="${numero == 1 }">El número es el 1</c:when>
			<c:when test="${numero == 3 }">El número es el 3</c:when>
			<c:when test="${numero == 5 }">El número es el 5</c:when>
		</c:choose>
		
	</section>
	
<jsp:include page="/includes/footer.jsp"></jsp:include>