CREATE SCHEMA IF NOT EXISTS `examen090193269` DEFAULT CHARACTER SET utf8;
USE `examen090193269`;

CREATE TABLE IF NOT EXISTS `Usuarios` (
  `idUsuarios` INT NOT NULL AUTO_INCREMENT,
  `Usuario` VARCHAR(45) NULL,
  `Password` VARCHAR(45) NULL,
  estado tinyint default 1,
  PRIMARY KEY (`idUsuarios`)
  )
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Privilegios` (
  `idPrivilegios` INT NOT NULL AUTO_INCREMENT,
  `descPrivilegio` VARCHAR(45) NULL,
  PRIMARY KEY (`idPrivilegios`)
  )
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `usuarioPrivilegios` (
  `idusuarioPrivilegios` INT NOT NULL AUTO_INCREMENT,
  `fkUsuario` INT NOT NULL,
  `fkPrivilegio` INT NOT NULL,
  PRIMARY KEY (`idusuarioPrivilegios`)
)ENGINE = InnoDB;
  
ALTER TABLE `usuarioPrivilegios`
  ADD CONSTRAINT `fk_UserP` FOREIGN KEY (`fkUsuario`) 
  REFERENCES `Usuarios` (`idUsuarios`);
  
ALTER TABLE `usuarioPrivilegios`
  ADD CONSTRAINT `fk_PrivP` FOREIGN KEY (`fkPrivilegio`) 
  REFERENCES `Privilegios` (`idPrivilegios`);
  
CREATE TABLE IF NOT EXISTS `Peliculas` (
  `idPeliculas` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL,
  `Clasificación` VARCHAR(45) NULL,
  `Genero` VARCHAR(45) NULL,
  `Subtitulado` VARCHAR(45) NULL,
  `Idioma` VARCHAR(45) NULL,
  `precio` DOUBLE NULL,
  PRIMARY KEY (`idPeliculas`)
  )
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Empeleado` (
  `idempleado` INT NOT NULL AUTO_INCREMENT,
  `idsala` VARCHAR(45) NULL,
  `duracion` VARCHAR(45) NULL,
  PRIMARY KEY (`idCines`)

CREATE TABLE IF NOT EXISTS `Cines` (
  `idCines` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL,
  `Dirección` VARCHAR(45) NULL,
  PRIMARY KEY (`idCines`)
)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Salas` (
  `idSalas` INT NOT NULL AUTO_INCREMENT,
  `fkCine` INT NOT NULL,
  `Descripción` VARCHAR(100) NULL,
  `formatoPeli` VARCHAR(45) NULL,
  `puntos` INT NULL,
  `precioSala` DOUBLE NULL,
  PRIMARY KEY (`idSalas`)
  )
ENGINE = InnoDB;
  
ALTER TABLE `Salas`
  ADD CONSTRAINT `fk_cinS` FOREIGN KEY (`fkCine`) 
  REFERENCES `Cines` (`idCines`);
  
CREATE TABLE IF NOT EXISTS `horarioCine` (
  `idhorarioCine` INT NOT NULL AUTO_INCREMENT,
  `fkPelicula` INT NULL,
  `fkSala` INT NOT NULL,
  `fechaHorario` TIMESTAMP NULL,
  PRIMARY KEY (`idhorarioCine`)
)
ENGINE = InnoDB;

ALTER TABLE `horarioCine`
  ADD CONSTRAINT `fkhcinP` FOREIGN KEY (`fkPelicula`) 
  REFERENCES `Peliculas` (`idPeliculas`);
ALTER TABLE `horarioCine`
  ADD CONSTRAINT `fkhcinSa` FOREIGN KEY (`fkSala`) 
  REFERENCES `Salas` (`idSalas`);

CREATE TABLE IF NOT EXISTS `Derechos` (
  `idDerechos` INT NOT NULL AUTO_INCREMENT,
  `fkPelicula` INT NOT NULL,
  `estadoDerechos` TINYINT NULL,
  PRIMARY KEY (`idDerechos`)
  )
ENGINE = InnoDB;


ALTER TABLE `Derechos`
  ADD CONSTRAINT `fkpder` FOREIGN KEY (`fkPelicula`) 
  REFERENCES `Peliculas` (`idPeliculas`);

CREATE TABLE IF NOT EXISTS `Clientes` (
  `idClientes` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL,
  `Nit` VARCHAR(45) NULL,
  PRIMARY KEY (`idClientes`))
ENGINE = InnoDB;

  `idAsientos` INT NOT NULL AUTO_INCREMENT,
  `fkSala` INT NOT NULL,
  `Fila` INT NULL,
  `Columna` VARCHAR(45) NULL,
  PRIMARY KEY (`idAsientos`)
  )
ENGINE = InnoDB;

ALTER TABLE `Asientos`
  ADD CONSTRAINT `fkasieS` FOREIGN KEY (`fkSala`) 
  REFERENCES `Salas` (`idSalas`);

CREATE TABLE IF NOT EXISTS `Factura` (
  `idFactura` INT NOT NULL AUTO_INCREMENT,
  `fkCliente` INT NULL,
  `metodoPago` VARCHAR(45) NULL,
  `subTotal` DOUBLE NULL,
  `impuesto` DOUBLE NULL,
  PRIMARY KEY (`idFactura`)
)
ENGINE = InnoDB;

ALTER TABLE `Factura`
  ADD CONSTRAINT `fkfacCl` FOREIGN KEY (`fkCliente`) 
  REFERENCES `Clientes` (`idClientes`);

CREATE TABLE IF NOT EXISTS `Reservaciones` (
  `idReservaciones` INT NOT NULL AUTO_INCREMENT,
  `fkAsientos` INT NOT NULL,
  `subTotalAsiento` DOUBLE NULL,
  `fkFactura` INT NULL,
  PRIMARY KEY (`idReservaciones`)
  )
ENGINE = InnoDB;
  
ALTER TABLE `Reservaciones`
  ADD CONSTRAINT `fkresas` FOREIGN KEY (`fkAsientos`) 
  REFERENCES `Asientos` (`idAsientos`);
  
ALTER TABLE `Reservaciones`
  ADD CONSTRAINT `fkresfac` FOREIGN KEY (`fkFactura`) 
  REFERENCES `Factura` (`idFactura`);
  
CREATE TABLE IF NOT EXISTS `registroPuntos` (
  `idregistroPuntos` INT NOT NULL AUTO_INCREMENT,
  `fkCliente` INT NOT NULL,
  `puntosAcum` INT NULL,
  `puntosUsados` INT NULL,
  PRIMARY KEY (`idregistroPuntos`)
  )
ENGINE = InnoDB;
  
  
ALTER TABLE `registroPuntos`
  ADD CONSTRAINT `fkregCl` FOREIGN KEY (`fkCliente`) 
  REFERENCES `Clientes` (`idClientes`);  
