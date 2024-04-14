package com.example.demo.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EmpleadosController {
	
	@RequestMapping("/empleados")
	public String empleados() {
		return"empleados";
	}

}
