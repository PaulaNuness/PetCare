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
                    <input type="text" class="form-control" id="apellido" name="apellido" required>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" id="email" name="usuario" maxlength="22"required>
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" id="contrasena" name="contrasena" maxlength="10"required>
                </div>
                <div class="form-group">
					<select id="desplegablePais" class="form-control form-control-sm">
						<option value="Espana"><%= ResourceBundle.getBundle("code").getString("registrar.pais.Espana") %></option>
 						<option value="Brazil"><%= ResourceBundle.getBundle("code").getString("registrar.pais.Brazil") %></option>
 						<option value="Italia"><%= ResourceBundle.getBundle("code").getString("registrar.pais.Italia") %></option>
 						<option value="Francia"><%= ResourceBundle.getBundle("code").getString("registrar.pais.Francia") %></option>
 						<option value="Portugal"><%= ResourceBundle.getBundle("code").getString("registrar.pais.Portugal") %></option>
 												
					</select>					
				</div>
				<div class="form-group">
					<input type="radio" name="sexo" value="hombre" id="sexo_H"><%= ResourceBundle.getBundle("code").getString("registrar.sexo.hombre") %>
					<input type="radio" name="sexo" value="mujer" id="sexo_M"><%= ResourceBundle.getBundle("code").getString("registrar.sexo.mujer") %>
				</div>
            </div>
            <div class="col-md-12">
                <div class="col-md-12 mb-5">
					<a href="login" id="btnSalir" type="button" class="btn btn-primary "> 
						<%= ResourceBundle.getBundle("code").getString("registrar.salir") %>		
					</a>
					<a  href="javascript:crearYmodificarUsuario()" id="btnConfirmar" type="button" class="btn btn-primary "> 
						<%= ResourceBundle.getBundle("code").getString("registrar.confirmar") %>		
					</a>
                </div>
            </div>
        </form>
    </div>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script><!-- 	Link para o jQuery fazer a solicitação AJAX -->
<script>
    function crearYmodificarUsuario() {
        // Verifica se os campos obrigatórios estão preenchidos
        if ($("#nombre").val() === "" || $("#apellido").val() === "" || $("#email").val() === "" || $("#contrasena").val() === "" || $("#desplegablePais").val() === "" || !$("input[name='sexo']").is(":checked")) {
            alert("Por favor. Rellenar todos los campos.");
            return;
        }

        // Verifica o formato do campo de email(usuario), somente letras e numeros, e deve terminar @hotmail.com
       var formatoEmail = /^[a-zA-Z0-9]+@hotmail\.com$/;


        if (!formatoEmail.test($("#email").val())) {
            alert("Por favor, el campo 'Usuario' es un correo. Cantidad de caracteres permitida en el campo (22). Formato del correo: Solo es permitido letras y numeros y debe terminar  @hotmail.com ");
            return;
        }

        // Codifica a senha
        crypto.subtle.digest('SHA-256', new TextEncoder().encode($("#contrasena").val())).then(function(hash) {
            // Converte o hash para uma string hexadecimal
            var hashedPassword = Array.from(new Uint8Array(hash)).map(b => b.toString(16).padStart(2, '0')).join('');
            
            // Envia os dados apenas se todos os campos estiverem preenchidos
            $.post("crearYmodificarUsuario.json", {
                nombre: $("#nombre").val(),
                apellido: $("#apellido").val(),
                email: $("#email").val(),
                contrasena: hashedPassword, // Envie a senha codificada
                pais: $("#desplegablePais").val(),
                sexo: $("input[name='sexo']:checked").val()
            })
            //o .done() é usado para executar código específico quando a requisição AJAX é bem-sucedida, 
            //permitindo que atualize a interface do usuário, 
            //processe os dados recebidos ou execute outras operações necessárias após a conclusão da requisição.
            .done(function (datos) {
            	
                // Verifica a mensagem recebida do servidor
                if (datos.mensaje === "Registro confirmado!") {
                	// Limpa os campos após o registro ser confirmado
                    $("#nombre").val("");
                    $("#apellido").val("");
                    $("#email").val("");
                    $("#contrasena").val("");
                    $("#desplegablePais").val("");
                    $("input[name='sexo']").prop('checked', false);
                    alert("Registro confirmado!");
                } else {
                	 alert(datos.mensaje);//el alert aparece el mensaje que ha pasado el model del controller
                     
                }
            })
            
            //o .fail() é usado para lidar com erros que ocorrem durante a execução de uma requisição AJAX,
            //permitindo que exiba mensagens de erro, 
            //registre os erros no console ou tome outras medidas necessárias para lidar com a situação de erro.
            .fail(function (jqXHR, textStatus, errorThrown) {
                console.error("Error al enviar la solicitud:", errorThrown);
                alert("Ocorreu um erro ao enviar a solicitação. Por favor, tente novamente.");
            });
        });
    }
</script>

</body>
</html>