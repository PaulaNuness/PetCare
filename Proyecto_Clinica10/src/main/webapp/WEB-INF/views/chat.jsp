<%@ page import="java.util.List" %>
<%@ page import="com.example.demo.Interface.PacientePOJO" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ page import="com.example.demo.Datos.BBDD_Paciente" %>
<jsp:include page="tabla.jsp" />
<!DOCTYPE html>
<html>
	<head>
    <title>Chat</title>
    <link href="/webjars/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/main.css" rel="stylesheet">
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/sockjs-client/sockjs.min.js"></script>
    <script src="/webjars/stomp-websocket/stomp.min.js"></script>
    <script src="/app.js"></script>
    	<style>

		</style>
	</head>
	<body>
	<div class="container-fluid">
    	<div class="row mt-3">
        	<!-- Primeiro contêiner -->
        	<div class="col-md-3">
            	<div class="container">
                <h3 class="text-center">Conectar con el servidor</h3>
                <div class="row">
                    <div class="col-md-12 text-center">
                        <button id="connect" class="btn btn-success" type="submit">Conectar</button>
                        <button id="disconnect" class="btn btn-danger" type="submit">Desconectar</button>
                    </div>
                </div>
            	</div>
        	</div>
        	<!-- Segundo contêiner -->
        	<div class="col-md-4">
            	<div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <form>
                            <div class="mb-3">
                                <label for="name" class="form-label"><%= ResourceBundle.getBundle("code").getString("chatnombre") %></label>
                                <input type="text" class="form-control" id="name">
                            </div>
                            <button id="join" type="submit" class="btn btn-primary"><%= ResourceBundle.getBundle("code").getString("chatuni") %></button>
                        </form>
                    </div>
                </div><br/><br/>
                <div class="row">
                    <div class="col-md-12">
                        <form>
                            <div class="mb-3">
                                <label for="input" class="form-label"><%= ResourceBundle.getBundle("code").getString("chatmsg") %></label>
                                <textarea type="text" cols="70" rows="6" class="form-control" id="input"></textarea>
                            </div>
                            <button id="sendChat" type="submit" class="btn btn-primary"><%= ResourceBundle.getBundle("code").getString("chatenv") %></button>
                        </form>
                    </div>
                </div>
            	</div>
        	</div>
        	<!-- tercero contêiner -->
        	<div class="col-md-5">
            	<div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="mb-3">
                            <label for="textarea" class="form-label"><%= ResourceBundle.getBundle("code").getString("chatrec") %></label>
                            <textarea type="text" cols="50" rows="7" class="form-control" id="textarea"></textarea><br/>
                        </div>
                        <div class="mb-3">
                            <label for="userlist" class="form-label"><%= ResourceBundle.getBundle("code").getString("chatusu") %></label>
                            <textarea type="text" cols="50" rows="3" class="form-control" id="userlist"></textarea><br/>
                        </div>
                    </div>
                </div>
            	</div>
        	</div>
    	</div>
	</div>

 		<%@ include file="/WEB-INF/views/navbar.jsp"%>



    <script>
    let stompClient = null;
    let userName;
    let textarea;
    let userlist;

//cuando pulsamos conectar
function setConnected(connected) {
    $("#connect").prop("disabled", connected);//desabilita o botão de conectar se a variável connected for verdadeira e o habilita caso contrário.
    $("#disconnect").prop("disabled", !connected);//desabilita o botão de desconectar se a variável connected for falsa e o habilita caso contrário

    if (connected) {
        $("#conversation").show();
        alert("Conectado");
    } else {
        $("#conversation").hide();
    }

    $('#output').val('');
    $("#responses").html("");

    // Desabilitar os botões "Unirse al chat" e "Enviar mensaje", cuando inicia la session
    $("#join").prop("disabled", !connected);
    $("#sendChat").prop("disabled", !connected);
}

//cuando pulsamos para desconectar
    function disconnect() {
        if (stompClient !== null) {
            stompClient.disconnect();
        }
        setConnected(false);
        alert("Desconectado")
        console.log("Disconnected");
    }
    
