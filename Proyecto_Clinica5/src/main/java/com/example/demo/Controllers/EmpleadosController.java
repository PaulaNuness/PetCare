package com.example.demo.Controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.Interface.UsuarioPOJO;
import com.example.demo.Negocio.Usuario;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class EmpleadosController {
	
	@Autowired
	private MessageSource meassageSource;
	
	@Autowired
	private HttpServletRequest request;;
	
	
/********************************************************************************************************************/
	@RequestMapping("/empleados")
	public ModelAndView Usuario() {
	    ModelAndView mv = new ModelAndView();
	    Map<String, Object> model = new HashMap<>();
	    ObjectMapper objectMapper = new ObjectMapper();
	    try {
	        List<UsuarioPOJO> usuarios = Usuario.getUsuarios(); // Obtém a lista de usuários
	        //aqui estou imprimindo por consola, para saber se estou mapeando bem
//	        System.out.println("Lista de Usuários:");
//	        for (UsuarioPOJO usuario : usuarios) {
//	            System.out.println(usuario.getNombre() + " " + usuario.getApellido() + " - " + usuario.getEmail());
//	        }
	        // Converter a lista de usuários para JSON
	        String usuariosJSON = objectMapper.writeValueAsString(usuarios);
	        
	        model.put("usuariosJSON", usuariosJSON); // Adiciona a string JSON ao modelo


	        mv = new ModelAndView("empleados", "model", model);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return mv;
	}

	
/********************************************************************************************************************/

}
