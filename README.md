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
INSERT INTO usuarios VALUES
                      (1, 'Paula', 'Nunes', 'paula@hotmail.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'Brazil', 'mujer'),
                      (2, 'Camila', 'Ranzani', 'camila@hotmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','Italia', 'mujer'),
                      (3, 'Sonia', 'Aparecida', 'sonia@hotmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','Francia', 'mujer'),
                      (4, 'Selmo', 'Costa', 'selmo@hotmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','Portugal','hombre'),
                      (5, 'Solange', 'Ranzani', 'solange@hotmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','Brazil', 'mujer'),
                      (6, 'Laura', 'Lopez', 'laura@hotmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','Espana', 'mujer'),
                      (7, 'Roberto', 'Silva', 'roberto@hotmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','Italia','hombre'),
                      (8, 'Alvaro', 'Souza', 'alvaro@hotmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','Francia','hombre'),
                      (9, 'Sergio', 'Cruz', 'sergio@hotmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','Espana','hombre');
                      
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
