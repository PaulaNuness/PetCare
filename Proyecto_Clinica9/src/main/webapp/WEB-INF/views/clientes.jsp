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
            z-index: 9999; /* Certifique-se de que o popup esteja acima do resto do conteúdo */
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
                <input type="text" class="form-control form-control-sm" id="inputFilterNumeroChip" placeholder="Filtrar por NumeroChip">
            </div>
        </div>
        <div class="col">
            <div class="input-group mb-3">
                <input type="text" class="form-control form-control-sm" id="inputFilterNombreMascota" placeholder="Filtrar por Nombre Mascota">
            </div>
        </div>
        <div class="col">
            <div class="input-group mb-3">
                <input type="text" class="form-control form-control-sm" id="inputFilterEdad" placeholder="Filtrar por Edad">
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
    </div>
    <!-- Tabela -->
    <div class="table-container mb-3">
        <table class="table table-bordered" id="myTable">
            <!-- Conteúdo da tabela aqui, abaixo em JavaScript -->
        </table>
    </div>

    <!-- Botões -->
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
            <%=ResourceBundle.getBundle("code").getString("clientes.eliminar")%>        
        </a>
    </div>
</div>

<div id="popupModificar" class="popup">
    <!-- Conteúdo do popup de modificar aqui -->
    <form>
        <div class="row">
            <!-- Primeira coluna a esquerda-->
            <div class="col-md-6">
                <div class="form-group">
                	<label ><%= ResourceBundle.getBundle("code").getString("registrar.paciente.idchip") %></label>
                    <input type="text" class="form-control" id="inputIdChip" placeholder="Numero Chip">
                </div>
                <div class="form-group">
                	<label ><%= ResourceBundle.getBundle("code").getString("registrar.paciente.nombremascota") %></label>
                    <input type="text" class="form-control" id="inputNombreMascota" placeholder="Nombre de la Mascota">
                </div>
                <div class="form-group">
                	<label ><%= ResourceBundle.getBundle("code").getString("registar.paciente.edad") %></label>
                    <input type="text" class="form-control" id="inputEdad" placeholder="Edad">
                </div>
                <div class="form-group">
                	<label ><%= ResourceBundle.getBundle("code").getString("registrar.paciente.nombretutor") %></label>
                    <input type="text" class="form-control" id="inputNombreTutor" placeholder="Nombre del Tutor">
                </div>
            </div>
            <!-- Segunda coluna a direita-->
            <div class="col-md-6">
                <div class="form-group">
                	<label ><%= ResourceBundle.getBundle("code").getString("registrar.paciente.DNITutor") %></label>
                    <input type="text" class="form-control" id="inputDNITutor" placeholder="DNI del Tutor">
                </div>
                <div class="form-group">
                	<label ><%= ResourceBundle.getBundle("code").getString("registar.paciente.ubicacion") %></label>
                    <input type="text" class="form-control" id="inputUbicacionMascota" placeholder="Ubicación de la Mascota">
                </div>
                <div class="form-group">
                	<label ><%= ResourceBundle.getBundle("code").getString("registrar.paciente.estaActivo") %></label>
                    <input type="text"  class="form-control" id="inputEstaActivo" placeholder="Esta Activo?">
                </div>
            </div>
        </div>

            <!-- Botões -->
    <div class="btn-group mb-3" role="group" aria-label="Basic example">
        <a href="javascript:salvarMod()" id="btnSalvar" type="button" class="btn btn-primary "> 
            <%= ResourceBundle.getBundle("code").getString("empleados.salvar") %>       
        </a>
    </div>
    
    <div class="btn-group mb-3" role="group" aria-label="Basic example">
        <a href="javascript:fecharPopupMod()" id="btnCancelar" type="button" class="btn btn-primary "> 
            <%= ResourceBundle.getBundle("code").getString("empleados.cancelar") %>     
        </a>
    </div>
    </form>
