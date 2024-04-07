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

*****************************************************************
Dependencias importantes del proyecto:
- Spring Web
- Spring Boot Dev Tools
- Mysql Driver
- Spring Data JPA
- añadir la dependencia JSP en el pom : <dependency>
                                          <groupId>org.apache.tomcat.embed</groupId>
                                          <artifactId>tomcat-embed-jasper</artifactId>
                                          <scope>provided</scope>
                                        </dependency>
 -tenemos que crear una ruta de carpetas donde vamos poner los archivos .jsp
      * src/main/webapp/WEB-INF/views
      * ahora el application.properties añadimos: spring.mvc.view.prefix= /WEB-INF/views/
                                                  spring.mvc.view.suffix= .jsp
  
*****************************************************************
Añadir imagenes y CSS:
- crear la ruta: static/css 
- las imagenes y el archivo .css estara ahi
- dentro del archivo .jsp añadimos una etiqueta para aplicar el estilo css
# <link href="/css/style.css" rel="stylesheet" type="text/css"/>
- tambien añadimos una etiqueta para imagen
# <img src="logo_verde.png" width="30%"/>

*****************************************************************
