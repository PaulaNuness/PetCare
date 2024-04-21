package com.example.demo.Datos;

import java.sql.Connection;
import java.sql.PreparedStatement;

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
	
}
