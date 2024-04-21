package com.example.demo.Negocio;


import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.Datos.BBDD_Usuario;
import com.example.demo.Interface.UsuarioPOJO;

public class Usuario {
	
/********************************************************************************************************************/
	//mapeando para insertar usuarios
	public static void insertarUsuario(UsuarioPOJO  datos) {
		try {
			 
			BBDD_Usuario.insertarUsuario(datos);
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
/********************************************************************************************************************/	

	// Método para verificar se o usuário existe, o parâmetro será o email
	public static boolean existeUsuario(String email) {
		boolean respuesta=BBDD_Usuario.existeUsuario(email);
		
		return respuesta;
		
	}
	
/********************************************************************************************************************/	
	// Método para retornar a contrasena de un email
	public static String retornarContrasena(String email) {
		String contrasenaBBDD =BBDD_Usuario.retornarContrasena(email);
		
		return contrasenaBBDD;
		
	}
	
/********************************************************************************************************************/
}
