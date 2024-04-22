package com.example.demo.Datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.example.demo.Interface.ClientePOJO;


public class BBDD_Cliente {
	
/********************************************************************************************************************/	
	//metodo para buscar todos los clientes(pacientes) da base de datos
	 public static List<ClientePOJO> getClientes() {
		 
	        List<ClientePOJO> clientes = new ArrayList<>();
	        
	        Connection conn = null;
	        PreparedStatement query = null;
	        ResultSet result = null;
   	    
	        try {
		    	// Obter conexão com o banco de dados
		        conn = ConexionBD.obterConexao();
	        	
		        // Consulta SQL	
	            String sql = "SELECT * FROM pacientes";
	            
	            query = conn.prepareStatement(sql);
	           // Executar a consulta
		        result = query.executeQuery();

	           while (result.next()) {
	        	   ClientePOJO cliente = new ClientePOJO();
	        	   		cliente.setIdPaciente(result.getInt("IdPaciente"));
	        	   		cliente.setNombreMascota(result.getString("NombreMascota"));
	        	   		cliente.setEdad(result.getInt("Edad"));
	        	   		cliente.setNombreTutor(result.getString("NombreTutor"));
	        	   		cliente.setDNItutor(result.getString("DNITutor"));
	        	   		cliente.setUbicacionMascota(result.getString("UbicacionMascota"));
	        	   		clientes.add(cliente);
	                }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return clientes;
	    }
/********************************************************************************************************************/	
}
