/*      Gerente      */

create table Gerente
(
idGerente       number not null,
descGerente    varchar(30) not null,
fechaRegistro   date,
CONSTRAINT pk_gerente PRIMARY KEY (idGerente)
);

-- Insertar registros en la tabla Gerente
INSERT INTO Gerente (idGerente, descGerente, fechaRegistro)
VALUES (1, 'Juan Pérez', TO_DATE('2025-01-15', 'YYYY-MM-DD'));

INSERT INTO Gerente (idGerente, descGerente, fechaRegistro)
VALUES (2, 'María Gómez', TO_DATE('2024-07-20', 'YYYY-MM-DD'));

INSERT INTO Gerente (idGerente, descGerente, fechaRegistro)
VALUES (3, 'Carlos López', TO_DATE('2023-11-10', 'YYYY-MM-DD'));

INSERT INTO Gerente (idGerente, descGerente, fechaRegistro)
VALUES (4, 'Ana Sánchez', TO_DATE('2022-05-30', 'YYYY-MM-DD'));

INSERT INTO Gerente (idGerente, descGerente, fechaRegistro)
VALUES (5, 'Pedro Rodríguez', TO_DATE('2021-08-12', 'YYYY-MM-DD'));



create table condicion
(
idCondicion number not null,
descCondicion varchar(30),
fechaRegistro date,
CONSTRAINT pk_condicion PRIMARY KEY (idCondicion)
);

-- Insertar registros en la tabla condicion
INSERT INTO condicion (idCondicion, descCondicion, fechaRegistro)
VALUES (1, 'Condición Crítica', TO_DATE('2025-01-01', 'YYYY-MM-DD'));

INSERT INTO condicion (idCondicion, descCondicion, fechaRegistro)
VALUES (2, 'Condición Estable', TO_DATE('2024-03-15', 'YYYY-MM-DD'));

INSERT INTO condicion (idCondicion, descCondicion, fechaRegistro)
VALUES (3, 'Condición Grave', TO_DATE('2023-07-10', 'YYYY-MM-DD'));

INSERT INTO condicion (idCondicion, descCondicion, fechaRegistro)
VALUES (4, 'Condición Moderada', TO_DATE('2022-11-20', 'YYYY-MM-DD'));

INSERT INTO condicion (idCondicion, descCondicion, fechaRegistro)
VALUES (5, 'Condición Leve', TO_DATE('2021-09-30', 'YYYY-MM-DD'));



create table provincia
(
idProvincia number not null,
descProvincia varchar(30),
fechaRegistro date,
CONSTRAINT pk_provincia PRIMARY KEY (idProvincia)
);

-- Insertar provincias del departamento de Piura
INSERT INTO provincia (idProvincia, descProvincia, fechaRegistro)
VALUES (1, 'Piura', TO_DATE('2025-01-01', 'YYYY-MM-DD'));

INSERT INTO provincia (idProvincia, descProvincia, fechaRegistro)
VALUES (2, 'Ayabaca', TO_DATE('2024-02-15', 'YYYY-MM-DD'));

INSERT INTO provincia (idProvincia, descProvincia, fechaRegistro)
VALUES (3, 'Huancabamba', TO_DATE('2023-06-10', 'YYYY-MM-DD'));

INSERT INTO provincia (idProvincia, descProvincia, fechaRegistro)
VALUES (4, 'Sullana', TO_DATE('2023-12-01', 'YYYY-MM-DD'));

INSERT INTO provincia (idProvincia, descProvincia, fechaRegistro)
VALUES (5, 'Talara', TO_DATE('2022-11-10', 'YYYY-MM-DD'));

INSERT INTO provincia (idProvincia, descProvincia, fechaRegistro)
VALUES (6, 'Sechura', TO_DATE('2022-05-20', 'YYYY-MM-DD'));

INSERT INTO provincia (idProvincia, descProvincia, fechaRegistro)
VALUES (7, 'Morropón', TO_DATE('2021-09-25', 'YYYY-MM-DD'));

INSERT INTO provincia (idProvincia, descProvincia, fechaRegistro)
VALUES (8, 'Paita', TO_DATE('2021-08-15', 'YYYY-MM-DD'));



