package com.example.demo.Controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.Interface.PacientePOJO;
import com.example.demo.Negocio.Paciente;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class PacienteController {
	
	@Autowired
	private MessageSource meassageSource;
	
	@Autowired
	private HttpServletRequest request;;
	
	
/********************************************************************************************************************/
	@RequestMapping("/clientes")
	public ModelAndView Clientes() {
		
		ModelAndView mv = new ModelAndView();
		Map<String, Object> model = new HashMap<>();
		ObjectMapper objectMapper = new ObjectMapper();
		try {
	        List<PacientePOJO> clientes = Paciente.getClientes(); // Obtém a lista de cliente
	        //aqui estou imprimindo por consola, para saber se estou mapeando bem
//	        System.out.println("Lista de Pacientes:");
//	        for (ClientePOJO cliente : clientes) {
//	            System.out.println(cliente.getNombreMascota() + " " + cliente.getDNItutor()+"");
//	        }
	        // Converter a lista de usuários para JSON
	        String clientesJSON = objectMapper.writeValueAsString(clientes);
	        
	        model.put("usuariosJSON", clientesJSON); // Adiciona a string JSON ao modelo


			mv = new ModelAndView("clientes","model",model);
		}catch (Exception e){
			e.getMessage();
		}
		return mv;


	}
	
/********************************************************************************************************************/
	
}