//no texto area  de mesnsagem recebidas, quando o usuario entrar
function showMsg(response) {
    const recebido = response.body;
    console.log("Client received: " + recebido);

    // Removendo os primeiros 13 caracteres e os 2 ultimos
     let substring = recebido.substring(13, recebido.length - 2);

    // Removendo a substring `","body":"` da string
    substring = substring.replace('","body"', '');
    substring = substring.replace('"', '');
    
    let nombre = substring;

    console.log("Substring: " + substring);


    // adiciona a substring a um textarea
    textarea.value += nombre + "\n"; // Adiciona uma quebra de linha após a substring

}



//texto area usuarios en la sala
    function updateUserList(response) {
    	   const recebido = response.body;
    	    console.log("Client received: " + recebido);

    	    // Removendo os primeiros 13 caracteres e os 2 ultimos
    	     let substring = recebido.substring(13, recebido.length - 2);

    	    // Removendo a substring `","body":"` da string
    	    substring = substring.replace('","body"', '');
    	    substring = substring.replace(':"', '');
    	    
    	    let nombre = substring.replace('***Nuevo usaurio al chat***', '');

         userlist.value += nombre+"\n";
    }
    
    

    const submitJoin = () => {
        let input = document.getElementById("input");
        let name = document.getElementById("name");
        let join = document.getElementById("join");
        if (name.value.trim() === "") {
            alert("El nickname no puede estar vacío");
            return;
        }

        let message = {};
        message.username = name.value;
        let messageJson = JSON.stringify(message);
        console.log("before send");
        stompClient.send("/app/join", {}, messageJson);
        console.log("after send");

        name.disabled = true;
        join.disabled = true;
        input.disabled = false;
        userName = name.value;
    };

//mensagens escritas
    const sendMessage = () => {
        let input = document.getElementById("input");
        let name = document.getElementById("name");

        if (input.value.trim() === "") {
            alert("El mensaje no puede estar vacío");
            return;
        }

        let message = {};
        message.username = userName;
        message.body = input.value;
        let messageJson = JSON.stringify(message);
        stompClient.send("/app/chat", {}, messageJson);
        input.value = "";
    };



    function connect() {
        const socket = new SockJS('/websocket-server');
        stompClient = Stomp.over(socket);
        stompClient.connect({}, function (frame) {
            setConnected(true);
            console.log('Connected: ' + frame);

            const subscription = stompClient.subscribe('/topic/responses', function (response) {
                showMsg(response, 'table-success');
            });
            const subscription2 = stompClient.subscribe('/topic/users', function (response) {
                updateUserList(response);
            });

            stompClient.subscribe('/topic/errors', function (response) {
                showMsg(response, 'table-danger');
                console.log('Client unsubscribes: ' + subscription);
                subscription.unsubscribe({});
            });
        });
    }

    $(function () {
        // Desabilitar os botões ao carregar a página
        $("#join").prop("disabled", true);
        $("#sendChat").prop("disabled", true);

        // Evitar que o formulário seja enviado ao pressionar "Enter"
        $("form").on('submit', (e) => { e.preventDefault(); });

        // Associar a função de conexão ao clicar no botão "Connect"
        $( "#connect" ).click(() => { connect(); });

        // Associar a função de desconexão ao clicar no botão "Disconnect"
        $( "#disconnect" ).click(() => { disconnect(); });

        // Associar a função de unir-se ao chat ao clicar no botão "Unirse al chat"
        $( "#join" ).click(() => { submitJoin(); });

        // Associar a função de enviar mensagem ao clicar no botão "Enviar mensaje"
        $( "#sendChat" ).click(() => { sendMessage(); });

        // Dar foco ao campo de nome ao carregar a página
        $( "#name" ).focus();

        // Definir as variáveis do textarea e userlist
        userlist = document.getElementById("userlist");
        textarea = document.getElementById("textarea");
    });


    </script> 
		
 		<%@ include file="/WEB-INF/views/footer.jsp"%> 
	</body>
</html>