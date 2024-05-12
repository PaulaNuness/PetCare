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
            justify-content: center; /* Alinha o conte�do horizontalmente ao centro */
            align-items: center; /* Alinha o conte�do verticalmente ao centro */
            height: 100vh; /* Ocupa toda a altura da tela */
            margin: 0; /* Remove a margem padr�o */
            background-color: #f5f5f5; /* Cor de fundo do corpo */
        }

        .container {
            text-align: center; /* Alinha o conte�do do cont�iner no centro horizontal */
            border-radius: 50%; /* Torna o cont�iner redondo */
            overflow: hidden; /* Garante que a imagem n�o ultrapasse os limites do cont�iner */
            width: 500px; /* Defina a largura do cont�iner */
            height: 500px; /* Defina a altura do cont�iner */
            box-shadow: 0px 0px 40px rgba(0, 0, 0, 0.5); /* Adiciona uma sombra */
        }

        .container img {
            border-radius: 50%; /* Torna a imagem redonda */
            width: 100%; /* Garante que a imagem ocupe todo o espa�o do cont�iner */
            height: auto; /* Mant�m a propor��o da imagem */
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
        }, 3000); // Redireciona para a p�gina de login ap�s 3 segundos
    </script>
</body>
</html>

