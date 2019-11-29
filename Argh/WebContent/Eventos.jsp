<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="database.EventoData" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="entities.Evento" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Eventos</title>
<link href="Css/PageInPanel.css" type="text/css" rel="stylesheet" />
</head>
<body>
	<div>
		<h1>Eventos:</h1>
		<a href="EventosInsert.jsp"><button>Añadir</button></a>
		<form action="EventosServlet" method="post">			
			<table>
			<tr>
				<th >Fecha</th>
				<th >Lugar</th>
				<th >Acción</th>
			</tr>
			<% 
			EventoData ed = new EventoData();
			ArrayList<Evento> list = ed.getAll();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			for(Evento l: list){%>
				<tr>
					<td ><%= sdf.format(l.getFecha())%></td>
					<td ><%= l.getLugar() %></td>
					<td ><div class="acciones"><button type="submit" value="<%=Integer.toString(l.getId())%>" name="modificar">Modificar</button>
					<button type="submit" value="<%=Integer.toString(l.getId())%>" name="eliminar" style="float: right;">Eliminar</button></div></td>
				</tr>			
			<%}%>
			</table>
		</form>
	</div>
</body>
</html>