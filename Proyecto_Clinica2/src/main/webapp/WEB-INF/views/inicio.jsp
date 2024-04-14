<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ResourceBundle" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>PetCare</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/estilo.css">
    <link rel="icon" href="/icon.ico" type="image/x-icon">
    <style>
        body {
            display: flex;
            justify-content: center; /* Alinha o conteúdo horizontalmente ao centro */
            align-items: center; /* Alinha o conteúdo verticalmente ao centro */
            height: 100vh; /* Ocupa toda a altura da tela */
            margin: 0; /* Remove a margem padrão */
            background-color: #f5f5f5; /* Cor de fundo do corpo */
        }

        .container {
            text-align: center; /* Alinha o conteúdo do contêiner no centro horizontal */
            border-radius: 50%; /* Torna o contêiner redondo */
            overflow: hidden; /* Garante que a imagem não ultrapasse os limites do contêiner */
            width: 500px; /* Defina a largura do contêiner */
            height: 500px; /* Defina a altura do contêiner */
            box-shadow: 0px 0px 40px rgba(0, 0, 0, 0.5); /* Adiciona uma sombra */
        }

        .container img {
            border-radius: 50%; /* Torna a imagem redonda */
            width: 100%; /* Garante que a imagem ocupe todo o espaço do contêiner */
            height: auto; /* Mantém a proporção da imagem */
        }
    </style>
</head>
<body>
    <div class="container">
        <img src="/inicio.png" alt="Logo">
    </div>
    
    <script>
        setTimeout(function() {
            window.location.href = "login";
        }, 3000); // Redireciona para a página de login após 3 segundos
    </script>
</body>
</html>

