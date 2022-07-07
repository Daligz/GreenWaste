CREATE
DATABASE recolector;

USE
recolector;

CREATE TABLE rol
(
    idRol int(4) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    rol   enum('usuario', 'admin')
);

CREATE TABLE usuario
(
    idUsuario       int(4) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombre          varchar(45),
    apellidoPaterno varchar(50),
    apellidoMaterno varchar(50),
    telefono        varchar(10),
    correo          varchar(50),
    psw             varchar(50),
    idRol           int (4),
    FOREIGN KEY (idRol) REFERENCES rol (idRol)
);


CREATE TABLE material
(
    idMaterial int(4) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombre     varchar(50),
    costo      float(6, 2)
);

CREATE TABLE direccion
(
    idDireccion int(4) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    colonia     varchar(50),
    calle       varchar(50),
    numero      varchar(50),
    municipio   varchar(50),
    estado      varchar(50),
    latitud     varchar(250),
    longitud    varchar(250),
    idUsuario   int(4),
    FOREIGN KEY (idUsuario) REFERENCES usuario (idUsuario)
);

CREATE TABLE contenedor
(
    idContenedor int(4) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    idMaterial   int(4),
    idDireccion  int(4),
    estado       enum('lleno','vacio'),
    FOREIGN KEY (idMaterial) REFERENCES material (idMaterial),
    FOREIGN KEY (idDireccion) REFERENCES direccion (idDireccion)
);

CREATE TABLE recoleccion
(
    idRecoleccion    int(4) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    idContenedor     int(4),
    fechaRecoleccion DATE,
    FOREIGN KEY (idContenedor) REFERENCES contenedor (idContenedor)
);

CREATE TABLE premios
(
    idPremio    int(4) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombre      varchar(50),
    descripcion varchar(100),
    imagen      varchar(100),
    valor       int(10),
    stock       int(4)
);

CREATE TABLE puntos
(
    idPuntos  int(4) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    idUsuario int(4),
    puntos    int(10),
    FOREIGN KEY (idUsuario) REFERENCES usuario (idUsuario)
);

CREATE TABLE canjee
(
    idCanje     int(4) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    idPuntos    int(4),
    idPremio    int(4),
    fechaCanjee DATE,
    FOREIGN KEY (idPuntos) REFERENCES puntos (idPuntos),
    FOREIGN KEY (idPremio) REFERENCES premios (idPremio)
);
