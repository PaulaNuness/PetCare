package com.example.demo.Controllers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.Datos.ConexionBD;
import com.example.demo.Interface.PacientePOJO;
import com.example.demo.Interface.UsuarioPOJO;
import com.example.demo.Negocio.Paciente;
import com.example.demo.Negocio.Usuario;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class PacienteController {
	
	@Autowired
	private MessageSource meassageSource;
	
	@Autowired
	private HttpServletRequest request;

	
	
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
	@RequestMapping("/addPaciente.json")
	@ResponseBody
	public Object crearUsuario(
	        @RequestParam(value="numeroChip") String numeroChipStr,
	        @RequestParam(value="nombreMascota") String nombreMascota,
	        @RequestParam(value="edad") String edadStr,
	        @RequestParam(value="nombreTutor") String nombreTutor,
	        @RequestParam(value="DNI") String DNI,
	        @RequestParam(value="ubicacion") String ubicacion,
	        @RequestParam(value="estaActivo") String estaActivo
	        ){
	    Map<String,Object> model = new HashMap<>();
	    try {
	        // Verificar se algum campo está vazio
	        if (numeroChipStr.isEmpty() || nombreMascota.isEmpty() || edadStr.isEmpty() || nombreTutor.isEmpty() || DNI.isEmpty() || ubicacion.isEmpty() || estaActivo.isEmpty()) {
	            // Se algum campo estiver vazio, retorne uma mensagem de erro
	            model.put("mensajeAdd", "Todos los campos son obligatorios.");
	            model.put("success", false);
	        } else {
	            // Converter idChip e idade para os tipos corretos
	            int idChip = Integer.parseInt(numeroChipStr);
	            int edad = Integer.parseInt(edadStr);
	            
	            // Verificar se o paciente já existe
	            if (!Paciente.existePaciente(idChip)) {
	                // Se o paciente não existe, inserir o paciente
	                PacientePOJO datos = new PacientePOJO(idChip, nombreMascota, edad, nombreTutor,DNI, ubicacion, Boolean.valueOf(estaActivo));
	                Paciente.insertarPaciente(datos);
	                model.put("mensajeAdd", "OK");
	                model.put("success", true);
	            } else {
	                // Se o paciente já existe, retornar uma mensagem indicando isso
	                model.put("mensajeAdd", "El paciente ya está registrado.");
	                model.put("success", false);
	            }
	        }
	    } catch(NumberFormatException e) {
	        // Se houver um erro ao converter o idChip ou idade para inteiros, retorne uma mensagem de erro
	        model.put("mensajeAdd", "ID de chip o edad no válido.");
	        model.put("success", false);
	    } catch(Exception e) {
	        // Se houver um erro inesperado, retorne uma mensagem de erro genérica
	        e.printStackTrace();
	        model.put("mensajeAdd", "Ocurrió un error al crear el paciente.");
	        model.put("success", false);
	    }   
	    return model;
	}


/********************************************************************************************************************/
	//mapeando para eliminar Paceinte
	@RequestMapping("/eliminarPaciente.json")
	@ResponseBody
	public Object eliminarPaciente(
			@RequestParam(value="idPaciente") int idPaciente
	        ){

	    Map<String,Object> model = new HashMap<>();
	    try {
	    	
	    	Paciente.eliminarPaciente(idPaciente);

	    	model.put("mensajeElim", "OK");
	    	model.put("success", true);


	    } catch(Exception e) {
	        e.printStackTrace();
	        model.put("mensaje", "Ocurrió un error al eliminar el paciente");
	        model.put("success", false);
	    }
	    return model;
	}
	
/********************************************************************************************************************/
	@RequestMapping("/modPaciente.json")
	@ResponseBody
	public Object modPaciente(
			@RequestParam(value="idPaciente") int idPaciente,
	        @RequestParam(value="numeroChip") String numeroChipStr,
	        @RequestParam(value="nombreMascota") String nombreMascota,
	        @RequestParam(value="edad") String edadStr,
	        @RequestParam(value="nombreTutor") String nombreTutor,
	        @RequestParam(value="DNI") String DNI,
	        @RequestParam(value="ubicacion") String ubicacion,
	        @RequestParam(value="estaActivo") String estaActivo
	        ){
	    Map<String,Object> model = new HashMap<>();
	    try {
    		// Verificar se estaActivo es true o false
    		if (estaActivo.equals("true") || estaActivo.equals("false")) {
    			// Converter idChip e idade para os tipos corretos
	            int idChip = Integer.parseInt(numeroChipStr);
	            int edad = Integer.parseInt(edadStr);
	            PacientePOJO datos = new PacientePOJO(idPaciente,idChip,nombreMascota,edad,nombreTutor,DNI,ubicacion,Boolean.valueOf(estaActivo));
	            Paciente.modificarPaciente(datos);

	            model.put("mensajeMod", "OK");
	            model.put("success", true);
    		}else {
	            model.put("mensajeMod", "En el campo estaActivo solo acepta: true o false");
	            model.put("success", false);
        	}
	    } catch(NumberFormatException e) {
	        // Se houver um erro ao converter o idChip ou idade para inteiros, retorne uma mensagem de erro
	        model.put("mensajeAdd", "ID de chip o edad no válido.");
	        model.put("success", false);
	    } catch(Exception e) {
	        // Se houver um erro inesperado, retorne uma mensagem de erro genérica
	        e.printStackTrace();
	        model.put("mensajeAdd", "Ocurrió un error al crear el paciente.");
	        model.put("success", false);
	    }   
	    return model;
	}


/********************************************************************************************************************/

	
}
