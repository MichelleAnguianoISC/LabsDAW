select * from materiales

select * from materiales
where clave=1000

select clave,rfc,fecha from entregan

select * from materiales,entregan
where materiales.clave = entregan.clave

select * from entregan,proyectos
where entregan.numero < = proyectos.numero

(select * from entregan where clave=1450)
union
(select * from entregan where clave=1300)

SELECT *
FROM Entregan
WHERE Clave = 1450 OR Clave = 1300

(select clave from entregan where numero=5001)
intersect
(select clave from entregan where numero=5018)

(select * from entregan)
minus
(select * from entregan where clave=1000)

SELECT *
FROM Entregan
WHERE clave!=1000

select * from entregan,materiales

SET DATEFORMAT DMY
SELECT M.descripcion
FROM Entregan E, Materiales M
WHERE Fecha BETWEEN '01/01/2000' AND '31/12/2000'
AND E.Clave = M.Clave

SET DATEFORMAT DMY
SELECT DISTINCT M.descripcion
FROM Entregan E, Materiales M
WHERE Fecha BETWEEN '01/01/2000' AND '31/12/2000'
AND E.Clave = M.Clave

Select p.numero, p.denominacion, e.fecha, e.cantidad
FROM Proyectos p, Entregan e
WHERE p.Numero = e.Numero
ORDER BY p.Numero, fecha desc

SELECT * FROM Materiales where Descripcion LIKE 'Si%'

--SELECT (Apellido + ', ' + Nombre) as Nombre FROM Personas;

DECLARE @foo varchar(40);
DECLARE @bar varchar(40);
SET @foo = '¿Que resultado';
SET @bar = ' ¿¿¿??? '
SET @foo += ' obtienes?';
PRINT @foo + @bar;

SELECT RFC FROM Entregan WHERE RFC LIKE '[A-D]%';
SELECT RFC FROM Entregan WHERE RFC LIKE '[^A]%';
SELECT Numero FROM Entregan WHERE Numero LIKE '___6';

SELECT Clave,RFC,Numero,Fecha,Cantidad
FROM Entregan
WHERE Numero Between 5000 and 5010;

SET DATEFORMAT DMY
SELECT * FROM Entregan
WHERE Fecha BETWEEN '01/01/1998' AND '31/12/1999'

SELECT RFC,Cantidad, Fecha,Numero
FROM [Entregan]
WHERE [Numero] Between 5000 and 5010 AND
Exists ( SELECT [RFC]
FROM [Proveedores]
WHERE RazonSocial LIKE 'La%' and [Entregan].[RFC] = [Proveedores].[RFC] )

SELECT RFC,Cantidad, Fecha,Numero
FROM [Entregan]
WHERE [Numero] Between 5000 and 5010
AND Entregan.RFC IN (SELECT [RFC]
FROM [Proveedores]
WHERE RazonSocial LIKE 'La%' and [Entregan].[RFC] = [Proveedores].[RFC])

SELECT RFC,Cantidad, Fecha,Numero
FROM [Entregan]
WHERE [Numero] Between 5000 and 5010
AND Entregan.RFC NOT IN (SELECT [RFC]
FROM [Proveedores]
WHERE RazonSocial NOT LIKE 'La%' and [Entregan].[RFC] = [Proveedores].[RFC])

SELECT RFC,Cantidad, Fecha,Numero
FROM [Entregan]
WHERE [Numero] Between 5000 and 5010
AND RFC = ANY ( SELECT [RFC]
FROM [Proveedores]
WHERE RazonSocial LIKE 'La%' and [Entregan].[RFC] = [Proveedores].[RFC] )

SELECT TOP 2 * FROM Proyectos

SELECT TOP 1 Numero FROM Proyectos

ALTER TABLE materiales ADD PorcentajeImpuesto NUMERIC(6,2);

UPDATE materiales SET PorcentajeImpuesto = 2*clave/1000;

SELECT E.Cantidad, M.Costo, M.PorcentajeImpuesto, (Cantidad*Costo)*(1+PorcentajeImpuesto/100) as Importe
FROM Materiales M, Entregan E
WHERE M.Clave = E.Clave

CREATE VIEW [Entregas entre 1998 y 1999] AS
SELECT * FROM Entregan
WHERE Fecha BETWEEN '01/01/1998' AND '31/12/1999'

CREATE VIEW [Entregas con RFC que inicia con letra entre A y D] AS
SELECT RFC FROM Entregan WHERE RFC LIKE '[A-D]%';

