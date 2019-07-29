<jsp:include page="/includes/header.jsp"></jsp:include>
<jsp:include page="/includes/navbar.jsp"></jsp:include>

<section class="p-3 bg-light">
<div class="card card-block">
	<span class="notifications" id="user-notifications"></span>
	<div role="main">
		<span id="maincontent"></span>
		<h2>Scopes o Ambitos de una App Web</h2>
		<div class="box generalbox center clearfix p-y-1">
			<div class="no-overflow">
				<div class="col">
					<p>
						<img
							src="http://www.campus.formacion.ipartek.com/moodle/pluginfile.php/4263/mod_page/content/1/scope.gif"
							alt="" role="presentation"
							class="img-responsive atto_image_button_text-bottom" width="250"
							height="480"><br>
					</p>
				</div>
				<div class="col">
					<p></p>
					<h2>
						<span id="Page_Scope">Page Scope</span>
					</h2>
					<p>Son variables que solo se ven dentro de nuestro JSP o
						Servlet mientras se está ejecutando. Una vez construída y enviada
						la respuesta al navegador, desaparecen. Su única utilidad es
						ayudarnos a construir la página que queremos mostrar en el
						navegador. Dentro del JSP serían variables normales de JSP</p>
					<pre>&lt;% int variable = 33;&nbsp;%&gt;
...
&lt;p&gt;La variable vale &lt;%= variable&nbsp;%&gt;&lt;/p&gt;
</pre>
					<p>y dentro de un Servlet no serían más que variables locales
						de nuestros métodos doGet() o doPost().</p>
					<pre>public class UnServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
       int variable = 33;
       ...
       resp.getWriter().print("&lt;p&gt; La variable vale " + variable + "&lt;/p&gt;");
</pre>
					<br>
					<h2>
						<span id="Request_Scope">Request Scope</span>
					</h2>
					<p>Estas variables son más útiles. Las guardamos en la petición
						que nuestro JSP/Servlet van a hacer a otro JSP/Servlet de nuestra
						aplicación, y este segundo JSP/Servlet puede recogerlos para hacer
						cosas con ellas.</p>
					<p>Dentro de un JSP tenemos predefinido un objeto request, y en
						él podríamos fijar estas variables con setParameter() o con
						setAttribue(). y obtener los valores con los getParameter() o
						getAttribute().</p>
					<p>
						<br>
					</p>
					<h3>
						<span id="request_:_set_y_get_parameter">request&nbsp;: set
							y get parameter</span>
					</h3>
					<p>En principio no debemos usar este método. Está reservado
						para los form de html de nuestras páginas jsp. Cuando pulsemos el
						botón "submit" del formulario, él se encargará de rellenar los
						setParameter()</p>
					<pre>&lt;form action="destino.jsp"&gt;
&lt;input type="text" name="variable" /&gt;
&lt;input type="submit value="Enviar" /&gt;
&lt;/form&gt;
</pre>
					<p>
						En el formulario anterior, al pulsar el submit "Enviar",
						automáticamente se hará un request.setParameter("variable",&nbsp;<i>valor
							en la caja de texto</i>) que luego podrá leer nuestra página de
						destino (destino.jsp en nuestro ejemplo) o el servlet. "variable"
						es el name del input type="text". Se guardará uno por cada input
						que tengamos en el form, cada uno con el nombre que diga su
						atributo "name".
					</p>
					<p>En la página jsp de destino podemos recoger los valores del
						formulario de esta forma</p>
					<pre>&lt;% String variable = request.getParameter("variable");&nbsp;%&gt;
&lt;p&gt;Me han pasado &lt;%= variable&nbsp;%&gt;&lt;/p&gt;
</pre>
					<p>y en un servlet lo recogeríamos del parámetro HttpRequest
						que nos pasan</p>
					<pre>public class UnServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
       String variable = req.getParameter("variable");
       ...
       resp.getWriter().print("&lt;p&gt; La variable vale " + variable + "&lt;/p&gt;");
</pre>
					<p>Un detalle a tener en cuenta es que estos "parameter" sólo
						pueden guardar valores de tipo "String".</p>
					<br>
					<p></p>
					<p>
						<br>
					</p>
					<p></p>
					<h2>
						<span id="Session_scope">Session scope</span>
					</h2>
					<p>Las variables Session scope se mantienen durante lo que se
						conoce como una sesión. Cuando un usuario visita nuestra
						aplicación por primera vez, automáticamente se crea una sesión
						para ese usuario. Esta sesión suele estar abierta mientras el
						usuario va navegando por las páginas de nuestra aplicación y
						desaparece cuando el usuario deja de navegar por nuestra
						aplicación durante un tiempo predeterminado.</p>
					<p>Dicho de otra forma, cualquier valor que guardemos en la
						sesión del usuario, sólo será visible por las páginas que visite
						ese usuario y mientras el usuario esté activo. Son las variables
						típicas donde guardar si un usuario ha entrado en sesión con un
						usuario y password, su nombre, su carrito de la compra si nuestra
						aplicación es de comercio electrónico, etc.</p>
					<p>En una página JSP guardaríamos los objetos java que queramos
						por medio de la variable session ya predefinida</p>
					<pre>&lt;% session.setAttribute("variable", new Integer(22));
</pre>
					<p>y en otra página JSP lo obtendríamos con</p>
					<pre>&lt;p&gt;Me ha llegado &lt;%= session.getAttribute("variable")&nbsp;%&gt;&lt;/p&gt;
</pre>
					<p>Y en un Servlet, igual de fácil obteniendo la session del
						request que nos llega como parámetro</p>
					<pre>public class UnServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
       req.getSession().setAttribute("variable", new Integer(22));
       ...
</pre>
					<p>y para leer</p>
					<pre>public class UnServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
       Integer variable = (Integer)req.getSession().getAttribute("variable");
       ...
       resp.getWriter().print("&lt;p&gt; La variable vale " + variable + "&lt;/p&gt;");
</pre>
					<br>
					<h2>
						<span id="Application_scope">Application scope</span>
					</h2>
					<p>Estas variables son válidas para la aplicación. Permanecen
						hasta que repleguemos nuestra aplicación del servidor o echemos el
						servidor abajo. Son compartidas para todos los usuarios que
						visiten nuestra página web.</p>
					<p>Dentro de un JSP podemos fijarlas o leerlas con la variable
						application que viene predefinida en cualquier JSP, usando los
						conocidos métodos setAttribute() y getAttribute().</p>
					<pre>&lt;% // Para fijar una variable en un jsp
   application.setAttribute("variable", new Integer(22));

   // Para leerla en otro o el mismo JSP
   Integer valor = (Integer)application.getAttribute("variable");
%&gt;
</pre>
					<p>Y en un Servlet, se puede acceder obteniendo el
						ServletContext y llamando a sus métodos setAttribute() o
						getAttribute()</p>
					<pre>public class UnServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

       // Para fijar la variable
       getServletContext().setAttribute("PI", new Double(3.1416));
       ...
       // Y para leerla en otro o el mismo servlet
       Double pi = (Double)getServletContext().getAttribute("PI");
</pre>
				
				</div>
			</div>
		</div>


</div>
</div>
</section>
<jsp:include page="/includes/footer.jsp"></jsp:include>