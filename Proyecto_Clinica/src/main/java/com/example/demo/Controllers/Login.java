package com.example.demo.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Login {
	
	@RequestMapping("/login")
    public String login() {
	
        return "login"; // Isso vai renderizar o arquivo login.jsp
    }

}