CREATE VIEW [Descripcion de materiales entregados en el año 2000] AS
SELECT DISTINCT M.descripcion
FROM Entregan E, Materiales M
WHERE Fecha BETWEEN '01/01/2000' AND '31/12/2000'
AND E.Clave = M.Clave

CREATE VIEW [Entregas con clave 1450 o 1300] AS
SELECT *
FROM Entregan
WHERE Clave = 1450 OR Clave = 1300

CREATE VIEW [Entregas con clave distinta de 1000] AS
SELECT *
FROM Entregan
WHERE clave!=1000

SELECT m.Clave, Descripcion
FROM Proyectos p, Materiales m, Entregan e
WHERE Denominacion LIKE '%Mexico sin ti no estamos completos%'
AND p.Numero = e.Numero
AND m.Clave = e.Clave

SELECT m.Clave, Descripcion
FROM Proveedores p, Materiales m, Entregan e
WHERE RazonSocial LIKE '%Acme tools%'
AND p.RFC = e.RFC
AND m.Clave = e.Clave

SET DATEFORMAT DMY
SELECT Clave, sum(Cantidad) as Total
FROM Entregan e
WHERE Fecha BETWEEN '01/01/2000' AND '31/12/2000'
GROUP BY Clave

CREATE View [Total de cada material entregado en 2001] AS
  SELECT Clave, Sum(Cantidad) as Total
  FROM Entregan
  WHERE Fecha BETWEEN '01/01/2001' AND '31/12/2001'
  GROUP BY Clave
SET DATEFORMAT DMY
SELECT TOP 1 Clave
FROM [Total de cada material entregado en 2001]
ORDER BY Total DESC

SELECT *
FROM Materiales
WHERE Descripcion like '%ub%'

SELECT Denominacion, SUM(Cantidad*Costo) as TotalPagar
FROM Materiales m, Proyectos p, Entregan e
WHERE m.clave = e.clave
AND p.Numero = e.Numero
GROUP BY Denominacion

CREATE VIEW [Proveedores que apoyan Televisa] (Denominacion, RFC, RazonSocial) AS
SELECT DISTINCT Denominacion, P.RFC, RazonSocial
FROM Proveedores P, Proyectos Pr, Entregan E
WHERE P.RFC = E.RFC
AND Pr.Numero = E.Numero
AND Denominacion LIKE 'Televisa%'

CREATE VIEW [Proveedores que apoyan Educando a Coahuila] (Denominacion, RFC, RazonSocial) AS
SELECT DISTINCT Denominacion, P.RFC, RazonSocial
FROM Proveedores P, Proyectos Pr, Entregan E
WHERE P.RFC = E.RFC AND Pr.Numero = E.Numero AND Denominacion LIKE '%Coahuila%'

CREATE VIEW [Proveedores que apoyan Televisa y no Coahuila] as
SELECT RazonSocial FROM [Proveedores que apoyan Televisa]
EXCEPT
SELECT RazonSocial FROM [Proveedores que apoyan Educando a Coahuila]
SELECT * FROM [Proveedores que apoyan Televisa]
WHERE RazonSocial IN (SELECT * FROM [Proveedores que apoyan Televisa y no Coahuila])

SELECT DISTINCT denominacion, pv.RFC, pv.RazonSocial
FROM Proyectos py, Proveedores pv, Entregan e
WHERE pv.RFC = e.RFC
AND py.Numero = e.Numero
AND py.Denominacion LIKE 'Televisa%'
AND pv.RazonSocial NOT IN
    (SELECT pv.RazonSocial
    FROM Proveedores pv, Entregan e, Proyectos py
    WHERE pv.RFC = e.RFC
    AND py.Numero = e.Numero
    AND py.denominacion LIKE 'Educando en Coahuila%'
    GROUP BY pv.RazonSocial
    )

SELECT m.Descripcion, m.Costo
FROM Proyectos py, Proveedores pv, Entregan e, Materiales m
WHERE pv.RFC = e.RFC
AND py.Numero = e.Numero
AND m.Clave = e.Clave
AND py.Denominacion LIKE 'Televisa%'
AND pv.RazonSocial IN
    (SELECT pv.RazonSocial
    FROM Proveedores pv, Entregan e, Proyectos py
    WHERE pv.RFC = e.RFC
    AND py.Numero = e.Numero
    AND py.denominacion LIKE 'Educando en Coahuila%'
    GROUP BY pv.RazonSocial
    )

SELECT  Descripcion, count(Descripcion), SUM(Costo*Cantidad)
FROM Entregan e, Materiales m
WHERE e.Clave = m.Clave
GROUP BY Descripcion