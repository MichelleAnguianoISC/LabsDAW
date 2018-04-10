-- Procedimiento para creaMaterial

IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'creaMaterial' AND type = 'P')
                DROP PROCEDURE creaMaterial
            GO

CREATE PROCEDURE creaMaterial
                @uclave NUMERIC(5,0),
                @udescripcion VARCHAR(50),
                @ucosto NUMERIC(8,2),
                @uimpuesto NUMERIC(6,2)
            AS
                INSERT INTO Materiales VALUES(@uclave, @udescripcion, @ucosto, @uimpuesto)
            GO

EXECUTE creaMaterial 5000,'Martillos Acme',250,15

SELECT * from Materiales

IF EXISTS (SELECT name FROM sysobjects
           WHERE name = 'modificaMaterial' AND type = 'P')
           DROP PROCEDURE modificaMaterial
GO

CREATE PROCEDURE modificaMaterial
    @uclave NUMERIC(5,0),
    @udescripcion VARCHAR(50),
    @ucosto NUMERIC(8,2),
    @uimpuesto NUMERIC(6,2)
AS
    UPDATE Materiales
	SET Descripcion=@udescripcion, Costo=@ucosto, PorcentajeImpuesto=@uimpuesto
	WHERE Clave=@uclave
GO

EXECUTE modificaMaterial 5000,'Martillos Acme',250,20

SELECT * FROM Materiales

IF EXISTS (SELECT name FROM sysobjects
           WHERE name = 'eliminaMaterial' AND type = 'P')
           DROP PROCEDURE eliminaMaterial
GO

CREATE PROCEDURE eliminaMaterial
    @uclave NUMERIC(5,0)
AS
    DELETE FROM Materiales
	WHERE Clave=@uclave
GO

EXECUTE eliminaMaterial 5000

SELECT * FROM Materiales

-- STORED PROCEDURES PROYECTOS

-- creaProyecto

IF EXISTS (SELECT name FROM sysobjects
           WHERE name = 'creaProyecto' AND type = 'P')
           DROP PROCEDURE creaProyecto
GO

CREATE PROCEDURE creaProyecto
    @unumero NUMERIC(5,0),
    @udenominacion VARCHAR(50)
AS
    INSERT INTO Proyectos VALUES(@unumero, @udenominacion)
GO

-- modificaProyecto

IF EXISTS (SELECT name FROM sysobjects
           WHERE name = 'modificaProyecto' AND type = 'P')
           DROP PROCEDURE modificaProyecto
GO

CREATE PROCEDURE modificaProyecto
    @unumero NUMERIC(5,0),
    @udenominacion VARCHAR(50)
AS
    UPDATE Proyectos
	SET Denominacion=@udenominacion
	WHERE Numero=@unumero
GO

-- eliminaProyecto

IF EXISTS (SELECT name FROM sysobjects
           WHERE name = 'eliminaProyecto' AND type = 'P')
           DROP PROCEDURE eliminaProyecto
GO

CREATE PROCEDURE eliminaProyecto
    @unumero NUMERIC(5,0)
AS
    DELETE FROM Proyectos
	WHERE Numero=@unumero
GO

IF EXISTS (SELECT name FROM sysobjects
                                       WHERE name = 'queryMaterial' AND type = 'P')
                                DROP PROCEDURE queryMaterial
                            GO

                            CREATE PROCEDURE queryMaterial
                                @udescripcion VARCHAR(50),
                                @ucosto NUMERIC(8,2)

                            AS
                                SELECT * FROM Materiales WHERE descripcion
                                LIKE '%'+@udescripcion+'%' AND costo > @ucosto
                            GO

EXECUTE queryMaterial 'Lad',20

-- STORED PROCEDURES PROVEEDORES

-- creaProveedor

IF EXISTS (SELECT name FROM sysobjects 
           WHERE name = 'creaProveedor' AND type = 'P')
           DROP PROCEDURE creaProveedor
GO
            
