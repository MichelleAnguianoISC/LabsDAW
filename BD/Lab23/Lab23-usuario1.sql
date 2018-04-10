CREATE TABLE Clientes_Banca
(
  NoCuenta varchar(5) NOT NULL PRIMARY KEY,
  Nombre varchar(30),
  Saldo numeric(10,2)
)

CREATE TABLE Tipos_Movimiento
(
  ClaveM varchar(2) PRIMARY KEY,
  Descripcion varchar(30)
)

CREATE TABLE Movimientos
(
  NoCuenta varchar(5) NOT NULL FOREIGN KEY REFERENCES Clientes_Banca(NoCuenta),
  ClaveM varchar(2) NOT NULL FOREIGN KEY REFERENCES Tipos_Movimiento(ClaveM),
  Fecha datetime,
  Monto numeric(10,2)
)

BEGIN TRANSACTION PRUEBA1
INSERT INTO CLIENTES_BANCA VALUES('001', 'Manuel Rios Maldonado', 9000);
INSERT INTO CLIENTES_BANCA VALUES('002', 'Pablo Perez Ortiz', 5000);
INSERT INTO CLIENTES_BANCA VALUES('003', 'Luis Flores Alvarado', 8000);
COMMIT TRANSACTION PRUEBA1

SELECT * FROM CLIENTES_BANCA

SELECT * FROM CLIENTES_BANCA

ROLLBACK TRANSACTION PRUEBA2

BEGIN TRANSACTION PRUEBA3
INSERT INTO TIPOS_MOVIMIENTO VALUES('A','Retiro Cajero Automatico');
INSERT INTO TIPOS_MOVIMIENTO VALUES('B','Deposito Ventanilla');
COMMIT TRANSACTION PRUEBA3

BEGIN TRANSACTION PRUEBA4
INSERT INTO MOVIMIENTOS VALUES('001','A',GETDATE(),500);
UPDATE CLIENTES_BANCA SET SALDO = SALDO -500
WHERE NoCuenta='001'
COMMIT TRANSACTION PRUEBA4

BEGIN TRANSACTION PRUEBA5
INSERT INTO CLIENTES_BANCA VALUES('005','Rosa Ruiz Maldonado',9000);
INSERT INTO CLIENTES_BANCA VALUES('006','Luis Camino Ortiz',5000);
INSERT INTO CLIENTES_BANCA VALUES('001','Oscar Perez Alvarado',8000);

IF @@ERROR = 0
COMMIT TRANSACTION PRUEBA5
ELSE
BEGIN
PRINT 'A transaction needs to be rolled back'
ROLLBACK TRANSACTION PRUEBA5
END

--Stored procedure: Una transacción que registre el retiro de una cajero. nombre del store procedure
-- REGISTRAR_RETIRO_CAJERO que recibe 2 parámetros en NoCuenta y el monto a retirar.
IF EXISTS (
    SELECT name FROM sysobjects
    WHERE name = 'REGISTRAR_RETIRO_CAJERO' AND type = 'P'
)
  DROP PROCEDURE REGISTRAR_RETIRO_CAJERO
GO
CREATE PROCEDURE REGISTRAR_RETIRO_CAJERO
    @NoCuenta varchar(5),
    @Monto numeric(10,2)
AS
  BEGIN TRANSACTION Retiro
    INSERT INTO Movimientos VALUES(@NoCuenta,'A',GETDATE(),@Monto);
    UPDATE CLIENTES_BANCA SET SALDO = SALDO -@Monto
    WHERE NoCuenta=@NoCuenta
    IF @@ERROR = 0
      COMMIT TRANSACTION Retiro
    ELSE
      BEGIN
        PRINT 'A transaction needs to be rolled back'
        ROLLBACK TRANSACTION Retiro
      END
GO

--Una transacción que registre el deposito en ventanilla. Nombre del store procedure
--REGISTRAR_DEPOSITO_VENTANILLA que recibe 2 parámetros en NoCuenta y el monto a depositar.
IF EXISTS (
    SELECT name FROM sysobjects
    WHERE name = 'REGISTRAR_DEPOSITO_CAJERO' AND type = 'P'
)
  DROP PROCEDURE REGISTRAR_DEPOSITO_CAJERO
GO
CREATE PROCEDURE REGISTRAR_DEPOSITO_CAJERO
    @NoCuenta varchar(5),
    @Monto numeric(10,2)
AS
  BEGIN TRANSACTION Deposito
    INSERT INTO Movimientos VALUES(@NoCuenta,'B',GETDATE(),@Monto);
    UPDATE CLIENTES_BANCA SET SALDO = SALDO +@Monto
    WHERE NoCuenta=@NoCuenta
    IF @@ERROR = 0
      COMMIT TRANSACTION Deposito
    ELSE
      BEGIN
        PRINT 'A transaction needs to be rolled back'
        ROLLBACK TRANSACTION Deposito
      END
GO

SELECT * FROM Clientes_Banca
SELECT * FROM Movimientos
EXECUTE REGISTRAR_DEPOSITO_CAJERO '001',2000
SELECT * FROM Clientes_Banca
SELECT * FROM Movimientos