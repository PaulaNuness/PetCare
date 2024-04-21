package com.example.demo.Negocio;

import static org.mockito.Mockito.*;

import org.junit.jupiter.api.Test;

import com.example.demo.Datos.BBDD_Usuario;
import com.example.demo.Interface.UsuarioPOJO;

public class UsuarioTest {

    @Test
    public void testInsertarUsuario() {
        // Mock da classe BBDD_Usuario
        BBDD_Usuario mockBBDDUsuario = mock(BBDD_Usuario.class);
        
        // Simular dados do usuário
        UsuarioPOJO datos = new UsuarioPOJO("John", "Doe", "john.doe@example.com", "password", "Brasil", "Masculino");
        
        // Chamar o método a ser testado
        Usuario.insertarUsuario(datos);
        
        // Verificar se o método insertarUsuario da classe BBDD_Usuario foi chamado com os dados corretos
        verify(mockBBDDUsuario, times(1)).insertarUsuario(datos);
    }
    /********************************************************************************************************************/
}

