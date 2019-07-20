<jsp:include page="/includes/header.jsp"></jsp:include>
<jsp:include page="/includes/navbar.jsp"></jsp:include>
<%@ page contentType="text/html; charset=utf-8" %>

<div id="content" class="mw-body" role="main">
	<a id="top"></a>
	<div id="siteNotice" class="mw-body-content"><div id="centralNotice"></div><!-- CentralNotice --></div>
	<div class="mw-indicators mw-body-content">
</div>

	<h1 id="firstHeading" class="firstHeading" lang="es">JavaServer Pages</h1>
	
<p><b>JavaServer Pages</b> (JSP) es una tecnología que ayuda a los desarrolladores de software a crear páginas web dinámicas basadas en <a href="/wiki/HTML" title="HTML">HTML</a> y <a href="/wiki/XML" class="mw-redirect" title="XML">XML</a>, entre otros tipos de documentos. JSP es similar a <a href="/wiki/PHP" title="PHP">PHP</a>, pero usa el lenguaje de programación <a href="/wiki/Java_(lenguaje_de_programaci%C3%B3n)" title="Java (lenguaje de programación)">Java</a>.
</p><p>Para desplegar y correr JavaServer Pages, se requiere un servidor web compatible con contenedores <a href="/wiki/Servlet" class="mw-redirect" title="Servlet">servlet</a> como <a href="/wiki/Apache_Tomcat" class="mw-redirect" title="Apache Tomcat">Apache Tomcat</a> o <a href="/wiki/Jetty" title="Jetty">Jetty</a>.
</p><p>TagLibs -&gt; JSP -&gt; Servidor Aplicaciones (Servlets) -&gt; Cliente (Navegador)
</p><p>El rendimiento de una página JSP es el mismo que tendría el servlet equivalente, ya que el código es compilado como cualquier otra clase Java. A su vez, la máquina virtual compilará dinámicamente a código de máquina las partes de la aplicación que lo requieran. Esto hace que JSP tenga un buen desempeño y sea más eficiente que otras tecnologías web que ejecutan el código de una manera puramente interpretada.
</p><p>La principal ventaja de <b>JSP</b> frente a otros lenguajes es que el lenguaje Java es un lenguaje de propósito general que excede el mundo web y que es apto para crear clases que manejen lógica de negocio y acceso a datos de una manera prolija. Esto permite separar en niveles las aplicaciones web, dejando la parte encargada de generar el documento HTML en el archivo JSP.
</p><p>Otra ventaja es que JSP hereda la portabilidad de Java, y es posible ejecutar las aplicaciones en múltiples plataformas sin cambios. Es común incluso que los desarrolladores trabajen en una plataforma y que la aplicación termine siendo ejecutada en otra.
</p><p>Los servlets y Java Server Pages (JSPs) son dos métodos de creación de páginas web dinámicas en servidor usando el lenguaje Java. En ese sentido son similares a otros métodos o lenguajes tales como el <a href="/wiki/PHP" title="PHP">PHP</a>, <a href="/wiki/Active_Server_Pages" title="Active Server Pages">ASP</a> o los <a href="/wiki/Interfaz_de_entrada_com%C3%BAn" title="Interfaz de entrada común">CGIs</a>, programas que generan páginas web en el servidor. Sin embargo, se diferencian de ellos en otras cosas.
</p><p>Para empezar, los JSPs y servlets se ejecutan en una máquina virtual Java, lo cual permite que, en principio, se puedan usar en cualquier tipo de ordenador, siempre que exista una máquina virtual Java para él. Cada servlet (o JSP, a partir de ahora lo usaremos de forma indistinta) se ejecuta en su propio hilo, es decir, en su propio contexto; pero no se comienza a ejecutar cada vez que recibe una petición, sino que persiste de una petición a la siguiente, de forma que no se pierde tiempo en invocarlo (cargar programa + <a href="/wiki/Int%C3%A9rprete_(inform%C3%A1tica)" title="Intérprete (informática)">intérprete</a>). Su persistencia le permite también hacer una serie de cosas de forma más eficiente: conexión a bases de datos y manejo de sesiones, por ejemplo. 
</p><p>Las JSPs son en realidad una forma alternativa de crear servlets ya que el código JSP se traduce a código de servlet Java la primera vez que se le invoca y en adelante es el código del nuevo servlet el que se ejecuta produciendo como salida el código HTML que compone la página web de respuesta.
</p>
<div id="toc" class="toc"><input type="checkbox" role="button" id="toctogglecheckbox" class="toctogglecheckbox" style="display:none"><div class="toctitle" dir="ltr" lang="es"><h2>Índice</h2><span class="toctogglespan"><label class="toctogglelabel" for="toctogglecheckbox"></label></span></div>
<ul>
<li class="toclevel-1 tocsection-1"><a href="#Descripción"><span class="tocnumber">1</span> <span class="toctext">Descripción</span></a></li>
<li class="toclevel-1 tocsection-2"><a href="#Ejemplo_de_documento_JSP"><span class="tocnumber">2</span> <span class="toctext">Ejemplo de documento JSP</span></a></li>
<li class="toclevel-1 tocsection-3"><a href="#Sintaxis"><span class="tocnumber">3</span> <span class="toctext">Sintaxis</span></a>
<ul>
<li class="toclevel-2 tocsection-4"><a href="#Variables_implícitas"><span class="tocnumber">3.1</span> <span class="toctext">Variables implícitas</span></a></li>
<li class="toclevel-2 tocsection-5"><a href="#Directivas"><span class="tocnumber">3.2</span> <span class="toctext">Directivas</span></a></li>
<li class="toclevel-2 tocsection-6"><a href="#Declaraciones"><span class="tocnumber">3.3</span> <span class="toctext">Declaraciones</span></a></li>
<li class="toclevel-2 tocsection-7"><a href="#Scriptlets"><span class="tocnumber">3.4</span> <span class="toctext">Scriptlets</span></a></li>
<li class="toclevel-2 tocsection-8"><a href="#Expresiones"><span class="tocnumber">3.5</span> <span class="toctext">Expresiones</span></a></li>
<li class="toclevel-2 tocsection-9"><a href="#Etiquetas"><span class="tocnumber">3.6</span> <span class="toctext">Etiquetas</span></a>
<ul>
<li class="toclevel-3 tocsection-10"><a href="#Etiquetas_JSP"><span class="tocnumber">3.6.1</span> <span class="toctext">Etiquetas JSP</span></a></li>
<li class="toclevel-3 tocsection-11"><a href="#Etiquetas_JSTL"><span class="tocnumber">3.6.2</span> <span class="toctext">Etiquetas JSTL</span></a></li>
<li class="toclevel-3 tocsection-12"><a href="#Etiquetas_Struts_TagLib"><span class="tocnumber">3.6.3</span> <span class="toctext">Etiquetas Struts TagLib</span></a></li>
<li class="toclevel-3 tocsection-13"><a href="#Etiquetas_personalizadas"><span class="tocnumber">3.6.4</span> <span class="toctext">Etiquetas personalizadas</span></a></li>
</ul>
</li>
</ul>
</li>
<li class="toclevel-1 tocsection-14"><a href="#Véase_también"><span class="tocnumber">4</span> <span class="toctext">Véase también</span></a></li>
<li class="toclevel-1 tocsection-15"><a href="#Enlaces_externos"><span class="tocnumber">5</span> <span class="toctext">Enlaces externos</span></a></li>
</ul>
</div>

