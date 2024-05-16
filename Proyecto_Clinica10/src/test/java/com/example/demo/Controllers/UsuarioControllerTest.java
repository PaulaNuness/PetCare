package com.example.demo.Controllers;

import static org.junit.Assert.assertEquals;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.web.servlet.ModelAndView;
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

    @Test
    public void testUsuarioEmailInSession() {
        // Crie uma instância do controlador PrincipalController
        PrincipalController principalController = new PrincipalController();
        
        // Crie uma HttpSession falsa
        MockHttpSession session = new MockHttpSession();
        
        // Defina o valor do atributo usuarioEmail na sessão falsa
        String email = "usuario@example.com";
        session.setAttribute("usuarioEmail", email);
        
        // Chame o método do controlador para testar
        ModelAndView mv = principalController.usuario();
        
        // Obtenha o valor do atributo usuarioEmail da sessão
        String usuarioEmail = (String) session.getAttribute("usuarioEmail");
        
        // Verifique se o valor recuperado é o mesmo que foi definido
        assertEquals(email, usuarioEmail);
        
        // Verifique se o modelo da visão contém o atributo "email" com o valor correto
        assertEquals(email, mv.getModel().get("email"));
    }
    /********************************************************************************************************************/
}
