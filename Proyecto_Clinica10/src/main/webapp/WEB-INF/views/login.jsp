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
                    <input type="text" class="form-control" id="email" name="email" required>
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" id="contrasena" name="contrasena" required>
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
					<a href="usuario" id="btnRegistrar" type="button" class="btn btn-primary "> 
						<%= ResourceBundle.getBundle("code").getString("login.registrar") %>		
					</a>
                </div>
            </div>
        </form>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script><!-- 	Link para o jQuery fazer a solicitação AJAX -->
    <script>
    function entrar() {
        // Verifica se os campos obrigatórios estão preenchidos
        if ($("#email").val() === "" || $("#contrasena").val() === ""  ) {
            alert("Por favor. Rellenar todos los campos.");
            return;
        }
        
        // Codifica a senha
        crypto.subtle.digest('SHA-256', new TextEncoder().encode($("#contrasena").val())).then(function(hash) {
            // Converte o hash para uma string hexadecimal
            var hashedPassword = Array.from(new Uint8Array(hash)).map(b => b.toString(16).padStart(2, '0')).join('');
        
        // Envia os dados apenas se todos os campos estiverem preenchidos
        $.post("entrarAplicacion.json", {
            email: $("#email").val(),
            contrasena: hashedPassword // Envie a senha codificada

        })
        //o .done() é usado para executar código específico quando a requisição AJAX é bem-sucedida, 
        //permitindo que atualize a interface do usuário, 
        //processe os dados recebidos ou execute outras operações necessárias após a conclusão da requisição.
        .done(function (datos) {
        	
            // Verifica a mensagem recebida do servidor
            if (datos.mensaje === "La contraseña es correcta") {
                // Se a autenticação for bem-sucedida, redirecione para a página principal com o email como parâmetro na URL
                window.location.href = "/principal?nombre=" + datos.nombre ;
               
            	
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
    <%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>

