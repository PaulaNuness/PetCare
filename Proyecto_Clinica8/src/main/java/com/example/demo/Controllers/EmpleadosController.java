package com.example.demo.Controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.Interface.UsuarioPOJO;
import com.example.demo.Negocio.Usuario;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class EmpleadosController {
	
	@Autowired
	private MessageSource meassageSource;
	
    @Autowired
    private HttpSession session;
	
	
/********************************************************************************************************************/
    @RequestMapping("/empleados")
    public ModelAndView Empleado() {
        ModelAndView mv = new ModelAndView();
        Map<String, Object> model = new HashMap<>();
        ObjectMapper objectMapper = new ObjectMapper();
        try {

            mv = new ModelAndView("empleados", "model", model);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mv;
    }

/********************************************************************************************************************/
    @GetMapping("/esAdmin")
    @ResponseBody
    public boolean isUserAdmin() {
        String userEmail = (String) session.getAttribute("userEmail");
        return userEmail != null && Usuario.esAdmin(userEmail);
    }
    
/********************************************************************************************************************/

}
