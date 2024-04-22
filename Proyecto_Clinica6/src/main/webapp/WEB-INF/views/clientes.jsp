<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ResourceBundle" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.demo.Interface.ClientePOJO" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ page import="com.example.demo.Datos.BBDD_Cliente" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
   		<link rel="stylesheet" type="text/css" href="/resources/css/estilo.css">
    	<link rel="icon" href="/icon.ico" type="image/x-icon">
    	<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
		<title><%= ResourceBundle.getBundle("code").getString("clientes") %></title>
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
            max-height: 300px; /* Altura máxima da tabela */
            overflow-y: auto; /* Adiciona rolagem vertical quando necessário */
        }

        .form-control-sm {
            padding: .25rem .5rem;
            font-size: .875rem;
            line-height: 1.5;
            border-radius: .2rem;
        }

        /* Espaço maior entre nav e container */
        .container {
            margin-top: -10px; /* Ajuste conforme necessário */
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
                <input type="text" class="form-control form-control-sm" id="inputFilterIdPaciente" placeholder="Filtrar por IdPaciente">
            </div>
        </div>
        <div class="col">
            <div class="input-group mb-3">
                <input type="text" class="form-control form-control-sm" id="inputFilterNombreMascota" placeholder="Filtrar por Nombre Mascota">
            </div>
        </div>
        <div class="col">
            <div class="input-group mb-3">
                <input type="text" class="form-control form-control-sm" id="inputFilterNombreTutor" placeholder="Filtrar por Nombre Tutor">
            </div>
        </div>
        <div class="col">
            <div class="input-group mb-3">
                <input type="text" class="form-control form-control-sm" id="inputFilterDNITutor" placeholder="Filtrar por DNI Tutor">
            </div>
        </div>
        <div class="col">
            <div class="input-group mb-3">
                <input type="text" class="form-control form-control-sm" id="inputFilterEdad" placeholder="Filtrar por Edad">
            </div>
        </div>
    </div>
    <!-- Tabela -->
    <div class="table-container mb-3">
        <table class="table table-bordered" id="myTable">
            <!-- Conteúdo da tabela aqui, abaixo em JavaScript -->
        </table>
    </div>

    <!-- Botões -->
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
        // Converter a lista de usuários para JSON
        var clientesJSON = '<%
            List<ClientePOJO> clientes = BBDD_Cliente.getClientes();
            ObjectMapper objectMapper = new ObjectMapper();
            String clientesJSON = objectMapper.writeValueAsString(clientes);
            out.print(clientesJSON);
        %>';

        // Obtém os dados da lista de usuários passada do controlador
        var datos = JSON.parse(clientesJSON);

        // Colunas da tabela, field faz referência ao campo da base de dados, o id será o identificador da coluna da tabela
        var colunas = [
            { id: 'idPaciente', name: 'ID', field: 'idPaciente' },
            { id: 'nombreMascota', name: 'Nombre Mascota', field: 'nombreMascota' },
            { id: 'edad', name: 'Edad', field: 'edad' },
            { id: 'nombreTutor', name: 'Nombre Tutor', field: 'nombreTutor' },
            { id: 'dniTutor', name: 'DNI Tutor', field: 'dnitutor' },
            { id: 'ubicacion', name: 'Ubicacion Mascota', field: 'ubicacionMascota' }
        ];

        function criarTabela(container, colunas) {
            // Verifica se o container existe
            var containerElement = document.getElementById(container);
            if (!containerElement) {
                console.error("O container especificado não foi encontrado.");
                return;
            }

            // Cria a tabela
            var tabela = document.createElement('table');
            tabela.classList.add('table', 'table-bordered'); // Adiciona classes do Bootstrap para estilizar a tabela
            var cabecalho = document.createElement('thead');
            var corpo = document.createElement('tbody');
            var cabecalhoRow = document.createElement('tr');

            // Adiciona as colunas ao cabeçalho
            colunas.forEach(function(coluna) {
                var th = document.createElement('th');
                th.textContent = coluna.name;
                cabecalhoRow.appendChild(th);
            });

            cabecalho.appendChild(cabecalhoRow);
            tabela.appendChild(cabecalho);
            tabela.appendChild(corpo);
            containerElement.appendChild(tabela);

            // Retorna a tabela criada para manipulá-la posteriormente, se necessário
            return tabela;
        }

        function preencherTabelaComDados(tabela, dados) {
            // Encontra o corpo da tabela
            var corpo = tabela.querySelector('tbody');

            // Limpa o conteúdo existente do corpo da tabela
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

        // Função para filtrar a tabela por idPaciente
        document.getElementById("inputFilterIdPaciente").addEventListener("keyup", function() {
            var filter, table, tr, td, i, txtValue;
            filter = this.value.toUpperCase();
            table = document.getElementById("myTable");
            tr = table.getElementsByTagName("tr");
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[0]; // Coluna do idpaciente
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

        // Função para filtrar a tabela por nombre de la mascota
        document.getElementById("inputFilterNombreMascota").addEventListener("keyup", function() {
            var filter, table, tr, td, i, txtValue;
            filter = this.value.toUpperCase();
            table = document.getElementById("myTable");
            tr = table.getElementsByTagName("tr");
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[1]; // Coluna do nombre mascota
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

     // Função para filtrar a tabela por nombre del tutor
        document.getElementById("inputFilterNombreTutor").addEventListener("keyup", function() {
            var filter, table, tr, td, i, txtValue;
            filter = this.value.toUpperCase();
            table = document.getElementById("myTable");
            tr = table.getElementsByTagName("tr");
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[3]; // Coluna do nombre tutor
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

        // Função para filtrar a tabela por DNI Tutor
        document.getElementById("inputFilterDNITutor").addEventListener("keyup", function() {
            var filter, table, tr, td, i, txtValue;
            filter = this.value.toUpperCase();
            table = document.getElementById("myTable");
            tr = table.getElementsByTagName("tr");
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[4]; // Coluna do DNI Tutor
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

        // Função para filtrar a tabela por edad de la mascota
        document.getElementById("inputFilterEdad").addEventListener("keyup", function() {
            var filter, table, tr, td, i, txtValue;
            filter = this.value.toUpperCase();
            table = document.getElementById("myTable");
            tr = table.getElementsByTagName("tr");
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[2]; // Coluna do edad
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