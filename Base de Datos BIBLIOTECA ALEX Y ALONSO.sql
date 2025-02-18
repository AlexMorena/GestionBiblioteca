CREATE TABLE Usuarios (
    IdUsuario int(8) PRIMARY KEY auto_increment,
    Nombre VARCHAR(50) NOT NULL,
    Direccion VARCHAR(50),
    Telefono VARCHAR(9),
    Curso INT(1),
    Email VARCHAR(50) UNIQUE NOT NULL,
    Contraseña VARCHAR(8) NOT NULL
);

CREATE TABLE Documento (
    idDocumento int(8) PRIMARY KEY auto_increment,
    Titulo VARCHAR(50) NOT NULL,
    ListaAutores VARCHAR(100),
    FechaPublicacion DATE,
    Editorial VARCHAR(100),
    NumEjemplares tinyint,
    Descripcion VARCHAR(100),
    Materia VARCHAR(25)
);

CREATE TABLE Ejemplar (
    IdEjemplar int(2) PRIMARY KEY auto_increment,
    idDocumento int(8),
    Localizacion VARCHAR(50),
    Prestado BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (idDocumento) REFERENCES Documento(idDocumento) ON DELETE CASCADE
);

CREATE TABLE Prestar (
    IdUsuario int(8),
    IdEjemplar int(2),
    FechaP DATE,
    FechaD DATE,
    Observacion VARCHAR(100),
    PRIMARY KEY (IdUsuario, IdEjemplar),
    FOREIGN KEY (IdUsuario) REFERENCES Usuarios(IdUsuario) ON DELETE CASCADE,
    FOREIGN KEY (IdEjemplar) REFERENCES Ejemplar(IdEjemplar) ON DELETE CASCADE
);

-- Revistas hereda de documento, por eso se une mediante clave foránea a documento
CREATE TABLE Revista (
    idDocumento VARCHAR(9) PRIMARY KEY,
    ISBN VARCHAR(9),
    Frecuencia enum('diario','semanal','mensual','anual'),
    FOREIGN KEY (idDocumento) REFERENCES Documento(idDocumento) ON DELETE CASCADE
);

-- Multimedia hereda de documento, por eso se une mediante clave foránea a documento
CREATE TABLE Multimedia (
	idDocumento VARCHAR(9) PRIMARY KEY,
    Soporte VARCHAR(50),
    FOREIGN KEY (idDocumento) REFERENCES Documento(idDocumento) ON DELETE CASCADE
);

-- Libro hereda de documento, por eso se une mediante clave foránea a documento
CREATE TABLE Libro (
    idDocumento VARCHAR(9) PRIMARY KEY,
    ISBN VARCHAR(9),
    numPaginas int(5),
    FOREIGN KEY (idDocumento) REFERENCES Documento(idDocumento) ON DELETE CASCADE
);
