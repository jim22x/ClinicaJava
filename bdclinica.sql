/*
SQLyog Community v13.2.0 (64 bit)
MySQL - 10.4.28-MariaDB : Database - bdclinica
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bdclinica` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `bdclinica`;

/*Table structure for table `cita` */

DROP TABLE IF EXISTS `cita`;

CREATE TABLE `cita` (
  `Id_cita` int(11) NOT NULL AUTO_INCREMENT,
  `fec_cita` date NOT NULL,
  `Id_doctor` int(11) NOT NULL,
  `Id_paciente` int(11) NOT NULL,
  `estado_cita` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Id_cita`),
  KEY `Id_doctor` (`Id_doctor`),
  KEY `Id_paciente` (`Id_paciente`),
  CONSTRAINT `cita_ibfk_1` FOREIGN KEY (`Id_doctor`) REFERENCES `doctor` (`Id_doctor`),
  CONSTRAINT `cita_ibfk_2` FOREIGN KEY (`Id_paciente`) REFERENCES `paciente` (`Id_paciente`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `cita` */

insert  into `cita`(`Id_cita`,`fec_cita`,`Id_doctor`,`Id_paciente`,`estado_cita`) values 
(1,'2023-11-29',1,2,'PENDIENTE'),
(2,'2023-11-30',1,3,'CONFIRMADA'),
(3,'2023-12-05',2,1,'CONFIRMADA'),
(4,'2023-12-12',3,5,'ESPERA'),
(5,'2023-12-01',2,3,'CONFIRMADA'),
(6,'2022-11-30',1,2,'CONFIRMADA'),
(7,'2022-12-30',2,3,'ESPERA'),
(8,'2023-12-15',1,5,'CONFIRMADA'),
(9,'2023-12-20',1,1,'CONFIRMADA'),
(10,'2023-12-15',3,5,'ESPERA');

/*Table structure for table `concepto` */

DROP TABLE IF EXISTS `concepto`;

CREATE TABLE `concepto` (
  `Id_concepto` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Id_concepto`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `concepto` */

insert  into `concepto`(`Id_concepto`,`descripcion`) values 
(1,'Diabetes tipo 2'),
(2,'Gripe'),
(3,'Desarrollo infantil'),
(4,'Embarazo'),
(5,'Presion arterial');

/*Table structure for table `detalle` */

DROP TABLE IF EXISTS `detalle`;

CREATE TABLE `detalle` (
  `Id_detalle` int(11) NOT NULL AUTO_INCREMENT,
  `Id_cita` int(11) NOT NULL,
  `Id_concepto` int(11) NOT NULL,
  `costo` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Id_detalle`),
  KEY `Id_cita` (`Id_cita`),
  KEY `Id_concepto` (`Id_concepto`),
  CONSTRAINT `detalle_ibfk_1` FOREIGN KEY (`Id_cita`) REFERENCES `cita` (`Id_cita`),
  CONSTRAINT `detalle_ibfk_2` FOREIGN KEY (`Id_concepto`) REFERENCES `concepto` (`Id_concepto`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `detalle` */

insert  into `detalle`(`Id_detalle`,`Id_cita`,`Id_concepto`,`costo`) values 
(1,1,3,'50'),
(2,2,3,'80'),
(3,3,1,'40'),
(4,4,4,'100');

/*Table structure for table `doctor` */

DROP TABLE IF EXISTS `doctor`;

CREATE TABLE `doctor` (
  `Id_doctor` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_doctor` varchar(20) DEFAULT NULL,
  `Id_especialidad` int(11) NOT NULL,
  PRIMARY KEY (`Id_doctor`),
  KEY `Id_especialidad` (`Id_especialidad`),
  CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`Id_especialidad`) REFERENCES `especialidad` (`Id_especialidad`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `doctor` */

insert  into `doctor`(`Id_doctor`,`nombre_doctor`,`Id_especialidad`) values 
(1,'Luis',2),
(2,'Pedro',1),
(3,'Juana',3),
(4,'Lucho',4),
(5,'Lucas',1),
(6,'ASDASD',4);

/*Table structure for table `especialidad` */

DROP TABLE IF EXISTS `especialidad`;

CREATE TABLE `especialidad` (
  `Id_especialidad` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_especialidad` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Id_especialidad`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `especialidad` */

insert  into `especialidad`(`Id_especialidad`,`nombre_especialidad`) values 
(1,'Medicina general'),
(2,'Pediatria'),
(3,'Ginecologia'),
(4,'Cardiologia');

/*Table structure for table `paciente` */

DROP TABLE IF EXISTS `paciente`;

CREATE TABLE `paciente` (
  `Id_paciente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_paciente` varchar(20) DEFAULT NULL,
  `apellidos` varchar(30) DEFAULT NULL,
  `edad` int(11) NOT NULL,
  `dni` int(11) NOT NULL,
  `sexo` char(1) DEFAULT NULL,
  PRIMARY KEY (`Id_paciente`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `paciente` */

insert  into `paciente`(`Id_paciente`,`nombre_paciente`,`apellidos`,`edad`,`dni`,`sexo`) values 
(1,'Adrian','Abril Gutierrez',25,45678912,'M'),
(2,'Maria','Azuay Mercedes',40,45632148,'F'),
(3,'Juan','Cevallos Trujillo',50,45618954,'M'),
(4,'Luis','Gonzales Lopez',31,45687512,'M'),
(5,'Laura','Munera Gomez',19,41564857,'F'),
(6,'LIJLIJILJLI',',JHBJJBJ',22,12534534,'F'),
(7,'asdasda','dsfsdfsdfsdf',21,546466545,'F');

/*Table structure for table `tipo_usuario` */

DROP TABLE IF EXISTS `tipo_usuario`;

CREATE TABLE `tipo_usuario` (
  `Id_tipo` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_descripcion` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tipo_usuario` */

insert  into `tipo_usuario`(`Id_tipo`,`tipo_descripcion`) values 
(1,'administrador'),
(2,'secretaria');

/*Table structure for table `usuario` */

DROP TABLE IF EXISTS `usuario`;

CREATE TABLE `usuario` (
  `Id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_usuario` varchar(50) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `Id_tipo` int(11) NOT NULL,
  PRIMARY KEY (`Id_usuario`),
  KEY `Id_tipo` (`Id_tipo`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`Id_tipo`) REFERENCES `tipo_usuario` (`Id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `usuario` */

insert  into `usuario`(`Id_usuario`,`nombre_usuario`,`contrasena`,`Id_tipo`) values 
(1,'Jim','123',1),
(2,'Maria','1234',2),
(3,'Jhimmy','321',1),
(4,'Luz','asd',2),
(5,'huashdu','akdjmmm',2),
(6,'Andrea','lkjdfd',2),
(7,'ojiaosdjia','092348i29',2),
(8,'Lisa','huokj',2),
(9,'Marge','huoijhads',2),
(10,'jioasdoi','njlkjksdf',1),
(11,'asdasd','tertert',2);

/* Procedure structure for procedure `USPAddCita` */

/*!50003 DROP PROCEDURE IF EXISTS  `USPAddCita` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `USPAddCita`(
	IN id INT(11),
    IN fec DATE,
    IN doc INT(11),
    IN pac INT(11),
    IN esta VARCHAR(20)
)
INSERT INTO cita VALUES(id,fec,doc,pac,esta) */$$
DELIMITER ;

/* Procedure structure for procedure `USPAgregarDoctor` */

/*!50003 DROP PROCEDURE IF EXISTS  `USPAgregarDoctor` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `USPAgregarDoctor`(
	IN id INT(11), 
	IN nom VARCHAR(20),
	IN especialidad INT(11)	
)
INSERT INTO doctor VALUES(id,nom,especialidad) */$$
DELIMITER ;

/* Procedure structure for procedure `USPAgregarPaciente` */

/*!50003 DROP PROCEDURE IF EXISTS  `USPAgregarPaciente` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `USPAgregarPaciente`(
	IN id INT(11), 
	IN nom VARCHAR(20),
	IN apellidos VARCHAR(30),
	IN edad INT(11),
	IN dni INT(11),
	IN sex CHAR(1)
)
INSERT INTO paciente VALUES(id,nom,apellidos,edad,dni,sex) */$$
DELIMITER ;

/* Procedure structure for procedure `USPBuscarCita` */

/*!50003 DROP PROCEDURE IF EXISTS  `USPBuscarCita` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `USPBuscarCita`(IN id INT(11))
SELECT * FROM cita WHERE Id_paciente LIKE CONCAT(id,'%') */$$
DELIMITER ;

/* Procedure structure for procedure `USPBuscarDoctor` */

/*!50003 DROP PROCEDURE IF EXISTS  `USPBuscarDoctor` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `USPBuscarDoctor`(IN nom VARCHAR(20))
SELECT * FROM doctor WHERE nombre_doctor LIKE CONCAT(nom,'%') */$$
DELIMITER ;

/* Procedure structure for procedure `USPBuscarPaciente` */

/*!50003 DROP PROCEDURE IF EXISTS  `USPBuscarPaciente` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `USPBuscarPaciente`(IN nom VARCHAR(20))
SELECT * FROM paciente WHERE nombre_paciente LIKE CONCAT(nom,'%') */$$
DELIMITER ;

/* Procedure structure for procedure `USPBuscarPorNombre` */

/*!50003 DROP PROCEDURE IF EXISTS  `USPBuscarPorNombre` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `USPBuscarPorNombre`(IN nom VARCHAR(50))
SELECT * FROM usuario WHERE nombre_usuario LIKE CONCAT(nom,'%') */$$
DELIMITER ;

/* Procedure structure for procedure `USPDoctorxEspecialidad` */

/*!50003 DROP PROCEDURE IF EXISTS  `USPDoctorxEspecialidad` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `USPDoctorxEspecialidad`(IN especialidad VARCHAR(20))
SELECT d.nombre_doctor
FROM doctor d 
JOIN especialidad e ON d.Id_especialidad = e.Id_especialidad
WHERE nombre_especialidad = especialidad */$$
DELIMITER ;

/* Procedure structure for procedure `USPEditarCita` */

/*!50003 DROP PROCEDURE IF EXISTS  `USPEditarCita` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `USPEditarCita`(
    IN id INT(11),
    IN fec DATE,
    IN doc INT(11),
    IN pac INT(11),
    IN esta VARCHAR(20)
)
UPDATE cita
    SET 
        fec_cita = fec,
        Id_doctor = doc,
        Id_paciente = pac,
        estado_cita = esta
    WHERE Id_cita = id */$$
DELIMITER ;

/* Procedure structure for procedure `USPEditarDoctor` */

/*!50003 DROP PROCEDURE IF EXISTS  `USPEditarDoctor` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `USPEditarDoctor`(
    IN id INT(11),
    IN nom VARCHAR(20),
    IN espec INT(11)
)
UPDATE doctor
    SET 
        nombre_doctor = nom,
        Id_especialidad = espec
    WHERE Id_doctor = id */$$
DELIMITER ;

/* Procedure structure for procedure `USPEditarPaciente` */

/*!50003 DROP PROCEDURE IF EXISTS  `USPEditarPaciente` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `USPEditarPaciente`(
    IN id INT(11),
    IN nom VARCHAR(20),
    IN ape VARCHAR(30),
    IN ed INT(11),
    IN d INT(11),
    IN sex CHAR(1)
)
UPDATE paciente
    SET 
        nombre_paciente = nom,
        apellidos = ape,
        edad = ed,
        dni = d,
        sexo = sex
    WHERE Id_paciente = id */$$
DELIMITER ;

/* Procedure structure for procedure `USPEditarUsuario` */

/*!50003 DROP PROCEDURE IF EXISTS  `USPEditarUsuario` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `USPEditarUsuario`(
    IN id INT(11),
    IN nom VARCHAR(50),
    IN con VARCHAR(255),
    IN tipo INT(11)
)
UPDATE usuario
    SET 
        nombre_usuario = nom,
        contrasena = con,
        Id_tipo = tipo
    WHERE Id_usuario = id */$$
DELIMITER ;

/* Procedure structure for procedure `USPEliminarCita` */

/*!50003 DROP PROCEDURE IF EXISTS  `USPEliminarCita` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `USPEliminarCita`(IN id INT(11))
DELETE FROM cita WHERE Id_cita = id */$$
DELIMITER ;

/* Procedure structure for procedure `USPEliminarDoctor` */

/*!50003 DROP PROCEDURE IF EXISTS  `USPEliminarDoctor` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `USPEliminarDoctor`(IN id INT(11))
DELETE FROM doctor WHERE Id_doctor = id */$$
DELIMITER ;

/* Procedure structure for procedure `USPEliminarPaciente` */

/*!50003 DROP PROCEDURE IF EXISTS  `USPEliminarPaciente` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `USPEliminarPaciente`(IN id INT(11))
DELETE FROM paciente WHERE Id_paciente = id */$$
DELIMITER ;

/* Procedure structure for procedure `USPEliminarUsuario` */

/*!50003 DROP PROCEDURE IF EXISTS  `USPEliminarUsuario` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `USPEliminarUsuario`(IN id INT(11))
DELETE FROM usuario WHERE Id_usuario = id */$$
DELIMITER ;

/* Procedure structure for procedure `USPInsertarUsuario` */

/*!50003 DROP PROCEDURE IF EXISTS  `USPInsertarUsuario` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `USPInsertarUsuario`(
	IN Id_us INT(11), 
	IN nombre_us VARCHAR(50),
	IN contra VARCHAR(255),
	IN Id_tip INT(11)	
)
INSERT INTO USUARIO VALUES(Id_us, nombre_us, contra, Id_tip) */$$
DELIMITER ;

/* Procedure structure for procedure `USPListarCitas` */

/*!50003 DROP PROCEDURE IF EXISTS  `USPListarCitas` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `USPListarCitas`()
SELECT c.Id_cita, c.fec_cita, d.nombre_doctor, p.nombre_paciente, c.estado_cita, e.nombre_especialidad
    FROM cita c
    JOIN doctor d ON c.Id_doctor = d.Id_doctor
    JOIN paciente p ON c.Id_paciente = p.Id_paciente
    JOIN especialidad e ON d.Id_especialidad = e.Id_especialidad */$$
DELIMITER ;

/* Procedure structure for procedure `USPListarConceptos` */

/*!50003 DROP PROCEDURE IF EXISTS  `USPListarConceptos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `USPListarConceptos`()
SELECT descripcion FROM concepto */$$
DELIMITER ;

/* Procedure structure for procedure `USPListarCostos` */

/*!50003 DROP PROCEDURE IF EXISTS  `USPListarCostos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `USPListarCostos`()
SELECT d.Id_detalle, d.costo, d.Id_cita, c.descripcion
FROM detalle d
JOIN concepto c ON d.Id_concepto = c.Id_concepto */$$
DELIMITER ;

/* Procedure structure for procedure `USPListarDoctores` */

/*!50003 DROP PROCEDURE IF EXISTS  `USPListarDoctores` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `USPListarDoctores`()
SELECT d.Id_doctor, d.nombre_doctor, e.nombre_especialidad
FROM doctor d
JOIN especialidad e ON d.Id_especialidad = e.Id_especialidad */$$
DELIMITER ;

/* Procedure structure for procedure `USPListarPacientes` */

/*!50003 DROP PROCEDURE IF EXISTS  `USPListarPacientes` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `USPListarPacientes`()
SELECT * FROM paciente */$$
DELIMITER ;

/* Procedure structure for procedure `USPListarUsuarios` */

/*!50003 DROP PROCEDURE IF EXISTS  `USPListarUsuarios` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `USPListarUsuarios`()
SELECT u.Id_usuario, u.nombre_usuario, u.contrasena, t.tipo_descripcion
FROM usuario u
JOIN tipo_usuario t ON u.Id_tipo = t.Id_tipo */$$
DELIMITER ;

/* Procedure structure for procedure `USPValidar` */

/*!50003 DROP PROCEDURE IF EXISTS  `USPValidar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `USPValidar`(

    IN nombre VARCHAR(50), 
    IN con VARCHAR(255),
    IN Id INT(11) 
)
SELECT *
    FROM usuario 
    WHERE nombre_usuario = nombre 
        AND contrasena = con
        AND Id_tipo = id */$$
DELIMITER ;

/* Procedure structure for procedure `USPValidarUsuario` */

/*!50003 DROP PROCEDURE IF EXISTS  `USPValidarUsuario` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `USPValidarUsuario`(IN nombre VARCHAR(50), IN con VARCHAR(255))
SELECT*FROM usuario WHERE nombre_usuario = nombre AND contrasena = con */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
