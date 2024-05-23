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

CREATE TABLE IF NOT EXISTS usuarios(
	IdUsuario int NOT NULL AUTO_INCREMENT,
	Nombre VARCHAR(50) NOT NULL,
	Apellido VARCHAR(50) NOT NULL,
    EsAdmin boolean DEFAULT false,
	Email VARCHAR(50) NOT NULL,
	Contrasena VARCHAR(500) NOT NULL,
    Pais VARCHAR(50) NOT NULL,
    Sexo VARCHAR(50) NOT NULL,
    DNI varchar(9),
    Telefono varchar(9),
    EstaActivo boolean DEFAULT true,
	PRIMARY KEY(idUsuario)
);
INSERT INTO usuarios VALUES
                      (1, 'Paula', 'Nunes',1, 'paula@hotmail.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'Brazil', 'mujer','38276789P','638564773',1),
                      (2, 'Camila', 'Ranzani',0, 'camila@hotmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','Italia', 'mujer','78654325L','654278991',1),
                      (3, 'Sonia', 'Aparecida',0, 'sonia@hotmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','Francia', 'mujer','76543289J','657453213',1),
                      (4, 'Selmo', 'Costa',0, 'selmo@hotmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','Portugal','hombre','78643206G','675432987',1),
                      (5, 'Solange', 'Ranzani',0, 'solange@hotmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','Brazil', 'mujer','56432876H','675489345',1),
                      (6, 'Laura', 'Lopez',0, 'laura@hotmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','Espana', 'mujer','67543298B','675435987',1),
                      (7, 'Roberto', 'Silva',0, 'roberto@hotmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','Italia','hombre','43276541R','675456281',1),
                      (8, 'Alvaro', 'Souza',0, 'alvaro@hotmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','Francia','hombre','89765432E','675981223',1),
                      (9, 'Sergio', 'Cruz',0, 'sergio@hotmail.com','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','Espana','hombre','56281946S','675349887',1);
                      
CREATE TABLE IF NOT EXISTS pacientes(
	IdPaciente int NOT NULL AUTO_INCREMENT,
	NumeroChip int NOT NULL ,
	NombreMascota VARCHAR(50) NOT NULL,
    Edad int NOT NULL,
	NombreTutor VARCHAR(50) NOT NULL,
	DNI VARCHAR(9) NOT NULL,
	UbicacionMascota VARCHAR(50) NOT NULL,
    EstaActivo boolean DEFAULT true,
	PRIMARY KEY(IdPaciente)
);
INSERT INTO pacientes VALUES
                      (1,48596, 'Mel', 5, 'Paulinha', '12345678P', 'Calle Galana,54',1),
                      (2,38495, 'Toto', 6, 'Juan','22998811J','Paseo Zorrilla,12',1),
                      (3,39475, 'Mial', 8, 'Carmen','87654321C','Plaza España,34',1),
                      (4,20495, 'Jorge', 1, 'Maria','37261839J','Plaza Madrid,26',1),
                      (5,48379, 'Samuka', 3, 'Juana','78462748S','Av.Zamora,7',1),
                      (6,18493, 'Titi', 4, 'Beatriz','11111882T','Av.Salamanca,8',1),
                      (7,19384, 'Tiko', 2, 'Cris','62734827R','Av.Segovia,12',1);
                     
CREATE TABLE IF NOT EXISTS chat (
    IdChat INT NOT NULL AUTO_INCREMENT,
    IdUsuario INT NOT NULL,
    Descripcion VARCHAR(500) NOT NULL,
    PRIMARY KEY(IdChat),
    FOREIGN KEY (IdUsuario) REFERENCES usuarios(IdUsuario)
);

CREATE TABLE IF NOT EXISTS consultas (
    IdConsulta INT NOT NULL AUTO_INCREMENT,
    IdUsuario INT NOT NULL,
    IdPaciente INT NOT NULL,
    Fecha VARCHAR(10),
    Hora VARCHAR(5),
    Descripcion VARCHAR(500) NOT NULL,
    PRIMARY KEY(IdConsulta),
    FOREIGN KEY (IdUsuario) REFERENCES usuarios(IdUsuario),
    FOREIGN KEY (IdPaciente) REFERENCES pacientes(IdPaciente)
);

INSERT INTO consultas VALUES
(1, 3,5, '2024-05-01', '10:00', 'Consulta vacuna'),
(2, 7,3, '2024-05-02', '11:00', 'Consulta retorno'),
(3, 2,6, '2024-05-03', '12:00', 'Consulta alergia'),
(4, 5,4, '2024-05-04', '13:00', 'Consulta dolor oido'),
(5, 8, 2,'2024-05-05', '14:00', 'Consulta vacuna'),
(6, 8,1, '2024-05-06', '15:00', 'Consulta fiebre'),
(7, 6, 7,'2024-05-07', '16:00', 'Consulta retorno');

CREATE TABLE IF NOT EXISTS inventario (
    IdInventario INT NOT NULL AUTO_INCREMENT,
    NombreMedicamiento VARCHAR(50) NOT NULL,
    Recomendaciones VARCHAR(10) NOT NULL,
    PRIMARY KEY(IdInventario)
);
INSERT INTO inventario VALUES
(1, 'Antiparasitario Plus', 'Oral'),
(2, 'Antibiótico Vet', 'Inyectable'),
(3, 'Antiinflamatorio Pet', 'Tópico'),
(4, 'Calcio Pet', 'Oral'),
(5, 'Multivitamínico Canino', 'Oral'),
(6, 'Suero Rehidratante', 'Inyectable'),
(7, 'Analgesico Vet', 'Oral');
/***********************************************************************************************************/
La memoria esta en el PDF llamado ClinicaPETCARE, el manual del usuario está en la memoria.
El proyecto final es el zip llamado Proyecto_Clinica15
El archivo .sql es la base de datos
/***********************************************************************************************************/
