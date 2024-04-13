<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ResourceBundle" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title><%= ResourceBundle.getBundle("code").getString("registrar") %></title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="icon" href="/icon.ico" type="image/x-icon">
        <style>
        body {
            display: flex;
            justify-content: center; /* Centraliza o conte�do horizontalmente */
            align-items: center; /* Centraliza o conte�do verticalmente */
            height: 100vh; /* Ocupa toda a altura da tela */
            margin: 0; /* Remove a margem padr�o */
            background: linear-gradient(to bottom right, #5EB1F5, #5EF5B4); /* Fundo degrad� de azul para verde */
        }

        .container {
            text-align: center; /* Alinha o conte�do do cont�iner no centro horizontal */
            border: 1px solid #ccc; /* Adiciona uma borda para visualiza��o */
            padding: 20px;
            border-radius: 10px;
            background-color: #ffffff; /* Cor de fundo do cont�iner */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5); /* Adiciona uma sombra de fundo */
            max-width: 400px; /* Define a largura m�xima do cont�iner */
            width: 100%; /* Garante que o cont�iner n�o ultrapasse a largura m�xima */
        } 
        h1{
            color: #FDB7D7;
        }

       /* Cor padr�o dos bot�es */
        .btn-primary {
            background-color: #1EE4F2;
            border-color: #1EE4F2;
        }

        /* Cor dos bot�es ao passar o mouse */
        .btn-primary:hover {
            background-color: #1EF2C8;
            border-color: #1EF2C8;
        }
    </style>
</head>
<body>
	    <div class="container">
        <form action="/registrarFormulario" method="post" class="row">
            <div class="col-md-12">
                <label><h1><%= ResourceBundle.getBundle("code").getString("registrar") %></h1></label>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label for=""><h5><%= ResourceBundle.getBundle("code").getString("registrar.nombre") %></h5></label>
                </div>
                <div class="form-group">
                    <label for=""><h5><%= ResourceBundle.getBundle("code").getString("registrar.apellido") %></h5></label>
                </div>
                <div class="form-group">
                    <label for=""><h5><%= ResourceBundle.getBundle("code").getString("registrar.usuario") %></h5></label>
                </div>
                <div class="form-group">
                    <label for=""><h5><%= ResourceBundle.getBundle("code").getString("registrar.contrasena") %></h5></label>
                </div>
                <div class="form-group">
                    <label for=""><h5><%= ResourceBundle.getBundle("code").getString("registrar.pais") %></h5></label>
                </div>
                <div class="form-group">
                    <label for=""><h5><%= ResourceBundle.getBundle("code").getString("registrar.sexo") %></h5></label>
                </div>
            </div>
            <div class="col-md-8">
            	<div class="form-group">
                    <input type="text" class="form-control" id="nombre" name="nombre" required>
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" id="apellido" name="apellido" required>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" id="usuario" name="usuario" required>
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" id="contrasena" name="contrasena" required>
                </div>
                <div class="form-group">
					<select id="desplegableCampana" class="form-control form-control-sm">
						<option value="0"><%= ResourceBundle.getBundle("code").getString("registrar.pais.Espana") %></option>
 						<option value="1"><%= ResourceBundle.getBundle("code").getString("registrar.pais.Brazil") %></option>
 						<option value="2"><%= ResourceBundle.getBundle("code").getString("registrar.pais.Italia") %></option>
 						<option value="3"><%= ResourceBundle.getBundle("code").getString("registrar.pais.Francia") %></option>
 						<option value="4"><%= ResourceBundle.getBundle("code").getString("registrar.pais.Portugal") %></option>
 												
					</select>					
				</div>
				<div class="form-group">
					<input type="radio" name="sexo" value="hombre" id="sexo_H"><%= ResourceBundle.getBundle("code").getString("registrar.sexo.hombre") %>
					<input type="radio" name="sexo" value="mujer" id="sexo_M"><%= ResourceBundle.getBundle("code").getString("registrar.sexo.mujer") %>
				</div>
            </div>
            <div class="col-md-12">
                <div class="col-md-12 mb-5">
					<a href="javascript:salir()" id="btnSalir" type="button" class="btn btn-primary "> 
						<%= ResourceBundle.getBundle("code").getString("registrar.salir") %>		
					</a>
					<a href="javascript:confirmar()" id="btnConfirmar" type="button" class="btn btn-primary "> 
						<%= ResourceBundle.getBundle("code").getString("registrar.confirmar") %>		
					</a>
                </div>
            </div>
        </form>
    </div>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>