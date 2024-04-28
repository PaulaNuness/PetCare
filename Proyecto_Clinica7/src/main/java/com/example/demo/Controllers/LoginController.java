package com.example.demo.Controllers;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.Interface.UsuarioPOJO;
import com.example.demo.Negocio.Usuario;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class LoginController {
	
	@Autowired
	private MessageSource meassageSource;
	
	@Autowired
	private HttpServletRequest request;;
	
	
/********************************************************************************************************************/
	@RequestMapping("/login")
	public ModelAndView Usuario() {
		
		ModelAndView mv = new ModelAndView();
		Map<String, Object> model = new HashMap<>();
		try {
			mv = new ModelAndView("login","model",model);
		}catch (Exception e){
			e.getMessage();
		}
		return mv;


	}
	
/********************************************************************************************************************/
	 @RequestMapping("/entrarAplicacion.json")
	 @ResponseBody
	    public Map<String, Object> processarFormulario(
	            @RequestParam(value="email") String email,
	            @RequestParam(value="contrasena") String contrasena
	    ) {
	        Map<String, Object> model = new HashMap<>();
	        try {
	        	// Verificar se o email já existe, Se o email existe, verifica se a contrasena es deste email
		        if (Usuario.existeUsuario(email)) {
		        	if(Usuario.retornarContrasena(email).equals(contrasena)) {
		        		model.put("mensaje", "La contraseña es correcta");
		        	}else {
		        		model.put("mensaje", "Los datos(email o contraseña) no corresponden");
		        	}
		        } else {
		            // Se o email no existe
		            model.put("mensaje", "El correo no existe.");
		            
		        }
		    } catch(Exception e) {
		        e.printStackTrace();
		        model.put("mensaje", "Ocurrió un error al entrar en la aplicación");
		       
		    }
	        
	        return model;
	    }
	 
/********************************************************************************************************************/ 
}
