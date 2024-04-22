<%@ page import="java.util.List" %>
<%@ page import="com.example.demo.Interface.UsuarioPOJO" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ page import="com.example.demo.Datos.BBDD_Usuario" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><%= ResourceBundle.getBundle("code").getString("empleados") %></title>
    <link rel="stylesheet" type="text/css" href="/resources/css/estilo.css">
    <link rel="icon" href="/icon.ico" type="image/x-icon">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>

        .table-bordered {
            border: 2px solid black; /* Define a cor da borda e a largura */
        }

        .table-bordered th,
        .table-bordered td {
            background-color: white; /* Define a cor de fundo */
            border: 2px solid black; /* Define a cor da borda e a largura */
        }

        .table-container {
            max-height: 300px; /* Altura m�xima da tabela */
            overflow-y: auto; /* Adiciona rolagem vertical quando necess�rio */
        }

        .form-control-sm {
            padding: .25rem .5rem;
            font-size: .875rem;
            line-height: 1.5;
            border-radius: .2rem;
        }

        /* Espa�o maior entre nav e container */
        .container {
            margin-top: -10px; /* Ajuste conforme necess�rio */
        }
    </style>
</head>
<body>
    <%@ include file="/WEB-INF/views/navbar.jsp"%>
<div class="container ">
	<!-- Filtros -->
    <div class="row">
        <div class="col">
            <div class="input-group mb-3">
                <input type="text" class="form-control form-control-sm" id="inputFilterNombre" placeholder="Filtrar por Nombre">
            </div>
        </div>
        <div class="col">
            <div class="input-group mb-3">
                <input type="text" class="form-control form-control-sm" id="inputFilterApellido" placeholder="Filtrar por Apellido">
            </div>
        </div>
        <div class="col">
            <div class="input-group mb-3">
                <input type="text" class="form-control form-control-sm" id="inputFilterEmail" placeholder="Filtrar por Email">
            </div>
        </div>
        <div class="col">
            <div class="input-group mb-3">
                <input type="text" class="form-control form-control-sm" id="inputFilterPais" placeholder="Filtrar por Pa�s">
            </div>
        </div>
        <div class="col">
            <div class="input-group mb-3">
                <input type="text" class="form-control form-control-sm" id="inputFilterSexo" placeholder="Filtrar por Sexo">
            </div>
        </div>
    </div>
    <!-- Tabela -->
    <div class="table-container mb-3">
        <table class="table table-bordered" id="myTable">
            <!-- Conte�do da tabela aqui, abaixo em JavaScript -->
        </table>
    </div>

    <!-- Bot�es -->
    <div class="btn-group mb-3" role="group" aria-label="Basic example">
        <a href="javascript:modificar()" id="btnModificar" type="button" class="btn btn-primary "> 
            <%= ResourceBundle.getBundle("code").getString("empleados.modificar") %>        
        </a>
    </div>
    
    <div class="btn-group mb-3" role="group" aria-label="Basic example">
        <a href="javascript:eliminar()" id="btnEliminar" type="button" class="btn btn-primary "> 
            <%= ResourceBundle.getBundle("code").getString("empleados.eliminar") %>        
        </a>
    </div>
