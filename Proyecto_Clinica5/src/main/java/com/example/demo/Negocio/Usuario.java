package com.example.demo.Negocio;


import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
		boolean respuesta=false;
		try {
			respuesta=BBDD_Usuario.existeUsuario(email);
		}catch(Exception e){
			e.printStackTrace();
		}
		return respuesta;
		
	}
	
/********************************************************************************************************************/	
	// Método para retornar a contrasena de un email
	public static String retornarContrasena(String email) {
		String contrasenaBBDD ="";
		try {
			contrasenaBBDD =BBDD_Usuario.retornarContrasena(email);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return contrasenaBBDD;
		
	}
	
/*******************************************************************************************************************/
	//metodo para buscar todos los empleados(usuarios) da base de datos
	 public static List<UsuarioPOJO> getUsuarios() {
		 List<UsuarioPOJO> usuarios = new ArrayList<>();
		 try {
			 usuarios = BBDD_Usuario.getUsuarios();
		 }catch(Exception e){
				e.printStackTrace();
			}
		return usuarios;
		 
	 }
/*******************************************************************************************************************/
}
