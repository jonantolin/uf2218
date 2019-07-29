<jsp:include page="/includes/header.jsp"></jsp:include>
<jsp:include page="/includes/navbar.jsp"></jsp:include>

	<h1>Session en JSP (HttpSession session)</h1>
	
	<section class="p-3 bg-light">
	
	<p>Hasta ahora hemos estado trabajando con request individuales, pero podemos gestionar los datos que se pasan entre la sesion del cliente individual y servidor. La sesi�n se refiere al navegador que env�a la petici�n que permanecer� abierta mientras no expire el tiempo de sesi�n definido por la aplicaci�n o bien �sta la cierre en alg�n momento.
	<p>Como es obvio, los atributos de sesi�n del objeto HttpSession almacena datos independientes para cada sesi�n.</p>
	<h3>Funcionamiento</h3>
	<p>El funcionamiento del sistema de sessiones es relativamente sencillo. Cada vez que un usuario crea una session accediendo a una p�gina (que la genere) se crea un objeto a nivel de Servidor con un HashMap vac�o que nos permite almacenar la informaci�n que necesitamos relativa a este usuario. Realizado este primer paso se env�a al navegador del usuario una Cookie que sirve para identificarle y asociarle el HashMap que se acaba de construir para que pueda almacenar informaci�n en �l. Este HashMap puede ser accedido desde cualquier otra p�gina permiti�ndonos compartir informaci�n.</p>

	<h3>C�mo acceder a la sesi�n de usuario</h3>
	
	<p>Desde una JSP se puede acceder a trav�s de la variable session que ya esta declarada de forma impl�cita.</p>


	<p>Desde un Servlet se puede conseguir la session del usuario desde la request con la siguiente linea:</p>

	<pre><code>
	
		import javax.servlet.http.HttpSession;
		
		HttpSession session = request.getSession();
	</code></pre>
	
	<p>Podemos establecer atributos accesibles desde otros jsp / servlets lo hacemos asi: </p>
	
	<pre><code>
		
		session.setAttribute("nombreAtributo", "valor que tendr� el atributo (objeto, String, ArrayList, etc)");
		
		TipoAtributo recogidoAtributo = session.getAttribute("nombreAtributo"); 
		</code></pre>
		
	<p>Para marcar la caducidad de la session del usuario se puede usar el siguienete metodo:

session.setMaxInactiveInterval(60);  // 60 segundos 

*En caso de no especificar el propio servidor tiene un tiempo de expiraci�n.</p>

	</section>
<jsp:include page="/includes/footer.jsp"></jsp:include>