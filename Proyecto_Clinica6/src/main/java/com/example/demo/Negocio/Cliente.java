package com.example.demo.Negocio;

import java.util.ArrayList;
import java.util.List;

import com.example.demo.Datos.BBDD_Cliente;
import com.example.demo.Interface.ClientePOJO;


public class Cliente {
	
/*******************************************************************************************************************/
	//metodo para buscar todos los clientes(pacientes) da base de datos
	 public static List<ClientePOJO> getClientes() {
		 List<ClientePOJO> usuarios = new ArrayList<>();
		 try {
			 usuarios = BBDD_Cliente.getClientes();
		 }catch(Exception e){
				e.printStackTrace();
			}
		return usuarios;
		 
	 }
/*******************************************************************************************************************/
}
