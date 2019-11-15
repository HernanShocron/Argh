<%@page import="java.util.Date"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.script.*"%>
<!-- @page import="logic.ConexDb" -->
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Panel de Control</title>
	<link rel="icon" type="image/png" href="Imagenes/icono.jpg" />
	<link href="Css/PanelDeControl.css" rel="stylesheet" type="text/css"/>
	<link href="https://fonts.googleapis.com/css?family=Open+Sans&display=swap" rel="stylesheet">
		
</head>
<body>
	<div id="abuelo">
		<div id="padre">
			<div id="Header">
				<div Style="float: left; 
							position: absolute">
				<h1 id="PanelTitulo">
					PANEL DE CONTROL ARGH</h1>
				</div>
				<div id="PanelUsuario" style= "float: right">
				Usuario: "Unknown"
				<select >
					<option Onclick="redirigir(perfil)">Perfíl</option>
					<option OnClick="CerrarSesion()">Cerrar Sesión</option>			
				</select>
				</div>
			</div>
			
			<div id="ContenedorPrincipal">
				<div id="contenedorBotones">
					<img alt="Bandera" src="Imagenes/BanderaLibano.jpg" id="banderaLibano">
					<a href="Eventos.jsp" target="iframeprincipal">
						<button class="BTNPANEL">Eventos</button>
					</a>
					<a href="Productos.jsp" target="iframeprincipal">
						<button class="BTNPANEL" >Productos</button>
					</a>
					<a href="MesasYMozos.jsp" target="iframeprincipal" >	
						<button class="BTNPANEL" OnClick="mesasYMozos()">Mesas Y Mozos</button>
					</a>
					<a href="Pedidos.jsp" target="iframeprincipal">
						<button class="BTNPANEL" >Pedidos</button>
					</a>
					<a href="Informes.jsp" target="iframeprincipal">
						<button class="BTNPANEL" >Informes</button>
					</a>
					<a href="Reservas.jsp" target="iframeprincipal">
						<button class="BTNPANEL" >Reservas</button>
					</a>
					<a href="Usuarios.jsp" target="iframeprincipal">
						<button class="BTNPANEL" >Usuarios</button>
					</a>
				</div>
				<div id="Pantalla">
					<iframe name="iframeprincipal" id="iframeprincipal" src="Welcome.jsp">
						<p>Este navegador no soparta iframes, intente visitar el sitio con otro navegador.</p>
					</iframe>
				</div>
			</div>
			
			<div id="footer">
				<p>Copyright ©. All rights reserved.</p>
			</div>
		</div>
	</div>		
</body>
</html>