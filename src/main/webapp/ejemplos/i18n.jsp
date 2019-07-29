<jsp:include page="/includes/header.jsp"></jsp:include>
<jsp:include page="/includes/navbar.jsp"></jsp:include>


<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<h1>Idiomas</h1>
<h2>Recuperar properties desde Servlet</h2>

<!--  -->

${mensajeIdioma }

<ol>
	<li><a href="i18n?idiomaSeleccionado=es_ES"><img width="24px"
			src="resources/img/espana.png"></a></li>
	<li><a href="i18n?idiomaSeleccionado=en_EN"><img width="24px"
			src="resources/img/uk.png"></a></li>
	<li><a href="i18n?idiomaSeleccionado=eu_ES"><img width="24px"
			src="resources/img/ikurrina.png"></a></li>
</ol>

<h2>Recuperar properties desde JSP</h2>

<!-- creo una variable languaje  -->
 <c:set var="locale" value="${not empty sessionScope.locale ? sessionScope.locale : 'es_ES'}" scope="session" />
<fmt:setLocale value="${locale}" />
<fmt:setBundle basename="i18n.i18nmessages" /> 

<p>Idioma: ${locale }</p>
<p class="text-danger"><fmt:message key="menu.ejemplos" /></p>



<div class="card card-block" id="yui_3_17_2_1_1564393149038_24">
	<span class="notifications" id="user-notifications"></span>
	<div role="main" id="yui_3_17_2_1_1564393149038_23">
		<span id="maincontent"></span>
		<h2>i18n - internationalization</h2>
		<div class="box generalbox center clearfix p-y-1"
			id="yui_3_17_2_1_1564393149038_22">
			<div class="no-overflow" id="yui_3_17_2_1_1564393149038_21">
				<p></p>
				<p>
					<i>i18n es la abreviatura de&nbsp;<b>internationalization&nbsp;</b>porque<b>&nbsp;</b>entre
						la "i" y la "n" tenemos 18 letras.
					</i><b><br></b>
				</p>
				<p>
					Internacionalization es un tema que tiene que estar presente en la
					cabeza de todos los desarrolladores de esta era tan globalizada. Es
					poder hacer una aplicación soporte diferentes lenguages con el
					minimo impacto en el código.Por suerte Java nos da una API para
					poder manejarlo en los servlet y en las vistas con JSP.&nbsp;<br>
				</p>
				<p>Para poder realizar todo esto nos basaremos en ficheros
					.properties cada uno de ellos contendran los mensajes para el
					idioma necesario:</p>
				<p id="yui_3_17_2_1_1564393149038_20">
					<img
						src="http://www.campus.formacion.ipartek.com/moodle/pluginfile.php/1562/mod_page/content/2/i18n%20configuracion%20eclipse.png"
						alt="i18n eclipse configuracion" width="416" height="300"
						class="img-responsive atto_image_button_text-bottom"
						id="yui_3_17_2_1_1564393149038_19"><br>
				</p>
				<p>
					<br>
				</p>
				<p>
					En este caso tenemos 3 ficheros de .properties, los cuales todos se
					llaman igual salvo por el final&nbsp;<b>i18nmessages_xx_XX.properties</b>&nbsp;,
					donde las xx son el idioma y XX el pais:<br>
				</p>
				<ul>
					<li>en_EN : ingles de Inglaterra</li>
					<li>es_ES : español de España</li>
					<li>eu_ES : euskera de España</li>
				</ul>
				En el siguiente enlace podemos ver un listado de los idiomas (&nbsp;<b>locale&nbsp;</b>)
				soportados por java&nbsp;<a target="_blank"
					href="http://www.oracle.com/technetwork/java/javase/javase7locales-334809.html">http://www.oracle.com/technetwork/java/javase/javase7locales-334809.html<br></a>
				<p>
					<br>
				</p>
				<h2>
					<b>formato de un properties</b>
				</h2>
				<p>
					Son fichero de texto plano con&nbsp;<b>key = value</b>&nbsp;, la
					KEY nunca cambia y es la forma de acceder al VALUE, el cual varia
					segun el idioma.
				</p>
				<p>
					se usan&nbsp;<b># para comentar<br></b>
				</p>
				<hr>
				ejemplo en_EN:
				<p>
					#navmenu<br>navmenu.op1 = Welcome example
				</p>
				<hr>
				ejemplo es_ES:
				<p>
					#navmenu<br>navmenu.op1 = BienVenido
				</p>
				<hr>
				ejemplo eu_ES:<br>#navmenu<br>navmenu.op1 = OngiEtorri<br>
				<hr>
				<br>
				<p></p>
				<h2>
					Recuperar properties desde <a class="autolink" title="Servlets"
						href="http://www.campus.formacion.ipartek.com/moodle/mod/resource/view.php?id=719">Servlets</a>
				</h2>
				<p>
					Usaremos la clase de la Api Util de java&nbsp;<b>java.util.ResourceBundle</b>&nbsp;para
					cargar el fichero de properties, no hace falta indicar el&nbsp;<b>locale&nbsp;</b>o<b>&nbsp;</b>la
					extensión del idioma porque se le pasa como argumento al metodo:
				</p>
				<p>ResourceBundle.getBundle ( PATH_PROPERTIES, locale );</p>
				<p>
					Para este ejemplo contemplamos que<b>&nbsp;</b>guardamos el idioma
					seleccionado por el usuario en login.jsp en session, variable de
					tipo String "language". Pero tambien podriamos haber usado el
					locale del navegador del usuario&nbsp;<b>request.getLocale()</b><br>
				</p>
				<p>
					Si no existe el idioma carga un locale por defecto "es_ES"<br>
				</p>
				<p>Codigo:</p>
				<p>
					//Locale por defecto Español<br>Locale locale = new
					Locale("es_ES");<br>
					<br>//obtener lenguaje de la session del usuario<br>String
					language = (String) request.getSession().getAttribute("language");<br>
					<br>if ( language != null ){<br>locale = new
					Locale(language);<br>}<br>log.debug("language: " +
					language + " locale: " + locale);
				</p>
				<p>
					<br>//Cargar resourceBundle o properties dependiente del
					idioma
				</p>
				<p>
					// Debemos indicara el package donde se encuentra y el nombre del
					/properties sin la extension del locale&nbsp;<br>ResourceBundle
					messages =
					ResourceBundle.getBundle("com.ipartek.formacion.egunon.controller.i18nmessages",
					locale );<br>
				</p>
				<br>
				<h2>Recuperar properties desde JSP</h2>
				<p>En las JSP usaremos el TagLibrary de JSTL para poder acceder
					a los properties multidiomas:</p>
				<p>
					<b>&lt;fmt:message key="navmenu.op3" /&gt;</b>
				</p>
				<p>Antes de poder usar este tag, debemos realizar una serie de
					pasos:</p>
				<b>1.- Importar las librerias</b>&nbsp;de los TagLibs a usar CORE y
				FMT<br>
				<br>&lt;%@ taglib prefix="c"
				uri="http://java.sun.com/jsp/jstl/core"%&gt;<br>&lt;%@ taglib
				prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%&gt;<br>
				<br>
				<b>2.-</b>&nbsp;<b>Crear una variable para que recoja el valor
					del idioma guardado en session</b><br>
				<br>&lt;c:set var="language" value="${not empty sessionScope.language ? sessionScope.language : 'es_ES'}"
				scope="session" /&gt;<br>
				<br>
				<b>3.- Setear el locale para el TagLig FMT</b><br>&lt;fmt:setLocale
				value="${language}" /&gt;<br>
				<br>
				<b>4.- Cargar fichero de properties&nbsp;</b><br>&lt;fmt:setBundle
				basename="com.ipartek.formacion.egunon.controller.i18nmessages"
				/&gt;&nbsp;<br>
				<b><br>5.- Indicar el idioma que usamos al HMLT</b><br>&lt;!DOCTYPE&gt;<br>&lt;html
				lang="${language}"&gt;<br>&lt;head&gt;<br>
				<br>
				<b>6.- Usarlo</b>&nbsp;donde queramos usando el tag&nbsp;<b>&lt;fmt:message
					key="</b>key.name<b>"<br>
				<br></b><b>fuente:</b>&nbsp;http://docs.oracle.com/javase/tutorial/i18n/intro/index.html<br>
				<br>
				<h1>Recursos con paramatros</h1>
				<p>
					properti con parametros se usan&nbsp;<b>{ }</b>&nbsp;y un numero
					correlativo, ejemplo:<br>
				</p>
				<p>
					<b>ejem.parametros</b>&nbsp;= Tiene dos paramtros; primero:&nbsp;<b>{0}</b>&nbsp;,
					segundo:&nbsp;<b>{1}&nbsp;<br></b>
				</p>
				<p>
					<u><br></u>
				</p>
				<h2>
					<u>Uso en las&nbsp;<b>JSPs</b></u><b></b>
				</h2>
				<p>
					&lt; !-- Ejemplo de Mensajes con paramtros --&gt;<br>&lt;<b>fmt:message</b>&nbsp;key="ejem.parametros"&gt;<br>&lt;<b>fmt:param</b>&nbsp;value="uno"
					/&gt;<br>&lt;<b>fmt:param</b>&nbsp;value="dos" /&gt;<br>&lt;/fmt:message&gt;<br>&lt;
					! -- end:Ejemplo de Mensajes con paramtros --&gt;&nbsp;<br>
				</p>
				<p>
					<br>
				</p>
				<h2>
					<u>En&nbsp;<b>JAVA&nbsp;</b>debemos crearnos una función para
						utilizar
					</u><br>
				</h2>
				<p>
					<br>
				</p>
				<h3>declaracion de la función:</h3>
				<p>
					/**<br>* Utilidad para mostrar mensajes de properties con
					parametros<br>* @param resource ResourceBundle con los
					.properties&nbsp;<br>* @param key llave a buscar en
					ResourceBundle<br>* @param params numero indeterminado de
					paramatros a sustituir<br>* @return cadena mensajes con los
					parametros injectados, si MissingResourceException return: '!' +
					key + '!'<br>*/<br>public static String
					getStringParametros(<br>ResourceBundle resource, String key,
					Object... params )&nbsp;<br>{&nbsp;<br>try {<br>return&nbsp;<b>MessageFormat.format</b>(resource.getString(key),
					params);<br>} catch (MissingResourceException e) {<br>return
					'!' + key + '!';<br>}<br>}<br>
					<br>
				</p>
				<p>
					<br>
				</p>
				<h3>
					Uso de la función<br>
				</h3>
				<p>
					I18n.getStringParametros(
					messages,&nbsp;//bundle&nbsp;"ejem.parametros",&nbsp;//key<br>"uno",&nbsp;//param0
					{0}<br>"dos"&nbsp;//param1 {1}<br>);<br>
				</p>
				<p>
					<br>
				</p>
				<p>
					<br>
				</p>
				<br>
				<br>
				<p></p>
			</div>
		</div>
		<div class="modified">Última modificación: jueves, 19 de octubre
			de 2017, 13:56</div>
	</div>

</div>

<jsp:include page="/includes/footer.jsp"></jsp:include>