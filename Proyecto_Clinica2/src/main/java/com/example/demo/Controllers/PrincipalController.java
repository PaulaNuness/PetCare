package com.example.demo.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PrincipalController {

	@RequestMapping("/principal")
	public String principal() {
		return"principal";
	}
}
