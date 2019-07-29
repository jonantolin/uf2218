<jsp:include page="/includes/header.jsp"></jsp:include>
<jsp:include page="/includes/navbar.jsp"></jsp:include>
<%@ page contentType="text/html; charset=UTF-8" %>

<div role="main">
		<span id="maincontent"></span>
		<h2>Listenner y Filters</h2>
		<section class="p-3 bg-light">
		<div class="box generalbox center clearfix p-y-1">
			<div class="no-overflow">
				<p></p>
				<h1>Filtros en JEE</h1>
				<p></p>
				<div>
					<p>Vamos a explicar por encima un mecanismo muy potente que se
						puede utilizar en el diseño modular de portales java, normalmente
						al desarrollar portales siguiendo un patrón MVC o utilizando algún
						Framework que lo implemente como Struts o Spring.</p>
					<p>Siempre nos surge la necesidad de desarrollar la seguridad o
						controlar los “eventos” de navegación, para este caso existen los
						Filtros, un filtro permite que determinada petición o respuesta
						sea analizada bajo ciertas condiciones.</p>
					<p>Una de las principales características de un filtro es que
						puede ser colocado en cualquier punto del flujo de la aplicación,
						ya sea entre una solicitud de JSP a JSP, Servlet a Servlet, o
						inclusive Servlet/JSP a HTML, la única condición que debe
						cumplirse es que debe existir un objeto de entrada
						(ServletRequest) y otro de salida (ServletResponse).</p>
					<p>Ahora bien, solo queda pensar para que queremos usar nuestro
						filtro, su uso normal se suele aplicar para “tracear” el flujo de
						la aplicación con las llamadas que se van realizando, comprobar la
						sesión del usuario así como implementar la seguridad del portal.</p>
				</div>
				<br>Podemos tener mas de un filtro, por lo cual se encadenan
				usando el método <b>chain. </b>El orden de ejecución de los filtros
				es según se declaren en el Web.xml o dependiendo del tipo que sea (
				request, response,...)<br>
				<br>
				<img src="http://www.campus.formacion.ipartek.com/moodle/pluginfile.php/1559/mod_page/content/5/web-filterMapping.gif" alt="ejecucion de filtros" class="img-responsive atto_image_button_text-bottom" width="356" height="253"><br>podemos ver tres filtros ( F1, F2 y F3)
				y tres <a class="autolink" title="Servlets" href="http://www.campus.formacion.ipartek.com/moodle/mod/resource/view.php?id=719">servlets</a>
				( azul )<br>
				<br>
				<h5>
					<br>
				</h5>
				<h5>Creando un Filtro desde Eclipse</h5>
				<p>
					<img src="http://www.campus.formacion.ipartek.com/moodle/pluginfile.php/1559/mod_page/content/5/Creacion%20de%20un%20Filtro.png" alt="creacion filtro desde eclipse" role="presentation" class="img-responsive atto_image_button_text-bottom" width="529" height="547"><br>
				</p>
				<br>Los Filtros al igual que los <a class="autolink" title="Servlets" href="http://www.campus.formacion.ipartek.com/moodle/mod/resource/view.php?id=719">servlets</a>
				también tienen un <b>ciclo de vida</b>, pero es este caso es mas
				simple:<br>
				<br>public void <b>init</b>(FilterConfig fConfig) throws
				ServletException&nbsp;<br>
				<br>public void <b>doFilter</b>(ServletRequest request,
				ServletResponse response, FilterChain chain) throws IOException,
				ServletException<br>
				<br>public void <b>destroy</b>()&nbsp;<br>
				<br>
				<br>
				<br>
				<br>
				<p></p>
				<p></p>
				<h1>Escuchadores ( Listenners ) en Java</h1>
				<p>
					otro concepto importante&nbsp;<strong>de JEE a nivel web
						los listeners</strong>&nbsp;y en concreto en este caso&nbsp;<strong>el
						ServletContextListener</strong>&nbsp;. Estos listener estan diseñados para
					escuchar los diferentes eventos que se producen en el ciclo de vida
					de la aplicacion web. Los listener mas importantes son los
					siguientes:<br>
				</p>
				<p itemprop="description">
					<strong>ServletContextListener:</strong><span>&nbsp;Listener
						que se encarga de gestionar los eventos generales de la aplicación
						como son arranque y parada de la App Web.</span><br>
				</p>
				<div>
					<main>
					<article itemscope="" itemtype="https://schema.org/CreativeWork">
						<div itemprop="text">
							<p>
								<strong>HttpSessionListener :</strong>Listener que se encarga de
								gestionar los propios eventos de la sessión como creación
								,invalidación y destrucción de sessiones.
							</p>
							<p>
								<strong>ServletRequestListener :</strong>&nbsp;Listener que se
								encarga de los eventos de creación y destruccion de peticiones
								del usuario.
							</p>
						</div>
					</article>
					</main>
				</div>
				<img src="http://www.campus.formacion.ipartek.com/moodle/pluginfile.php/1559/mod_page/content/5/listener%20disponibles.png" alt="listener disponibles" class="img-responsive atto_image_button_text-bottom" width="533" height="561"><br>
				<p></p>
				<h1>
					<br>
				</h1>
				<h1>Invocación de servlest con Listener y Filtros</h1>
				<br>
				<br>En el diagrama de la izquierda se puede ver que antes de
				ejecutar un&nbsp;<b>servlet</b>&nbsp;( o&nbsp;<b>JSP</b>&nbsp;), se
				ejecuta un Web&nbsp;<b>Listener</b>.<br>
				<br>En el diagrama de la derecha; si usamos&nbsp;<b>filtros</b>,
				estos se ejecutan después del listener y despues de la ejecución del
				Servlet Container ( en nuestro caso el motor de <a class="autolink" title="Servlets" href="http://www.campus.formacion.ipartek.com/moodle/mod/resource/view.php?id=719">servlets</a>
				de Tomcat ), luego se irán aplicando N filtros. El orden de los
				filtros coincide con el orden de declaración en el WEB.XML.<br>
				<br>
				<p></p>
				<p>
					<img src="http://www.campus.formacion.ipartek.com/moodle/pluginfile.php/1559/mod_page/content/5/ejecucion%20listenner%20y%20filters.png" alt="" role="presentation" class="img-responsive atto_image_button_text-bottom" width="523" height="510"><br>
				</p>
				<p>
					<img src="http://www.campus.formacion.ipartek.com/moodle/brokenfile.php#/5/user/draft/775115967/ejecucion%20listenner%20y%20filters.png" alt="ejecucion listenner y filters" width="523" height="510">
				</p>
				<br>
				<p></p>
			</div>
		</div>
		</section>
	</div>

<jsp:include page="/includes/footer.jsp"></jsp:include>