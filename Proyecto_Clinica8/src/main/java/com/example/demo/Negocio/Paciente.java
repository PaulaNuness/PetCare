package com.example.demo.Negocio;

import java.util.ArrayList;
import java.util.List;

import com.example.demo.Datos.BBDD_Paciente;
import com.example.demo.Interface.PacientePOJO;


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
}
