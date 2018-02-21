BULK INSERT a1209529.a1209529.[Materiales]
   FROM 'e:\wwwroot\a1209529\materiales.csv'
   WITH
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )

BULK INSERT a1209529.a1209529.[Entregan]
   FROM 'e:\wwwroot\a1209529\entregan.csv'
   WITH
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )

BULK INSERT a1209529.a1209529.[Proveedores]
   FROM 'e:\wwwroot\a1209529\proveedores.csv'
   WITH
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )

BULK INSERT a1209529.a1209529.[Proyectos]
   FROM 'e:\wwwroot\a1209529\proyectos.csv'
   WITH
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )

SET DATEFORMAT dmy
CREATE TABLE Entregan
(
  Clave    NUMERIC(5),
  RFC      CHAR(13),
  Numero   NUMERIC(5),
  Fecha    DATETIME,
  Cantidad NUMERIC(8, 2)
)
GO

SELECT  * FROM Materiales
