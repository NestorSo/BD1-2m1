-- Lunes 07-08-2023
-- Crear BD en blanco
create database SistVBX

-- Abrir BD
use SistVBX

-- Creacion de tablas
create table Recintos(
IdRec int identity(1,1) primary key not null,
NombreRec nvarchar(50) not null,
ubicacion nvarchar(50) not null
)

create table Facultad(
CodFac char(5) primary key not null,
NombreFac nvarchar(50) not null,
TiempoExist int not null,
Nautor nvarchar(50) not null,
IdRec int foreign key references Recintos(IdRec) not null
)

create table Carreras(
CodCarrera char(7) primary key not null,
NombreCarrera nvarchar(35) not null,
Tduracion int not null,
CodFac char(5) foreign key references Facultad(CodFac) not null
)

create table Areas(
CodArea char(5) primary key not null,
NombreArea nvarchar(50) not null,
JefeArea nvarchar(50) not null,
Cpersonal int not null,
CodCarrera char(7) foreign key references Carreras(CodCarrera) not null
)

create table Clientes(
IdCliente int identity(1,1) primary key not null,
DirC nvarchar(70) not null,
TelC char(8) check(TelC like '[2|5|7|8][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
CodArea char(5) foreign key references Areas(CodArea) not null
)

create table CNatural(
IDCN int identity(1,1) primary key not null,
PNCN nvarchar(15) not null,
SNCN nvarchar(15),
PACN nvarchar(15) not null,
SACN nvarchar(15),
TipoC char(1) check(TipoC like '[E|D|A]'),
IdCliente int foreign key references Clientes(IdCliente) not null
)

backup database SistVBX to disk='D:\SistVBX.bak'

-- Miercoles 09-08-2023
-- restaurar la BD a traves del backup
create database SistVBX

restore database SistVBX from disk='D:\SistVBX.bak'
with replace

-- Abrir la BD
use SistVBX


create table CAdm(
IDCA int identity(1,1) primary key not null,
NombreCAdm nvarchar(35) not null,
RespCAdm nvarchar(50) not null,
IdCliente int foreign key references 
Clientes(IdCliente) not null
)

create table Distribuidor(
IdDist char(5) primary key not null,
NombreDist nvarchar(35) not null,
DirDist nvarchar(80) not null,
TelD char(8) check(TelD like '[2|5|7|8][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
)

create table Contactos(
IdCont char(4) primary key not null,
PNC nvarchar(15) not null,
SNC nvarchar(15),
PAC nvarchar(15) not null,
SAC nvarchar(15),
DirCont nvarchar(70) not null,
TelCont char(8) check(TelCont like '[2|5|7|8][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
MailCont nvarchar(45),
IdDist char(5) foreign key references Distribuidor(IdDist) not null
)

create table Productos(
CodProd int identity(1,1) primary key not null,
NombreProd nvarchar(45) not null,
DescProd nvarchar(50) not null,
preciop float not null,
existp int not null,
IdDist char(5) foreign key references Distribuidor(IdDist) not null
)

create rule EntP
as
@V>0

sp_bindrule 'EntP','Productos.preciop'

create rule Ent
as
@X>=0

sp_bindrule 'Ent','Productos.existp'

create table Ventas(
IdVenta int identity(1,1) primary key not null,
FechaV datetime default getdate() not null,
IdCliente int foreign key references Clientes(IdCliente) not null,
TotalV float
)

create table DetVentas(
IdVenta int foreign key references Ventas(IdVenta) not null,
CodProd int foreign key references Productos(CodProd) not null,
cantv int not null,
subtp float,
primary key(IdVenta,CodProd)
)

sp_bindrule 'EntP','DetVentas.cantv'
sp_bindrule 'Ent','DetVentas.subtp'


create table Compras(
IdCompra char(4) primary key not null,
FechaCompra date not null,
IdDist char(5) foreign key references Distribuidor(IdDist) not null,
subtc float,
totalc float
)

sp_bindrule 'Ent','Compras.subtc'
sp_bindrule 'Ent','Compras.totalc'


create table DetCompras(
IdCompra char(4) foreign key references Compras(IdCompra) not null,
CodProd int foreign key references Productos(CodProd) not null,
cantc int not null,
precioc float not null,
subtc float,
primary key(IdCompra, CodProd)
)

sp_bindrule 'EntP','DetCompras.cantc'
sp_bindrule 'EntP','DetCompras.precioc'
sp_bindrule 'Ent','DetCompras.subtc'


backup database SistVBX to disk='C:\Users\Nesto\OneDrive\Escritorio\BD1 2m1\SistVBX.bak'