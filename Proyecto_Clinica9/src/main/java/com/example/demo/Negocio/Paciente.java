package com.example.demo.Negocio;

import java.util.ArrayList;
import java.util.List;

import com.example.demo.Datos.BBDD_Paciente;
import com.example.demo.Datos.BBDD_Usuario;
import com.example.demo.Interface.PacientePOJO;
import com.example.demo.Interface.UsuarioPOJO;


public class Paciente {
	
/*******************************************************************************************************************/
	//metodo para buscar todos los clientes(pacientes) da base de datos
	 public static List<PacientePOJO> getClientes() {
		 List<PacientePOJO> usuarios = new ArrayList<>();
		 try {
			 usuarios = BBDD_Paciente.getPacientes();
		 }catch(Exception e){
				e.printStackTrace();
			}
		return usuarios;
		 
	 }
/*******************************************************************************************************************/
		//metodo para insertar paciente en la base de datos 
		public static void insertarPaciente(PacientePOJO  datos) {
			try {
				 
				BBDD_Paciente.insertarPaciente(datos);
				
			}catch(Exception e){
				e.printStackTrace();
			}
		}
/*******************************************************************************************************************/	

		// Método para verificar se o usuário existe, o parâmetro será o email
		public static boolean existePaciente(int idChip) {
			boolean respuesta=false;
			try {
				respuesta=BBDD_Paciente.existePaciente(idChip);
			}catch(Exception e){
				e.printStackTrace();
			}
			return respuesta;
			
		}
		
	/********************************************************************************************************************/
		// Método para eliminar um paciente existente no banco de dados
		public static void eliminarPaciente(int idPaciente) {
			try {
				 
				BBDD_Paciente.eliminarPaciente(idPaciente);
				
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
/********************************************************************************************************************/	
		//mapeando para modificar pacientes
		public static void modificarPaciente(PacientePOJO  datos) {
			try {
				 
				BBDD_Paciente.modificarPaciente(datos);
				
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
/********************************************************************************************************************/
}
