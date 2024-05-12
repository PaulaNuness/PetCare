package com.example.demo.Datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.example.demo.Interface.PacientePOJO;
import com.example.demo.Interface.UsuarioPOJO;


public class BBDD_Paciente {
	
/********************************************************************************************************************/	
	//metodo para buscar todos los pacientes da base de datos
	 public static List<PacientePOJO> getPacientes() {
		 
	        List<PacientePOJO> clientes = new ArrayList<>();
	        
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
	        	   PacientePOJO cliente = new PacientePOJO();
	        	   		cliente.setIdPaciente(result.getInt(1));
	        	   		cliente.setNumeroChip(result.getInt(2));
	        	   		cliente.setNombreMascota(result.getString(3));
	        	   		cliente.setEdad(result.getInt(4));
	        	   		cliente.setNombreTutor(result.getString(5));
	        	   		cliente.setDNItutor(result.getString(6));
	        	   		cliente.setUbicacionMascota(result.getString(7));
	                    cliente.setEstaActivo(result.getBoolean(8));
	        	   		clientes.add(cliente);
	                }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return clientes;
	    }
/********************************************************************************************************************/
		//metodo para insertar paciente en la base de datos 
		public static void insertarPaciente(PacientePOJO  datos) {
			
			Connection conn = null;
	        PreparedStatement query = null;
	        
			try {
				
				// Obter conexão com o banco de dados
	            conn = ConexionBD.obterConexao();
	            
	           // Consulta SQL para inserir um novo usuário
	            String sql = "INSERT INTO pacientes (numeroChip, nombreMascota, edad, nombreTutor, DNITutor, ubicacionMascota, estaActivo) VALUES (?, ?, ?, ?, ?, ?,?)";

	            query = conn.prepareStatement(sql);

	            // Preencher os parâmetros da consulta com os dados do POJO
	            query.setInt(1, datos.getNumeroChip());
	            query.setString(2, datos.getNombreMascota());
	            query.setInt(3, datos.getEdad());
	            query.setString(4, datos.getNombreTutor());
	            query.setString(5, datos.getDNItutor());
	            query.setString(6, datos.getUbicacionMascota());
	            query.setBoolean(7, datos.isEstaActivo());
	            
	            // Executar a consulta
	            query.executeUpdate();
	            System.out.println("Paciente inserido com sucesso.");
				
	         
			}catch(Exception e){
	            e.printStackTrace();
	            System.out.println("Erro ao inserir paciente: " + e.getMessage());
			}finally {
	            // Fechar a conexão e o statement
	            ConexionBD.fecharConexao(conn);
	            if (query != null) {
	                try {
	                    query.close();
	                } catch (Exception e) {
	                    e.printStackTrace();
	                }
	            }
			}
		}
/********************************************************************************************************************/
		// Método para verificar se o usuário existe, o parâmetro será o email
		public static boolean existePaciente(int numeroChip) {
		    boolean resposta = false;

		    Connection conn = null;
		    PreparedStatement query = null;
		    ResultSet result = null;
		    
		    try {
		        // Obter conexão com o banco de dados
		        conn = ConexionBD.obterConexao();
		        
		        // Consulta SQL
		        String sql = "SELECT COUNT(*) AS count FROM pacientes WHERE numeroChip=?";
		        
		        query = conn.prepareStatement(sql);
		        query.setInt(1, numeroChip);
		        
		        // Executar a consulta
		        result = query.executeQuery();
		        
		        // Verificar se há algum resultado
		        if (result.next()) {
		            int count = result.getInt("count");
		            resposta = count > 0; // Se count for maior que 0, o email existe. aqi ja tenho true
		        }
		        
		    } catch (Exception e) {
		        e.printStackTrace(); // Use o printStackTrace para depurar facilmente
		    } finally {
		        // Fechar conexão, consultas e resultados
		        try {
		            if (result != null) result.close();
		            if (query != null) query.close();
		            if (conn != null) conn.close();
		        } catch (SQLException e) {
		            e.printStackTrace(); // Lidar com possíveis erros de fechamento
		        }
		    }
		    
		    return resposta;
		}

	/********************************************************************************************************************/
		// Método para eliminar um upaciente existente no banco de dados
		public static void eliminarPaciente(int idPaciente) {
		    Connection conn = null;
		    PreparedStatement query = null;

		    try {
		        // Obter conexão com o banco de dados
		        conn = ConexionBD.obterConexao();

		        // Consulta SQL para atualizar um usuário existente
		        String sql = "UPDATE pacientes SET estaActivo=false WHERE idPaciente=?";

		        query = conn.prepareStatement(sql);

		        // Preencher os parâmetros da consulta com os novos dados do POJO
		        query.setInt(1, idPaciente); 

		        // Executar a consulta
		        query.executeUpdate();
		        System.out.println("Paciente eliminado com sucesso.");

		    } catch (Exception e) {
		        e.printStackTrace();
		        System.out.println("Erro ao modificar usuário: " + e.getMessage());
		    } finally {
		        // Fechar a conexão e o statement
		        ConexionBD.fecharConexao(conn);
		        if (query != null) {
		            try {
		                query.close();
		            } catch (Exception e) {
		                e.printStackTrace();
		            }
		        }
		    }
		}

/*******************************************************************************************************************/
		// Método para modificar um paciente existente no banco de dados
		public static void modificarPaciente(PacientePOJO datos) {
		    Connection conn = null;
		    PreparedStatement query = null;

		    try {
		        // Obter conexão com o banco de dados
		        conn = ConexionBD.obterConexao();

		        // Consulta SQL para atualizar um usuário existente
		        String sql = "UPDATE pacientes SET numeroChip=?, nombreMascota=?, edad=?, nombreTutor=?, DNITutor=?, ubicacionMascota=?, estaActivo=? WHERE idPaciente=?";

		        query = conn.prepareStatement(sql);

		        // Preencher os parâmetros da consulta com os novos dados do POJO
		        query.setInt(1, datos.getNumeroChip());
		        query.setString(2, datos.getNombreMascota());
		        query.setInt(3, datos.getEdad());
		        query.setString(4, datos.getNombreTutor());
		        query.setString(5, datos.getDNItutor()); 
		        query.setString(6, datos.getUbicacionMascota());
		        query.setBoolean(7, datos.isEstaActivo());
		        query.setInt(8, datos.getIdPaciente()); 
		        

		        // Executar a consulta
		        query.executeUpdate();
		        System.out.println("Paciente modificado com sucesso.");

		    } catch (Exception e) {
		        e.printStackTrace();
		        System.out.println("Erro ao modificar usuário: " + e.getMessage());
		    } finally {
		        // Fechar a conexão e o statement
		        ConexionBD.fecharConexao(conn);
		        if (query != null) {
		            try {
		                query.close();
		            } catch (Exception e) {
		                e.printStackTrace();
		            }
		        }
		    }
		}

/*******************************************************************************************************************/
}