<h2><span id="Descripci.C3.B3n"></span><span class="mw-headline" id="Descripción">Descripción</span><span class="mw-editsection"><span class="mw-editsection-bracket">[</span><a href="/w/index.php?title=JavaServer_Pages&amp;action=edit&amp;section=1" title="Editar sección: Descripción">editar</a><span class="mw-editsection-bracket">]</span></span></h2>
<p>JSP puede ser visto como una abstracción de alto nivel de los servlets Java. Las JavaServer Pages son traducidas a servlets en tiempo real; cada servlet es guardado en caché y rehusado hasta que la JSP original es modificada. Dicho en otras palabras un JSP son páginas java para un ambiente web.
</p>
<h2><span class="mw-headline" id="Ejemplo_de_documento_JSP">Ejemplo de documento JSP</span><span class="mw-editsection"><span class="mw-editsection-bracket">[</span><a href="/w/index.php?title=JavaServer_Pages&amp;action=edit&amp;section=2" title="Editar sección: Ejemplo de documento JSP">editar</a><span class="mw-editsection-bracket">]</span></span></h2>
<p>Ejemplo de código de una página JSP:
</p>
<div class="mw-highlight mw-content-ltr" dir="ltr"><pre><span></span><span class="k">&lt;%@</span> <span class="n">page</span> <span class="n">errorPage</span><span class="o">=</span><span class="s">"myerror.jsp"</span> <span class="k">%&gt;</span>
<span class="k">&lt;%@</span> <span class="n">page</span> <span class="n">import</span><span class="o">=</span><span class="s">"com.foo.bar"</span> <span class="k">%&gt;</span>
<span class="nt">&lt;html&gt;</span>
<span class="nt">&lt;head&gt;</span>
<span class="k">&lt;%!</span> <span class="kt">int</span> <span class="n">serverInstanceVariable</span> <span class="o">=</span> <span class="mi">1</span><span class="o">;</span><span class="k">%&gt;</span>

