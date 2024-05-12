package com.example.demo.Interface;

import java.util.Map;

public class PacientePOJO {

	private int idPaciente;
	private int numeroChip;
	private String nombreMascota;
	private int edad;
	private String nombreTutor;
	private String DNItutor;
	private String ubicacionMascota;
	private boolean estaActivo;
	
/****************************************************************************************************/
	public PacientePOJO() {
	}
	
/****************************************************************************************************/
	public PacientePOJO(int numeroChip,String nombreMascota, int edad, String nombreTutor, String dNItutor, String ubicacionMascota,Boolean estaActivo) {
		this.numeroChip = numeroChip;
		this.nombreMascota = nombreMascota;
		this.edad = edad;
		this.nombreTutor = nombreTutor;
		this.DNItutor = dNItutor;
		this.ubicacionMascota = ubicacionMascota;
		this.estaActivo = estaActivo;
	}
	
/****************************************************************************************************/
	public PacientePOJO(int idPaciente,int numeroChip,String nombreMascota, int edad, String nombreTutor, String dNItutor, String ubicacionMascota,Boolean estaActivo) {
		this.idPaciente = idPaciente;
		this.numeroChip = numeroChip;
		this.nombreMascota = nombreMascota;
		this.edad = edad;
		this.nombreTutor = nombreTutor;
		this.DNItutor = dNItutor;
		this.ubicacionMascota = ubicacionMascota;
		this.estaActivo = estaActivo;
	}
	/********************************************************************************************************************/
	
	public PacientePOJO(Map<String,Object>aux) throws Exception{
		this.numeroChip=(Integer) aux.get("NumeroChip");
		this.nombreMascota=(String) aux.get("NombreMascota");
		this.edad=(Integer) aux.get("Edad");
		this.nombreTutor=(String) aux.get("NombreTutor");
		this.DNItutor=(String) aux.get("DNITutor");
		this.ubicacionMascota=(String) aux.get("UbicacionMascota");
        this.estaActivo = (Boolean) aux.get("EstaActivo") != null ? (Boolean) aux.get("EstaActivo") : true;
	}
/****************************************************************************************************/
	public int getIdPaciente() {
		return idPaciente;
	}

	public void setIdPaciente(int idPaciente) {
		this.idPaciente = idPaciente;
	}

	public int getNumeroChip() {
		return numeroChip;
	}

	public void setNumeroChip(int numeroChip) {
		this.numeroChip = numeroChip;
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

	public boolean isEstaActivo() {
		return estaActivo;
	}

	public void setEstaActivo(boolean estaActivo) {
		this.estaActivo = estaActivo;
	}

/****************************************************************************************************/
	@Override
	public String toString() {
		return "PacientePOJO [idPaciente=" + idPaciente + ", numeroChip=" + numeroChip + ", nombreMascota="
				+ nombreMascota + ", edad=" + edad + ", nombreTutor=" + nombreTutor + ", DNItutor=" + DNItutor
				+ ", ubicacionMascota=" + ubicacionMascota + ", estaActivo=" + estaActivo + "]";
	}

/****************************************************************************************************/
}
