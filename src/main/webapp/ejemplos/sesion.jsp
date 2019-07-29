<jsp:include page="/includes/header.jsp"></jsp:include>
<jsp:include page="/includes/navbar.jsp"></jsp:include>

	<h1>Session en JSP (HttpSession session)</h1>
	
	<section class="p-3 bg-light">
	
	<p>Hasta ahora hemos estado trabajando con request individuales, pero podemos gestionar los datos que se pasan entre la sesion del cliente individual y servidor. La sesión se refiere al navegador que envía la petición que permanecerá abierta mientras no expire el tiempo de sesión definido por la aplicación o bien ésta la cierre en algún momento.
	<p>Como es obvio, los atributos de sesión del objeto HttpSession almacena datos independientes para cada sesión.</p>
	<h3>Funcionamiento</h3>
	<p>El funcionamiento del sistema de sessiones es relativamente sencillo. Cada vez que un usuario crea una session accediendo a una página (que la genere) se crea un objeto a nivel de Servidor con un HashMap vacío que nos permite almacenar la información que necesitamos relativa a este usuario. Realizado este primer paso se envía al navegador del usuario una Cookie que sirve para identificarle y asociarle el HashMap que se acaba de construir para que pueda almacenar información en él. Este HashMap puede ser accedido desde cualquier otra página permitiéndonos compartir información.</p>

	<h3>Cómo acceder a la sesión de usuario</h3>
	
	<p>Desde una JSP se puede acceder a través de la variable session que ya esta declarada de forma implícita.</p>


	<p>Desde un Servlet se puede conseguir la session del usuario desde la request con la siguiente linea:</p>

	<pre><code>
	
		import javax.servlet.http.HttpSession;
		
		HttpSession session = request.getSession();
	</code></pre>
	
	<p>Podemos establecer atributos accesibles desde otros jsp / servlets lo hacemos asi: </p>
	
	<pre><code>
		
		session.setAttribute("nombreAtributo", "valor que tendrá el atributo (objeto, String, ArrayList, etc)");
		
		TipoAtributo recogidoAtributo = session.getAttribute("nombreAtributo"); 
		</code></pre>
		
	<p>Para marcar la caducidad de la session del usuario se puede usar el siguienete metodo:

session.setMaxInactiveInterval(60);  // 60 segundos 

*En caso de no especificar el propio servidor tiene un tiempo de expiración.</p>

	</section>
<jsp:include page="/includes/footer.jsp"></jsp:include>