<span class="k">&lt;%!</span> <span class="kt">int</span> <span class="n">localStackBasedVariable</span> <span class="o">=</span> <span class="mi">1</span><span class="o">;</span><span class="k">%&gt;</span>
…
</pre></div>
<p><br>
</p>
<div class="mw-highlight mw-content-ltr" dir="ltr"><pre><span></span>JSP
</pre></div>
<p><br>
Ejemplo de una compilación o "salida" JSP:
</p>
<div class="mw-highlight mw-content-ltr" dir="ltr"><pre><span></span>package jsp_servlet;
import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.*;
import com.foo.bar; //importado como resultado de <span class="k">&lt;%@</span> <span class="n">page</span> <span class="n">import</span><span class="o">=</span><span class="s">"com.foo.bar"</span> <span class="k">%&gt;</span>
import …
class _myservlet implements javax.servlet.Servlet, javax.servlet.jsp.HttpJspPage {
	//insertado como
	//resultado de <span class="k">&lt;%!</span> <span class="kt">int</span> <span class="n">serverInstanceVariable</span> <span class="o">=</span> <span class="mi">1</span><span class="o">;</span><span class="k">%&gt;</span>
	int serverInstanceVariable = 1; 
	…
	public void _jspService( javax.servlet.http.HttpServletRequest request,
		javax.servlet.http.HttpServletResponse response )
		throws javax.servlet.ServletException,
		java.io.IOException
	{
		javax.servlet.ServletConfig config = ...;//obtener la configuración del servlet
		Object page = this;
		PageContext pageContext = …;//obtener el contexto de la página para esta petición 
		javax.servlet.jsp.JspWriter out = pageContext.getOut();
		HttpSession session = request.getSession( true );
		…
</pre></div>
<p>Para ejecutar las páginas JSP, se necesita un servidor Web con un contenedor Web que cumpla con las especificaciones de JSP y de Servlet. <a href="/wiki/Tomcat" title="Tomcat">Tomcat</a> 5 es una completa implementación de referencia para las especificaciones Java Servlet 2.2 y JSP 1.1.
</p>
<h2><span class="mw-headline" id="Sintaxis">Sintaxis</span><span class="mw-editsection"><span class="mw-editsection-bracket">[</span><a href="/w/index.php?title=JavaServer_Pages&amp;action=edit&amp;section=3" title="Editar sección: Sintaxis">editar</a><span class="mw-editsection-bracket">]</span></span></h2>
<h3><span id="Variables_impl.C3.ADcitas"></span><span class="mw-headline" id="Variables_implícitas">Variables implícitas</span><span class="mw-editsection"><span class="mw-editsection-bracket">[</span><a href="/w/index.php?title=JavaServer_Pages&amp;action=edit&amp;section=4" title="Editar sección: Variables implícitas">editar</a><span class="mw-editsection-bracket">]</span></span></h3>
<p>Las páginas JSP incluyen ciertas variables privilegiadas sin necesidad de declararlas ni configurarlas:
</p>
<table class="wikitable">

<tbody><tr align="center">
<th>Variable
</th>
<th>Clase
</th></tr>
<tr>
<td><code>pageContext</code>
</td>
<td><code>javax.servlet.jsp.PageContext</code>
</td></tr>
<tr>
<td><code>request</code>
</td>
<td><code>javax.servlet.http.HttpServletRequest</code>
</td></tr>
<tr>
<td><code>response</code>
</td>
<td><code>javax.servlet.http.HttpServletResponse</code>
</td></tr>
<tr>
<td><code>session</code>
</td>
<td><code>javax.servlet.http.HttpSession</code>
</td></tr>
<tr>
<td><code>config</code>
</td>
<td><code>javax.servlet.ServletConfig</code>
</td></tr>
<tr>
<td><code>application</code>
</td>
<td><code>javax.servlet.ServletContext</code>
</td></tr>
<tr>
<td><code>out</code>
</td>
<td><code>javax.servlet.jsp.JspWriter</code>
</td></tr>
<tr>
<td><code>page</code>
</td>
<td><code>java.lang.Object</code>
</td></tr>
<tr>
<td><code>exception</code>
</td>
<td><code>java.lang.Exception</code>
</td></tr></tbody></table>
<h3><span class="mw-headline" id="Directivas">Directivas</span><span class="mw-editsection"><span class="mw-editsection-bracket">[</span><a href="/w/index.php?title=JavaServer_Pages&amp;action=edit&amp;section=5" title="Editar sección: Directivas">editar</a><span class="mw-editsection-bracket">]</span></span></h3>
<p>Son etiquetas a partir de las cuales se genera información que puede ser utilizada por el motor de JSP. No producen una salida visible al usuario sino que configura cómo se ejecutará la página JSP.
</p><p>Su sintaxis es:
<code>
</code></p><code><pre> &lt;%@ directiva atributo="valor"&nbsp;%&gt;
</pre></code><code></code><p><code></code>
</p><p>Las directivas disponibles son:
</p>
<ul><li><code><b>include</b></code>: Incluye el contenido de un fichero en la página mediante el atributo <i>file</i>.</li></ul>
<dl><dd><dl><dd><code>&lt;%@ include file="cabecera.html"&nbsp;%&gt;</code></dd></dl></dd></dl>
<ul><li><code><b>taglib</b></code>: Importa bibliotecas de etiquetas (Tag Libraries)</li></ul>
<dl><dd><dl><dd><code>&lt;%@ taglib uri="/tags/struts-html" prefix="html"&nbsp;%&gt;</code></dd></dl></dd></dl>
<ul><li><code><b>page</b></code>: Especifica atributos relacionados con la página a procesar. Los atributos son:</li></ul>
<dl><dd><table class="wikitable">

<tbody><tr align="center">
<th>Atributo</th>
<th>Sintaxis</th>
<th>Utilización
</th></tr>
<tr>
<td><code>import</code>
</td>
<td><code>&lt;%@ page import="class; class"&nbsp;%&gt;</code>
</td>
<td>Importa clases y paquetes Java para ser utilizadas dentro del fichero JSP.
</td></tr>
<tr>
<td><code>session</code>
</td>
<td><code>&lt;%@ page session="false"&nbsp;%&gt;</code>
</td>
<td>Especifica si utiliza los datos contenidos en sesión; por defecto "true".
</td></tr>
<tr>
<td><code>contentType</code>
</td>
<td><code>&lt;%@ page contentType="class; class"&nbsp;%&gt;</code>
</td>
<td>Especifica el tipo MIME del objeto "response"; por defecto "text/html; charset=ISO-8859-1".
</td></tr>
<tr>
<td><code>buffer</code>
</td>
<td><code>&lt;%@ page buffer="12KB"&nbsp;%&gt;</code>
</td>
<td>Buffer utilizado por el objeto writer "out"; puede tomar el valor de "none"; por defecto "8KB".
</td></tr>
<tr>
<td><code>errorPage</code>
</td>
<td><code>&lt;%@ page errorPage="/path_to_error_page"&nbsp;%&gt;</code>
</td>
<td>Especifica la ruta de la página de error que será invocada en caso de producirse una excepción durante la ejecución de este fichero JSP.
</td></tr>
<tr>
<td><code>isErrorPage</code>
</td>
<td><code>&lt;%@ page isErrorPage="true"&nbsp;%&gt;</code>
</td>
<td>Determina si este fichero JSP es una página que maneja excepciones. Únicamente a este tipo de páginas pueden acceder a la variable implícita "exception", que contiene la excepción que provocó la llamada a la página de error.
</td></tr></tbody></table></dd></dl>
<h3><span class="mw-headline" id="Declaraciones">Declaraciones</span><span class="mw-editsection"><span class="mw-editsection-bracket">[</span><a href="/w/index.php?title=JavaServer_Pages&amp;action=edit&amp;section=6" title="Editar sección: Declaraciones">editar</a><span class="mw-editsection-bracket">]</span></span></h3>
<p>Nos permiten declarar variables, funciones y datos estáticos.
</p><p><code>
</code></p><code><pre> &lt;%! int maxAlumnosClase = 30;&nbsp;%&gt;
</pre></code><code></code><p><code></code>
</p>
<h3><span class="mw-headline" id="Scriptlets">Scriptlets</span><span class="mw-editsection"><span class="mw-editsection-bracket">[</span><a href="/w/index.php?title=JavaServer_Pages&amp;action=edit&amp;section=7" title="Editar sección: Scriptlets">editar</a><span class="mw-editsection-bracket">]</span></span></h3>
<p>Los scriptlets son partes de código Java incrustadas entre los elementos estáticos de la página....
</p><p><code>
</code></p><code><pre> &lt;% ... código Java ...&nbsp;%&gt;
</pre></code><code></code><p><code></code>
</p>
<h3><span class="mw-headline" id="Expresiones">Expresiones</span><span class="mw-editsection"><span class="mw-editsection-bracket">[</span><a href="/w/index.php?title=JavaServer_Pages&amp;action=edit&amp;section=8" title="Editar sección: Expresiones">editar</a><span class="mw-editsection-bracket">]</span></span></h3>
<p>Las expresiones se evalúan dentro de la servlet. No deben acabar en ";".
</p><p><code>
</code></p><code><pre> &lt;%= maxAlumnosClase + 1%&gt;
</pre></code><code></code><p><code></code>
</p><p>El siguiente ejemplo pondría como título de la página el atributo "titulo" contenido en el objeto request:
</p><p><code>
</code></p><code><pre> &lt;%
   String titulo = "";
   if (request.getAttribute("titulo")&nbsp;!= null) {
     titulo = (String) request.getAttribute ("titulo");
   }
 %&gt;
 ...
 &lt;title&gt;&lt;%=titulo%&gt;&lt;/title&gt;
 ....
</pre></code><code></code><p><code></code>
</p>
<h3><span class="mw-headline" id="Etiquetas">Etiquetas</span><span class="mw-editsection"><span class="mw-editsection-bracket">[</span><a href="/w/index.php?title=JavaServer_Pages&amp;action=edit&amp;section=9" title="Editar sección: Etiquetas">editar</a><span class="mw-editsection-bracket">]</span></span></h3>
<p>Etiquetas JSP para simplificar el código y dar mayor funcionalidad.
</p><p>Desarrollar sitios web utilizando etiquetas presenta ciertas ventajas como:
</p>
<ul><li>facilitar el aprendizaje.</li>
<li>facilitar el mantenimiento.</li>
<li>fomentar la modularidad y la reutilización.</li>
<li>simplificar el código y reducir el número de líneas necesarias.</li></ul>
<p>Su sintaxis sería:
</p><p><code>
</code></p><code><pre> &lt;%@ taglib uri="/taglib/lycka" prefix="lycka"&nbsp;%&gt;
 ...
 &lt;lycka:hola/&gt;
 ...
</pre></code><code></code><p><code></code>
</p><p>A la hora de generar el código Java de la Servlet, esta etiqueta <b>hola</b> será interpretada por el Servidor de Aplicaciones como perteneciente a la biblioteca de etiquetas (Tag Library) <b>lycka</b>. Esta biblioteca estará identificada en el fichero descriptor de nuestra aplicación (web.xml) con el nombre de recurso (URI) <b>/taglib/lycka</b>. 
</p><p><code>
</code></p><code><pre> &lt;taglib-uri&gt;/taglib/lycka&lt;/taglib-uri&gt;
 &lt;taglib-location&gt;/WEB-INF/tags/lycka.tld&lt;/taglib-location&gt;
</pre></code><code></code><p><code></code>
</p><p>Una implementación de este fichero descriptor, /WEB-INF/tags/<b>lycka.tld</b> podría ser:
</p><p><code>
</code></p><code><pre> &lt;?xml version="1.0" encoding="ISO-8859-1"&nbsp;?&gt;
 &lt;!DOCTYPE taglib PUBLIC "-//Sun Microsystems, Inc.//DTD JSP Tag Library 1.1//EN" 
    "<a rel="nofollow" class="external free" href="http://java.sun.com/j2ee/dtds/web-jsptaglibrary_1_1.dtd">http://java.sun.com/j2ee/dtds/web-jsptaglibrary_1_1.dtd</a>"&gt;
 
 &lt;taglib&gt;
   &lt;tlibversion&gt;1.0&lt;/tlibversion&gt;
   &lt;jspversion&gt;1.1&lt;/jspversion&gt;
   &lt;shortname&gt;simp&lt;/shortname&gt;
   &lt;uri&gt;<a rel="nofollow" class="external free" href="http://www.hachisvertas.net/jcs/taglibs/lycka">http://www.hachisvertas.net/jcs/taglibs/lycka</a>&lt;/uri&gt;
   &lt;info&gt;A simple sample tag library&lt;/info&gt;
 
   &lt;tag&gt;
     &lt;name&gt;hola&lt;/name&gt;
     &lt;tagclass&gt;org.lcyka.taglibs.miEtiqueta&lt;/tagclass&gt;
     &lt;bodycontent&gt;empty&lt;/bodycontent&gt;
     &lt;info&gt;Alaba la belleza de mi gata.&lt;/info&gt;
   &lt;/tag&gt;
 &lt;/taglib&gt;
</pre></code><code></code><p><code></code>
</p><p>Y por fin, el servidor de aplicaciones sustituirá la etiqueta por su código Java asociado, <b>org.lcyka.taglibs.miEtiqueta</b>:
</p><p><code>
</code></p><code><pre> package org.lcyka.taglibs;
 import ...;
 public class miEtiqueta extends TagSupport {
   public int doStartTag {
     try {
       pageContext.getOut().print("Mi gata es preciosa");
     } catch (IOException ioe) {
     }
     return SKIP_BODY;
   }
</pre></code><code></code><p><code></code>
</p><p>Y finalmente el <b>navegador</b> mostraría:
</p>
<pre> Mi gata es preciosa
</pre>
<h4><span class="mw-headline" id="Etiquetas_JSP">Etiquetas JSP</span><span class="mw-editsection"><span class="mw-editsection-bracket">[</span><a href="/w/index.php?title=JavaServer_Pages&amp;action=edit&amp;section=10" title="Editar sección: Etiquetas JSP">editar</a><span class="mw-editsection-bracket">]</span></span></h4>
<p>Son las etiquetas pertenecientes a la especificación JSP. Proporcionan una funcionalidad básica.
</p><p>Un primer grupo de etiquetas proporciona funcionalidad a nivel de la página de una manera muy simple:
</p>
<ul><li><b>&lt;jsp:forward&gt;</b>, redirige la request a otra URL</li>
<li><b>&lt;jsp:include&gt;</b>, incluye el texto de un fichero dentro de la página</li>
<li><b>&lt;jsp:plugin&gt;</b>, descarga un plugin de Java (una applet o un Bean).</li></ul>
<p>Un segundo grupo permite manipular componentes JavaBean sin conocimientos de Java.
</p>
<ul><li><b>&lt;jsp:useBean&gt;</b>, permite manipular un <a href="/wiki/Bean_(inform%C3%A1tica)" title="Bean (informática)">Bean</a> (si no existe, se creará el Bean), especificando su ámbito (scope), la clase y el tipo.</li>
<li><b>&lt;jsp:getProperty&gt;</b>, obtiene la propiedad especificada de un bean previamente declarado y la escribe en el objeto response.</li>
<li><b>&lt;jsp:setProperty&gt;</b>, establece el valor de una propiedad de un bean previamente declarado.</li></ul>
<h4><span class="mw-headline" id="Etiquetas_JSTL">Etiquetas JSTL</span><span class="mw-editsection"><span class="mw-editsection-bracket">[</span><a href="/w/index.php?title=JavaServer_Pages&amp;action=edit&amp;section=11" title="Editar sección: Etiquetas JSTL">editar</a><span class="mw-editsection-bracket">]</span></span></h4>
<p>Son proporcionadas por Sun dentro de la distribución de <a href="/wiki/JSTL" class="mw-redirect" title="JSTL">JSTL</a>.
</p>
<ul><li><b>core</b>, iteraciones, condicionales, manipulación de URL y otras funciones generales.</li>
<li><b>xml</b>, para la manipulación de XML y para XML-Transformation.</li>
<li><b>sql</b>, para gestionar conexiones a bases de datos.</li>
<li><b>i18n</b>, para la internacionalización y formateo de las cadenas de caracteres como cifras.</li></ul>
<h4><span class="mw-headline" id="Etiquetas_Struts_TagLib">Etiquetas Struts TagLib</span><span class="mw-editsection"><span class="mw-editsection-bracket">[</span><a href="/w/index.php?title=JavaServer_Pages&amp;action=edit&amp;section=12" title="Editar sección: Etiquetas Struts TagLib">editar</a><span class="mw-editsection-bracket">]</span></span></h4>
<p>Distribuidas por <a rel="nofollow" class="external text" href="https://web.archive.org/web/20070624063648/http://struts.apache.org/1.x/struts-taglib/index.html">Apache</a> para funcionar junto con el Framework de Struts.
</p>
<ul><li><b>PHP</b></li>
<li><b>Bean</b></li>
<li><b>HTML</b></li>
<li><b>Logic</b></li>
<li><b>Nested</b></li>
<li><b>vjgp</b></li></ul>
<h4><span class="mw-headline" id="Etiquetas_personalizadas">Etiquetas personalizadas</span><span class="mw-editsection"><span class="mw-editsection-bracket">[</span><a href="/w/index.php?title=JavaServer_Pages&amp;action=edit&amp;section=13" title="Editar sección: Etiquetas personalizadas">editar</a><span class="mw-editsection-bracket">]</span></span></h4>
<p>Anteriormente hemos visto un ejemplo para crear una etiqueta personalizada almacenada en nuestra propia biblioteca de etiquetas.
</p><p>Para desarrollar etiquetas personalizadas, utilizaremos la API de las bibliotecas de etiquetas (Tag Libraries).
</p><p>La API de las Servlet de Java es:
</p><p><code>
</code></p><code><pre> javax.servlet.*
</pre></code><code></code><p><code></code>
</p><p>La API de JSP extiende de esta API, 
</p><p><code>
</code></p><code><pre> javax.servlet.jsp.*
</pre></code><code></code><p><code></code>
</p><p>Finalmente, la API de las bibliotecas de etiquetas (Tag Libraries) extiende de esta última,
</p><p><code>
</code></p><code><pre> javax.servlet.jsp.tagext.*
</pre></code><code></code><p><code></code>
</p><p>Lo más relevante de esta API son:
</p>
<ul><li>Las <a href="/wiki/Interfaz_(Java)" title="Interfaz (Java)">interfaces</a>
<ul><li>Tag, que todas las etiquetas deben implementar.</li>
<li>BodyTag, extiende a la anterior y define métodos adicionales para inspeccionar el cuerpo de una etiqueta.</li></ul></li>
<li>Las clases
<ul><li>BodyContent, un manejador (handler) para leer y escribir en el cuerpo de una etiqueta.</li>
<li>BodyTagSupport, que implementa la interfaz BodyTag.</li>
<li>TagAttributeInfo, para obtener la información de los atributos de la etiqueta declarados en el TLD.</li>
<li>TagData, que contiene los valores de los atributos.</li>
<li>TagExtraInfo, para especificar información extra de una etiqueta, como las variables que introduce en el código o los atributos que serán validados.</li>
<li>TagInfo, basado en la información de la TLD.</li>
<li>TagLibraryInfo, representa la información de una TLD.</li>
<li>TagSupport, implementa la interfaz Tag.</li>
<li>VariableInfo, contiene información como el tipo y ámbito de las variables creadas o modificadas por la etiqueta.</li></ul></li></ul>
<p>Podemos encontrar una descripción más detallada en <a rel="nofollow" class="external free" href="http://java.sun.com/j2ee/sdk_1.3/techdocs/api/javax/servlet/jsp/tagext/package-summary.html">http://java.sun.com/j2ee/sdk_1.3/techdocs/api/javax/servlet/jsp/tagext/package-summary.html</a>
</p><p>Otro ejemplo de etiqueta podría ser el siguiente código Java:
</p><p><code>
</code></p><code><pre> package org.lycka.taglibs;
 import ...;
 public class LowerCaseTag extends BodyTagSupport {
   public int doAfterBody() throws JspException {
     try {
       BodyContent body = getBodyContent();
       JspWriter writer = body.getEnclosingWriter();
       String bodyString = body.getString();
       if ( bodyString&nbsp;!= null ) {
         writer.print( bodyString.toLowerCase());
       }
     } catch(IOException ioe) {
       throw new JspException("Error: IOException while writing to the user");
     }
     return SKIP_BODY;
   }
 }
</pre></code><code></code><p><code></code>
</p><p>Al encontrar el inicio de la etiqueta, el runtime primero se invocará el método doStart() una vez instanciada la clase. Puede devolver uno de los siguientes valores:
</p>
<ul><li>SKIP_BODY, no procesa el contenido del cuerpo de la etiqueta.</li>
<li>EVAL_BODY_INCLUDE , evalúa el cuerpo de la etiqueta.</li>
<li>EVAL_BODY_TAG , evalúa el cuerpo de la etiqueta y lanza el resultado a otro stream almacenado en una propiedad de la etiqueta.</li></ul>
<p>El método doAfterBody() después de procesar el cuerpo de la etiqueta.
</p><p>Finalmente se invocará el método doEndTag(). Puede devolver:
</p>
<ul><li>EVAL_PAGE, para seguir procesando la página JSP</li>
<li>SKIP_PAGE, para dejar de procesar la página JSP, para por ejemplo redirigir la página</li></ul>
<p>Declarado en el descriptor de la biblioteca como 
</p><p><code>
</code></p><code><pre> &lt;tag&gt;
   &lt;name&gt;lowercase&lt;/name&gt;
   &lt;tagclass&gt;org.lycka.taglibs.LowerCaseTag&lt;/tagclass&gt;
   &lt;bodycontent&gt;JSP&lt;/bodycontent&gt;
   &lt;info&gt;Put body in lowercase.&lt;/info&gt;
 &lt;/tag&gt;
</pre></code><code></code><p><code></code>
</p><p>Utilizado en la página JSP 
</p><p><code>
</code></p><code><pre> &lt;%@ taglib uri="/taglib/lycka" prefix="lycka"&nbsp;%&gt;
 ...
 &lt;lycka:lowercase&gt;Esto es un EJEMPLO&lt;/lycka:lowercase&gt;
</pre></code><code></code><p><code></code>
</p><p>Y su salida sería
</p>
<pre> esto es un ejemplo
</pre>
<h2><span id="V.C3.A9ase_tambi.C3.A9n"></span><span class="mw-headline" id="Véase_también">Véase también</span><span class="mw-editsection"><span class="mw-editsection-bracket">[</span><a href="/w/index.php?title=JavaServer_Pages&amp;action=edit&amp;section=14" title="Editar sección: Véase también">editar</a><span class="mw-editsection-bracket">]</span></span></h2>
<ul><li><a href="/wiki/Tomcat" title="Tomcat">Tomcat</a></li>
<li><a href="/wiki/Sun_Microsystems" title="Sun Microsystems">Sun Microsystems</a></li>
<li><a href="/wiki/Servidor_HTTP_Apache" title="Servidor HTTP Apache">Servidor HTTP Apache</a></li>
<li><a href="/wiki/GlassFish" title="GlassFish">GlassFish</a></li>
<li><a href="/wiki/Contenido_din%C3%A1mico" title="Contenido dinámico">Contenido dinámico</a></li></ul>
<h2><span class="mw-headline" id="Enlaces_externos">Enlaces externos</span><span class="mw-editsection"><span class="mw-editsection-bracket">[</span><a href="/w/index.php?title=JavaServer_Pages&amp;action=edit&amp;section=15" title="Editar sección: Enlaces externos">editar</a><span class="mw-editsection-bracket">]</span></span></h2>
<ul><li><a rel="nofollow" class="external text" href="http://www.sun.com">Sun Microsystem</a></li>
<li><a rel="nofollow" class="external text" href="http://www.oracle.com/technetwork/java/jsp-138432.html">Página oficial de JSP</a></li>
<li><a rel="nofollow" class="external text" href="http://www.apache.org/">Apache</a></li>
<li><a rel="nofollow" class="external text" href="http://tomcat.apache.org/">Tomcat</a></li></ul>
<!-- 
NewPP limit report
Parsed by mw1261
Cached time: 20190704063558
Cache expiry: 2592000
Dynamic content: false
Complications: []
CPU time usage: 0.196 seconds
Real time usage: 0.241 seconds
Preprocessor visited node count: 2028/1000000
Preprocessor generated node count: 0/1500000
Post‐expand include size: 6501/2097152 bytes
Template argument size: 464/2097152 bytes
Highest expansion depth: 8/40
Expensive parser function count: 0/500
Unstrip recursion depth: 0/20
Unstrip post‐expand size: 2552/5000000 bytes
Number of Wikibase entities loaded: 1/400
Lua time usage: 0.106/10.000 seconds
Lua memory usage: 1.92 MB/50 MB
-->
<!--
Transclusion expansion time report (%,ms,calls,template)
100.00%  188.577      1 Plantilla:Ficha_de_software
100.00%  188.577      1 -total
 96.58%  182.122      1 Plantilla:Ficha
 68.07%  128.367     15 Plantilla:Propiedad
-->

<!-- Saved in parser cache with key eswiki:pcache:idhash:48056-0!canonical and timestamp 20190704063558 and revision id 116232375
 -->
</div><noscript><img src="//es.wikipedia.org/wiki/Special:CentralAutoLogin/start?type=1x1" alt="" title="" width="1" height="1" style="border: none; position: absolute;" /></noscript></div>
		
		<div class="printfooter">Obtenido de «<a dir="ltr" href="https://es.wikipedia.org/w/index.php?title=JavaServer_Pages&amp;oldid=116232375">https://es.wikipedia.org/w/index.php?title=JavaServer_Pages&amp;oldid=116232375</a>»</div>
		
		<div id="catlinks" class="catlinks" data-mw="interface"><div id="mw-normal-catlinks" class="mw-normal-catlinks"><a href="/wiki/Especial:Categor%C3%ADas" title="Especial:Categorías">Categorías</a>: <ul><li><a href="/wiki/Categor%C3%ADa:Tecnolog%C3%ADas_Java_EE" title="Categoría:Tecnologías Java EE">Tecnologías Java EE</a></li><li><a href="/wiki/Categor%C3%ADa:Frameworks_para_aplicaciones_web" title="Categoría:Frameworks para aplicaciones web">Frameworks para aplicaciones web</a></li></ul></div><div id="mw-hidden-catlinks" class="mw-hidden-catlinks mw-hidden-cats-hidden">Categoría oculta: <ul><li><a href="/wiki/Categor%C3%ADa:Wikipedia:Art%C3%ADculos_con_datos_por_trasladar_a_Wikidata" title="Categoría:Wikipedia:Artículos con datos por trasladar a Wikidata">Wikipedia:Artículos con datos por trasladar a Wikidata</a></li></ul></div></div>
		<div class="visualClear"></div>
		
	</div>
</div>

</main>

<jsp:include page="/includes/footer.jsp"></jsp:include>