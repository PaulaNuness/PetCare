package com.example.demo.Datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.example.demo.Interface.UsuarioPOJO;

public class BBDD_Usuario {

/********************************************************************************************************************/
	//metodo para insertar en la base de datos usuarios
	public static void insertarUsuario(UsuarioPOJO  datos) {
		
		Connection conn = null;
        PreparedStatement query = null;
        
		try {
			
			// Obter conexão com o banco de dados
            conn = ConexionBD.obterConexao();
            
           // Consulta SQL para inserir um novo usuário
            String sql = "INSERT INTO usuarios (nombre, apellido, email, contrasena, pais, sexo) VALUES (?, ?, ?, ?, ?, ?)";

            query = conn.prepareStatement(sql);

            // Preencher os parâmetros da consulta com os dados do POJO
            query.setString(1, datos.getNombre());
            query.setString(2, datos.getApellido());
            query.setString(3, datos.getEmail());
            query.setString(4, datos.getContrasena());
            query.setString(5, datos.getPais());
            query.setString(6, datos.getSexo());
            
            // Executar a consulta
            query.executeUpdate();
            System.out.println("Usuário inserido com sucesso.");
			
         
		}catch(Exception e){
            e.printStackTrace();
            System.out.println("Erro ao inserir usuário: " + e.getMessage());
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
	public static boolean existeUsuario(String email) {
	    boolean resposta = false;
	    
	    Connection conn = null;
	    PreparedStatement query = null;
	    ResultSet result = null;
	    
	    try {
	        // Obter conexão com o banco de dados
	        conn = ConexionBD.obterConexao();
	        
	        // Consulta SQL
	        String sql = "SELECT COUNT(*) AS count FROM usuarios WHERE email=?";
	        
	        query = conn.prepareStatement(sql);
	        query.setString(1, email);
	        
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
	// Método para retornar a contrasena de un email
	public static String retornarContrasena(String email) {
		String contrasenaBBDD = "";
	    
	    Connection conn = null;
	    PreparedStatement query = null;
	    ResultSet result = null;
		
	    try {
	    	// Obter conexão com o banco de dados
	        conn = ConexionBD.obterConexao();
	        
	     // Consulta SQL
	        String sql = "SELECT Contrasena  FROM usuarios WHERE email=?";
	        
	        query = conn.prepareStatement(sql);
	        query.setString(1, email);
	        
	     // Executar a consulta
	        result = query.executeQuery();
	        
	     // Verificar se há algum resultado
	        if (result.next()) {
	        	// Se houver um resultado, atribua a senha associada ao email à variável senhaBBDD
	        	contrasenaBBDD = result.getString("Contrasena");
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
		
		return contrasenaBBDD;
	}
	
/*******************************************************************************************************************/
	//metodo para buscar todos los empleados(usuarios) da base de datos
	 public static List<UsuarioPOJO> getUsuarios() {
		 
	        List<UsuarioPOJO> usuarios = new ArrayList<>();
	        
	        Connection conn = null;
    	    PreparedStatement query = null;
    	    ResultSet result = null;
    	    
	        try {
		    	// Obter conexão com o banco de dados
		        conn = ConexionBD.obterConexao();
	        	
		        // Consulta SQL	
	            String sql = "SELECT * FROM usuarios";
	            
	            query = conn.prepareStatement(sql);
	           // Executar a consulta
		        result = query.executeQuery();

	           while (result.next()) {
	                    UsuarioPOJO usuario = new UsuarioPOJO();
	                    usuario.setNombre(result.getString("nombre"));
	                    usuario.setApellido(result.getString("apellido"));
	                    usuario.setEmail(result.getString("email"));
	                    usuario.setPais(result.getString("pais"));
	                    usuario.setSexo(result.getString("sexo"));
	                    usuarios.add(usuario);
	                }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return usuarios;
	    }
/********************************************************************************************************************/	
}
