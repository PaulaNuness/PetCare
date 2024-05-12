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
		// Método para retornar o id de un email
		public static int obterIdUsuario(String email) {
			int idUsuario =0;
			try {
				idUsuario =BBDD_Usuario.obterIdUsuario(email);
			}catch(Exception e){
				e.printStackTrace();
			}
			
			return idUsuario;
			
		}
		
/*******************************************************************************************************************/
		// Método para saber se usuario es adm o no
		public static boolean esAdmin(String email) {
			boolean esAdmin = false;
			try {
				esAdmin =BBDD_Usuario.esAdmin(email);
			}catch(Exception e){
				e.printStackTrace();
			}
			
			return esAdmin;
			
		}
		
/*******************************************************************************************************************/
		// Método para saber o nombre do usuario
		public static String nombreUsuario(String email) {
			String nombreUsu = "";
			try {
				nombreUsu =BBDD_Usuario.obterNombreUsuario(email);
			}catch(Exception e){
				e.printStackTrace();
			}
			
			return nombreUsu;
			
		}
		
/*******************************************************************************************************************/
		// Método para verificar se o usuário existe, o parâmetro será o email
		public static boolean existePais(String pais) {
			boolean respuesta=false;
			try {
				respuesta=BBDD_Usuario.existePais(pais);
			}catch(Exception e){
				e.printStackTrace();
			}
			return respuesta;
			
		}
		
/********************************************************************************************************************/	
		//mapeando para insertar usuarios
		public static void modificarUsuario(UsuarioPOJO  datos) {
			try {
				 
				BBDD_Usuario.modificarUsuario(datos);
				
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
/********************************************************************************************************************/
		// Método para eliminar um usuário existente no banco de dados
		public static void eliminarUsuario(int idUsuario) {
			try {
				 
				BBDD_Usuario.eliminarUsuario(idUsuario);
				
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
/********************************************************************************************************************/	
}
