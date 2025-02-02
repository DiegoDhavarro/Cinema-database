-- CREACION DE TABLAS

CREATE TABLE clientes (
documento VARCHAR(10) NOT NULL,
tipoDoc VARCHAR(20) NOT NULL,
nombreApellido VARCHAR(80) NOT NULL,
correo VARCHAR(30),
telefono VARCHAR(20) 
);

CREATE TABLE peliculas (
idPel VARCHAR(10) NOT NULL,
nombre VARCHAR(30) NOT NULL,
duracion NUMBER(4) NOT NULL,
CategoriaEdad VARCHAR(20) NOT NULL,
anio DATE NOT NULL,
informacion XMLTYPE
);

CREATE TABLE generos(
idPel VARCHAR(10) NOT NULL,
genero VARCHAR(20) NOT NULL
);

CREATE TABLE funciones (
idFun VARCHAR(10) NOT NULL,
fechaHora DATE NOT NULL,
idioma VARCHAR(10) NOT NULL,
idPel VARCHAR(10) NOT NULL,
subtitulos VARCHAR(1)
);


CREATE TABLE salas (
idSal VARCHAR(10) NOT NULL,
capacidad NUMBER(4) NOT NULL,
tipoSala VARCHAR(10) NOT NULL,
idFun VARCHAR(10) NOT NULL
);

CREATE TABLE boletos(
idBol VARCHAR(10) NOT NULL,
asiento VARCHAR(20) NOT NULL,
precioB NUMBER(6) NOT NULL,
categoria VARCHAR(10) NOT NULL,
idFun VARCHAR(10) NOT NULL,
idCom VARCHAR(10) NOT NULL,
DocumentoE VARCHAR(10) NOT NULL,
tipoDoc VARCHAR(10) NOT NULL
);

CREATE TABLE empleados (
documentoE VARCHAR(10) NOT NULL,
tipoDoc VARCHAR(10) NOT NULL,
nombre VARCHAR(30) NOT NULL,
salario NUMBER(7) NOT NULL,
correoElectronico VARCHAR(30),
eps VARCHAR(20) NOT NULL,
direccion VARCHAR(20) NOT NULL
);

CREATE TABLE compras (
idCom VARCHAR(10) NOT NULL,
valor NUMBER(7) NOT NULL,
metodoPago VARCHAR(40)NOT NULL,
fechaHora DATE NOT NULL,
documento VARCHAR(10) NOT NULL,
tipoDoc VARCHAR(10) NOT NULL
);

CREATE TABLE detalleCompras (
idCom VARCHAR(10) NOT NULL,
codigoPro VARCHAR(10) NOT NULL,
cantidad NUMBER(4) NOT NULL
);

CREATE TABLE comidas (
codigoPro VARCHAR(10) NOT NULL,
producto VARCHAR(10) NOT NULL,
precioUnitario NUMBER NOT NULL,
idProov VARCHAR(10) NOT NULL
);

CREATE TABLE proveedores (
idProov VARCHAR(10) NOT NULL,
nombreProov VARCHAR(20) NOT NULL
);

CREATE TABLE resenas(
codigoResena VARCHAR(10) NOT NULL,
fecha DATE NOT NULL,
mensaje VARCHAR(300) NOT NULL,
puntuacion NUMBER(1) NOT NULL,
documento VARCHAR(10) NOT NULL,
tipoDoc VARCHAR(2) NOT NULL,
idPel VARCHAR(10) NOT NULL
);


CREATE TABLE OpinionesCine (
codigoOp VARCHAR(10) NOT NULL,
comentario VARCHAR(100),
calificacion VARCHAR(20) NOT NULL,
documento VARCHAR(10) NOT NULL,
tipoDoc VARCHAR(2)
);

-- ADD CONSTRAINTS PK


ALTER TABLE peliculas
ADD CONSTRAINT PK_peliculas PRIMARY KEY (idPel);

ALTER TABLE generos
ADD CONSTRAINT PK_generos PRIMARY KEY (idPel, genero);

ALTER TABLE funciones
ADD CONSTRAINT PK_funciones PRIMARY KEY (idFun);

ALTER TABLE salas
ADD CONSTRAINT PK_salas PRIMARY KEY (idSal);

ALTER TABLE boletos
ADD CONSTRAINT PK_boletos PRIMARY KEY (idBol);

ALTER TABLE compras
ADD CONSTRAINT PK_compras PRIMARY KEY (idCom);

ALTER TABLE comidas
ADD CONSTRAINT PK_comidas PRIMARY KEY (codigoPro);

ALTER TABLE detalleCompras
ADD CONSTRAINT PK_detalleCompras PRIMARY KEY (codigoPro,idCom);

ALTER TABLE proveedores 
ADD CONSTRAINT PK_proveedores PRIMARY KEY (idProov);

ALTER TABLE clientes
ADD CONSTRAINT PK_clientes PRIMARY KEY (documento, tipoDoc);


ALTER TABLE empleados
ADD CONSTRAINT PK_empleados PRIMARY KEY (documentoE,tipoDoc);

ALTER TABLE resenas
ADD CONSTRAINT PK_resenas PRIMARY KEY (codigoResena);

ALTER TABLE opinionesCine
ADD CONSTRAINT PK_opinionesCine PRIMARY KEY (codigoOp);


-- ADD CONSTRAINT FK

ALTER TABLE generos
ADD CONSTRAINT FK_generos_peliculas_idPel  FOREIGN KEY (idPel)
REFERENCES peliculas(idPel);

ALTER TABLE funciones
ADD CONSTRAINT FK_funciones_peliculas_idPel FOREIGN KEY (idPel)
REFERENCES peliculas(idPel);

ALTER TABLE salas
ADD CONSTRAINT FK_salas_funciones_idFun FOREIGN KEY (idFun)
REFERENCES funciones(idFun);

ALTER TABLE boletos
ADD CONSTRAINT FK_boletos_funciones_idFun FOREIGN KEY (idFun)
REFERENCES funciones(idFun);

ALTER TABLE boletos
ADD CONSTRAINT FK_boletos_compras_idCom FOREIGN KEY (idCom)
REFERENCES compras(idCom);

ALTER TABLE boletos
ADD CONSTRAINT FK_boletos_empleados_documentoE_tipoDoc FOREIGN KEY (documentoE, tipoDoc)
REFERENCES empleados(documentoE,tipoDoc);

ALTER TABLE compras
ADD CONSTRAINT FK_compras_clientes_documento_tipoDoc FOREIGN KEY (documento, tipoDoc)
REFERENCES clientes (documento,tipoDoc);

ALTER TABLE comidas
ADD CONSTRAINT FK_comidas_proveedores_idProov FOREIGN KEY (idProov)
REFERENCES proveedores (idProov);

ALTER TABLE detalleCompras
ADD CONSTRAINT FK_detalleCompras_comidas_codigoPro FOREIGN KEY (codigoPro)
REFERENCES comidas(codigoPro);


ALTER TABLE detalleCompras
ADD CONSTRAINT FK_detalleCompras_compras_idCom FOREIGN KEY (idCom)
REFERENCES compras (idCom);


ALTER TABLE resenas
ADD CONSTRAINT FK_resenas_clientes_documento_tipoDoc FOREIGN KEY (documento, tipoDoc)
REFERENCES clientes(documento, tipoDoc)
ON DELETE CASCADE;

ALTER TABLE resenas
ADD CONSTRAINT FK_resenas_peliculas_idPel FOREIGN KEY (idPel)
REFERENCES peliculas(idPel)
ON DELETE CASCADE;

ALTER TABLE opinionesCine
ADD CONSTRAINT FK_opinionesCine_clientes_documento_tipoDoc FOREIGN KEY (documento,tipoDoc)
REFERENCES clientes(documento,tipoDoc);

-- ADD CONSTRAINTS UNIQUE

ALTER TABLE clientes
ADD CONSTRAINT UK_clientes_telefono UNIQUE (telefono);

ALTER TABLE empleados
ADD CONSTRAINT UK_empleados_correoElectronico UNIQUE (correoElectronico);



-- XTablas
DROP TABLE peliculas CASCADE CONSTRAINTS;
DROP TABLE generos CASCADE CONSTRAINTS;
DROP TABLE funciones CASCADE CONSTRAINTS;
DROP TABLE salas CASCADE CONSTRAINTS;
DROP TABLE boletos CASCADE CONSTRAINTS;
DROP TABLE compras CASCADE CONSTRAINTS;
DROP TABLE comidas CASCADE CONSTRAINTS;
DROP TABLE detalleCompras CASCADE CONSTRAINTS;
DROP TABLE proveedores CASCADE CONSTRAINTS;
DROP TABLE clientes CASCADE CONSTRAINTS;
DROP TABLE empleados CASCADE CONSTRAINTS;
DROP TABLE resenas CASCADE CONSTRAINTS;
DROP TABLE opinionesCine CASCADE CONSTRAINTS;



-- POBLAROK

INSERT INTO clientes (documento, tipoDoc, nombreApellido, correo, telefono) VALUES 
('1001234567', 'CC', 'Juan Perez', 'juanperez12@gmail.com', '3201234567');

INSERT INTO clientes (documento, tipoDoc, nombreApellido, correo, telefono) VALUES 
('1011234568', 'TI', 'Maria Ramirez', 'mramirez34@gmail.com', '3212345678');

INSERT INTO clientes (documento, tipoDoc, nombreApellido, correo, telefono) VALUES 
('1021234569', 'CE', 'Carlos Alvarez', 'carl_alv93@yahoo.com', '3223456789');

INSERT INTO clientes (documento, tipoDoc, nombreApellido, correo, telefono) VALUES 
('1031234570', 'PA', 'Laura Martinez', 'laura.m2@outlook.com', '3234567890');

INSERT INTO clientes (documento, tipoDoc, nombreApellido, correo, telefono) VALUES 
('1041234571', 'CC', 'Ana Fernandez', 'ana_f12@hotmail.com', '3245678901');




