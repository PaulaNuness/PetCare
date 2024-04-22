package com.example.demo.Interface;

import java.util.Map;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class UsuarioPOJO {

	private int idUsuario;
	private String nombre;
	private String apellido;
	private String email;
	private String contrasena;
	private String pais;
	private String sexo;
	
	/********************************************************************************************************************/
	public UsuarioPOJO() {
		
	}
	/********************************************************************************************************************/
	public UsuarioPOJO(String nombre, String apellido, String email, String contrasena, String pais,String sexo) {
		this.nombre = nombre;
		this.apellido = apellido;
		this.email = email;
		this.contrasena = contrasena;
		this.pais = pais;
		this.sexo = sexo;
	}
	/********************************************************************************************************************/	
	public UsuarioPOJO(Map<String,Object>aux) throws Exception{
		this.idUsuario=(Integer) aux.get("IdUsuario");
		this.nombre=(String) aux.get("Nombre");
		this.apellido=(String) aux.get("Apellido");
		this.email=(String) aux.get("mail");
		this.contrasena=(String) aux.get("Contrasena");
		this.pais=(String) aux.get("Pais");
		this.sexo=(String) aux.get("Sexo");
	}
	/********************************************************************************************************************/
	public int getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getContrasena() {
		return contrasena;
	}

	public void setContrasena(String contrasena) {
		this.contrasena = contrasena;
	}

	public String getPais() {
		return pais;
	}

	public void setPais(String pais) {
		this.pais = pais;
	}

	public String getSexo() {
		return sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}
	/********************************************************************************************************************/

	@Override
	public String toString() {
		return "UsuarioPOJO [idUsuario=" + idUsuario + ", nombre=" + nombre + ", apellido=" + apellido + ", email="
				+ email + ", contrasena=" + contrasena + ", pais=" + pais + ", sexo=" + sexo + "]";
	}
	/********************************************************************************************************************/
	
}
