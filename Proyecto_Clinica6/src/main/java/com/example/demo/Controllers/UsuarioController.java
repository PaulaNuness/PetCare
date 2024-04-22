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
public class UsuarioController {
	
	@Autowired
	private MessageSource meassageSource;
	
	@Autowired
	private HttpServletRequest request;;
	
	
/********************************************************************************************************************/
	//metodo para mostrar la vista(achivo .jsp) y tambien hacer lista(datos que busco)
	@RequestMapping("/usuario")
	public ModelAndView Usuario() {
		
		ModelAndView mv = new ModelAndView();
		Map<String, Object> model = new HashMap<>();
		try {
			mv = new ModelAndView("usuario","model",model);
		}catch (Exception e){
			e.getMessage();
		}
		return mv;


	}
	
/********************************************************************************************************************/	
	//mapeando para crera o modificar datos Usuario
	@RequestMapping("/crearYmodificarUsuario.json")
	@ResponseBody
	public Object crearYmodificarUsuario(
	        @RequestParam(value="nombre") String nombre,
	        @RequestParam(value="apellido") String apellido,
	        @RequestParam(value="email") String email,
	        @RequestParam(value="contrasena") String contrasena,
	        @RequestParam(value="pais") String pais,
	        @RequestParam(value="sexo") String sexo
	        ){

	    Map<String,Object> model = new HashMap<>();
	    try {
	        // Verificar se o email já existe
	        if (!Usuario.existeUsuario(email)) {
	            // Se o email não existe, inserir o usuário
	            UsuarioPOJO datos = new UsuarioPOJO(nombre, apellido, email, contrasena, pais, sexo);
	            Usuario.insertarUsuario(datos);
	            model.put("mensaje", "Registro confirmado!");
	            model.put("success", true);
	        } else {
	            // Se o email já existe, retornar uma mensagem indicando isso
	            model.put("mensaje", "El correo electrónico ya está registrado.");
	            model.put("success", false);
	        }
	    } catch(Exception e) {
	        e.printStackTrace();
	        model.put("mensaje", "Ocurrió un error al crear/modificar el usuario");
	        model.put("success", false);
	    }
	    return model;
	}

/********************************************************************************************************************/
	
}
