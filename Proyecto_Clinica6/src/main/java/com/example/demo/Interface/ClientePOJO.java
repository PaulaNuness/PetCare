package com.example.demo.Interface;

import java.util.Map;

public class ClientePOJO {

	private int idPaciente;
	private String nombreMascota;
	private int edad;
	private String nombreTutor;
	private String DNItutor;
	private String ubicacionMascota;
	
/****************************************************************************************************/
	public ClientePOJO() {
	}
	
/****************************************************************************************************/
	public ClientePOJO(String nombreMascota, int edad, String nombreTutor, String dNItutor, String ubicacionMascota) {
		this.nombreMascota = nombreMascota;
		this.edad = edad;
		this.nombreTutor = nombreTutor;
		this.DNItutor = dNItutor;
		this.ubicacionMascota = ubicacionMascota;
	}
	
/****************************************************************************************************/
	
	public ClientePOJO(Map<String,Object>aux) throws Exception{
		this.idPaciente=(Integer) aux.get("IdPaciente");
		this.nombreMascota=(String) aux.get("NombreMascota");
		this.edad=(Integer) aux.get("Edad");
		this.nombreTutor=(String) aux.get("NombreTutor");
		this.DNItutor=(String) aux.get("DNITutor");
		this.ubicacionMascota=(String) aux.get("UbicacionMascota");
	}
/****************************************************************************************************/
	public int getIdPaciente() {
		return idPaciente;
	}

	public void setIdPaciente(int idPaciente) {
		this.idPaciente = idPaciente;
	}

	public String getNombreMascota() {
		return nombreMascota;
	}

	public void setNombreMascota(String nombreMascota) {
		this.nombreMascota = nombreMascota;
	}

	public int getEdad() {
		return edad;
	}

	public void setEdad(int edad) {
		this.edad = edad;
	}

	public String getNombreTutor() {
		return nombreTutor;
	}

	public void setNombreTutor(String nombreTutor) {
		this.nombreTutor = nombreTutor;
	}

	public String getDNItutor() {
		return DNItutor;
	}

	public void setDNItutor(String dNItutor) {
		DNItutor = dNItutor;
	}

	public String getUbicacionMascota() {
		return ubicacionMascota;
	}

	public void setUbicacionMascota(String ubicacionMascota) {
		this.ubicacionMascota = ubicacionMascota;
	}
/****************************************************************************************************/
	@Override
	public String toString() {
		return "ClientePOJO [idPaciente=" + idPaciente + ", nombreMascota=" + nombreMascota + ", edad=" + edad
				+ ", nombreTutor=" + nombreTutor + ", DNItutor=" + DNItutor + ", ubicacionMascota=" + ubicacionMascota
				+ "]";
	}
/****************************************************************************************************/
}
