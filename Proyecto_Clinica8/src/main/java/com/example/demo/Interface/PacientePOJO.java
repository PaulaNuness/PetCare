package com.example.demo.Interface;

import java.util.Map;

public class PacientePOJO {

	private int idChip;
	private String nombreMascota;
	private int edad;
	private String nombreTutor;
	private String DNItutor;
	private String ubicacionMascota;
	
/****************************************************************************************************/
	public PacientePOJO() {
	}
	
/****************************************************************************************************/
	public PacientePOJO(int idChip,String nombreMascota, int edad, String nombreTutor, String dNItutor, String ubicacionMascota) {
		this.idChip = idChip;
		this.nombreMascota = nombreMascota;
		this.edad = edad;
		this.nombreTutor = nombreTutor;
		this.DNItutor = dNItutor;
		this.ubicacionMascota = ubicacionMascota;
	}
	
/****************************************************************************************************/
	
	public PacientePOJO(Map<String,Object>aux) throws Exception{
		this.idChip=(Integer) aux.get("IdChip");
		this.nombreMascota=(String) aux.get("NombreMascota");
		this.edad=(Integer) aux.get("Edad");
		this.nombreTutor=(String) aux.get("NombreTutor");
		this.DNItutor=(String) aux.get("DNITutor");
		this.ubicacionMascota=(String) aux.get("UbicacionMascota");
	}
/****************************************************************************************************/
	public int getIdChip() {
		return idChip;
	}

	public void setIdChip(int idChip) {
		this.idChip = idChip;
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
		return "PacientePOJO [idChip=" + idChip + ", nombreMascota=" + nombreMascota + ", edad=" + edad
				+ ", nombreTutor=" + nombreTutor + ", DNItutor=" + DNItutor + ", ubicacionMascota=" + ubicacionMascota
				+ "]";
	}

/****************************************************************************************************/
}