create table distrito
(
idDistrito number not null,
idProvincia number not null,
descDistrito varchar(30),
fechaRegistro date,
CONSTRAINT pk_distrito PRIMARY KEY (idDistrito),
CONSTRAINT fk_provincia FOREIGN KEY (idProvincia) REFERENCES provincia(idProvincia)
);

-- Insertar distritos de la provincia de Sullana 
INSERT INTO distrito (idDistrito, idProvincia, descDistrito, fechaRegistro)
VALUES (1, 4, 'Bellavista', TO_DATE('2025-01-01', 'YYYY-MM-DD'));

INSERT INTO distrito (idDistrito, idProvincia, descDistrito, fechaRegistro)
VALUES (2, 4, 'Ignacio Escudero', TO_DATE('2024-02-15', 'YYYY-MM-DD'));

INSERT INTO distrito (idDistrito, idProvincia, descDistrito, fechaRegistro)
VALUES (3, 4, 'Lancones', TO_DATE('2023-06-10', 'YYYY-MM-DD'));

INSERT INTO distrito (idDistrito, idProvincia, descDistrito, fechaRegistro)
VALUES (4, 4, 'Marcavelica', TO_DATE('2023-12-01', 'YYYY-MM-DD'));

INSERT INTO distrito (idDistrito, idProvincia, descDistrito, fechaRegistro)
VALUES (5, 4, 'Miguel Checa', TO_DATE('2022-11-10', 'YYYY-MM-DD'));

INSERT INTO distrito (idDistrito, idProvincia, descDistrito, fechaRegistro)
VALUES (6, 4, 'Querecotillo', TO_DATE('2022-05-20', 'YYYY-MM-DD'));

INSERT INTO distrito (idDistrito, idProvincia, descDistrito, fechaRegistro)
VALUES (7, 4, 'Salitral', TO_DATE('2021-09-25', 'YYYY-MM-DD'));

INSERT INTO distrito (idDistrito, idProvincia, descDistrito, fechaRegistro)
VALUES (8, 4, 'Sullana', TO_DATE('2021-08-15', 'YYYY-MM-DD'));


create table sede 
(
idSede number not null,
descSede varchar(30),
fechaRegistro date,
CONSTRAINT pk_sede PRIMARY KEY (idSede)
);

-- Insertar sedes 
INSERT INTO sede (idSede, descSede, fechaRegistro)
VALUES (1, 'Sede Piura', TO_DATE('2025-01-01', 'YYYY-MM-DD'));

INSERT INTO sede (idSede, descSede, fechaRegistro)
VALUES (2, 'Sede Ayabaca', TO_DATE('2024-02-15', 'YYYY-MM-DD'));

INSERT INTO sede (idSede, descSede, fechaRegistro)
VALUES (3, 'Sede Huancabamba', TO_DATE('2023-06-10', 'YYYY-MM-DD'));

INSERT INTO sede (idSede, descSede, fechaRegistro)
VALUES (4, 'Sede Sullana', TO_DATE('2023-12-01', 'YYYY-MM-DD'));

INSERT INTO sede (idSede, descSede, fechaRegistro)
VALUES (5, 'Sede Talara', TO_DATE('2022-11-10', 'YYYY-MM-DD'));


create table hospital
(
idHospital number not null,
idDistrito number not null,
nombre varchar(30),
antiguedad number,
area decimal(5,2),
idSede number not null,
idGerente number not null,
idCondicion number not null,
fechaReistro date,
CONSTRAINT pk_hospital PRIMARY KEY (idHospital),
CONSTRAINT fk_hospital_distrito FOREIGN KEY (idDistrito) REFERENCES distrito(idDistrito),
CONSTRAINT fk_hospital_sede FOREIGN KEY (idSede) REFERENCES sede(idSede),
CONSTRAINT fk_hospital_gerente FOREIGN KEY (idGerente) REFERENCES gerente(idGerente),
CONSTRAINT fk_hospital_condicion FOREIGN KEY (idCondicion) REFERENCES condicion(idCondicion)
);

