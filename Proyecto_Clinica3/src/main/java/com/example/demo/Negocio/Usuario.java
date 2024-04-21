package com.example.demo.Negocio;


import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.Datos.BBDD_Usuario;
import com.example.demo.Interface.UsuarioPOJO;

public class Usuario {
	
/********************************************************************************************************************/
	//mapeando para insertar usuarios
	public static void insertarUsuario(UsuarioPOJO  datos) {
		try {
			 
			BBDD_Usuario.insertarUsuario(datos);
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
/********************************************************************************************************************/	

}