</div>

    <script>
        // Converter a lista de usu�rios para JSON
        var usuariosJSON = '<%
            List<UsuarioPOJO> usuarios = BBDD_Usuario.getUsuarios();
            ObjectMapper objectMapper = new ObjectMapper();
            String usuariosJSON = objectMapper.writeValueAsString(usuarios);
            out.print(usuariosJSON);
        %>';

        // Obt�m os dados da lista de usu�rios passada do controlador
        var datos = JSON.parse(usuariosJSON);

        // Colunas da tabela, field faz refer�ncia ao campo da base de dados, o id ser� o identificador da coluna da tabela
        var colunas = [
            { id: 'nombre', name: 'Nombre', field: 'nombre' },
            { id: 'apellido', name: 'Apellido', field: 'apellido' },
            { id: 'email', name: 'Email', field: 'email' },
            { id: 'pais', name: 'Pais', field: 'pais' },
            { id: 'sexo', name: 'Sexo', field: 'sexo' }
        ];

        function criarTabela(container, colunas) {
            // Verifica se o container existe
            var containerElement = document.getElementById(container);
            if (!containerElement) {
                console.error("O container especificado n�o foi encontrado.");
                return;
            }

            // Cria a tabela
            var tabela = document.createElement('table');
            tabela.classList.add('table', 'table-bordered'); // Adiciona classes do Bootstrap para estilizar a tabela
            var cabecalho = document.createElement('thead');
            var corpo = document.createElement('tbody');
            var cabecalhoRow = document.createElement('tr');

            // Adiciona as colunas ao cabe�alho
            colunas.forEach(function(coluna) {
                var th = document.createElement('th');
                th.textContent = coluna.name;
                cabecalhoRow.appendChild(th);
            });

            cabecalho.appendChild(cabecalhoRow);
            tabela.appendChild(cabecalho);
            tabela.appendChild(corpo);
            containerElement.appendChild(tabela);

            // Retorna a tabela criada para manipul�-la posteriormente, se necess�rio
            return tabela;
        }

        function preencherTabelaComDados(tabela, dados) {
            // Encontra o corpo da tabela
            var corpo = tabela.querySelector('tbody');

            // Limpa o conte�do existente do corpo da tabela
            corpo.innerHTML = '';

            // Preenche a tabela com os dados
            dados.forEach(function(item) {
                var row = document.createElement('tr');

                colunas.forEach(function(coluna) {
                    var cell = document.createElement('td');
                    cell.textContent = item[coluna.field]; // Acessa o valor do campo do objeto de dados usando a propriedade field
                    row.appendChild(cell);
                });

                corpo.appendChild(row);
            });
        }

        // Criar e preencher a tabela
        var tabela = criarTabela('myTable', colunas);
        preencherTabelaComDados(tabela, datos);

        // Fun��o para filtrar a tabela por nome
        document.getElementById("inputFilterNombre").addEventListener("keyup", function() {
            var filter, table, tr, td, i, txtValue;
            filter = this.value.toUpperCase();
            table = document.getElementById("myTable");
            tr = table.getElementsByTagName("tr");
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[0]; // Coluna do nome
                if (td) {
                    txtValue = td.textContent || td.innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        });

        // Fun��o para filtrar a tabela por apellido
        document.getElementById("inputFilterApellido").addEventListener("keyup", function() {
            var filter, table, tr, td, i, txtValue;
            filter = this.value.toUpperCase();
            table = document.getElementById("myTable");
            tr = table.getElementsByTagName("tr");
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[1]; // Coluna do apellido
                if (td) {
                    txtValue = td.textContent || td.innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        });

        // Fun��o para filtrar a tabela por email
        document.getElementById("inputFilterEmail").addEventListener("keyup", function() {
            var filter, table, tr, td, i, txtValue;
            filter = this.value.toUpperCase();
            table = document.getElementById("myTable");
            tr = table.getElementsByTagName("tr");
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[2]; // Coluna do email
                if (td) {
                    txtValue = td.textContent || td.innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        });

        // Fun��o para filtrar a tabela por pa�s
        document.getElementById("inputFilterPais").addEventListener("keyup", function() {
            var filter, table, tr, td, i, txtValue;
            filter = this.value.toUpperCase();
            table = document.getElementById("myTable");
            tr = table.getElementsByTagName("tr");
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[3]; // Coluna do pa�s
                if (td) {
                    txtValue = td.textContent || td.innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        });

        // Fun��o para filtrar a tabela por sexo
        document.getElementById("inputFilterSexo").addEventListener("keyup", function() {
            var filter, table, tr, td, i, txtValue;
            filter = this.value.toUpperCase();
            table = document.getElementById("myTable");
            tr = table.getElementsByTagName("tr");
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[4]; // Coluna do sexo
                if (td) {
                    txtValue = td.textContent || td.innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        });

    </script>

    <%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>
