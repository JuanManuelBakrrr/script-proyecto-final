CREATE SCHEMA universidad;

use universidad;


CREATE TABLE `carreras` (
  `id_carreras` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id_carreras`)
  );


CREATE TABLE `ubicacion` (
  `id_ubicacion` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id_ubicacion`)
  );


CREATE TABLE `facultad` (
  `id_facultad` int NOT NULL AUTO_INCREMENT,
  `id_ubicacion` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`id_facultad`)
  );
  ALTER TABLE facultad ADD CONSTRAINT FOREIGN KEY
  (id_ubicacion) references ubicacion (id_ubicacion);

CREATE TABLE `profesores` (
  `id_profesores` int NOT NULL,
  `id_facultad` int NOT NULL,
  `id_materia` int NOT NULL,
  `id_comision` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `titulo` varchar(45) NOT NULL,
  PRIMARY KEY (`id_profesores`)
  );
   ALTER TABLE profesores ADD CONSTRAINT FOREIGN KEY
   (id_facultad) references facultad (id_facultad),
   ADD CONSTRAINT FOREIGN KEY
   (id_materia) references materia (id_materia),
   ADD CONSTRAINT FOREIGN KEY
   (id_comision) references comision (id_comision);

CREATE TABLE `materia` (
  `id_materia` int NOT NULL,
  `id_profesor` int NOT NULL,
  `id_comision` int NOT NULL,
  `id_estudiante` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id_materia`)
  );
  ALTER TABLE materia ADD CONSTRAINT FOREIGN KEY 
  ( id_profesor ) references profesores (id_profesores),
  ADD CONSTRAINT FOREIGN KEY
  (id_comision) references comision (id_comision),
  ADD CONSTRAINT FOREIGN KEY
  (id_estudiante) references estudiante (id_estudiante);
  
  


CREATE TABLE `estudiante` (
  `id_estudiante` int NOT NULL AUTO_INCREMENT,
  `id_comision` int NOT NULL,
  `id_materia` int NOT NULL,
  `id_facultad` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `dni` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`id_estudiante`)
  );
  
  ALTER TABLE estudiante ADD CONSTRAINT FOREIGN KEY
  (id_comision) references comision (id_comision),
  ADD CONSTRAINT FOREIGN KEY 
  (id_materia) references materia (id_materia),
  ADD CONSTRAINT FOREIGN KEY 
  (id_facultad) references facultad (id_facultad);
  
  


CREATE TABLE `comision` (
  `id_comision` int NOT NULL,
  `id_profesor` int NOT NULL,
  `id_materia` int NOT NULL,
  `id_estudiante` int NOT NULL,
  `numero` int NOT NULL,
  PRIMARY KEY (`id_comision`)
  );
  ALTER TABLE comision ADD CONSTRAINT FOREIGN KEY
  (id_profesor) references profesores (id_profesores),
  ADD CONSTRAINT FOREIGN KEY
  (id_materia) references materia (id_materia),
  ADD CONSTRAINT FOREIGN KEY 
  (id_estudiante) references estudiante (id_estudiante);
  
CREATE TABLE `inscripcion` (
  `id_inscripcion` int NOT NULL AUTO_INCREMENT,
  `id_comision` int NOT NULL,
  `id_estudiante` int NOT NULL,
  `id_carrera` int NOT NULL,
  `fecha` date NOT NULL,
  `periodo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_inscripcion`)
  );
  
  ALTER TABLE inscripcion ADD CONSTRAINT FOREIGN KEY
  (id_comision) references comision (id_comision),
  ADD CONSTRAINT FOREIGN KEY 
  (id_estudiante) references estudiante (id_estudiante),
  ADD CONSTRAINT FOREIGN KEY 
  (id_carrera) references carreras (id_carreras);
  









