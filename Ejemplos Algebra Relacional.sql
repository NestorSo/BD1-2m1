create database SistVBX

restore database SistVBX from disk='D:\ECEA\BD I\2M1-IS\SistVBX.bak'
with replace

use SistVBX

select * from Productos

select * from Distribuidor

insert into Distribuidor values('01','BIMBO',
'Carretera Masaya','22587485'),('02',
'FEMSA','Carretera Norte','22857496')

insert into Productos values('Pinguino','Torta de chocolate',
25,12,'01'),('Bimbolete','Torta',20,10,'01'),
('Coca cola','12 onz ret',15,48,'02')

-- Algebra Relacional
-- Operaciones Conjuntistas: Union, Interseccion,
-- Diferencia y Producto Cartesiano
-- A: Distribuidor B: Productos
-- A U B
-- Implementacion de Consulta
select NombreDist,DirDist,TelD,
CodProd, NombreProd,DescProd, preciop,
existp from Distribuidor inner join 
Productos on 
Distribuidor.IdDist=Productos.IdDist

-- Implementacion de objeto vista
create view EjUnion as select NombreDist,DirDist,TelD,
CodProd, NombreProd,DescProd, preciop,
existp from Distribuidor inner join 
Productos on 
Distribuidor.IdDist=Productos.IdDist

select * from EjUnion


-- Operaciones Relacionales:
-- Proyeccion, Seleccion, Reunion Theta,
-- Reunion Natural, Equireunion y Division.
-- Proyeccion
-- π<NombreProd, preciop,existp>(Productos)
-- Implementacion de la consulta
select NombreProd, preciop, existp from
Productos

-- Implementacion del objeto vista
create view EjP as select NombreProd, preciop, existp from
Productos

select * from EjP

-- Reunion Theta
-- A: Distribuidor B: Productos
-- A φ B
-- Implementacion de consulta
select NombreDist,TelD,
NombreProd, preciop,
existp from Distribuidor inner join 
Productos on 
Distribuidor.IdDist=Productos.IdDist

-- Implementacion del objeto vista
create view EjRT as
select NombreDist,
NombreProd, preciop,
existp from Distribuidor inner join 
Productos on 
Distribuidor.IdDist=Productos.IdDist

select * from EjRT

-- Seleccion
-- A: Productos
-- σ<preciop>20>(Productos)
-- Implementacion de consulta
select * from Productos where preciop>20

-- Implementacion de objeto vista
create view EJS as select
* from Productos where preciop>20

select * from EJS

-- Reunion Natural
-- Implementacion de consulta
select NombreDist,
NombreProd, preciop,
existp from Distribuidor inner join 
Productos on 
Distribuidor.IdDist=Productos.IdDist
where preciop>15

-- Implementacion de objeto vista
create view EjRN as
select NombreDist,
NombreProd, preciop,
existp from Distribuidor inner join 
Productos on 
Distribuidor.IdDist=Productos.IdDist
where preciop>15

select * from EJRN

-- Equireunion
-- Implementacion de Consulta
select * from Productos where
NombreProd='Pinguino'

-- Implementacion del objeto vista
create view EjER as
select * from Productos where
NombreProd='Pinguino'

select * from EjER