</div>
<div id="popupAdd" class="popup">
    <!-- Conteúdo do popup de añadir aqui -->
    <form>
        <div class="row">
            <!-- Primeira coluna a esquerda-->
            <div class="col-md-6">
                <div class="form-group">
                	<label ><%= ResourceBundle.getBundle("code").getString("registrar.paciente.idchip") %></label>
                    <input type="text" class="form-control" id="inputIdChip" placeholder="ID Chip">
                </div>
                <div class="form-group">
                	<label ><%= ResourceBundle.getBundle("code").getString("registrar.paciente.nombremascota") %></label>
                    <input type="text" class="form-control" id="inputNombreMascota" placeholder="Nombre de la Mascota">
                </div>
                <div class="form-group">
                	<label ><%= ResourceBundle.getBundle("code").getString("registar.paciente.edad") %></label>
                    <input type="text" class="form-control" id="inputEdad" placeholder="Edad">
                </div>
                <div class="form-group">
                	<label ><%= ResourceBundle.getBundle("code").getString("registrar.paciente.nombretutor") %></label>
                    <input type="text" class="form-control" id="inputNombreTutor" placeholder="Nombre del Tutor">
                </div>
            </div>
            <!-- Segunda coluna a direita-->
            <div class="col-md-6">
                <div class="form-group">
                	<label ><%= ResourceBundle.getBundle("code").getString("registrar.paciente.DNITutor") %></label>
                    <input type="text" class="form-control" id="inputDNITutor" placeholder="DNI del Tutor">
                </div>
                <div class="form-group">
                	<label ><%= ResourceBundle.getBundle("code").getString("registar.paciente.ubicacion") %></label>
                    <input type="text" class="form-control" id="inputUbicacionMascota" placeholder="Ubicación de la Mascota">
                </div>
                <div class="form-group">
                	<label ><%= ResourceBundle.getBundle("code").getString("registrar.paciente.estaActivo") %></label>
                    <input type="text"  class="form-control" id="inputEstaActivo" placeholder="Esta Activo?">
                </div>
            </div>
        </div>

            <!-- Botões -->
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
        // Converter a lista de usuários para JSON
        var clientesJSON = '<%List<PacientePOJO> clientes = BBDD_Paciente.getPacientes();
            ObjectMapper objectMapper = new ObjectMapper();
            String clientesJSON = objectMapper.writeValueAsString(clientes);
            out.print(clientesJSON);%>';

        // Obtém os dados da lista de usuários passada do controlador
        var datos = JSON.parse(clientesJSON);

        // Colunas da tabela, field faz referência ao campo da base de dados, o id será o identificador da coluna da tabela
        var colunas = [
            { id: 'idPaciente', name: 'Id', field: 'idPaciente' },
            { id: 'numeroChip', name: 'Numero Chip', field: 'numeroChip' },
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

        // Função para filtrar a tabela por idChip de la mascota
        document.getElementById("inputFilterNumeroChip").addEventListener("keyup", function() {
            var filter, table, tr, td, i, txtValue;
            filter = this.value.toUpperCase();
            table = document.getElementById("myTable");
            tr = table.getElementsByTagName("tr");
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[2]; // Coluna do NumeroChip
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
                td = tr[i].getElementsByTagName("td")[3]; // Coluna do nombre mascota
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
                td = tr[i].getElementsByTagName("td")[5]; // Coluna do nombre tutor
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
                td = tr[i].getElementsByTagName("td")[6]; // Coluna do DNI Tutor
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
                td = tr[i].getElementsByTagName("td")[4]; // Coluna do edad
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
        
        
         // Função para abrir o popup de modificar
         function add() {
             // Mostrar o popup ao clicar no botão
            document.getElementById("popupAdd").style.display = "block";
        	
         }
        
         // Função para fechar o popup
         function fecharPopup() {
             // Ocultar o popup
             document.getElementById("popupAdd").style.display = "none";
             location.reload(); // Isso recarregará a página
         }
        
         function salvar() {
        	    // Envia os dados apenas se todos os campos estiverem preenchidos
        	    $.post("addPaciente.json", {
        	    	numeroChip: $("#inputIdChip").val(),
        	        nombreMascota: $("#inputNombreMascota").val(),
        	        edad: $("#inputEdad").val(),
        	        nombreTutor: $("#inputNombreTutor").val(),
        	        DNI: $("#inputDNITutor").val(),
        	        ubicacion: $("#inputUbicacionMascota").val(),
        	        estaActivo: $("#inputEstaActivo").val()
        	    })
        	    .done(function(datos) {
        	        // Verifica a mensagem recebida do servidor
        	        if (datos.mensajeAdd === "OK") {
        	            alert("Paciente Añadido");
        	            fecharPopup();
        	        } else {
        	            alert(datos.mensajeAdd);
        	        }
        	    })
        	    .fail(function(jqXHR, textStatus, errorThrown) {
        	        console.error("Error al enviar la solicitud:", errorThrown);
        	        alert("Ocorreu um erro ao enviar a solicitação. Por favor, tente novamente.");
        	    });
        	}


      // Função para abrir o popup de modificar
         function abrirPopupModificar() {
             // Verificar se um paciente foi selecionado
             if (idCheckbox !== undefined) {
                 // Encontrar os dados do paciente correspondente ao ID do checkbox
                 var pacienteSelecionado = datos.find(function(paciente) {
                     return paciente.idPaciente === idCheckbox;
                 });

                 // Verificar se o paciente foi encontrado
                 if (pacienteSelecionado) {
                     // Preencher os campos do modal com os dados do paciente
                     $("#inputNombreMascota").val(pacienteSelecionado.nombreMascota);
                     $("#inputIdChip").val(pacienteSelecionado.numeroChip);
                     $("#inputEdad").val(pacienteSelecionado.edad);
                     $("#inputNombreTutor").val(pacienteSelecionado.nombreTutor);
                     $("#inputDNITutor").val(pacienteSelecionado.DNITutor);
                     $("#inputUbicacionMascota").val(pacienteSelecionado.ubicacionMascota);
                     $("#inputEstaActivo").val(pacienteSelecionado.estaActivo);
                     
                     // Mostrar o popup de modificar
                       $("#popupModificar").modal("show");
                 } else {
                     alert('Paciente não encontrado.');
                 }
             } else {
                 alert('Selecione um paciente na tabela.');
             }
         }
         // Função para fechar o popup
         function fecharPopupMod() {
             // Ocultar o popup
             document.getElementById("popupModificar").style.display = "none";
             location.reload(); // Isso recarregará a página
         }

function eliminar(){
	// Verificar se um checkbox está selecionado
    if (idCheckbox !== undefined) {
        // Encontrar os dados do paciente correspondente ao ID do checkbox
        var pacienteSelecionado = datos.find(function(paciente) {
            return paciente.idPaciente === idCheckbox;
        });
        // Se o usuário for um administrador, solicite confirmação antes de excluir o funcionário
        var confirmacao = confirm("¿Estás seguro de que deseas eliminar este empleado?");
        if (confirmacao) {
        
             // Se o usuário confirmar
 			// Envia os dados apenas se todos os campos estiverem preenchidos
     		$.post("eliminarPaciente.json", {
     			
     			idPaciente:idCheckbox
     		})
             //o .done() é usado para executar código específico quando a requisição AJAX é bem-sucedida, 
             //permitindo que atualize a interface do usuário, 
             //processe os dados recebidos ou execute outras operações necessárias após a conclusão da requisição.
             .done(function (datos) {
            	 
                 // Verifica a mensagem recebida do servidor
                 if (datos.mensajeElim === "OK") {
                     alert("Eliminado.");
                     location.reload(); // Isso recarregará a página
                 } else {
                 	 alert(datos.mensajeElim);//el alert aparece el mensaje que ha pasado el model del controller
                     
                 }
             })
             //o .fail() é usado para lidar com erros que ocorrem durante a execução de uma requisição AJAX,
             //permitindo que exiba mensagens de erro, 
             //registre os erros no console ou tome outras medidas necessárias para lidar com a situação de erro.
             .fail(function (jqXHR, textStatus, errorThrown) {
                 console.error("Error al enviar la solicitud:", errorThrown);
                 alert("Ocorreu um erro ao enviar a solicitação. Por favor, tente novamente.");
             });
            
        } else {
            // Se o usuário cancelar, exiba uma mensagem informando que a exclusão foi cancelada
            alert("Eliminación cancelada.");

            location.reload(); // Isso recarregará a página
        }
        
    }  else {
        alert('Selecione un paciente en la tabla');
    }
       
}
	function salvarMod() {

        	// Envia os dados apenas se todos os campos estiverem preenchidos
            $.post("modPaciente.json", {
            	idPaciente:idCheckbox,
    	    	numeroChip: $("#inputIdChip").val(),
    	        nombreMascota: $("#inputNombreMascota").val(),
    	        edad: $("#inputEdad").val(),
    	        nombreTutor: $("#inputNombreTutor").val(),
    	        DNI: $("#inputDNITutor").val(),
    	        ubicacion: $("#inputUbicacionMascota").val(),
    	        estaActivo: $("#inputEstaActivo").val()
            })
         //o .done() é usado para executar código específico quando a requisição AJAX é bem-sucedida, 
        //permitindo que atualize a interface do usuário, 
        //processe os dados recebidos ou execute outras operações necessárias após a conclusão da requisição.
        .done(function (datos) {
        	
            // Verifica a mensagem recebida do servidor
            if (datos.mensajeMod === "OK") {
                alert("Modificado");
                fecharPopup();
            } else {
            	 alert(datos.mensajeMod);//el alert aparece el mensaje que ha pasado el model del controller
                 
            }
        })
         //o .fail() é usado para lidar com erros que ocorrem durante a execução de uma requisição AJAX,
         //permitindo que exiba mensagens de erro, 
         //registre os erros no console ou tome outras medidas necessárias para lidar com a situação de erro.
         .fail(function (jqXHR, textStatus, errorThrown) {
             console.error("Error al enviar la solicitud:", errorThrown);
             alert("Ocorreu um erro ao enviar a solicitação. Por favor, tente novamente.");
         });

	}



    </script> 
		
 		<%@ include file="/WEB-INF/views/footer.jsp"%> 
	</body>
</html>