<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ResourceBundle" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <link rel="stylesheet" type="text/css" href="/resources/css/estilo.css">
    <link rel="icon" href="/icon.ico" type="image/x-icon"> 
    <style>
        footer {
            text-align: center; /* Alinha o conteúdo do rodapé no centro */
            padding: 20px 0; /* Adiciona um espaçamento interno */
            background-color: #F5F7F9; /* Cor de fundo do rodapé */
            position: fixed; /* Mantém o rodapé fixo na parte inferior da página */
            width: 100%; /* Ocupa toda a largura da página */
            bottom: 0; /* Coloca o rodapé no final da página */
        }

        .footer-content {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 20px;
        }

        .footer-content img {
            max-width: 40px; /* Defina a largura máxima da imagem */
            height: 20px; /* Mantém a proporção da imagem */
        }
    </style>
</head>
<body>
    <footer>
        <div class="footer-content">
            <span id="dataSistema"></span> <!-- Exibe a data do sistema aqui -->
            <span><%= ResourceBundle.getBundle("code").getString("footer.anyo") %></span>
            <img src="/empresa.png" alt="empresa">
        </div>
    </footer>

    <script>
        // Função para obter a data atual
        function getDataAtual() {
            var data = new Date();
            var dia = data.getDate();
            var mes = data.getMonth() + 1;
            var ano = data.getFullYear();

            // Formata a data no formato DD/MM/AAAA
            return dia + '/' + mes + '/' + ano;
        }

        // Atualiza o conteúdo do primeiro span com a data atual
        document.getElementById('dataSistema').textContent = getDataAtual();
    </script>
</body>
</html>

