package com.example.demo.Datos;

import static org.mockito.Mockito.*;

import java.sql.Connection;
import java.sql.PreparedStatement;

import org.junit.jupiter.api.Test;

import com.example.demo.Interface.UsuarioPOJO;
import com.example.demo.Negocio.Usuario;

public class BBDD_UsuarioTest {

    @Test
    public void testInsertarUsuario() throws Exception {
        // Mock da conexão com o banco de dados
        Connection conn = mock(Connection.class);
        // Mock do PreparedStatement
        PreparedStatement query = mock(PreparedStatement.class);
        
        // Configurar o comportamento do mock do PreparedStatement
        when(conn.prepareStatement(anyString())).thenReturn(query);
        
        // Simular dados do usuário
        UsuarioPOJO datos = new UsuarioPOJO("John", "Doe", "john.doe@example.com", "password", "Brasil", "Masculino");
        
        // Chamar o método a ser testado
        Usuario.insertarUsuario(datos);
        
        // Verificar se o método executeUpdate foi chamado no PreparedStatement
        verify(query, times(1)).executeUpdate();
        
        // Verificar se a conexão foi fechada
        verify(conn, times(1)).close();
        // Verificar se o PreparedStatement foi fechado
        verify(query, times(1)).close();
    }
    /********************************************************************************************************************/
}
