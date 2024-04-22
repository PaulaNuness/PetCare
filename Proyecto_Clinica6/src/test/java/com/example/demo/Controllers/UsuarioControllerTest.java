package com.example.demo.Controllers;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
@SpringBootTest
@AutoConfigureMockMvc
public class UsuarioControllerTest {

    @Autowired
    private MockMvc mockMvc;

    /********************************************************************************************************************/
    @Test
    public void testCrearYModificarUsuario() throws Exception {
        mockMvc.perform(MockMvcRequestBuilders.get("/crearYmodificarUsuario.json")
                .param("nombre", "John")
                .param("apellido", "Doe")
                .param("email", "john.doe@example.com")
                .param("contrasena", "password")
                .param("pais", "Brasil")
                .param("sexo", "Masculino")
                .contentType(MediaType.APPLICATION_JSON))
                .andExpect(MockMvcResultMatchers.status().isOk());
    }
    /********************************************************************************************************************/
    
}
