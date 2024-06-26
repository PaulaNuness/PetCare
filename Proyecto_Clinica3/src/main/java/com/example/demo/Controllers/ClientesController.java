package com.example.demo.Controllers;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class ClientesController {
	
	@Autowired
	private MessageSource meassageSource;
	
	@Autowired
	private HttpServletRequest request;;
	
	
/********************************************************************************************************************/
	@RequestMapping("/clientes")
	public ModelAndView Usuario() {
		
		ModelAndView mv = new ModelAndView();
		Map<String, Object> model = new HashMap<>();
		try {
			mv = new ModelAndView("clientes","model",model);
		}catch (Exception e){
			e.getMessage();
		}
		return mv;


	}
	
/********************************************************************************************************************/
	
}
