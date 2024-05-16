<%@ page import="java.util.List" %>
<%@ page import="com.example.demo.Interface.PacientePOJO" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ page import="com.example.demo.Datos.BBDD_Paciente" %>
<jsp:include page="tabla.jsp" />
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title><%=ResourceBundle.getBundle("code").getString("clientes")%></title>
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
		        /* Estilo para linha selecionada */
        .selected {
            background-color: #f0f0f0; /* Cor de fundo quando selecionado */
        }

        /* Estilo do popup */
        .popup {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: white;
            padding: 20px;
            border: 1px solid black;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
            z-index: 9999; /* Certifique-se de que o popup esteja acima do resto do conte�do */
        }
        
    	label {
        	color: pink;
        	font-weight: bold;
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
                <input type="text" class="form-control form-control-sm" id="inputFilterIdChip" placeholder="Filtrar por IdChip">
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
            <!-- Conte�do da tabela aqui, abaixo em JavaScript -->
        </table>
    </div>

    <!-- Bot�es -->
    <div class="btn-group mb-3" role="group" aria-label="Basic example">
        <a href="javascript:add()" id="btnAdd" type="button" class="btn btn-primary "> 
            <%=ResourceBundle.getBundle("code").getString("clientes.add")%>        
        </a>
    </div>
    <div class="btn-group mb-3" role="group" aria-label="Basic example">
        <a href="javascript:abrirPopupModificar()" id="btnModificar" type="button" class="btn btn-primary "> 
            <%=ResourceBundle.getBundle("code").getString("clientes.modificar")%>        
        </a>
    </div>
    
    <div class="btn-group mb-3" role="group" aria-label="Basic example">
        <a href="javascript:eliminar()" id="btnEliminar" type="button" class="btn btn-primary "> 
            <%=ResourceBundle.getBundle("code").getString("empleados.eliminar")%>        
        </a>
    </div>
</div>

<div id="popupModificar" class="popup">
    <!-- Conte�do do popup de modificar aqui -->
    <form>
        <div class="row">
            <!-- Primeira coluna a esquerda-->
            <div class="col-md-6">
                <div class="form-group">
                	<label ><%= ResourceBundle.getBundle("code").getString("registrar.nombre") %></label>
                    <input type="text" class="form-control" id="inputNombre" placeholder="Nombre">
                </div>
                <div class="form-group">
                	<label ><%= ResourceBundle.getBundle("code").getString("registrar.apellido") %></label>
                    <input type="text" class="form-control" id="inputApellido" placeholder="Apellido">
                </div>
                <div class="form-group">
                	<label ><%= ResourceBundle.getBundle("code").getString("empleados.email") %></label>
                    <input type="email" class="form-control" id="inputEmail" placeholder="Email">
                </div>
                <div class="form-group">
                	<label ><%= ResourceBundle.getBundle("code").getString("registrar.pais") %></label>
                    <input type="text" class="form-control" id="inputPais" placeholder="Pa�s">
                </div>
                <div class="form-group">
                	<label ><%= ResourceBundle.getBundle("code").getString("registrar.sexo") %></label>
                    <input type="text" class="form-control" id="inputSexo" placeholder="Sexo">
                </div>
            </div>
            <!-- Segunda coluna a direita-->
            <div class="col-md-6">
                <div class="form-group">
                	<label ><%= ResourceBundle.getBundle("code").getString("empleados.dni") %></label>
                    <input type="text" class="form-control" id="inputDNI" placeholder="DNI">
                </div>
                <div class="form-group">
                	<label ><%= ResourceBundle.getBundle("code").getString("empleados.telefono") %></label>
                    <input type="text" class="form-control" id="inputTelefono" placeholder="Telefono">
                </div>
                <div class="form-group">
                	<label ><%= ResourceBundle.getBundle("code").getString("empleados.admin") %></label>
                    <input type="email" class="form-control" id="inputAdmin" placeholder="Admin">
                </div>
                <div class="form-group">
                	<label ><%= ResourceBundle.getBundle("code").getString("empleados.activo") %></label>
                    <input type="text" class="form-control" id="inputEstaActivo" placeholder="Esta Activo">
                </div>
            </div>
        </div>

            <!-- Bot�es -->
    <div class="btn-group mb-3" role="group" aria-label="Basic example">
        <a href="javascript:salvar()" id="btnSalvar" type="button" class="btn btn-primary "> 
            <%= ResourceBundle.getBundle("code").getString("empleados.salvar") %>       
        </a>
    </div>
    
    <div class="btn-group mb-3" role="group" aria-label="Basic example">
        <a href="javascript:fecharPopup()" id="btnCancelar" type="button" class="btn btn-primary "> 
            <%= ResourceBundle.getBundle("code").getString("empleados.cancelar") %>     
        </a>
    </div>
    </form>
</div>

    <script>
        // Converter a lista de usu�rios para JSON
        var clientesJSON = '<%List<PacientePOJO> clientes = BBDD_Paciente.getPacientes();
            ObjectMapper objectMapper = new ObjectMapper();
            String clientesJSON = objectMapper.writeValueAsString(clientes);
            out.print(clientesJSON);%>';

        // Obt�m os dados da lista de usu�rios passada do controlador
        var datos = JSON.parse(clientesJSON);

        // Colunas da tabela, field faz refer�ncia ao campo da base de dados, o id ser� o identificador da coluna da tabela
        var colunas = [
            { id: 'idChip', name: 'Id Chip', field: 'idChip' },
            { id: 'nombreMascota', name: 'Nombre Mascota', field: 'nombreMascota' },
            { id: 'edad', name: 'Edad', field: 'edad' },
            { id: 'nombreTutor', name: 'Nombre Tutor', field: 'nombreTutor' },
            { id: 'dniTutor', name: 'DNI Tutor', field: 'dnitutor' },
            { id: 'ubicacion', name: 'Ubicacion Mascota', field: 'ubicacionMascota' }
        ];

        // Criar e preencher a tabela
        //tengo las funciones dentro del archivo tabla.jsp
        var tabela = criarTabela('myTable', colunas);
        preencherTabelaComDados(tabela, datos);

        // Fun��o para filtrar a tabela por idChip de la mascota
        document.getElementById("inputFilterIdChip").addEventListener("keyup", function() {
            var filter, table, tr, td, i, txtValue;
            filter = this.value.toUpperCase();
            table = document.getElementById("myTable");
            tr = table.getElementsByTagName("tr");
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[1]; // Coluna do idChip
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

        // Fun��o para filtrar a tabela por nombre de la mascota
        document.getElementById("inputFilterNombreMascota").addEventListener("keyup", function() {
            var filter, table, tr, td, i, txtValue;
            filter = this.value.toUpperCase();
            table = document.getElementById("myTable");
            tr = table.getElementsByTagName("tr");
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[2]; // Coluna do nombre mascota
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

     // Fun��o para filtrar a tabela por nombre del tutor
        document.getElementById("inputFilterNombreTutor").addEventListener("keyup", function() {
            var filter, table, tr, td, i, txtValue;
            filter = this.value.toUpperCase();
            table = document.getElementById("myTable");
            tr = table.getElementsByTagName("tr");
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[4]; // Coluna do nombre tutor
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

        // Fun��o para filtrar a tabela por DNI Tutor
        document.getElementById("inputFilterDNITutor").addEventListener("keyup", function() {
            var filter, table, tr, td, i, txtValue;
            filter = this.value.toUpperCase();
            table = document.getElementById("myTable");
            tr = table.getElementsByTagName("tr");
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[5]; // Coluna do DNI Tutor
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

        // Fun��o para filtrar a tabela por edad de la mascota
        document.getElementById("inputFilterEdad").addEventListener("keyup", function() {
            var filter, table, tr, td, i, txtValue;
            filter = this.value.toUpperCase();
            table = document.getElementById("myTable");
            tr = table.getElementsByTagName("tr");
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[3]; // Coluna do edad
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

        // Fun��o para abrir o popup de modificar
        function abrirPopupModificar() {
            // Verificar se um checkbox est� selecionado
            if (idCheckbox !== undefined) {
                // Encontrar os dados do usu�rio correspondente ao ID do checkbox
                var usuarioSelecionado = datos.find(function(usuario) {
                    return usuario.idUsuario === idCheckbox;
                });

                // Verificar se encontrou o usu�rio correspondente
                if (usuarioSelecionado) {
                    // Preencher os campos do modal com os dados do usu�rio
                    preencherModalComDadosUsuario(usuarioSelecionado);
                    // Mostrar o popup ao clicar no bot�o
                    document.getElementById("popupModificar").style.display = "block";
                } else {
                    alert('Usu�rio n�o encontrado.');
                }
            } else {
                alert('No hay elementos de la tabla selecionado.');
            }
        }
        
        // Fun��o para fechar o popup
        function fecharPopup() {
            // Ocultar o popup
            document.getElementById("popupModificar").style.display = "none";
        }

    </script> 
		
 		<%@ include file="/WEB-INF/views/footer.jsp"%> 
	</body>
</html>