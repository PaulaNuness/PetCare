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
	private String DNI;
	private String telefono;
	private boolean esAdm;
	private boolean estaActivo;
	
	/********************************************************************************************************************/
	public UsuarioPOJO() {
		
	}
	/********************************************************************************************************************/
	public UsuarioPOJO(int idUsuario,String nombre, String apellido, String email, String pais,String sexo,String DNI,String telefono,Boolean esAdm,Boolean estaActivo) {
		this.idUsuario = idUsuario;
		this.nombre = nombre;
		this.apellido = apellido;
		this.email = email;
		this.pais = pais;
		this.sexo = sexo;
		this.DNI = DNI;
		this.esAdm = esAdm;
		this.telefono = telefono;
		this.estaActivo = estaActivo;
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
		this.sexo=(String) aux.get("DNI");
		this.sexo=(String) aux.get("Telefono");
		this.esAdm = (Boolean) aux.get("EsADM") != null ? (Boolean) aux.get("EsADM") : false;
        this.estaActivo = (Boolean) aux.get("EstaActivo") != null ? (Boolean) aux.get("EstaActivo") : true;
		
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

	public String getDNI() {
		return DNI;
	}
	public void setDNI(String dNI) {
		DNI = dNI;
	}
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	public boolean isEsAdm() {
		return esAdm;
	}
	public void setEsAdm(boolean esAdm) {
		this.esAdm = esAdm;
	}
	public boolean isEstaActivo() {
		return estaActivo;
	}
	public void setEstaActivo(boolean estaActivo) {
		this.estaActivo = estaActivo;
	}

	/********************************************************************************************************************/
	@Override
	public String toString() {
		return "UsuarioPOJO [idUsuario=" + idUsuario + ", nombre=" + nombre + ", apellido=" + apellido + ", email="
				+ email + ", contrasena=" + contrasena + ", pais=" + pais + ", sexo=" + sexo + ", DNI=" + DNI
				+ ", telefono=" + telefono + ", esAdm=" + esAdm + ", estaActivo=" + estaActivo + "]";
	}

	
	/********************************************************************************************************************/
	
}
