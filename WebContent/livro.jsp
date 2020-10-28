<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List, edu.curso.entity.Livro" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="./resources/css/bootstrap.min.css" rel="stylesheet" />
<script src="./resources/css/bootstrap.min.js" type="text/javascript"></script>
<title>Gestão de Livros</title>
</head>
<body>
<div class="container">
	<h1>Gestão de Livros</h1>
		<%
			List<Livro> livros = (List<Livro>)session.getAttribute("LIVROS");
			String msg = (String)session.getAttribute("MENSAGEM");
			if(msg != null){
				
		%>	
		<div class="alert alert-success" role="alert">
  			<h4 class="alert-heading">Comando executado!</h4>
  			<p><%=msg%></p>
  		</div>
		<% session.setAttribute("MENSAGEM",null);
			} %>
	
		<form action="./livroController" method="post">
		<div class="form-group">
			<label>ID:</label>
			<input type="text" name="txtID" class="form-control" readonly>
		</div>
		<div class="form-group">
			<label>Titulo:</label>
			<input type="text" name="txtTitulo" class="form-control" >
		</div>
		<div class="form-group">
			<label>Autor:</label>
			<input type="text" name="txtAutor" class="form-control" >
		</div>
		<div class="form-group">
			<label>Número de páginas:</label>
			<input type="number" name="txtPaginas" class="form-control" >
		</div>
		<div class="form-group">
			<label>Editora:</label>
			<select name="txtEditora" class="form-control">
				<option value="bookman">Bookman</option>
				<option value="companhiaLetra">Companhia de Letras</option>
				<option value="moderna">Moderna</option>
				<option value="verus">Verus</option>
			</select>
		</div>
		<div class="form-group">
			<label>Gênero:</label>
			<select name="txtGenero" class="form-control">
				<option value="aventura">Aventura</option>
				<option value="ficção científica">Ficção científica</option>
				<option value="misterio">Mistério</option>
				<option value="romance">Romance</option>
			</select>
		</div>
		
		<button type="submit"  class="btn btn-primary" name="cmd" value="adicionar">Adicionar</button>
		<button type="submit"  class="btn btn-primary" name="cmd" value="pesquisar">Pesquisar</button>
		</form>
		
	</div>
	<% if (livros != null && !livros.isEmpty()) {%>
		<div class="container">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>ID</th>
						<th>Titulo</th>
						<th>Autor</th>
						<th>Editora</th>
						<th>Genero</th>
					</tr>
				</thead>
				<tbody>
					<%for(Livro l: livros) {%>
						<tr>
							<td><%=l.getId()%></td>
							<td><%=l.getTitulo()%></td>
							<td><%=l.getAutor()%></td>
							<td><%=l.getEditora()%></td>
							<td><%=l.getGenero()%></td>
						</tr>
					<%} %>
				</tbody>
			</table>
		</div>
	<%} %>
</body>
</html>