CREATE PROCEDURE creaProveedor
    @urfc CHAR(13),
    @urazonsocial VARCHAR(50)
AS
    INSERT INTO Proveedores VALUES(@urfc, @urazonsocial)
GO

-- modificaProveedor

IF EXISTS (SELECT name FROM sysobjects 
           WHERE name = 'modificaProveedor' AND type = 'P')
           DROP PROCEDURE modificaProveedor
GO
            
CREATE PROCEDURE modificaProveedor
    @urfc CHAR(13),
    @urazonsocial VARCHAR(50)
AS
    UPDATE Proveedores 
	SET RazonSocial=@urazonsocial
	WHERE RFC=@urfc
GO

-- eliminaProveedor

IF EXISTS (SELECT name FROM sysobjects 
           WHERE name = 'eliminaProveedor' AND type = 'P')
           DROP PROCEDURE eliminaProveedor
GO
            
CREATE PROCEDURE eliminaProveedor
    @urfc CHAR(13)
AS
    DELETE FROM Proveedores 
	WHERE RFC=@urfc
GO


-- STORED PROCEDURES ENTREGAN

-- creaEntrega

IF EXISTS (SELECT name FROM sysobjects 
           WHERE name = 'creaEntrega' AND type = 'P')
           DROP PROCEDURE creaEntrega
GO
            
CREATE PROCEDURE creaEntrega
    @uclave NUMERIC(5,0),
	@urfc CHAR(13),
	@unumero NUMERIC(5,0),
	@ufecha DATETIME,
	@ucantidad NUMERIC(8,2)
AS
    INSERT INTO Entregan VALUES(@uclave, @urfc, @unumero, @ufecha, @ucantidad)
GO

SELECT * FROM Entregan

SET DATEFORMAT DMY
EXECUTE creaEntrega 1000,'AAAA800101',5000,'15/06/2017',500

-- modificaEntrega

IF EXISTS (SELECT name FROM sysobjects 
           WHERE name = 'modificaEntrega' AND type = 'P')
           DROP PROCEDURE modificaEntrega
GO
            
CREATE PROCEDURE modificaEntrega
    @uclave NUMERIC(5,0),
	@urfc CHAR(13),
	@unumero NUMERIC(5,0),
	@ufecha DATETIME,
	@ucantidad NUMERIC(8,2)
AS
    UPDATE Entregan 
	SET Cantidad=@ucantidad
	WHERE Clave=@uclave
	AND RFC=@urfc
	AND Numero=@unumero
	AND Fecha=@ufecha
GO

SELECT * FROM Entregan

SET DATEFORMAT DMY
EXECUTE modificaEntrega 1000,'AAAA800101',5000,'15/06/2017',600

-- eliminaEntrega

IF EXISTS (SELECT name FROM sysobjects 
           WHERE name = 'eliminaEntrega' AND type = 'P')
           DROP PROCEDURE eliminaEntrega
GO
            
CREATE PROCEDURE eliminaEntrega
    @uclave NUMERIC(5,0),
	@urfc CHAR(13),
	@unumero NUMERIC(5,0),
	@ufecha DATETIME
AS
    DELETE FROM Entregan 
	WHERE Clave=@uclave
	AND RFC=@urfc
	AND Numero=@unumero
	AND Fecha=@ufecha
GO

SELECT * FROM Entregan

SET DATEFORMAT DMY
EXECUTE eliminaEntrega 1000,'AAAA800101',5000,'15/06/2017'

-- Crear procedimientos para realizar consultas con parámetros 

IF EXISTS (SELECT name FROM sysobjects 
            WHERE name = 'queryMaterial' AND type = 'P')
    DROP PROCEDURE queryMaterial
GO
                            
CREATE PROCEDURE queryMaterial
    @udescripcion VARCHAR(50),
    @ucosto NUMERIC(8,2)                        
AS
    SELECT * FROM Materiales WHERE descripcion 
    LIKE '%'+@udescripcion+'%' AND costo > @ucosto 
GO

EXECUTE queryMaterial 'Lad',20 