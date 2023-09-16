use SistVBX

select * from Productos
-- II.- Calculo de Predicado
-- II.1.- Calculo de Predicado de tuplas
-- EJEMPLO: Los Productos cuyo precio 
-- es mayor a 15, lo podemos 
-- escribir de la manera siguiente:
-- {p | Productos(p)  and  p.preciop > 15}

-- Implementacion como consulta
select * from Productos
where preciop>15

select NombreProd, DescProd, preciop from Productos
where preciop>15

-- Implementacion como vista
create view PM15 as select * from Productos
where preciop>15

select * from PM15

-- equivalente en algebra (Operacion Relacional)
-- Tipo de Operacion: Seleccion.
-- σ<preciop>15>(Productos)

-- Generando condiciones
-- insertar registros
select * from Recintos

insert into Recintos values('Pedro Arauz Palacios','Managua'),
('Simon Bolivar','Managua')

select * from Facultad

insert into Facultad values('01','FTC',60,'Pedro',1),
('02','FEC',41,'Augusto',2)

select * from Carreras

insert into Carreras values('01','Ing. Civil',5,'01'),
('02','Ing. Comp',5,'02')

select * from Areas

insert into Areas values('01','Sec. Academica',
'Juan',6,'01'),('02','Depto. Hidraulica','Pepito',
8,'01')

select * from Clientes

insert into Clientes values('Bello horizonte','87451245',
'02'),('Lomas del valle','76325412','02')

select * from CNatural

insert into CNatural values('Aldo','','Urbina','','D',2),
('Lilliam','','Sequeira','','A',2)

-- II.2.- Calculo de Predicado de dominio
-- La obtención de la direccion y 
-- el telefono del empleado cuyo nombre es 
-- “Aldo Urbina” se indica por
--{dt | (Эn)( Эa)( CNatural(dtna...) and n = Aldo
-- and a = Urbina)}

-- Implementacion como consulta
select PNCN, PACN, DirC, TelC from Clientes
inner join CNatural on Clientes.IdCliente=CNatural.IdCliente
where PNCN='Aldo' and PACN='Urbina'

-- Implementacion como vista
create view EjCPD as
select PNCN, PACN, DirC, TelC from Clientes
inner join CNatural on Clientes.IdCliente=CNatural.IdCliente
where PNCN='Aldo' and PACN='Urbina'

select * from EjCPD

-- equivalente en algebra (Operacion Relacional)
-- Tipo de Operacion: Reunion Theta.
-- R(A φ B)  A: Clientes B: CNatural

select * from Distribuidor

select * from Productos

-- Tipo de Operacion , Nombre de la Operacion,
-- Diseñar con Algebra Relacional
-- Implementar la vista
-- Ejercicio 1: Muestre los productos distribuidos 
-- por BIMBO



-- Ejercicio 2: Muestre la informacion mas relevante
-- de los productos cuyas existencias sean menores
-- a 15

-- Reunion Natural
--{ndnpp | ( Эp)( Productos(ndnpp...) and n = BIMBO}
-- Implementacion de consulta
select NombreDist,
NombreProd, preciop,
existp from Distribuidor inner join 
Productos on 
Distribuidor.IdDist=Productos.IdDist
where NombreDist ='Bimbo'


-- Implementacion de objeto vista
create view EjRN as
select NombreDist,
NombreProd, preciop,
existp from Distribuidor inner join 
Productos on 
Distribuidor.IdDist=Productos.IdDist
where preciop>15

select * from EJRN

-- selecion
-- {ndpe | Productos(p)  and  p.existp < 15}
-- Implementacion de Consulta
select * from Productos where existp<15

-- Implementacion del objeto vista
create view EjRE as
select * from Productos where existp<15

select * from EjRE