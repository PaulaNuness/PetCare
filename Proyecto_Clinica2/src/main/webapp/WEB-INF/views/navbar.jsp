<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ResourceBundle" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="ISO-8859-1">
	<link rel="stylesheet" type="text/css" href="/resources/css/estilo.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<title>Insert title here</title>
	<style>
		.navbar {
    		background-color: #F5F7F9; /* Mesma cor de fundo do footer */
    		position: fixed; /* Mantém o navbar fixo no topo da página */
   			width: 100%; /* Ocupa toda a largura da página */
    		top: 0; /* Coloca o navbar no topo da página */
    		z-index: 1000; /* Certifica-se de que o navbar esteja acima de outros elementos */
  		}
  		body {
            display: flex;
            justify-content: center; /* Centraliza o conteúdo horizontalmente */
            align-items: center; /* Centraliza o conteúdo verticalmente */
            height: 100vh; /* Ocupa toda a altura da tela */
            margin: 0; /* Remove a margem padrão */
            background: linear-gradient(to bottom right, #5EB1F5, #5EF5B4); /* Fundo degradê de azul para verde */
        }
	</style>
	</head>
	<body>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
    		<div class="container">
        		<video width="13%" height="auto" controls autoplay loop>
            		<source src="vibes.mp4" type="video/mp4">
        		</video>

        		<div class="collapse navbar-collapse" id="navbarCollapse">
            		<ul class="navbar-nav ">
                		<li class="nav-item dropdown">
                    		<a id="dropdownAreaGestion" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link dropdown-toggle"><%= ResourceBundle.getBundle("code").getString("principal.gestion") %></a>
                    		<ul aria-labelledby="dropdownAreaGestion" class="dropdown-menu border-0 shadow">
                        		<li class="dropdown-item"><a href="clientes"><%= ResourceBundle.getBundle("code").getString("principal.clientes") %></a></li>
                        		<li class="dropdown-item"><a href="empleados"><%= ResourceBundle.getBundle("code").getString("principal.empleados") %></a></li>
                    		</ul>
               			 </li>
                		<li class="nav-item active">
                    		<a class="nav-link" href="#"><%= ResourceBundle.getBundle("code").getString("principal.consultas") %></a>
                		</li>
                		<li class="nav-item active">
                    		<a class="nav-link" href="#"><%= ResourceBundle.getBundle("code").getString("principal.inventario") %></a>
                		</li>
                		<li class="nav-item">
                    		<a class="nav-link" href="#"><%= ResourceBundle.getBundle("code").getString("principal.comunicacion") %></a>
                		</li>
            		</ul>
        		</div>
    		</div>
		</nav>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	</body>
</html>