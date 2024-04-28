package com.example.demo.Datos;

import static org.junit.Assert.*;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;

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
    
    @Test
    public void testGetUsuarios() {
        // Execute o método para buscar os usuários
        List<UsuarioPOJO> usuarios = BBDD_Usuario.getUsuarios();

        // Verifique se a lista não está nula
        assertNotNull(usuarios);

        // Verifique se pelo menos um usuário foi retornado
        // Isso depende dos dados existentes no seu banco de dados
        // Se não houver usuários no banco de dados, esse teste falhará
        // Você pode ajustar este teste de acordo com os dados esperados do seu banco de dados
        // Aqui, assumimos que deve haver pelo menos um usuário no banco de dados
        assertEquals(true, usuarios.size() > 0);

        // Exiba os detalhes dos usuários retornados
        for (UsuarioPOJO usuario : usuarios) {
            System.out.println(usuario.toString());
        }
    }
    /********************************************************************************************************************/
    @Test
    public void testObterIdUsuario() {
        // Define um email de exemplo
        String email = "camila@hotmail.com";
        
        // Chama o método obterIdUsuario com o email de exemplo
        int idUsuario = Usuario.obterIdUsuario(email);
        
        System.out.println(idUsuario);
    }
    /********************************************************************************************************************/
}