INSERT INTO peliculas (idPel, nombre, duracion, CategoriaEdad, anio, informacion) 
VALUES 
('PEL001', 'Inception', 148, 'PG-13', TO_DATE('2010-07-16', 'YYYY-MM-DD'), 
 XMLTYPE('<informacion>
  <director>Christopher Nolan</director>
  <actores>
    <actor>Leonardo DiCaprio</actor>
    <actor>Joseph Gordon-Levitt</actor>
    <actor>Elliot Page</actor>
    <actor>Tom Hardy</actor>
  </actores>
  <sinopsis>Un ladrón con habilidad para infiltrarse en los sueños debe realizar una tarea casi imposible: implantar una idea en la mente de alguien.</sinopsis>
</informacion>'));



INSERT INTO peliculas (idPel, nombre, duracion, CategoriaEdad, anio, informacion) 
VALUES 
('PEL002', 'Avatar', 162, 'PG-13', TO_DATE('2009-12-18', 'YYYY-MM-DD'), 
 XMLTYPE('<informacion>
  <director>James Cameron</director>
  <actores>
    <actor>Sam Worthington</actor>
    <actor>Zoe Saldana</actor>
    <actor>Sigourney Weaver</actor>
    <actor>Stephen Lang</actor>
  </actores>
  <sinopsis>
    En Pandora, un ex-marine se une a los Navi en una lucha por la supervivencia cuando una corporación intenta explotar los recursos del planeta.
  </sinopsis>
</informacion>'));


INSERT INTO peliculas (idPel, nombre, duracion, CategoriaEdad, anio, informacion) 
VALUES 
('PEL003', 'Interstellar', 169, 'PG-13', TO_DATE('2014-11-07', 'YYYY-MM-DD'), 
 XMLTYPE('<informacion>
  <director>Christopher Nolan</director>
  <actores>
    <actor>Matthew McConaughey</actor>
    <actor>Anne Hathaway</actor>
    <actor>Jessica Chastain</actor>
    <actor>Michael Caine</actor>
  </actores>
  <sinopsis>
    En un futuro donde la Tierra está muriendo, un grupo de astronautas viaja a través de un agujero de gusano en busca de un nuevo hogar para la humanidad.
  </sinopsis>
</informacion>'));


INSERT INTO peliculas (idPel, nombre, duracion, CategoriaEdad, anio, informacion) 
VALUES 
('PEL004', 'Titanic', 195, 'PG-13', TO_DATE('1997-12-19', 'YYYY-MM-DD'), 
 XMLTYPE('<informacion>
  <director>James Cameron</director>
  <actores>
    <actor>Leonardo DiCaprio</actor>
    <actor>Kate Winslet</actor>
    <actor>Billy Zane</actor>
    <actor>Kathy Bates</actor>
  </actores>
  <sinopsis>
    Una trágica historia de amor entre un joven artista y una aristócrata a bordo del fatídico transatlántico Titanic.
  </sinopsis>
</informacion>'));


INSERT INTO peliculas (idPel, nombre, duracion, CategoriaEdad, anio, informacion) 
VALUES 
('PEL005', 'The Matrix', 136, 'R', TO_DATE('1999-03-31', 'YYYY-MM-DD'), 
 XMLTYPE('<informacion>
  <director>Lana Wachowski</director>
  <director>Lilly Wachowski</director>
  <actores>
    <actor>Keanu Reeves</actor>
    <actor>Laurence Fishburne</actor>
    <actor>Carrie-Anne Moss</actor>
    <actor>Hugo Weaving</actor>
  </actores>
  <sinopsis>
    Un programador descubre que el mundo en el que vive es una simulación creada por máquinas, y se une a la resistencia para liberar a la humanidad.
  </sinopsis>
</informacion>'));




INSERT INTO generos (idPel, genero) VALUES 
('PEL001', 'Sci-Fi');

INSERT INTO generos (idPel, genero) VALUES 
('PEL002', 'Action');

INSERT INTO generos (idPel, genero) VALUES 
('PEL003', 'Drama');

INSERT INTO generos (idPel, genero) VALUES 
('PEL004', 'Romance');

INSERT INTO generos (idPel, genero) VALUES 
('PEL005', 'Action');



INSERT INTO funciones (idFun, fechaHora, idioma, idPel) VALUES 
('FUN001', TO_DATE('2024-10-19 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Español', 'PEL001');

INSERT INTO funciones (idFun, fechaHora, idioma, idPel) VALUES 
('FUN002', TO_DATE('2024-10-20 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Ingles', 'PEL002');

INSERT INTO funciones (idFun, fechaHora, idioma, idPel) VALUES 
('FUN003', TO_DATE('2024-10-21 20:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Ingles', 'PEL003');

INSERT INTO funciones (idFun, fechaHora, idioma, idPel) VALUES 
('FUN004', TO_DATE('2024-10-22 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Ingles', 'PEL004');

INSERT INTO funciones (idFun, fechaHora, idioma, idPel) VALUES 
('FUN005', TO_DATE('2024-10-23 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Español', 'PEL005');




INSERT INTO salas (idSal, capacidad, tipoSala, idFun) VALUES 
('SAL001', 150, 'Imax', 'FUN001');

INSERT INTO salas (idSal, capacidad, tipoSala, idFun) VALUES 
('SAL002', 200, '3D', 'FUN002');

INSERT INTO salas (idSal, capacidad, tipoSala, idFun) VALUES 
('SAL003', 180, 'Imax', 'FUN003');

INSERT INTO salas (idSal, capacidad, tipoSala, idFun) VALUES 
('SAL004', 120, '3D', 'FUN004');

INSERT INTO salas (idSal, capacidad, tipoSala, idFun) VALUES 
('SAL005', 220, 'Estandar', 'FUN005');


INSERT INTO empleados (documentoE, tipoDoc, nombre, salario, correoElectronico, eps, direccion) VALUES 
('1001123456', 'CC', 'Luis Gomez', 2500000, 'lgomez_88@empresa.com', 'Sura', 'Calle 123');

INSERT INTO empleados (documentoE, tipoDoc, nombre, salario, correoElectronico, eps, direccion) VALUES 
('1002123457', 'TI', 'Carla Lopez', 2700000, 'carla.lopez33@empresa.com', 'Sanitas', 'Carrera 45');

INSERT INTO empleados (documentoE, tipoDoc, nombre, salario, correoElectronico, eps, direccion) VALUES 
('1003123458', 'CC', 'Pedro Diaz', 3000000, 'pedrod87@empresa.com', 'Compensar', 'Avenida 56');

INSERT INTO empleados (documentoE, tipoDoc, nombre, salario, correoElectronico, eps, direccion) VALUES 
('1004123459', 'PA', 'Julia Ramos', 2200000, 'jramos_91@empresa.com', 'Sura', 'Diagonal 78');

INSERT INTO empleados (documentoE, tipoDoc, nombre, salario, correoElectronico, eps, direccion) VALUES 
('1005123460', 'CE', 'Juan Sanchez', 2900000, 'juansan78@empresa.com', 'Colsubsidio', 'Transversal 98');



INSERT INTO compras (idCom, valor, metodoPago, fechaHora, documento, tipoDoc) VALUES 
('COM001', 100000, 'tarjeta credito', TO_DATE('2024-10-19 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1001234567', 'CC');

INSERT INTO compras (idCom, valor, metodoPago, fechaHora, documento, tipoDoc) VALUES 
('COM002', 50000, 'efectivo', TO_DATE('2024-10-19 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1011234568', 'TI');

INSERT INTO compras (idCom, valor, metodoPago, fechaHora, documento, tipoDoc) VALUES 
('COM003', 75000, 'tarjeta debito', TO_DATE('2024-10-20 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1021234569', 'CE');

INSERT INTO compras (idCom, valor, metodoPago, fechaHora, documento, tipoDoc) VALUES 
('COM004', 85000, 'tarjeta credito', TO_DATE('2024-10-21 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1031234570', 'PA');


INSERT INTO boletos (idBol, asiento, precioB, categoria, idFun, idCom, DocumentoE, tipoDoc) VALUES 
('BOL001', 'A001', 50000, 'VIP', 'FUN001', 'COM001', '1001123456', 'CC');

INSERT INTO boletos (idBol, asiento, precioB, categoria, idFun, idCom, DocumentoE, tipoDoc) VALUES 
('BOL002', 'B002', 30000, 'BASICA', 'FUN002', 'COM002', '1002123457', 'TI');

INSERT INTO boletos (idBol, asiento, precioB, categoria, idFun, idCom, DocumentoE, tipoDoc) VALUES 
('BOL003', 'C003', 40000, 'VIP', 'FUN003', 'COM003', '1003123458', 'CC');

INSERT INTO boletos (idBol, asiento, precioB, categoria, idFun, idCom, DocumentoE, tipoDoc) VALUES 
('BOL004', 'D004', 25000, 'BASICA', 'FUN004', 'COM004', '1004123459', 'PA');

INSERT INTO boletos (idBol, asiento, precioB, categoria, idFun, idCom, DocumentoE, tipoDoc) VALUES 
('BOL005', 'E005', 35000, 'VIP', 'FUN005', 'COM004', '1005123460', 'CE');


INSERT INTO proveedores (idProov, nombreProov) VALUES ('PRO001', 'Provedor A');
INSERT INTO proveedores (idProov, nombreProov) VALUES ('PRO002', 'Provedor B');
INSERT INTO proveedores (idProov, nombreProov) VALUES ('PRO003', 'Provedor C');


INSERT INTO comidas (codigoPro, producto, precioUnitario, idProov) VALUES ('PRO001', 'Palomitas', 12000, 'PRO001');
INSERT INTO comidas (codigoPro, producto, precioUnitario, idProov) VALUES ('PRO002', 'Refresco', 5000, 'PRO001');
INSERT INTO comidas (codigoPro, producto, precioUnitario, idProov) VALUES ('PRO003', 'Gaseosa', 6000, 'PRO002');
INSERT INTO comidas (codigoPro, producto, precioUnitario, idProov) VALUES ('PRO004', 'Hot Dog', 15000, 'PRO003');
INSERT INTO comidas (codigoPro, producto, precioUnitario, idProov) VALUES ('PRO005', 'Nachos', 20000, 'PRO003');


INSERT INTO detalleCompras (idCom, codigoPro, cantidad) VALUES ('COM001', 'PRO001', 2);  
INSERT INTO detalleCompras (idCom, codigoPro, cantidad) VALUES ('COM001', 'PRO002', 1);  
INSERT INTO detalleCompras (idCom, codigoPro, cantidad) VALUES ('COM002', 'PRO003', 3);  
INSERT INTO detalleCompras (idCom, codigoPro, cantidad) VALUES ('COM002', 'PRO004', 2);  
INSERT INTO detalleCompras (idCom, codigoPro, cantidad) VALUES ('COM003', 'PRO005', 1);


-- POBLAR NOOK

INSERT INTO clientes (documento, tipoDoc, nombreApellido, correo, telefono) VALUES 
('1001234567', 'CC', NULL , 'juanperez12@gmail.com', '3201234567');

INSERT INTO peliculas (idPel, nombre, duracion, CategoriaEdad, anio) VALUES 
('PEL001', 'Inception', 'ciento veinte', 'PG-13', TO_DATE('2010-07-16', 'YYYY-MM-DD'));


INSERT INTO funciones (idFun, fechaHora, idioma, idPel) VALUES 
('FUN001', TO_DATE('2024-10-19 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'EN', 'PEL001');
INSERT INTO funciones (idFun, fechaHora, idioma, idPel) VALUES 
('FUN001', TO_DATE('2024-10-10 16:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'EN', 'PEL002');

INSERT INTO salas (iSal, capacidad, tipoSala, idFun) VALUES 
('SAL001', 150, 'IMAX', 'nnn');


INSERT INTO empleados (documentoE, tipoDoc, nombre, salario, correoElectronico, eps, direccion) VALUES 
('1004123459', 'PA', 'Julia Ramos', 2200000, 'jramos_91@empresa.com', 'Sura', 'Diagonal 78');

INSERT INTO empleados (documentoE, tipoDoc, nombre, salario, correoElectronico, eps, direccion) VALUES 
('1005123460', 'CE', 'Juan Sanchez', 2900000, 'jramos_91@empresa.com', 'Colsubsidio', 'Transversal 98');


-- XPOBLAR
TRUNCATE TABLE detalleCompras;
TRUNCATE TABLE comidas;
TRUNCATE TABLE proveedores;
TRUNCATE TABLE boletos;
TRUNCATE TABLE empleados;
TRUNCATE TABLE compras;
TRUNCATE TABLE salas;
TRUNCATE TABLE funciones;
TRUNCATE TABLE generos;
TRUNCATE TABLE peliculas;
TRUNCATE TABLE clientes;
TRUNCATE TABLE resenas;
TRUNCATE TABLE opinionesCine;

-- CONSULTAS

--La finalidad de esta consulta es contar el número total de boletos vendidos para la película "Inception" (u pelicula en general)
SELECT COUNT(idBol)
FROM Boletos JOIN Funciones ON Boletos.idFun = Funciones.idFun
JOIN Peliculas ON Funciones.idPel = Peliculas.idPel
Where Peliculas.nombre = 'Inception';


-- informe detallado de las compras realizadas en el cine, incluyendo productos de comida, boletos adquiridos, y datos relacionados con las funciones y salas, ordenado por el valor de compra.
SELECT Compras.documento, Compras.tipoDoc, Compras.valor, Compras.idCom, 
       Comidas.codigoPro, Comidas.producto, detalleCompras.cantidad, 
       Boletos.precioB, Boletos.categoria, Salas.tipoSala
FROM comidas 
JOIN detalleCompras ON Comidas.codigoPro = detalleCompras.codigoPro
JOIN Compras ON detalleCompras.idCom = Compras.idCom
JOIN Boletos ON Compras.idCom = Boletos.idCom
JOIN Funciones ON Boletos.idFun = Funciones.idFun
JOIN Salas ON Funciones.idFun = Salas.idFun
ORDER BY Compras.valor DESC;




-- TUPLAS

ALTER TABLE resenas
ADD CONSTRAINT CK_resenas_puntuacion
CHECK (puntuacion >= 0 AND puntuacion <= 5);


ALTER TABLE clientes 
ADD CONSTRAINT CK_clientes_tipoDoc
CHECK (tipoDoc IN ('CC','TI','CE','PA'));

ALTER TABLE clientes
ADD CONSTRAINT CK_clientes_correo
CHECK (
    REGEXP_LIKE(correo, '^[^@]*@[^@]*$')
    AND REGEXP_LIKE(correo, '[[:punct:]]') 
    AND REGEXP_LIKE(correo, '[0-9]')
);

ALTER TABLE opinionesCine
ADD CONSTRAINT CK_opinionesCine_calificacion
CHECK (calificacion IN ('Excelente', 'Bueno', 'Regular', 'Malo', 'Pesimo'));

ALTER TABLE compras 
ADD CONSTRAINT CK_compras_MetodoPago
CHECK (MetodoPago IN ('tarjeta credito','tarjeta debito','efectivo'));

ALTER TABLE funciones
ADD CONSTRAINT CK_funciones_idioma
CHECK (idioma IN ('Ingles', 'Español'));

ALTER TABLE funciones
ADD CONSTRAINT CK_funciones_subtitulos
CHECK (subtitulos IN ('T', 'F'));

ALTER TABLE boletos
ADD CONSTRAINT CK_boletos_Asiento
CHECK (REGEXP_LIKE(asiento, '^[A-Z][0-9]{1,3}$'));



ALTER TABLE boletos
ADD CONSTRAINT CK_boletos_Categoria
CHECK (categoria IN ('VIP','BASICA'));

ALTER TABLE empleados
ADD CONSTRAINT CK_empleados_tipoDoc
CHECK(tipoDoc IN ('CC','TI','CE','PA'));

ALTER TABLE empleados
ADD CONSTRAINT CK_empleado_correoElectronico
CHECK (
    REGEXP_LIKE(correoElectronico, '^[^@]*@[^@]*$') 
    AND REGEXP_LIKE(correoElectronico, '[[:punct:]]') 
    AND REGEXP_LIKE(correoElectronico, '[0-9]') 
);

ALTER TABLE Salas
ADD CONSTRAINT CK_salas_tipoSala
CHECK (tipoSala IN ('3D','Imax','Estandar'));


-- TuplasOK
INSERT INTO clientes (documento, tipoDoc, nombreApellido, correo, telefono) VALUES 
('1001234567', 'CC', 'Juan Perez', 'juanperez12@gmail.com', '3201234567');

INSERT INTO compras (idCom, valor, metodoPago, fechaHora, documento, tipoDoc) VALUES 
('COM002', 50000, 'efectivo', TO_DATE('2024-10-19 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1011234568', 'TI');

INSERT INTO boletos (idBol, asiento, precioB, categoria, idFun, idCom, DocumentoE, tipoDoc) VALUES 
('BOL001', 'A001', 50000, 'VIP', 'FUN001', 'COM001', '1001123456', 'CC');

INSERT INTO empleados (documentoE, tipoDoc, nombre, salario, correoElectronico, eps, direccion) VALUES 
('1004123459', 'PA', 'Julia Ramos', 2200000, 'jramos_91@empresa.com', 'Sura', 'Diagonal 78');

-- Tuplas NOOK

-- documento cliente no corresponde
INSERT INTO clientes (documento, tipoDoc, nombreApellido, correo, telefono) VALUES 
('1001234924', 'tarjetaid', 'Juan Perez', 'juanperez12@gmail.com', '3201234567');

-- metodoPago no corresponde
INSERT INTO compras (idCom, valor, metodoPago, fechaHora, documento, tipoDoc) VALUES 
('COM003', 50000, 'monedas', TO_DATE('2024-10-19 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), '1011234568', 'TI');

-- tipo asiento no corresponde 
INSERT INTO boletos (idBol, asiento, precioB, categoria, idFun, idCom, DocumentoE, tipoDoc) VALUES 
('0001', 'A001', 50000, 'VIP', 'FUN001', 'COM001', '1001123456', 'CC');


-- falta el @
INSERT INTO empleados (documentoE, tipoDoc, nombre, salario, correoElectronico, eps, direccion) VALUES 
('1004363459', 'CC', 'Julian Rivas', 2200000, 'jrivas_91.empresa.com', 'Sura', 'Diagonal 78');



-- ACCIONES
ALTER TABLE resenas
ADD CONSTRAINT FK_resenas_clientes_documento_tipoDoc FOREIGN KEY (documento, tipoDoc)
REFERENCES clientes(documento, tipoDoc)
ON DELETE CASCADE;

ALTER TABLE resenas
ADD CONSTRAINT FK_resenas_peliculas_idPel FOREIGN KEY (idPel)
REFERENCES peliculas(idPel)
ON DELETE CASCADE;



-- DISPARADORES


CREATE SEQUENCE seq_numero_oferta
START WITH 1
INCREMENT BY 1        
MINVALUE 1
MAXVALUE 999999999   
NOCYCLE;     
/

CREATE SEQUENCE seq_idFun_demandas
START WITH 1
INCREMENT BY 1        
MINVALUE 1
MAXVALUE 999999999   
NOCYCLE;     
/

CREATE OR REPLACE TRIGGER TG_funciones_insertar_idGenerado
BEFORE INSERT ON funciones
FOR EACH ROW
BEGIN
   
    :NEW.idFun := seq_idFun_demandas.NEXTVAL;

    :NEW.fechaHora := SYSDATE;
END;
/

--Si al insertar una funcion, no se especifica nada acerca de los subtitulos, se asume que es False.
CREATE OR REPLACE TRIGGER TG_funciones_insertar_subtitulos

BEFORE INSERT ON funciones
FOR EACH ROW
BEGIN
    IF :NEW.subtitulos IS NULL THEN
        :NEW.subtitulos := 'T';
    END IF;
END;
/

-- Solo se pueden actualizar los subtitulos.

CREATE OR REPLACE TRIGGER TG_funciones_update_subtitulos
BEFORE UPDATE ON funciones
FOR EACH ROW
BEGIN
    -- Solo permite la actualizaciÃ³n si Ãºnicamente 'subtitulos' estÃ¡ en la lista de campos a actualizar.
    IF UPDATING('subtitulos') AND 
       NOT (UPDATING('idFun') OR UPDATING('fechaHora') OR UPDATING('idioma') OR UPDATING('idPel')) THEN
       
        -- No se permite que subtitulos se actualice a NULL
        IF :NEW.subtitulos IS NULL THEN
            RAISE_APPLICATION_ERROR(-20001, 'No se puede actualizar el subtitulo a NULL');
        END IF;
        
    ELSE
        -- Bloquea actualizaciones en otros campos
        RAISE_APPLICATION_ERROR(-20002, 'Solo se permite la actualizaciÃ³n del campo subtitulos');
    END IF;
END;
/


CREATE OR REPLACE TRIGGER TG_comidas_update_precio
BEFORE UPDATE ON comidas
FOR EACH ROW
BEGIN
    IF :NEW.codigoPro <> :OLD.codigoPro or :NEW.producto <> :OLD.producto OR :NEW.idProov <> :NEW.idProov THEN
        RAISE_APPLICATION_ERROR(-20001, 'Solo se puede actualizar el precioUnitario.');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER TG_comidas_delete_precio
AFTER DELETE ON comidas
FOR EACH ROW
BEGIN
    DELETE FROM proveedores
    WHERE :OLD.idProov = proveedores.idProov;
END;
/



CREATE SEQUENCE seq_numero_opiniones
START WITH 1
INCREMENT BY 1        
MINVALUE 1
MAXVALUE 999999999   
NOCYCLE;
/

CREATE OR REPLACE TRIGGER TG_opinionesCine_insert_codigo
BEFORE INSERT ON opinionesCine
FOR EACH ROW
BEGIN
    :NEW.codigoOp := seq_numero_opiniones.NEXTVAL;
END;
/

CREATE OR REPLACE TRIGGER TG_opinionesCine_update
BEFORE UPDATE ON opinionesCine
FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20001, 'No se puede modificar nada de las opiniones.');
END;
/

CREATE OR REPLACE TRIGGER TG_empleados_insert_correos
BEFORE INSERT ON empleados
FOR EACH ROW
BEGIN
    IF :NEW.correoElectronico IS NULL THEN
        :NEW.correoElectronico := 'Pendiente de asignacion';
    END IF;
END;
/

CREATE OR REPLACE TRIGGER TG_empleados_update
BEFORE UPDATE ON empleados
FOR EACH ROW
BEGIN
    IF :NEW.documentoE <> :OLD.documentoE or :NEW.nombre <> :OLD.nombre or :NEW.tipoDoc <> :OLD.tipoDoc or :NEW.correoElectronico <> :OLD.correoElectronico THEN
        RAISE_APPLICATION_ERROR(-20001,'Del empleado solo es posible modificar el salario, la eps y la direcciÃ³n.');
    END IF;
END;
/


-- DISPARADORESOK

-- autogenerado id fun
INSERT INTO peliculas (idPel, nombre, duracion, CategoriaEdad, anio, informacion) 
VALUES ('P001', 'Inception', 148, 'PG-13', TO_DATE('2010-07-16', 'YYYY-MM-DD'), 
XMLTYPE('<informacion>
  <director>Christopher Nolan</director>
  <actores>
    <actor>Leonardo DiCaprio</actor>
    <actor>Joseph Gordon-Levitt</actor>
    <actor>Ellen Page</actor>
  </actores>
  <sinopsis>
    Un ladrón con la habilidad de robar secretos de los sueños de las personas se le ofrece una oportunidad para borrar su pasado, enfrentándose a un reto imposible.
  </sinopsis>
</informacion>'));

INSERT INTO peliculas (idPel, nombre, duracion, CategoriaEdad, anio, informacion) 
VALUES ('P002', 'The Matrix', 136, 'R', TO_DATE('1999-03-31', 'YYYY-MM-DD'),
XMLTYPE('<informacion>
  <director>Lana Wachowski</director>
  <director>Lilly Wachowski</director>
  <actores>
    <actor>Keanu Reeves</actor>
    <actor>Laurence Fishburne</actor>
    <actor>Carrie-Anne Moss</actor>
    <actor>Hugo Weaving</actor>
  </actores>
  <sinopsis>
    Un programador descubre que el mundo en el que vive es una simulación creada por máquinas, y se une a la resistencia para liberar a la humanidad.
  </sinopsis>
</informacion>'));


INSERT INTO funciones (idFun, fechaHora, idioma, idPel, subtitulos) VALUES (01, TO_DATE('2024-11-11 17:00', 'YYYY-MM-DD HH24:MI'), 'Ingles', 'P002', 'T');
INSERT INTO funciones (idFun, fechaHora, idioma, idPel, subtitulos) VALUES (02, TO_DATE('2024-11-11 17:00', 'YYYY-MM-DD HH24:MI'), 'Ingles', 'P002', 'T');

--subtitulos 
INSERT INTO funciones (idFun, fechaHora, idioma, idPel, subtitulos) VALUES (03, TO_DATE('2024-11-11 17:00', 'YYYY-MM-DD HH24:MI'), 'Ingles', 'P002', NULL);

-- solo actualizar subtitulos
UPDATE funciones 
SET subtitulos = 'F'
WHERE idFun = '3';
-- solo se puede actualizar el precio unitario
INSERT INTO proveedores (idProov, nombreProov) VALUES ('P001', 'Proveedor A');
INSERT INTO proveedores (idProov, nombreProov) VALUES ('P002', 'Proveedor B');

INSERT INTO comidas (codigoPro, producto, precioUnitario, idProov) VALUES ('C001', 'Palomitas', 10000, 'P001');
INSERT INTO comidas (codigoPro, producto, precioUnitario, idProov) VALUES ('C002', 'Refresco', 5000, 'P002');

UPDATE comidas
SET precioUnitario = 25000
WHERE codigoPro = 'C002';

-- opiniones codigo autogenerado

INSERT INTO clientes (documento, tipoDoc, nombreApellido, correo, telefono) VALUES ('1234567890', 'CC', 'Juan Perez', 'juan.perez2@example.com', '3012345678');
INSERT INTO clientes (documento, tipoDoc, nombreApellido, correo, telefono) VALUES ('0987654321', 'CC', 'Maria Gomez', 'maria.gomez1@example.com', '3023456789');

INSERT INTO OpinionesCine (codigoOp, comentario, calificacion, documento, tipoDoc) VALUES (NULL, 'Me encantï¿½ la experiencia', 'Excelente', '1234567890', 'CC');
INSERT INTO OpinionesCine (codigoOp, comentario, calificacion, documento, tipoDoc) VALUES (NULL, 'Fue regular', 'Malo', '0987654321', 'CC');

-- si el correo del empleado es null se deja pendiente
INSERT INTO empleados (documentoE, tipoDoc, nombre, salario, correoElectronico, eps, direccion) VALUES ('E001', 'CC', 'Pedro Ramirez', 2500000, 'PedroR3@gmail.com', 'Sura', 'Calle 10');
INSERT INTO empleados (documentoE, tipoDoc, nombre, salario, correoElectronico, eps, direccion) VALUES ('E002', 'CC', 'Ana Torres', 3000000, 'An4@gmail.com', 'Coomeva', 'Calle 20');

-- del emp solo es posible modificar salario, eps y direccion
UPDATE empleados
SET direccion = '20 julio'
WHERE documentoE = 'E002';

-- Disparadores NOOK
--Falla por check_correo
INSERT INTO empleados (documentoE, tipoDoc, nombre, salario, correoElectronico, eps, direccion) VALUES ('E004', 'CC', 'samu gil', 3000000, NULL, 'Coomeva', 'Calle 230');

-- solo se puede actualizar subtitulos:
INSERT INTO peliculas (idPel, nombre, duracion, CategoriaEdad, anio) 
VALUES ('P003', 'Inception', 148, 'PG-13', TO_DATE('2010-07-16', 'YYYY-MM-DD'));
INSERT INTO peliculas (idPel, nombre, duracion, CategoriaEdad, anio) 
VALUES ('P004', 'The Matrix', 136, 'R', TO_DATE('1999-03-31', 'YYYY-MM-DD'));

INSERT INTO funciones (idFun, fechaHora, idioma, idPel, subtitulos) 
VALUES (1, TO_DATE('2024-11-11 17:00', 'YYYY-MM-DD HH24:MI'), 'Ingles', 'P003', 'T');
INSERT INTO funciones (idFun, fechaHora, idioma, idPel, subtitulos) 
VALUES (2, TO_DATE('2024-11-11 19:00', 'YYYY-MM-DD HH24:MI'), 'Ingles', 'P004', 'F');

UPDATE funciones
SET fechaHora = SYSDATE
WHERE idFun = '4';

--solo se puede actualizar el precio unitario
UPDATE comidas
SET producto = 'papitas'
WHERE codigoPro = 'C002';

-- no se puede modificar nada de las opiniones
UPDATE opinionesCine
SET comentario = 'malo malisimo'
WHERE codigoOp = '2';

-- del empleado solo se puede actualizar salario, eps y direccion
UPDATE empleados
SET correoElectronico = 'Anita431@gmail.com'
WHERE documentoE = 'E002';



-- XDisparadores

-- Eliminar secuencias
DROP SEQUENCE seq_numero_oferta;
DROP SEQUENCE seq_idFun_demandas;
DROP SEQUENCE seq_numero_opiniones;

-- Eliminar disparadores
DROP TRIGGER TG_funciones_insertar_idGenerado;
DROP TRIGGER TG_funciones_insertar_subtitulos;
DROP TRIGGER TG_funciones_update_subtitulos;
DROP TRIGGER TG_comidas_update_precio;
DROP TRIGGER TG_comidas_delete_precio;
DROP TRIGGER TG_opinionesCine_insert_codigo;
DROP TRIGGER TG_opinionesCine_update;
DROP TRIGGER TG_empleados_insert_correos;
DROP TRIGGER TG_empleados_update;

-- **************************** Indices y Vistas *********************** 


-- INDICES ==

-- consultas operativas **

-- Indice para optimizar las busquedas por idFun (funcion) en la tabla boletos
CREATE INDEX idx_boletos_idFun ON boletos(idFun);

-- Indice para optimizar la busqueda de boletos por cliente (documento y tipoDoc)
CREATE INDEX idx_boletos_cliente ON boletos(DocumentoE, tipoDoc);

-- Indice para optimizar las bï¿½squedas por idPel (pelï¿½cula) en la tabla funciones
CREATE INDEX idx_funciones_idPel ON funciones(idPel);

-- Indice para optimizar las busquedas por nombre de pelï¿½cula
CREATE INDEX idx_peliculas_nombre ON peliculas(nombre);



-- consultas gerenciales **
CREATE INDEX idx_opinionesCine_documento_tipoDoc ON OpinionesCine(documento, tipoDoc);
CREATE INDEX idx_empleados_documentoE ON empleados(documentoE);
CREATE INDEX idx_comidas_producto ON comidas(producto);
CREATE INDEX idx_proveedores_nombreProov ON proveedores(nombreProov);
CREATE INDEX idx_resenas_idPel ON resenas(idPel);



-- VISTAS ==
-- consultas gerenciales
CREATE VIEW vista_opiniones_cine AS
SELECT o.codigoOp, o.comentario, o.calificacion, o.documento, o.tipoDoc, c.nombreApellido
FROM OpinionesCine o
JOIN clientes c ON o.documento = c.documento AND o.tipoDoc = c.tipoDoc;


CREATE VIEW vista_empleados AS
SELECT e.documentoE, e.nombre, e.salario
FROM empleados e;


CREATE VIEW vista_proveedores AS
SELECT p.idProov, p.nombreProov
FROM proveedores p;


CREATE VIEW vista_resenas_peliculas AS
SELECT r.codigoResena, r.fecha, r.mensaje, r.puntuacion, p.nombre, p.informacion
FROM resenas r
JOIN peliculas p ON r.idPel = p.idPel;





-- consultas operativas
CREATE VIEW vista_boletos_pelicula AS
SELECT p.nombre AS pelicula_nombre, 
       COUNT(b.idBol) AS cantidad_boletos_vendidos, 
       EXTRACTVALUE(p.informacion, '/informacion/director[1]') AS director_1,
       EXTRACTVALUE(p.informacion, '/informacion/sinopsis') AS sinopsis
FROM 
    boletos b
JOIN 
    funciones f ON b.idFun = f.idFun
JOIN 
    peliculas p ON f.idPel = p.idPel
WHERE 
    p.nombre = 'Transformers: La venganza de los caidos'
GROUP BY 
    p.nombre, 
    EXTRACTVALUE(p.informacion, '/informacion/director[1]'),
    EXTRACTVALUE(p.informacion, '/informacion/sinopsis');




 
CREATE VIEW vista_dinero_gastado_persona AS
SELECT 
    c.documento,
    c.tipoDoc,
    com.valor,
    com.idCom,
    dc.codigoPro,
    co.producto,
    dc.cantidad,
    b.precioB,
    b.categoria,
    s.tipoSala
FROM 
    clientes c
JOIN 
    compras com ON c.documento = com.documento AND c.tipoDoc = com.tipoDoc
JOIN 
    detalleCompras dc ON com.idCom = dc.idCom
JOIN 
    comidas co ON dc.codigoPro = co.codigoPro
JOIN 
    boletos b ON com.idCom = b.idCom
JOIN 
    salas s ON b.idFun = s.idFun
ORDER BY 
    com.valor DESC;


SELECT * FROM vista_opiniones_cine;
SELECT * FROM vista_empleados;
SELECT * FROM vista_proveedores;
SELECT * FROM vista_resenas_peliculas;
SELECT * FROM vista_boletos_pelicula;
SELECT * FROM vista_dinero_gastado_persona;

-- XINDICESVISTAS ==

DROP INDEX idx_boletos_idFun;
DROP INDEX idx_boletos_cliente;
DROP INDEX idx_funciones_idPel;
DROP INDEX idx_peliculas_nombre;


DROP INDEX idx_opinionesCine_documento_tipoDoc;
DROP INDEX idx_empleados_documentoE;
DROP INDEX idx_comidas_producto;
DROP INDEX idx_proveedores_nombreProov;
DROP INDEX idx_resenas_idPel;


--vistas

DROP VIEW vista_opiniones_cine;
DROP VIEW vista_empleados;
DROP VIEW vista_proveedores;
DROP VIEW vista_resenas_peliculas;
DROP VIEW vista_boletos_pelicula;
DROP VIEW vista_gasto_persona;



-- **************************************COMPONENTES************************
--CRUDE

--PK_OPINIONES
CREATE OR REPLACE PACKAGE PK_OPINIONES AS

    PROCEDURE adicionarOpinionCine(
        p_codigoOp IN OpinionesCine.codigoOp%TYPE, 
        p_comentario IN OpinionesCine.comentario%TYPE, 
        p_calificacion IN OpinionesCine.calificacion%TYPE,
        p_documento IN OpinionesCine.documento%TYPE, 
        p_tipoDoc IN OpinionesCine.documento%TYPE
    );

    PROCEDURE modificarOpinionCine(
        p_codigoOp IN OpinionesCine.codigoOp%TYPE, 
        p_comentario IN OpinionesCine.comentario%TYPE, 
        p_calificacion IN OpinionesCine.calificacion%TYPE
    );

    PROCEDURE eliminarOpinionCine(
        p_codigoOp IN OpinionesCine.codigoOp%TYPE
    );

    PROCEDURE consultarOpinionCine;

    PROCEDURE adicionarCliente(
        p_documento IN clientes.documento%TYPE,
        p_tipoDoc IN clientes.tipoDoc%TYPE,
        p_nombreApellido IN clientes.nombreApellido%TYPE,
        p_correo IN clientes.correo%TYPE,
        p_telefono IN clientes.telefono%TYPE
    );

    PROCEDURE modificarCliente(
        p_documento IN clientes.documento%TYPE,
        p_tipoDoc IN clientes.tipoDoc%TYPE,
        p_nombreApellido IN clientes.nombreApellido%TYPE,
        p_correo IN clientes.correo%TYPE,
        p_telefono IN clientes.telefono%TYPE
    );

    PROCEDURE consultarCliente;

END PK_OPINIONES;
/

-- PK_EMPLEADOS ========================================
CREATE OR REPLACE PACKAGE PK_EMPLEADOS AS

    CURSOR informacionEmpleados IS
        SELECT documentoE, tipoDoc, nombre, salario, correoElectronico, eps, direccion
        FROM empleados;

    PROCEDURE adicionarEmpleado(
        p_documentoE IN empleados.documentoE%TYPE, 
        p_tipoDoc IN empleados.tipoDoc%TYPE, 
        p_nombre IN empleados.nombre%TYPE, 
        p_salario IN empleados.salario%TYPE, 
        p_correoElectronico IN empleados.correoElectronico%TYPE, 
        p_eps IN empleados.eps%TYPE, 
        p_direccion IN empleados.direccion%TYPE
    );

    PROCEDURE modificarEmpleado(
        p_documentoE IN empleados.documentoE%TYPE, 
        p_tipoDoc IN empleados.tipoDoc%TYPE, 
        p_nombre IN empleados.nombre%TYPE, 
        p_salario IN empleados.salario%TYPE, 
        p_correoElectronico IN empleados.correoElectronico%TYPE, 
        p_eps IN empleados.eps%TYPE, 
        p_direccion IN empleados.direccion%TYPE
    );

    PROCEDURE eliminarEmpleado(p_documentoE IN empleados.documentoE%TYPE);

    PROCEDURE consultarEmpleado(p_documentoE IN empleados.documentoE%TYPE);

END PK_EMPLEADOS;
/

--PK_VENTAS ===========================
CREATE OR REPLACE PACKAGE PK_VENTAS AS

    CURSOR c_cantidadComida IS
        SELECT codigoPro, producto, precioUnitario, idProov
        FROM comidas;
    
    PROCEDURE adicionarComida(
        p_codigoPro IN comidas.codigoPro%TYPE,
        p_producto IN comidas.producto%TYPE,
        p_precioUnitario IN comidas.precioUnitario%TYPE,
        p_idProov IN comidas.idProov%TYPE
    );

    PROCEDURE modificarComida(
        p_codigoPro IN comidas.codigoPro%TYPE,
        p_producto IN comidas.producto%TYPE,
        p_precioUnitario IN comidas.precioUnitario%TYPE,
        p_idProov IN comidas.idProov%TYPE
    );

    PROCEDURE eliminarComida(
        p_codigoPro IN comidas.codigoPro%TYPE
    );

    PROCEDURE consultarComida(p_codigoPro IN comidas.codigoPro%TYPE);

    FUNCTION cantidadDinero RETURN SYS_REFCURSOR;

    FUNCTION cantidadBoletos RETURN SYS_REFCURSOR;

    PROCEDURE adicionarCompra(
    p_idCom       IN compras.idCom%TYPE,
    p_valor       IN compras.valor%TYPE,
    p_metodoPago  IN compras.metodoPago%TYPE,
    p_fechaHora   IN compras.fechaHora%TYPE,
    p_documento   IN compras.documento%TYPE,
    p_tipoDoc     IN compras.tipoDoc%TYPE
    );

    FUNCTION consultarCompra(
        p_documento IN compras.documento%TYPE,
        p_tipoDoc   IN compras.tipoDoc%TYPE
    ) RETURN SYS_REFCURSOR;

    FUNCTION consultarProvedores RETURN SYS_REFCURSOR;

    PROCEDURE adicionarFuncion(
        p_idFun     IN funciones.idFun%TYPE,
        p_fechaHora IN funciones.fechaHora%TYPE,
        p_idioma    IN funciones.idioma%TYPE,
        p_idPel     IN funciones.idPel%TYPE,
        p_subtitulos IN funciones.subtitulos%TYPE
    );

    PROCEDURE modificarFuncion(
        p_idFun     IN funciones.idFun%TYPE,
        p_fechaHora IN funciones.fechaHora%TYPE,
        p_idioma    IN funciones.idioma%TYPE,
        p_idPel     IN funciones.idPel%TYPE,
        p_subtitulos IN funciones.subtitulos%TYPE
    );

    PROCEDURE eliminarFuncion(p_idFun IN funciones.idFun%TYPE);

    PROCEDURE consultarFuncion(p_idFun IN funciones.idFun%TYPE);

    PROCEDURE adicionarBoleto(
        p_idBol   IN boletos.idBol%TYPE,
        p_asiento IN boletos.asiento%TYPE,
        p_precioB IN boletos.precioB%TYPE,
        p_categoria IN boletos.categoria%TYPE,
        p_idFun   IN boletos.idFun%TYPE,
        p_idCom   IN boletos.idCom%TYPE,
        p_DocumentoE IN boletos.DocumentoE%TYPE,
        p_tipoDoc IN boletos.tipoDoc%TYPE
    );

    PROCEDURE adicionarProveedor(
        p_idProov IN proveedores.idProov%TYPE,
        p_nombreProov IN proveedores.nombreProov%TYPE
    );

    PROCEDURE eliminarProveedor(p_idProov IN proveedores.idProov%TYPE);

    PROCEDURE adicionarDetalleCompra(
        p_idCom IN detalleCompras.idCom%TYPE,
        p_codigoPro detalleCompras.codigoPro%TYPE,
        p_cantidad detalleCompras.cantidad%TYPE
    );
END PK_VENTAS;
/

--PK_PELICULAS
--PK_PELICULAS
CREATE OR REPLACE PACKAGE PK_PELICULAS AS

    FUNCTION obtenerTodasResenas RETURN SYS_REFCURSOR; 

    PROCEDURE adicionarPelicula(
        p_idPel  IN peliculas.idPel%TYPE,
        p_nombre IN peliculas.nombre%TYPE,
        p_duracion IN peliculas.duracion%TYPE,
        p_CategoriaEdad IN peliculas.CategoriaEdad%TYPE,
        p_anio IN peliculas.anio%TYPE,
        p_informacion IN XMLTYPE -- Añadido el nuevo parámetro
    );

    PROCEDURE modificarPelicula(
        p_idPel  IN peliculas.idPel%TYPE,
        p_nombre IN peliculas.nombre%TYPE,
        p_duracion IN peliculas.duracion%TYPE,
        p_CategoriaEdad IN peliculas.CategoriaEdad%TYPE,
        p_anio IN peliculas.anio%TYPE,
        p_informacion IN XMLTYPE -- Añadido el nuevo parámetro
    );

    PROCEDURE consultarPelicula;

    PROCEDURE adicionarResena(
        p_codigoResena IN resenas.codigoResena%TYPE,
        p_fecha IN resenas.fecha%TYPE,
        p_mensaje IN resenas.mensaje%TYPE,
        p_puntuacion IN resenas.puntuacion%TYPE,
        p_documento IN resenas.documento%TYPE,
        p_tipoDoc IN resenas.tipoDoc%TYPE,
        p_idPel IN resenas.idPel%TYPE
    );

    PROCEDURE eliminarResena(p_codigoResena IN resenas.codigoResena%TYPE);

    PROCEDURE consultarResena;

END PK_PELICULAS;
/


--PK_SALA
CREATE OR REPLACE PACKAGE PK_SALAS AS

    PROCEDURE adicionarSala(
        p_idSal IN salas.idSal%TYPE,
        p_capacidad salas.capacidad%TYPE,
        p_tipoSala salas.tipoSala%TYPE,
        p_idFun salas.idFun%TYPE
    );

    PROCEDURE modificarSala(
        p_idSal IN salas.idSal%TYPE,
        p_capacidad salas.capacidad%TYPE,
        p_tipoSala salas.tipoSala%TYPE,
        p_idFun salas.idFun%TYPE
    );

    PROCEDURE eliminarSala(p_idSal IN salas.idSal%TYPE);

    PROCEDURE consultarSala;
END PK_SALAS;
/

--Componentes
--CRUDI

--PK_OPINIONES
CREATE OR REPLACE PACKAGE BODY PK_OPINIONES AS

    PROCEDURE adicionarOpinionCine(
        p_codigoOp IN OpinionesCine.codigoOp%TYPE, 
        p_comentario IN OpinionesCine.comentario%TYPE, 
        p_calificacion IN OpinionesCine.calificacion%TYPE,
        p_documento IN OpinionesCine.documento%TYPE, 
        p_tipoDoc IN OpinionesCine.documento%TYPE
    ) IS
    BEGIN
        INSERT INTO OpinionesCine (
            codigoOp, comentario, calificacion, documento, tipoDoc
        ) VALUES (
            p_codigoOp, p_comentario, p_calificacion, p_documento, p_tipoDoc
        );
    END adicionarOpinionCine;

    PROCEDURE modificarOpinionCine (
        p_codigoOp IN OpinionesCine.codigoOp%TYPE, 
        p_comentario IN OpinionesCine.comentario%TYPE, 
        p_calificacion IN OpinionesCine.calificacion%TYPE
    ) IS
    BEGIN
        UPDATE OpinionesCine
        SET 
            comentario = p_comentario,
            calificacion = p_calificacion
        WHERE codigoOp = p_codigoOp;
    END modificarOpinionCine;

    PROCEDURE eliminarOpinionCine(
        p_codigoOp IN OpinionesCine.codigoOp%TYPE
    ) IS
    BEGIN
        DELETE FROM OpinionesCine
        WHERE codigoOp = p_codigoOp;
    END eliminarOpinionCine;

    PROCEDURE consultarOpinionCine IS
    BEGIN
        FOR rec IN (SELECT * FROM OpinionesCine) LOOP
            DBMS_OUTPUT.PUT_LINE('Cï¿½digo: ' || rec.codigoOp || ', Comentario: ' || rec.comentario || ', Calificaciï¿½n: ' || rec.calificacion);
        END LOOP;
    END consultarOpinionCine;

    PROCEDURE adicionarCliente(
        p_documento IN clientes.documento%TYPE,
        p_tipoDoc IN clientes.tipoDoc%TYPE,
        p_nombreApellido IN clientes.nombreApellido%TYPE,
        p_correo IN clientes.correo%TYPE,
        p_telefono IN clientes.telefono%TYPE
    ) IS
    BEGIN
        INSERT INTO clientes (
            documento, tipoDoc, nombreApellido, correo, telefono
        ) VALUES (
            p_documento, p_tipoDoc, p_nombreApellido, p_correo, p_telefono
        );
    END adicionarCliente;

    PROCEDURE modificarCliente (
        p_documento IN clientes.documento%TYPE,
        p_tipoDoc IN clientes.tipoDoc%TYPE,
        p_nombreApellido IN clientes.nombreApellido%TYPE,
        p_correo IN clientes.correo%TYPE,
        p_telefono IN clientes.telefono%TYPE
    ) IS
    BEGIN
        UPDATE clientes
        SET 
            tipoDoc = p_tipoDoc,
            nombreApellido = p_nombreApellido,
            correo = p_correo,
            telefono = p_telefono
        WHERE documento = p_documento;
    END modificarCliente;

    PROCEDURE consultarCliente IS
    BEGIN
        FOR rec IN (SELECT * FROM clientes) LOOP
            DBMS_OUTPUT.PUT_LINE('Documento: ' || rec.documento || 
                                 ', Tipo Documento: ' || rec.tipoDoc || 
                                 ', Nombre y Apellido: ' || rec.nombreApellido || 
                                 ', Correo: ' || rec.correo || 
                                 ', TelÃ©fono: ' || rec.telefono);
        END LOOP;
    END consultarCliente;

END PK_OPINIONES;
/

-- PK_EMPLEADOS ===========================================

CREATE OR REPLACE PACKAGE BODY PK_EMPLEADOS AS

    PROCEDURE adicionarEmpleado(
        p_documentoE IN empleados.documentoE%TYPE, 
        p_tipoDoc IN empleados.tipoDoc%TYPE, 
        p_nombre IN empleados.nombre%TYPE, 
        p_salario IN empleados.salario%TYPE, 
        p_correoElectronico IN empleados.correoElectronico%TYPE, 
        p_eps IN empleados.eps%TYPE, 
        p_direccion IN empleados.direccion%TYPE
    ) IS
    BEGIN
        INSERT INTO empleados (documentoE, tipoDoc, nombre, salario, correoElectronico, eps, direccion)
        VALUES (p_documentoE, p_tipoDoc, p_nombre, p_salario, p_correoElectronico, p_eps, p_direccion);
    END adicionarEmpleado;

    PROCEDURE modificarEmpleado(
        p_documentoE IN empleados.documentoE%TYPE, 
        p_tipoDoc IN empleados.tipoDoc%TYPE, 
        p_nombre IN empleados.nombre%TYPE, 
        p_salario IN empleados.salario%TYPE, 
        p_correoElectronico IN empleados.correoElectronico%TYPE, 
        p_eps IN empleados.eps%TYPE, 
        p_direccion IN empleados.direccion%TYPE
    ) IS
    BEGIN
        UPDATE empleados
        SET tipoDoc = p_tipoDoc,
            nombre = p_nombre,
            salario = p_salario,
            correoElectronico = p_correoElectronico,
            eps = p_eps,
            direccion = p_direccion
        WHERE documentoE = p_documentoE;
    END modificarEmpleado;

    PROCEDURE eliminarEmpleado(p_documentoE IN empleados.documentoE%TYPE) IS
    BEGIN
        DELETE FROM empleados WHERE documentoE = p_documentoE;
    END eliminarEmpleado;

    PROCEDURE consultarEmpleado(p_documentoE IN empleados.documentoE%TYPE) IS
        v_tipoDoc empleados.tipoDoc%TYPE;
        v_nombre empleados.nombre%TYPE;
        v_salario empleados.salario%TYPE;
        v_correoElectronico empleados.correoElectronico%TYPE;
        v_eps empleados.eps%TYPE;
        v_direccion empleados.direccion%TYPE;
    BEGIN
        SELECT tipoDoc, nombre, salario, correoElectronico, eps, direccion
        INTO v_tipoDoc, v_nombre, v_salario, v_correoElectronico, v_eps, v_direccion
        FROM empleados
        WHERE documentoE = p_documentoE;
        
        DBMS_OUTPUT.PUT_LINE('Empleado: ' || v_nombre);
        DBMS_OUTPUT.PUT_LINE('Tipo de Documento: ' || v_tipoDoc);
        DBMS_OUTPUT.PUT_LINE('Salario: ' || v_salario);
        DBMS_OUTPUT.PUT_LINE('Correo Electrï¿½nico: ' || v_correoElectronico);
        DBMS_OUTPUT.PUT_LINE('EPS: ' || v_eps);
        DBMS_OUTPUT.PUT_LINE('Direcciï¿½n: ' || v_direccion);
    END consultarEmpleado;
END PK_EMPLEADOS;
/

--PK_VENTAS
CREATE OR REPLACE PACKAGE BODY PK_VENTAS AS

    PROCEDURE adicionarComida(
        p_codigoPro IN comidas.codigoPro%TYPE,
        p_producto IN comidas.producto%TYPE,
        p_precioUnitario IN comidas.precioUnitario%TYPE,
        p_idProov IN comidas.idProov%TYPE
    ) IS
    BEGIN
        INSERT INTO comidas (
            codigoPro, producto, precioUnitario, idProov
        ) VALUES (
            p_codigoPro, p_producto, p_precioUnitario, p_idProov
        );
    END adicionarComida;

    PROCEDURE modificarComida(
        p_codigoPro IN comidas.codigoPro%TYPE,
        p_producto IN comidas.producto%TYPE,
        p_precioUnitario IN comidas.precioUnitario%TYPE,
        p_idProov IN comidas.idProov%TYPE
    ) IS
    BEGIN
        UPDATE comidas
        SET producto = p_producto,
            precioUnitario = p_precioUnitario,
            idProov = p_idProov
        WHERE codigoPro = p_codigoPro;
    END modificarComida;

    PROCEDURE eliminarComida(
       p_codigoPro IN comidas.codigoPro%TYPE
    ) IS
    BEGIN
        DELETE FROM comidas
        WHERE codigoPro = p_codigoPro;
    END eliminarComida;

    PROCEDURE consultarComida(
        p_codigoPro IN comidas.codigoPro%TYPE
    ) IS
        v_codigoPro comidas.codigoPro%TYPE;
        v_producto comidas.producto%TYPE;
        v_precioUnitario comidas.precioUnitario%TYPE;
        v_idProov comidas.idProov%TYPE;
    BEGIN
        SELECT codigoPro, producto, precioUnitario, idProov
        INTO v_codigoPro, v_producto, v_precioUnitario, v_idProov
        FROM comidas
        WHERE codigoPro = p_codigoPro;

        DBMS_OUTPUT.PUT_LINE('Cï¿½digo: ' || v_codigoPro);
        DBMS_OUTPUT.PUT_LINE('Producto: ' || v_producto);
        DBMS_OUTPUT.PUT_LINE('Precio Unitario: ' || v_precioUnitario);
        DBMS_OUTPUT.PUT_LINE('ID Proveedor: ' || v_idProov);
    END consultarComida;

    FUNCTION cantidadDinero RETURN SYS_REFCURSOR IS
        v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR
            SELECT SUM(valor) AS totalDinero FROM compras;
        RETURN v_cursor;
    END cantidadDinero;

    FUNCTION cantidadBoletos RETURN SYS_REFCURSOR IS
        v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR
            SELECT COUNT(*) AS totalBoletos FROM compras;
        RETURN v_cursor;
    END cantidadBoletos;

    PROCEDURE adicionarCompra(
        p_idCom       IN compras.idCom%TYPE,
        p_valor       IN compras.valor%TYPE,
        p_metodoPago  IN compras.metodoPago%TYPE,
        p_fechaHora   IN compras.fechaHora%TYPE,
        p_documento   IN compras.documento%TYPE,
        p_tipoDoc     IN compras.tipoDoc%TYPE
    ) IS
    BEGIN
        INSERT INTO compras (idCom, valor, metodoPago, fechaHora, documento, tipoDoc)
        VALUES (p_idCom, p_valor, p_metodoPago, p_fechaHora, p_documento, p_tipoDoc);
    END adicionarCompra;

    FUNCTION consultarCompra(
        p_documento IN compras.documento%TYPE,
        p_tipoDoc   IN compras.tipoDoc%TYPE
    ) RETURN SYS_REFCURSOR IS
        v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR
            SELECT * FROM compras
            WHERE documento = p_documento AND tipoDoc = p_tipoDoc;
        RETURN v_cursor;
    END consultarCompra;

    FUNCTION consultarProvedores RETURN SYS_REFCURSOR IS
        v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR
            SELECT idProov, nombreProov
            FROM proveedores;
        RETURN v_cursor;
    END consultarProvedores;

    PROCEDURE adicionarFuncion(
        p_idFun     IN funciones.idFun%TYPE,
        p_fechaHora IN funciones.fechaHora%TYPE,
        p_idioma    IN funciones.idioma%TYPE,
        p_idPel     IN funciones.idPel%TYPE,
        p_subtitulos IN funciones.subtitulos%TYPE
    ) IS
    BEGIN
        INSERT INTO funciones (idFun, fechaHora, idioma, idPel, subtitulos)
        VALUES (p_idFun, p_fechaHora, p_idioma, p_idPel, p_subtitulos);
    END adicionarFuncion;

    PROCEDURE modificarFuncion(
        p_idFun     IN funciones.idFun%TYPE,
        p_fechaHora IN funciones.fechaHora%TYPE,
        p_idioma    IN funciones.idioma%TYPE,
        p_idPel     IN funciones.idPel%TYPE,
        p_subtitulos IN funciones.subtitulos%TYPE
    ) IS
    BEGIN
        UPDATE funciones
        SET fechaHora = p_fechaHora,
            idioma = p_idioma,
            idPel = p_idPel,
            subtitulos = p_subtitulos
        WHERE idFun = p_idFun;
    END modificarFuncion;

    PROCEDURE eliminarFuncion(
        p_idFun IN funciones.idFun%TYPE
    ) IS
    BEGIN
        DELETE FROM funciones
        WHERE idFun = p_idFun;
    END eliminarFuncion;

    PROCEDURE consultarFuncion(
        p_idFun IN funciones.idFun%TYPE
    ) IS
    BEGIN
        FOR rec IN (SELECT idFun, fechaHora, idioma, idPel, subtitulos
                    FROM funciones
                    WHERE idFun = p_idFun) LOOP
        DBMS_OUTPUT.PUT_LINE('ID Funciï¿½n: ' || rec.idFun);
        DBMS_OUTPUT.PUT_LINE('Fecha y Hora: ' || TO_CHAR(rec.fechaHora, 'YYYY-MM-DD HH24:MI:SS'));
        DBMS_OUTPUT.PUT_LINE('Idioma: ' || rec.idioma);
        DBMS_OUTPUT.PUT_LINE('ID Pelï¿½cula: ' || rec.idPel);
        DBMS_OUTPUT.PUT_LINE('Subtï¿½tulos: ' || rec.subtitulos);
        END LOOP;
    END consultarFuncion;

    PROCEDURE adicionarBoleto(
        p_idBol   IN boletos.idBol%TYPE,
        p_asiento IN boletos.asiento%TYPE,
        p_precioB IN boletos.precioB%TYPE,
        p_categoria IN boletos.categoria%TYPE,
        p_idFun   IN boletos.idFun%TYPE,
        p_idCom   IN boletos.idCom%TYPE,
        p_DocumentoE IN boletos.DocumentoE%TYPE,
        p_tipoDoc IN boletos.tipoDoc%TYPE
    ) IS
    BEGIN
        INSERT INTO boletos (
            idBol, asiento, precioB, categoria,idFun,idCom,DocumentoE,tipoDoc) 
        VALUES (
            p_idBol, p_asiento, p_precioB, p_categoria,p_idFun,p_idCom,p_DocumentoE,p_tipoDoc
        );
    END adicionarBoleto;

    PROCEDURE adicionarProveedor(
        p_idProov IN proveedores.idProov%TYPE,
        p_nombreProov IN proveedores.nombreProov%TYPE
    ) IS
    BEGIN
        INSERT INTO proveedores (
            idProov, nombreProov) 
        VALUES (
            p_idProov, p_nombreProov
        );
    END adicionarProveedor;

    PROCEDURE eliminarProveedor(
        p_idProov IN proveedores.idProov%TYPE
    ) IS
    BEGIN
        DELETE FROM proveedores
        WHERE idProov = p_idProov;
    END eliminarProveedor;

    PROCEDURE adicionarDetalleCompra(
        p_idCom IN detalleCompras.idCom%TYPE,
        p_codigoPro detalleCompras.codigoPro%TYPE,
        p_cantidad detalleCompras.cantidad%TYPE
    ) IS
    BEGIN
        INSERT INTO detalleCompras (
            idCom, codigoPro, cantidad) 
        VALUES (
            p_idCom, p_codigoPro, p_cantidad
        );
    END adicionarDetalleCompra;
END PK_VENTAS;
/

--PK_PELICULAS
CREATE OR REPLACE PACKAGE BODY PK_PELICULAS AS

    PROCEDURE adicionarPelicula(
        p_idPel  IN peliculas.idPel%TYPE,
        p_nombre IN peliculas.nombre%TYPE,
        p_duracion IN peliculas.duracion%TYPE,
        p_CategoriaEdad IN peliculas.CategoriaEdad%TYPE,
        p_anio IN peliculas.anio%TYPE,
        p_informacion IN XMLTYPE -- Parámetro añadido
    ) IS
    BEGIN
        INSERT INTO peliculas (idPel, nombre, duracion, CategoriaEdad, anio, informacion)
        VALUES (p_idPel, p_nombre, p_duracion, p_CategoriaEdad, p_anio, p_informacion);
    END adicionarPelicula;

    PROCEDURE modificarPelicula(
        p_idPel  IN peliculas.idPel%TYPE,
        p_nombre IN peliculas.nombre%TYPE,
        p_duracion IN peliculas.duracion%TYPE,
        p_CategoriaEdad IN peliculas.CategoriaEdad%TYPE,
        p_anio IN peliculas.anio%TYPE,
        p_informacion IN XMLTYPE -- Parámetro añadido
    ) IS
    BEGIN
        UPDATE peliculas
        SET nombre = p_nombre,
            duracion = p_duracion,
            CategoriaEdad = p_CategoriaEdad,
            anio = p_anio,
            informacion = p_informacion -- Actualización del campo 'informacion'
        WHERE idPel = p_idPel;
    END modificarPelicula;

    PROCEDURE consultarPelicula IS
    BEGIN
        FOR r IN (SELECT idPel, nombre, anio, informacion FROM peliculas) LOOP
            DBMS_OUTPUT.PUT_LINE('ID: ' || r.idPel || ', Nombre: ' || r.nombre || ', Año: ' || r.anio || ', Información: ' || r.informacion.getStringVal()); -- Convertimos 'informacion' a VARCHAR2
        END LOOP;
    END consultarPelicula;

    PROCEDURE adicionarResena(
        p_codigoResena IN resenas.codigoResena%TYPE,
        p_fecha IN resenas.fecha%TYPE,
        p_mensaje IN resenas.mensaje%TYPE,
        p_puntuacion IN resenas.puntuacion%TYPE,
        p_documento IN resenas.documento%TYPE,
        p_tipoDoc IN resenas.tipoDoc%TYPE,
        p_idPel IN resenas.idPel%TYPE
    ) IS
    BEGIN
        INSERT INTO resenas (codigoResena, fecha, mensaje, puntuacion, documento, tipoDoc, idPel)
        VALUES (p_codigoResena, p_fecha, p_mensaje, p_puntuacion, p_documento, p_tipoDoc, p_idPel);
    END adicionarResena;

    PROCEDURE eliminarResena(p_codigoResena IN resenas.codigoResena%TYPE) IS
    BEGIN
        DELETE FROM resenas WHERE codigoResena = p_codigoResena;
    END eliminarResena;

    PROCEDURE consultarResena IS
    BEGIN
        FOR r IN (SELECT codigoResena, mensaje, puntuacion FROM resenas) LOOP
            DBMS_OUTPUT.PUT_LINE('Código: ' || r.codigoResena || ', Mensaje: ' || r.mensaje || ', Puntuación: ' || r.puntuacion);
        END LOOP;
    END consultarResena;

    FUNCTION obtenerTodasResenas RETURN SYS_REFCURSOR IS
        v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR
        SELECT * FROM resenas;
        RETURN v_cursor;
    END obtenerTodasResenas;

END PK_PELICULAS;
/




-- PK_SALAS ==
CREATE OR REPLACE PACKAGE BODY PK_SALAS AS

    PROCEDURE adicionarSala(
        p_idSal IN salas.idSal%TYPE,
        p_capacidad salas.capacidad%TYPE,
        p_tipoSala salas.tipoSala%TYPE,
        p_idFun salas.idFun%TYPE
    ) IS
    BEGIN
        INSERT INTO salas (idSal, capacidad, tipoSala, idFun)
        VALUES (p_idSal, p_capacidad, p_tipoSala, p_idFun);
    END adicionarSala;

    PROCEDURE modificarSala(
        p_idSal IN salas.idSal%TYPE,
        p_capacidad salas.capacidad%TYPE,
        p_tipoSala salas.tipoSala%TYPE,
        p_idFun salas.idFun%TYPE
    ) IS
    BEGIN
        UPDATE salas
        SET capacidad = p_capacidad,
            tipoSala = p_tipoSala,
            idFun = p_idFun
        WHERE idSal = p_idSal;
    END modificarSala;

    PROCEDURE eliminarSala(p_idSal IN salas.idSal%TYPE) IS
    BEGIN
        DELETE FROM salas WHERE idSal = p_idSal;
    END eliminarSala;

    PROCEDURE consultarSala IS
    BEGIN
        FOR rec IN (SELECT * FROM salas) LOOP
            DBMS_OUTPUT.PUT_LINE('ID Sala: ' || rec.idSal || 
                                 ', Capacidad: ' || rec.capacidad || 
                                 ', Tipo Sala: ' || rec.tipoSala || 
                                 ', ID Funcion: ' || rec.idFun);
        END LOOP;
    END consultarSala;

END PK_SALAS;
/


-- CRUDOK componentes


-- PRUEBA PARA PK_OPINIONES ==
-- Probar adicionarOpinionCine

INSERT INTO clientes (documento, tipoDoc, nombreApellido, correo, telefono) 
VALUES ('123456789', 'CC', 'Nombre del Cliente', 'cliente2@correo.com', '323134');



BEGIN
    PK_OPINIONES.adicionarOpinionCine(
        p_codigoOp => 10, 
        p_comentario => 'Excelente película.', 
        p_calificacion => 'Excelente', 
        p_documento => '123456789', 
        p_tipoDoc => 'CC'
    );
END;

-- Probar modificarOpinionCine
BEGIN
    PK_OPINIONES.modificarOpinionCine(
        p_codigoOp => 1, 
        p_comentario => 'Muy buena película, pero podría mejorar el ritmo.', 
        p_calificacion => 'Malo'
    );
END;

-- Probar eliminarOpinionCine
BEGIN
    PK_OPINIONES.eliminarOpinionCine(p_codigoOp => 1);
END;

-- Probar consultarOpinionCine
BEGIN
    PK_OPINIONES.consultarOpinionCine;
END;

-- Probar adicionarCliente
BEGIN
    PK_OPINIONES.adicionarCliente(
        p_documento => '987654321', 
        p_tipoDoc => 'CC', 
        p_nombreApellido => 'Juan Pérez', 
        p_correo => 'juan.perez2@email.com', 
        p_telefono => '3001234567'
    );
END;

-- Probar modificarCliente
BEGIN
    PK_OPINIONES.modificarCliente(
        p_documento => '987654321', 
        p_tipoDoc => 'CC', 
        p_nombreApellido => 'Juan Pérez González', 
        p_correo => 'juan.perez2.gonzalez@email.com', 
        p_telefono => '3007654321'
    );
END;

-- Probar consultarCliente
BEGIN
    PK_OPINIONES.consultarCliente;
END;


-- PRUEBA PARA PK_EMPLEADOS ==

-- Probar adicionarEmpleado
BEGIN
    PK_EMPLEADOS.adicionarEmpleado(
        p_documentoE => '123', 
        p_tipoDoc => 'CC', 
        p_nombre => 'Carlos García', 
        p_salario => 2500, 
        p_correoElectronico => 'carlos2.garcia@email.com', 
        p_eps => 'EPS1', 
        p_direccion => 'Calle 123'
    );
END;

-- Probar modificarEmpleado
BEGIN
    PK_EMPLEADOS.modificarEmpleado(
        p_documentoE => '123', 
        p_tipoDoc => 'CC', 
        p_nombre => 'Carlos García López', 
        p_salario => 2700, 
        p_correoElectronico => 'carlos.garcia7.lopez@email.com', 
        p_eps => 'EPS2', 
        p_direccion => 'Calle 456'
    );
END;

-- Probar eliminarEmpleado
BEGIN
    PK_EMPLEADOS.eliminarEmpleado(p_documentoE => '123');
END;

-- Probar consultarEmpleado
BEGIN
    PK_EMPLEADOS.consultarEmpleado(p_documentoE => '123');
END;


-- PRUEBA PK_VENTAS ==
-- adicionar nuevo producto
BEGIN
    PK_VENTAS.adicionarComida(
        p_codigoPro => 101,
        p_producto => 'Pizza',
        p_precioUnitario => 20.5,
        p_idProov => 5
    );
END;


-- modificar detalles
BEGIN
    PK_VENTAS.modificarComida(
        p_codigoPro => 101,
        p_producto => 'Pizza D',
        p_precioUnitario => 25.0,
        p_idProov => 6
    );
END;

-- eliminar comida
BEGIN
    PK_VENTAS.eliminarComida(p_codigoPro => 101);
END;

--consultar comida
BEGIN
    PK_VENTAS.consultarComida(p_codigoPro => 101);
END;



-- adicionar compra
BEGIN
    PK_VENTAS.adicionarCompra(
        p_idCom => 201,
        p_valor => 50.75,
        p_metodoPago => 'Tarjeta',
        p_fechaHora => TO_DATE('2024-12-07 10:30:00', 'YYYY-MM-DD HH24:MI:SS'),
        p_documento => '123456789',
        p_tipoDoc => 'C.C.'
    );
END;


--consultar compra
DECLARE
    v_cursor SYS_REFCURSOR;
BEGIN
    v_cursor := PK_VENTAS.consultarCompra(
        p_documento => '123456789',
        p_tipoDoc => 'C.C.'
    );
    -- Aquí podrías usar un bucle para extraer y mostrar los resultados
    CLOSE v_cursor;
END;


-- adicionar proveedor
BEGIN
    PK_VENTAS.adicionarProveedor(
        p_idProov => 10,
        p_nombreProov => 'Proveedor ABC'
    );
END;


-- PRUEBA PK_PELICULAS


--adicionar
BEGIN
    PK_PELICULAS.adicionarPelicula(
        p_idPel => '309',
        p_nombre => 'Avatar 2',
        p_duracion => 180,
        p_CategoriaEdad => '13',
        p_anio => SYSDATE,
        p_informacion => XMLTYPE('<informacion>Secuela de Avatar, un viaje a Pandora.</informacion>')
    );
END;

-- modificar

BEGIN
    PK_PELICULAS.modificarPelicula(
        p_idPel => '309',
        p_nombre => 'Avatar 2: The Way of Water',
        p_duracion => 185,
        p_CategoriaEdad => '13',
        p_anio => SYSDATE,
        p_informacion => XMLTYPE('<informacion>Secuela de Avatar, un viaje a Pandora.</informacion>')
    );
END;

--consultar
BEGIN
    PK_PELICULAS.consultarPelicula;
END;

-- adicionar reseña
BEGIN
    PK_PELICULAS.adicionarResena(
        p_codigoResena => '402',
        p_fecha => TO_DATE('2024-12-07', 'YYYY-MM-DD'),
        p_mensaje => 'Excelente película, un espectáculo visual.',
        p_puntuacion => 5,
        p_documento => '123456789',
        p_tipoDoc => 'CC',
        p_idPel => '308'
    );
END;


-- eliminar resena
BEGIN
    PK_PELICULAS.eliminarResena(p_codigoResena => 402);
END;


-- obtener todas las resen
DECLARE
    v_cursor SYS_REFCURSOR;
BEGIN
    v_cursor := PK_PELICULAS.obtenerTodasResenas;
    -- Aquí podrías usar un bucle para extraer y mostrar los resultados
    CLOSE v_cursor;
END;



-- PRUEBA PK_SALAS ==

BEGIN
    PK_SALAS.adicionarSala(
        p_idSal => '101',  
        p_capacidad => 50,
        p_tipoSala => 'IMAX',
        p_idFun => '2001'  
    );
    DBMS_OUTPUT.PUT_LINE('Sala añadida correctamente.');
END;
/

BEGIN
    PK_SALAS.modificarSala(
        p_idSal => '101',  -- idSal como cadena
        p_capacidad => 70,
        p_tipoSala => '3D',
        p_idFun => '2002'  -- idFun como cadena
    );
    DBMS_OUTPUT.PUT_LINE('Sala modificada correctamente.');
END;
/


BEGIN
    PK_SALAS.eliminarSala(
        p_idSal => '101'  -- idSal como cadena
    );
    DBMS_OUTPUT.PUT_LINE('Sala eliminada correctamente.');
END;
/


BEGIN
    PK_SALAS.consultarSala;
END;
/


-- XCRUD


-- Eliminar el paquete PK_PELICULAS
DROP PACKAGE PK_PELICULAS;

-- Eliminar el paquete PK_SALAS
DROP PACKAGE PK_SALAS;

-- Eliminar el paquete PK_OPINIONCINE
DROP PACKAGE PK_OPINIONES;

-- Eliminar el paquete PK_EMPLEADOS
DROP PACKAGE PK_EMPLEADOS;

--Eliminar el paquete PK_VENTAS
DROP PACKAGE PK_VENTAS;

--  ****************************  SEGURIDAD  *************************

-- CRUDE

-- PK_GERENTE_GENERAL===
CREATE OR REPLACE PACKAGE PK_GERENTE_GENERAL AS
  FUNCTION Opiniones_opinionesCine RETURN SYS_REFCURSOR;
END PK_GERENTE_GENERAL;
/

-- PK_GERENTE_RECURSOS_HUMANOS
CREATE OR REPLACE PACKAGE PK_GERENTE_RECURSOS_HUMANOS AS
  FUNCTION Empleados_informacionEmpleados RETURN SYS_REFCURSOR;
END PK_GERENTE_RECURSOS_HUMANOS;
/


-- PK_DIRECTOR_DE_FINANZAS ===
CREATE OR REPLACE PACKAGE PK_DIRECTOR_FINANZAS AS
  FUNCTION Ventas_ventasComida RETURN SYS_REFCURSOR;

  FUNCTION Ventas_ventasPelicula RETURN SYS_REFCURSOR;
END PK_DIRECTOR_FINANZAS;
/


--PK_SUPERVISOR_ALMACEN ===
CREATE OR REPLACE PACKAGE PK_SUPERVISOR_ALMACEN AS
  FUNCTION Ventas_ConsultarProveedores RETURN SYS_REFCURSOR;
END PK_SUPERVISOR_ALMACEN;
/

--PK_MARKETER
CREATE OR REPLACE PACKAGE PK_MARKETER AS
  FUNCTION Peliculas_resenasPeliculas RETURN SYS_REFCURSOR;
END PK_MARKETER;
/

--PK_CAJERO
CREATE OR REPLACE PACKAGE PK_CAJERO IS
  PROCEDURE Ventas_adicionarCompra(
    p_idCom      IN compras.idCom%TYPE,
    p_valor      IN compras.valor%TYPE,
    p_metodoPago IN compras.metodoPago%TYPE,
    p_fechaHora  IN compras.fechaHora%TYPE,
    p_documento  IN compras.documento%TYPE,
    p_tipoDoc    IN compras.tipoDoc%TYPE
  );

  PROCEDURE Ventas_consultarCompra(
    p_documento IN compras.documento%TYPE,
    p_tipoDoc   IN compras.tipoDoc%TYPE
  );

  PROCEDURE Ventas_adicionarComida(
    p_codigoPro      IN comidas.codigoPro%TYPE,
    p_producto       IN comidas.producto%TYPE,
    p_precioUnitario IN comidas.precioUnitario%TYPE,
    p_idProov        IN comidas.idProov%TYPE
  );

  PROCEDURE Ventas_modificarComida(
    p_codigoPro      IN comidas.codigoPro%TYPE,
    p_producto       IN comidas.producto%TYPE,
    p_precioUnitario IN comidas.precioUnitario%TYPE,
    p_idProov        IN comidas.idProov%TYPE
  );

  PROCEDURE Ventas_eliminarComida(
    p_codigoPro IN comidas.codigoPro%TYPE
  );

  PROCEDURE Ventas_consultarComida;
END PK_CAJERO;
/

--PK_CLIENTE
CREATE OR REPLACE PACKAGE PK_CLIENTE AS

    PROCEDURE Opiniones_adicionarOpinionesCine(
        p_codigoOp     IN OpinionesCine.codigoOp%TYPE,  
        p_comentario   IN OpinionesCine.comentario%TYPE, 
        p_calificacion IN OpinionesCine.calificacion%TYPE,  
        p_documento    IN OpinionesCine.documento%TYPE,  
        p_tipoDoc      IN OpinionesCine.tipoDoc%TYPE
    );

    PROCEDURE Opiniones_consultarOpinionesCine;

    PROCEDURE Opiniones_modificarOpinionesCine(
        p_codigoOp     IN OpinionesCine.codigoOp%TYPE,   
        p_comentario   IN OpinionesCine.comentario%TYPE, 
        p_calificacion IN OpinionesCine.calificacion%TYPE  
    );

    PROCEDURE Opiniones_eliminarOpinionesCine(
        p_codigoOp IN OpinionesCine.codigoOp%TYPE  
    );

END PK_CLIENTE;
/

--PK_ADMINISTRADOR
CREATE OR REPLACE PACKAGE PK_ADMINISTRADOR AS

    PROCEDURE Empleados_adicionarEmpleados(
        p_documentoE IN empleados.documentoE%TYPE, 
        p_tipoDoc IN empleados.tipoDoc%TYPE, 
        p_nombre IN empleados.nombre%TYPE, 
        p_salario IN empleados.salario%TYPE, 
        p_correoElectronico IN empleados.correoElectronico%TYPE, 
        p_eps IN empleados.eps%TYPE, 
        p_direccion IN empleados.direccion%TYPE
    );

    PROCEDURE Empleados_consultarEmpleados(p_documentoE IN empleados.documentoE%TYPE
    );

    PROCEDURE Empleados_modificarEmpleados(
        p_documentoE IN empleados.documentoE%TYPE, 
        p_tipoDoc IN empleados.tipoDoc%TYPE, 
        p_nombre IN empleados.nombre%TYPE, 
        p_salario IN empleados.salario%TYPE, 
        p_correoElectronico IN empleados.correoElectronico%TYPE, 
        p_eps IN empleados.eps%TYPE, 
        p_direccion IN empleados.direccion%TYPE
    );

    PROCEDURE Empleados_eliminarEmpleados(p_documentoE IN empleados.documentoE%TYPE);

    PROCEDURE Ventas_adicionarFunciones(
        p_idFun IN funciones.idFun%TYPE,
        p_fechaHora IN funciones.fechaHora%TYPE,
        p_idioma IN funciones.idioma%TYPE,
        p_idPel IN funciones.idPel%TYPE,
        p_subtitulos IN funciones.subtitulos%TYPE
    );

    PROCEDURE Ventas_consultarFunciones(
        p_idFun IN funciones.idFun%TYPE 
    );

    PROCEDURE Ventas_modificarFunciones(
        p_idFun IN funciones.idFun%TYPE,
        p_fechaHora IN funciones.fechaHora%TYPE,
        p_idioma IN funciones.idioma%TYPE,
        p_idPel IN funciones.idPel%TYPE,
        p_subtitulos IN funciones.subtitulos%TYPE
    );

    PROCEDURE Ventas_eliminarFunciones(p_idFun IN funciones.idFun%TYPE);

END PK_ADMINISTRADOR;
/
-- CRUDI 

-- PK_GERENTE_GENERAL===
CREATE OR REPLACE PACKAGE BODY PK_GERENTE_GENERAL AS
  FUNCTION Opiniones_opinionesCine RETURN SYS_REFCURSOR IS
    v_cursor SYS_REFCURSOR;
  BEGIN
    OPEN v_cursor FOR
      SELECT codigoOp, comentario, calificacion, documento, tipoDoc
      FROM OpinionesCine;
    
    RETURN v_cursor;
  END Opiniones_opinionesCine;
END PK_GERENTE_GENERAL;
/

-- PK_GERENTE_RECURSOS_HUMANOS ===
CREATE OR REPLACE PACKAGE BODY PK_GERENTE_RECURSOS_HUMANOS AS
  FUNCTION Empleados_informacionEmpleados RETURN SYS_REFCURSOR IS
    v_cursor SYS_REFCURSOR;
  BEGIN
    OPEN v_cursor FOR
      SELECT documentoE, nombre, salario
      FROM empleados;
    
    RETURN v_cursor;
  END Empleados_informacionEmpleados;
END PK_GERENTE_RECURSOS_HUMANOS;
/

-- PK_DIRECTOR_FIANZAS =
CREATE OR REPLACE PACKAGE BODY PK_DIRECTOR_FINANZAS AS
  FUNCTION Ventas_ventasComida RETURN SYS_REFCURSOR IS
    v_cursor SYS_REFCURSOR;
  BEGIN
    OPEN v_cursor FOR
      SELECT c.producto, d.cantidad, c.precioUnitario * d.cantidad AS total
      FROM detalleCompras d
      JOIN comidas c ON d.codigoPro = c.codigoPro
      JOIN compras co ON d.idCom = co.idCom;
    
    RETURN v_cursor;
  END Ventas_ventasComida;
  
  FUNCTION Ventas_ventasPelicula RETURN SYS_REFCURSOR IS
    v_cursor SYS_REFCURSOR;
  BEGIN
    OPEN v_cursor FOR
      SELECT b.asiento, b.precioB, b.precioB * COUNT(b.idBol) AS total
      FROM boletos b
      JOIN compras co ON b.idCom = co.idCom
      GROUP BY b.asiento, b.precioB;
    
    RETURN v_cursor;
  END Ventas_ventasPelicula;
  
END PK_DIRECTOR_FINANZAS;
/

-- PK_SUPERVISOR_ALMACEN ====
CREATE OR REPLACE PACKAGE BODY PK_SUPERVISOR_ALMACEN AS
  FUNCTION Ventas_ConsultarProveedores RETURN SYS_REFCURSOR IS
  BEGIN
    RETURN PK_VENTAS.consultarProvedores;
  END Ventas_ConsultarProveedores;
END PK_SUPERVISOR_ALMACEN;
/

-- PK_MARKETER
CREATE OR REPLACE PACKAGE BODY PK_MARKETER AS
  FUNCTION Peliculas_resenasPeliculas RETURN SYS_REFCURSOR IS
  BEGIN
    RETURN PK_PELICULAS.obtenerTodasResenas;
  END Peliculas_resenasPeliculas;
END PK_MARKETER;
/
--PK_CAJERO
CREATE OR REPLACE PACKAGE BODY PK_CAJERO IS

  PROCEDURE Ventas_adicionarCompra(
    p_idCom      IN compras.idCom%TYPE,
    p_valor      IN compras.valor%TYPE,
    p_metodoPago IN compras.metodoPago%TYPE,
    p_fechaHora  IN compras.fechaHora%TYPE,
    p_documento  IN compras.documento%TYPE,
    p_tipoDoc    IN compras.tipoDoc%TYPE
  ) IS
  BEGIN
    PK_VENTAS.adicionarCompra(p_idCom, p_valor, p_metodoPago, p_fechaHora, p_documento, p_tipoDoc);
  END Ventas_adicionarCompra;

  PROCEDURE Ventas_consultarCompra(
    p_documento IN compras.documento%TYPE,
    p_tipoDoc   IN compras.tipoDoc%TYPE
  ) IS
    v_cursor SYS_REFCURSOR;
  BEGIN
    v_cursor := PK_VENTAS.consultarCompra(p_documento, p_tipoDoc);
    DBMS_SQL.RETURN_RESULT(v_cursor);
  END Ventas_consultarCompra;

  PROCEDURE Ventas_adicionarComida(
    p_codigoPro      IN comidas.codigoPro%TYPE,
    p_producto       IN comidas.producto%TYPE,
    p_precioUnitario IN comidas.precioUnitario%TYPE,
    p_idProov        IN comidas.idProov%TYPE
  ) IS
  BEGIN
    PK_VENTAS.adicionarComida(p_codigoPro, p_producto, p_precioUnitario, p_idProov);
  END Ventas_adicionarComida;

  PROCEDURE Ventas_modificarComida(
    p_codigoPro      IN comidas.codigoPro%TYPE,
    p_producto       IN comidas.producto%TYPE,
    p_precioUnitario IN comidas.precioUnitario%TYPE,
    p_idProov        IN comidas.idProov%TYPE
  ) IS
  BEGIN
    PK_VENTAS.modificarComida(p_codigoPro, p_producto, p_precioUnitario, p_idProov);
  END Ventas_modificarComida;

  PROCEDURE Ventas_eliminarComida(
    p_codigoPro IN comidas.codigoPro%TYPE
  ) IS
  BEGIN
    PK_VENTAS.eliminarComida(p_codigoPro);
  END Ventas_eliminarComida;

  PROCEDURE Ventas_consultarComida IS
    v_codigoPro comidas.codigoPro%TYPE;
    v_producto comidas.producto%TYPE;
    v_precioUnitario comidas.precioUnitario%TYPE;
    v_idProov comidas.idProov%TYPE;
  BEGIN
    PK_VENTAS.consultarComida(v_codigoPro);

    DBMS_OUTPUT.PUT_LINE('Código: ' || v_codigoPro);
    DBMS_OUTPUT.PUT_LINE('Producto: ' || v_producto);
    DBMS_OUTPUT.PUT_LINE('Precio Unitario: ' || v_precioUnitario);
    DBMS_OUTPUT.PUT_LINE('ID Proveedor: ' || v_idProov);
  END Ventas_consultarComida;

END PK_CAJERO;
/



--PK_CLIENTE
CREATE OR REPLACE PACKAGE BODY PK_CLIENTE AS

    PROCEDURE Opiniones_adicionarOpinionesCine(
        p_codigoOp     IN OpinionesCine.codigoOp%TYPE,  
        p_comentario   IN OpinionesCine.comentario%TYPE, 
        p_calificacion IN OpinionesCine.calificacion%TYPE,  
        p_documento    IN OpinionesCine.documento%TYPE,  
        p_tipoDoc      IN OpinionesCine.tipoDoc%TYPE
    ) IS
    BEGIN
        PK_OPINIONES.adicionarOpinionCine(p_codigoOp, p_comentario, p_calificacion, p_documento, p_tipoDoc);
    END Opiniones_adicionarOpinionesCine;

    PROCEDURE Opiniones_consultarOpinionesCine
    IS
    BEGIN
        PK_OPINIONES.consultarOpinionCine;
    END Opiniones_consultarOpinionesCine;

    PROCEDURE Opiniones_modificarOpinionesCine(
        p_codigoOp     IN OpinionesCine.codigoOp%TYPE,   
        p_comentario   IN OpinionesCine.comentario%TYPE, 
        p_calificacion IN OpinionesCine.calificacion%TYPE  
    ) IS
    BEGIN
        PK_OPINIONES.modificarOpinionCine(p_codigoOp, p_comentario, p_calificacion);
    END Opiniones_modificarOpinionesCine;

    PROCEDURE Opiniones_eliminarOpinionesCine(
        p_codigoOp IN OpinionesCine.codigoOp%TYPE  
    ) IS
    BEGIN
        PK_OPINIONES.eliminarOpinionCine(p_codigoOp);
    END Opiniones_eliminarOpinionesCine;

END PK_CLIENTE;
/

--PK_ADMINISTRADOR
CREATE OR REPLACE PACKAGE BODY PK_ADMINISTRADOR AS

    PROCEDURE Empleados_adicionarEmpleados(
        p_documentoE IN empleados.documentoE%TYPE, 
        p_tipoDoc IN empleados.tipoDoc%TYPE, 
        p_nombre IN empleados.nombre%TYPE, 
        p_salario IN empleados.salario%TYPE, 
        p_correoElectronico IN empleados.correoElectronico%TYPE, 
        p_eps IN empleados.eps%TYPE, 
        p_direccion IN empleados.direccion%TYPE
    ) IS
    BEGIN
        PK_EMPLEADOS.adicionarEmpleado(p_documentoE, p_tipoDoc, p_nombre, p_salario, p_correoElectronico, p_eps, p_direccion);
    END Empleados_adicionarEmpleados;

    PROCEDURE Empleados_consultarEmpleados(p_documentoE IN empleados.documentoE%TYPE
    ) IS
    BEGIN
        PK_EMPLEADOS.consultarEmpleado(p_documentoE);
    END Empleados_consultarEmpleados;

    PROCEDURE Empleados_modificarEmpleados(
        p_documentoE IN empleados.documentoE%TYPE, 
        p_tipoDoc IN empleados.tipoDoc%TYPE, 
        p_nombre IN empleados.nombre%TYPE, 
        p_salario IN empleados.salario%TYPE, 
        p_correoElectronico IN empleados.correoElectronico%TYPE, 
        p_eps IN empleados.eps%TYPE, 
        p_direccion IN empleados.direccion%TYPE
    ) IS
    BEGIN
        PK_EMPLEADOS.modificarEmpleado(p_documentoE, p_tipoDoc, p_nombre, p_salario, p_correoElectronico, p_eps, p_direccion);
    END Empleados_modificarEmpleados;

    PROCEDURE Empleados_eliminarEmpleados(p_documentoE IN empleados.documentoE%TYPE) IS
    BEGIN
        PK_EMPLEADOS.eliminarEmpleado(p_documentoE);
    END Empleados_eliminarEmpleados;

    PROCEDURE Ventas_adicionarFunciones(
        p_idFun IN funciones.idFun%TYPE,
        p_fechaHora IN funciones.fechaHora%TYPE,
        p_idioma IN funciones.idioma%TYPE,
        p_idPel IN funciones.idPel%TYPE,
        p_subtitulos IN funciones.subtitulos%TYPE
    ) IS
    BEGIN
        PK_VENTAS.adicionarFuncion(p_idFun, p_fechaHora, p_idioma, p_idPel, p_subtitulos);
    END Ventas_adicionarFunciones;

    PROCEDURE Ventas_consultarFunciones(
        p_idFun IN funciones.idFun%TYPE
    ) IS
    BEGIN
        PK_VENTAS.consultarFuncion(p_idFun);
    END Ventas_consultarFunciones;

    PROCEDURE Ventas_modificarFunciones(
        p_idFun IN funciones.idFun%TYPE,
        p_fechaHora IN funciones.fechaHora%TYPE,
        p_idioma IN funciones.idioma%TYPE,
        p_idPel IN funciones.idPel%TYPE,
        p_subtitulos IN funciones.subtitulos%TYPE
    ) IS
    BEGIN
        PK_VENTAS.modificarFuncion(p_idFun, p_fechaHora, p_idioma, p_idPel, p_subtitulos);
    END Ventas_modificarFunciones;

    PROCEDURE Ventas_eliminarFunciones(p_idFun IN funciones.idFun%TYPE) IS
    BEGIN
        PK_VENTAS.eliminarFuncion(p_idFun);
    END Ventas_eliminarFunciones;

END PK_ADMINISTRADOR;
/

DROP PACKAGE BODY PK_GERENTE_GENERAL;
DROP PACKAGE PK_GERENTE_GENERAL;

DROP PACKAGE BODY PK_GERENTE_RECURSOS_HUMANOS;
DROP PACKAGE PK_GERENTE_RECURSOS_HUMANOS;

DROP PACKAGE BODY PK_DIRECTOR_FINANZAS;
DROP PACKAGE PK_DIRECTOR_FINANZAS;

DROP PACKAGE BODY PK_SUPERVISOR_ALMACEN;
DROP PACKAGE PK_SUPERVISOR_ALMACEN;


