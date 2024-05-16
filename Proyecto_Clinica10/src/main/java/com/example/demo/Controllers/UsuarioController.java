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
	private HttpServletRequest request;
	
	
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
	//mapeando para crea Usuario
	@RequestMapping("/crearUsuario.json")
	@ResponseBody
	public Object crearUsuario(
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
	//mapeando para mod Usuario
	@RequestMapping("/modUsuario.json")
	@ResponseBody
	public Object modificarUsuario(
			@RequestParam(value="idUsuario") int idUsuario,
	        @RequestParam(value="nombre") String nombre,
	        @RequestParam(value="apellido") String apellido,
	        @RequestParam(value="email") String email,
	        @RequestParam(value="pais") String pais,
	        @RequestParam(value="sexo") String sexo,
	        @RequestParam(value="DNI") String DNI,
	        @RequestParam(value="telefono") String telefono,
	        @RequestParam(value="esAdmin") String esAdmin,
	        @RequestParam(value="estaActivo") String estaActivo
	        ){

	    Map<String,Object> model = new HashMap<>();
	    try {
	        // Verificar se pais esta na lista de opciones
	        if (Usuario.existePais(pais)) {
		        // Verificar se sexo es mujer o hombre
		        if (sexo.equals("mujer") || sexo.equals("hombre")) {
		        	// Verificar se esAdmin es true o false
		        	if (esAdmin.equals("true") || esAdmin.equals("false")) {
		        		// Verificar se estaActivo es true o false
		        		if (estaActivo.equals("true") || estaActivo.equals("false")) {
				        	boolean esAdm = Boolean.parseBoolean(esAdmin);
				        	
				            UsuarioPOJO datos = new UsuarioPOJO(idUsuario,nombre,apellido,email,pais,sexo,DNI,telefono,esAdm,Boolean.valueOf(estaActivo));
				            Usuario.modificarUsuario(datos);

				            model.put("mensajeMod", "OK");
				            model.put("success", true);
		        		}else {
				            model.put("mensajeMod", "En el campo estaActivo solo acepta: true o false");
				            model.put("success", false);
			        	}

		        	}else {
			            model.put("mensajeMod", "En el campo esAdmin solo acepta: true o false");
			            model.put("success", false);
		        	}

		        } else {
		            // Se o pais nao existe, retornar uma mensagem indicando isso
		            model.put("mensajeMod", "En el campo sexo solo acepta: mujer o hombre");
		            model.put("success", false);
		        }

	        } else {
	            // Se o pais nao existe, retornar uma mensagem indicando isso
	            model.put("mensajeMod", "En el campo país solo acepta: España, Brazil, Italia, Francia y Portugal");
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
	//mapeando para eliminar Usuario
	@RequestMapping("/eliminarUsuario.json")
	@ResponseBody
	public Object eliminarUsuario(
			@RequestParam(value="idUsuario") int idUsuario
	        ){

	    Map<String,Object> model = new HashMap<>();
	    try {
	    	
	    	Usuario.eliminarUsuario(idUsuario);

	    	model.put("mensajeElim", "OK");
	    	model.put("success", true);


	    } catch(Exception e) {
	        e.printStackTrace();
	        model.put("mensaje", "Ocurrió un error al eliminar el usuario");
	        model.put("success", false);
	    }
	    return model;
	}
	
/********************************************************************************************************************/
}
