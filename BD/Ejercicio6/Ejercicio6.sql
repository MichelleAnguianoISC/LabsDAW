--1.
SELECT nombre, fechanacimiento, titulo
FROM Actor A, Elenco E
WHERE A.nombre = E.nombre
AND A.sexo = 'femenino'

--2.
SELECT titulo
FROM Elenco E
WHERE E.actor = 'Mike Myers'
AND E.año BETWEEN 2000 and 2010

--3.
SELECT nombre, importeventas
FROM Elenco E, Pelicula Pe, Productor Pr
WHERE E.nombre = 'Tom Cruise'
AND E.titulo = Pe.Titulo
AND Pe.idproductor = Pr.idproductor

--4.
SELECT direccion
FROM Elenco E, Pelicula P, Estudio Es
WHERE E.actor = 'SM' OR E.actor= 'AB'
AND P.titulo=E.titulo
AND  E.peliAAA=P.peliAAA
AND P.duracion>3

--5.
SELECT nombre
FROM Elenco E
WHERE E.año=1938
AND E.titulo='Romeo y Julieta'