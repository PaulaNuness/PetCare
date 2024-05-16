package com.example.demo.Controllers;

import com.example.demo.Datos.ChatMessage;
import com.example.demo.Datos.JoinMessage;

import jakarta.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.event.EventListener;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.socket.messaging.SessionDisconnectEvent;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.stream.Collectors;

@Controller
public class ChatController {

	   @Autowired
	    private SimpMessageSendingOperations ops;
	    private static final Map<String, Map<String, Object>> sessions = new ConcurrentHashMap<>();
	    
		@Autowired
		private MessageSource meassageSource;
		
		@Autowired
		private HttpServletRequest request;
	    
/********************************************************************************************************************/
	    @RequestMapping("/chat")
	    public ModelAndView Usuario() {
	        ModelAndView mv = new ModelAndView();
	        Map<String, Object> model = new HashMap<>();
	        try {
	            mv = new ModelAndView("chat","model",model);
	        } catch (Exception e) {
	            e.getMessage();
	        }
	        return mv;
	    }
/********************************************************************************************************************/
	    //metodo para cuando un usuario se una al chat
	    @MessageMapping("/join")
	    public void onJoin(
	    		//recebe los parametros
	            @Payload JoinMessage message,//viene del packete Datos
	            SimpMessageHeaderAccessor accessor
	    ){
	    	Map<String,Object> model = new HashMap<>();
	    	
	        String sessionId = accessor.getSessionId();
	        Map<String, Object> sessionAttributes = accessor.getSessionAttributes();//atributos de la ssesion, ejemplo, email, contraseña
	        System.out.println("***********************");
	        System.out.println("Id: "+sessionId);


	        String username = message.username();//guardar el nombre
	        sessionAttributes.put("username", username);
	        sessions.put(sessionId, sessionAttributes);
	        System.out.println("Atributos: "+sessionAttributes);
	        System.out.println("Username: "+username);

	        var msg = new ChatMessage(username, "");//bem vindo al chat, mensage
	        this.ops.convertAndSend("/topic/responses", msg);
	        System.out.println(msg.body());
	        model.put("mensajeBody", msg.body());
	        
	        var usersMsg = new ChatMessage(username, " ");//meansage para saber cuantos usuario hay conectados
	        this.ops.convertAndSend("/topic/users", usersMsg);
	        System.out.println(usersMsg);

	    }
	    
/********************************************************************************************************************/
	    //metodo para las respuestas
	    @MessageMapping("/chat")
	    @SendTo("/topic/responses")//nos permite enviar mensage a uno topic
	    public ChatMessage onMessage(
	            @Payload ChatMessage message,
	            SimpMessageHeaderAccessor accessor
	    ){
	    	System.out.println("***********************");
	        System.out.println("Objeto Mensage:"+message);
	        System.out.println(message.username());
	        System.out.println(message.body());
	        // aquí se podrían hacer distintas comprobaciones antes de enviar el mensaje
	        // ...
	        return message;
	    }
	    
/********************************************************************************************************************/
	    //para indicar que el usuario a salindo
	    @EventListener
	    public void disconnectListener(SessionDisconnectEvent event) {
	        StompHeaderAccessor headerAccessor = StompHeaderAccessor.wrap(event.getMessage());

	        String username = (String) headerAccessor.getSessionAttributes().get("username");
	        if(username != null) {
	            System.out.println("User Disconnected : " + username);

	            var msg = new ChatMessage(username, " -- salio del chat -- ");
	            ops.convertAndSend("/topic/responses", msg);

	            // remove session associated with username
	            sessions.remove(headerAccessor.getSessionId());

	            var updateUserList = new ChatMessage(username, "");
	            ops.convertAndSend("/topic/users", updateUserList);
	        }
	    }
	    
/********************************************************************************************************************/
	    // user1,user2,user3
	    private String getUserNames(){
	        return sessions.values().stream()
	                .map(v -> v.get("username"))
	                .map(String::valueOf)
	                .collect(Collectors.joining(","));

	    }
	    
/********************************************************************************************************************/
	    
}
