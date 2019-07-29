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
						Servlet mientras se est� ejecutando. Una vez constru�da y enviada
						la respuesta al navegador, desaparecen. Su �nica utilidad es
						ayudarnos a construir la p�gina que queremos mostrar en el
						navegador. Dentro del JSP ser�an variables normales de JSP</p>
					<pre>&lt;% int variable = 33;&nbsp;%&gt;
...
&lt;p&gt;La variable vale &lt;%= variable&nbsp;%&gt;&lt;/p&gt;
</pre>
					<p>y dentro de un Servlet no ser�an m�s que variables locales
						de nuestros m�todos doGet() o doPost().</p>
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
					<p>Estas variables son m�s �tiles. Las guardamos en la petici�n
						que nuestro JSP/Servlet van a hacer a otro JSP/Servlet de nuestra
						aplicaci�n, y este segundo JSP/Servlet puede recogerlos para hacer
						cosas con ellas.</p>
					<p>Dentro de un JSP tenemos predefinido un objeto request, y en
						�l podr�amos fijar estas variables con setParameter() o con
						setAttribue(). y obtener los valores con los getParameter() o
						getAttribute().</p>
					<p>
						<br>
					</p>
					<h3>
						<span id="request_:_set_y_get_parameter">request&nbsp;: set
							y get parameter</span>
					</h3>
					<p>En principio no debemos usar este m�todo. Est� reservado
						para los form de html de nuestras p�ginas jsp. Cuando pulsemos el
						bot�n "submit" del formulario, �l se encargar� de rellenar los
						setParameter()</p>
					<pre>&lt;form action="destino.jsp"&gt;
&lt;input type="text" name="variable" /&gt;
&lt;input type="submit value="Enviar" /&gt;
&lt;/form&gt;
</pre>
					<p>
						En el formulario anterior, al pulsar el submit "Enviar",
						autom�ticamente se har� un request.setParameter("variable",&nbsp;<i>valor
							en la caja de texto</i>) que luego podr� leer nuestra p�gina de
						destino (destino.jsp en nuestro ejemplo) o el servlet. "variable"
						es el name del input type="text". Se guardar� uno por cada input
						que tengamos en el form, cada uno con el nombre que diga su
						atributo "name".
					</p>
					<p>En la p�gina jsp de destino podemos recoger los valores del
						formulario de esta forma</p>
					<pre>&lt;% String variable = request.getParameter("variable");&nbsp;%&gt;
&lt;p&gt;Me han pasado &lt;%= variable&nbsp;%&gt;&lt;/p&gt;
</pre>
					<p>y en un servlet lo recoger�amos del par�metro HttpRequest
						que nos pasan</p>
					<pre>public class UnServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
       String variable = req.getParameter("variable");
       ...
       resp.getWriter().print("&lt;p&gt; La variable vale " + variable + "&lt;/p&gt;");
</pre>
					<p>Un detalle a tener en cuenta es que estos "parameter" s�lo
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
						conoce como una sesi�n. Cuando un usuario visita nuestra
						aplicaci�n por primera vez, autom�ticamente se crea una sesi�n
						para ese usuario. Esta sesi�n suele estar abierta mientras el
						usuario va navegando por las p�ginas de nuestra aplicaci�n y
						desaparece cuando el usuario deja de navegar por nuestra
						aplicaci�n durante un tiempo predeterminado.</p>
					<p>Dicho de otra forma, cualquier valor que guardemos en la
						sesi�n del usuario, s�lo ser� visible por las p�ginas que visite
						ese usuario y mientras el usuario est� activo. Son las variables
						t�picas donde guardar si un usuario ha entrado en sesi�n con un
						usuario y password, su nombre, su carrito de la compra si nuestra
						aplicaci�n es de comercio electr�nico, etc.</p>
					<p>En una p�gina JSP guardar�amos los objetos java que queramos
						por medio de la variable session ya predefinida</p>
					<pre>&lt;% session.setAttribute("variable", new Integer(22));
</pre>
					<p>y en otra p�gina JSP lo obtendr�amos con</p>
					<pre>&lt;p&gt;Me ha llegado &lt;%= session.getAttribute("variable")&nbsp;%&gt;&lt;/p&gt;
</pre>
					<p>Y en un Servlet, igual de f�cil obteniendo la session del
						request que nos llega como par�metro</p>
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
					<p>Estas variables son v�lidas para la aplicaci�n. Permanecen
						hasta que repleguemos nuestra aplicaci�n del servidor o echemos el
						servidor abajo. Son compartidas para todos los usuarios que
						visiten nuestra p�gina web.</p>
					<p>Dentro de un JSP podemos fijarlas o leerlas con la variable
						application que viene predefinida en cualquier JSP, usando los
						conocidos m�todos setAttribute() y getAttribute().</p>
					<pre>&lt;% // Para fijar una variable en un jsp
   application.setAttribute("variable", new Integer(22));

   // Para leerla en otro o el mismo JSP
   Integer valor = (Integer)application.getAttribute("variable");
%&gt;
</pre>
					<p>Y en un Servlet, se puede acceder obteniendo el
						ServletContext y llamando a sus m�todos setAttribute() o
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