<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><%= ResourceBundle.getBundle("code").getString("principal") %></title>
    <link rel="stylesheet" type="text/css" href="/resources/css/estilo.css">
    <link rel="icon" href="/icon.ico" type="image/x-icon">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Estilos personalizados para a tabela */
        .table-bordered {
            border: 1px solid black; /* Define a cor da borda */
        }

        .table-bordered th,
        .table-bordered td {
            background-color: white; /* Define a cor de fundo */
        }
    </style>
</head>
<body>
    <%@ include file="/WEB-INF/views/navbar.jsp"%>

    <div class="container">
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Coluna 1</th>
                    <th>Coluna 2</th>
                    <th>Coluna 3</th>
                    <th>Coluna 4</th>
                    <th>Coluna 5</th>
                </tr>
            </thead>
            <tbody>
                <!-- Insira aqui as linhas da tabela se houver dados -->
            </tbody>
        </table>
    </div>

    <%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>
