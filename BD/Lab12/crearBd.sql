drop TABLE entregan
drop TABLE materiales
drop TABLE proyectos
drop TABLE Proveedores

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Materiales')
  DROP TABLE Materiales

CREATE TABLE Materiales
(
  Clave numeric(5) not null,
  Descripcion varchar(50),
  Costo numeric (8,2)
)

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Proveedores')

CREATE TABLE Proveedores
(
  RFC char(13) not null,
  RazonSocial varchar(50)
)

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Proyectos')

CREATE TABLE Proyectos
(
  Numero numeric(5) not null,
  Denominacion varchar(50)
)

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Entregan')

CREATE TABLE Entregan
(
  Clave numeric(5) not null,
  RFC char(13) not null,
  Numero numeric(5) not null,
  Fecha DateTime not null,
  Cantidad numeric (8,2)
)

BULK INSERT Materiales
  FROM 'e:\wwwroot\a1209529\materiales.csv'
  WITH
  (
    CODEPAGE = 'ACP',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
  )

BULK INSERT Proyectos
  FROM 'e:\wwwroot\a1209529\proyectos.csv'
  WITH
  (
    CODEPAGE = 'ACP',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
  )

BULK INSERT Proveedores
  FROM 'e:\wwwroot\a1209529\proveedores.csv'
  WITH
  (
    CODEPAGE = 'ACP',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
  )

SET DATEFORMAT dmy -- especificar formato de la fecha

BULK INSERT Entregan
  FROM 'e:\wwwroot\a1209529\entregan.csv'
  WITH
  (
    CODEPAGE = 'ACP',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
  )

INSERT INTO Materiales values(1000, 'xxx', 1000)

Delete from Materiales where Clave = 1000 and Costo = 1000

ALTER TABLE Materiales add constraint llaveMateriales PRIMARY KEY (Clave)

INSERT INTO Materiales values(1000, 'xxx', 1000)

sp_helpconstraint materiales

ALTER TABLE Proveedores add constraint llaveProveedores PRIMARY KEY (RFC)

ALTER TABLE Proyectos add constraint llaveProyectos PRIMARY KEY (Numero)

ALTER TABLE Entregan add constraint pk_llaveEntregan PRIMARY KEY (Clave, RFC, Numero, Fecha)

--ALTER TABLE tableName drop constraint ConstraintName (para eliminar el constraint)

SELECT * from Materiales;

SELECT * from Proveedores;

SELECT * from Proyectos;

INSERT INTO Entregan values (0, 'xxx', 0, '1-jan-02', 0);

Delete from Entregan where Clave = 0

ALTER TABLE entregan add constraint cfentreganclave
  foreign key (clave) references materiales(clave);

INSERT INTO Entregan values (0, 'xxx', 0, '1-jan-02', 0);

ALTER TABLE entregan add constraint cfentreganrfc
  foreign key (RFC) references Proveedores(RFC);

ALTER TABLE entregan add constraint cfentregannumero
  foreign key (Numero) references Proyectos(Numero);

sp_helpconstraint Entregan;
sp_helpconstraint Materiales;
sp_helpconstraint Proveedores;
sp_helpconstraint Proyectos;

INSERT INTO entregan values (1000, 'AAAA800101', 5000, GETDATE(), 0);

Delete from Entregan where Cantidad = 0;

ALTER TABLE entregan add constraint cantidad check (cantidad > 0);

INSERT INTO entregan values (1000, 'AAAA800101', 5000, GETDATE(), 0);