<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Agregar Evento</title>
<link href="Css/form.css" type="text/css" rel="stylesheet" />
</head>
<body>
	<div class="form">
		<h2>Agregar Evento</h2>
		<form action="EventosServlet" method="post">
		    <table>
		        <tr>
		            <th>Fecha:</th>
		            <td><input type="text" name="año" size="4">/<input type="text" name="mes" size="2">/<input type="text" name="dia" size="2"></td>
		        </tr>
		        <tr>
		            <th>Descripcion:</th>
		            <td></td>
		        </tr>
		        <tr>
		            <td colspan="2"><textarea name="desc" cols="60" rows="10"></textarea></td>
		        </tr>
		        <tr>
		        	<td></td>
		        	<td><div class="divbuttons"><input type="submit" value="Añadir" name="añadir"></div></td>
		        </tr>
		    </table>
		</form>
		<a href="Eventos.jsp"><button>Volver</button></a>
	</div>
</body>
</html>