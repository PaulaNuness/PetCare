<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ResourceBundle" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title><%= ResourceBundle.getBundle("code").getString("login") %></title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="icon" href="/icon.ico" type="image/x-icon"> 
    <style>
        body {
            display: flex;
            justify-content: center; /* Centraliza o conteúdo horizontalmente */
            align-items: center; /* Centraliza o conteúdo verticalmente */
            height: 100vh; /* Ocupa toda a altura da tela */
            margin: 0; /* Remove a margem padrão */
            background: linear-gradient(to bottom right, #5EB1F5, #5EF5B4); /* Fundo degradê de azul para verde */
        }

        .container {
            text-align: center; /* Alinha o conteúdo do contêiner no centro horizontal */
            border: 1px solid #ccc; /* Adiciona uma borda para visualização */
            padding: 20px;
            border-radius: 10px;
            background-color: #ffffff; /* Cor de fundo do contêiner */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5); /* Adiciona uma sombra de fundo */
            max-width: 400px; /* Define a largura máxima do contêiner */
            width: 100%; /* Garante que o contêiner não ultrapasse a largura máxima */
        } 
        h1{
            color: #FDB7D7;
        }

       /* Cor padrão dos botões */
        .btn-primary {
            background-color: #1EE4F2;
            border-color: #1EE4F2;
        }

        /* Cor dos botões ao passar o mouse */
        .btn-primary:hover {
            background-color: #1EF2C8;
            border-color: #1EF2C8;
        }
    </style>
</head>
<body>
    <div class="container">
        <form action="/processarFormulario" method="post" class="row">
            <div class="col-md-12">
                <label><h1><%= ResourceBundle.getBundle("code").getString("login.hola") %></h1></label>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label for=""><h5><%= ResourceBundle.getBundle("code").getString("login.usuario") %></h5></label>
                </div>
                <div class="form-group">
                    <label for=""><h5><%= ResourceBundle.getBundle("code").getString("login.contrasena") %></h5></label>
                </div>
            </div>
            <div class="col-md-8">
                <div class="form-group">
                    <input type="text" class="form-control" id="nome" name="nome" required>
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" id="senha" name="senha" required>
                </div>
            </div>
            <div class="col-md-12">
                <div class="col-md-12 mb-5">
					<a href="javascript:entrar()" id="btnEntrar" type="button" class="btn btn-primary "> 
						<%= ResourceBundle.getBundle("code").getString("login.entrar") %>		
					</a>
                </div>
                <div > 
                    <label for="username"><%= ResourceBundle.getBundle("code").getString("login.sin") %></label>
					<a href="javascript:registrar()" id="btnEntrar" type="button" class="btn btn-primary "> 
						<%= ResourceBundle.getBundle("code").getString("login.registrar") %>		
					</a>
                </div>
            </div>
        </form>
    </div>
    
    <%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>

