# PetCare
La propuesta para el proyecto es una página web interna para los funcionarios de una clínica veterinaria, donde los usuarios pueden buscar, añadir, eliminar y modificar datos de los animales y sus tutores, también un inventario de medicamentos y productos de la clínica.
Al principio, ya tenemos el logotipo de la clínica y un anteproyecto.

******************************************************************
Hierramientas utilizadas:
- Java
- Spring Tool Suite 4
- JSP
- Mysql
- Javascript
-Bootstrap
*****************************************************************
Dependencias importantes del proyecto: en el archivo pom.xml
Configuracion : archivo application.properties

*****************************************************************
Añadir imagenes y CSS y video:
- en la ruta: src/main/resources/static

*****************************************************************
OJO:
La evolucion del proyecto, estará separado por carpeta distintas, por ejemplo:
1º carpeta-->ProyectoClinica    primeros archivos
2º carpeta-->ProyectoClinica2   primera evolucion del proyecto
3º carpeta-->ProyectoClinica3   segunda evolucion del proyecto
*****************************************************************
Puse en la carpeta test, unas pruebas unitarias
Para ejecutar:
- por ejemplo,UsuarioControlerTest:
  - boton derecho en la clase, pulsar la opcion(Debug as), despues pulsar JUnit Test
*****************************************************************
En la vista usuario.jsp donde hago el registro(insertar) un nuevo usuario estoy controlando que:
- los campos no puedan estar vacios
- el campo Usaurio es un correo(que sera usado para entrar en la aplicacion), debe tener como mucho 22 caracteres, tener solo letras y numeros, y es obligatorio terminar en @hotmail.com
- la contrasena debe tener como mucho 10 caracteres, poruqe estoy codificando para poner en la base de datos.
*****************************************************************
La base de datos:
DROP DATABASE IF EXISTS ClinicaPetCare;
CREATE DATABASE IF NOT EXISTS ClinicaPetCare;
USE ClinicaPetCare;

CREATE TABLE usuarios(
	IdUsuario int NOT NULL AUTO_INCREMENT,
	Nombre VARCHAR(50) NOT NULL,
	Apellido VARCHAR(50) NOT NULL,
	Email VARCHAR(50) NOT NULL,
	Contrasena VARCHAR(500) NOT NULL,
    Pais VARCHAR(50) NOT NULL,
    Sexo VARCHAR(50) NOT NULL,
	PRIMARY KEY(idUsuario)
);

CREATE TABLE pacientes(
	IdPaciente int NOT NULL AUTO_INCREMENT,
	NombreMascota VARCHAR(50) NOT NULL,
    Raza VARCHAR(50) NOT NULL,
    Edad int NOT NULL,
    Sexo VARCHAR(50) NOT NULL,
	NombreTutor VARCHAR(50) NOT NULL,
	DNITutor VARCHAR(9) NOT NULL,
	UbicacionMascota VARCHAR(50) NOT NULL,
	PRIMARY KEY(IdPaciente)
);
*****************************************************************
