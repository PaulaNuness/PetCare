package com.example.demo.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RegistrarController {
	
	@RequestMapping("/registrar")
    public String registrar() {
	
        return "registrar"; // Isso vai renderizar o arquivo registrar.jsp
    }

}
