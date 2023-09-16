create database SistVBX

restore database SistVBX from disk='D:\BD1 2m1\SistVBX.bak'
with replace

-- Procedimientos Almacenados
use SistVBX

alter table Recintos add EstadoR bit default 1

select * from Recintos

update Recintos set EstadoR=1

-- 1.- Procedimiento de insercion
create procedure NuevoRecinto
@NR nvarchar(50),
@U nvarchar(50)
as
declare @nomrec as nvarchar(50)
set @nomrec=(select NombreRec from Recintos where NombreRec=@NR)
if(@NR='' or @U='')
begin
  print 'No puede estar en blanco'
end
else
begin
  if(@NR=@nomrec)
  begin
     print 'Recinto ya registrado'
  end
  else
  begin
    insert into Recintos values(@NR,@U,1)
  end
end


NuevoRecinto 'Albert Einstein','Managua'

select * from Recintos

-- Dar de baja
create procedure DBRec
@IDR int
as
declare @idrec as int
set @idrec=(select IdRec from Recintos where IdRec=@IDR)
if(@IDR=@idrec)
begin
  update Recintos set EstadoR=0 where IdRec=@IDR and
  EstadoR=1
end
else
begin
  print 'Recinto no encontrado'
end

DBRec 3

select * from Recintos

-- Procedimiento de Modificacion
create procedure ModRec
@IDR int,
@NR nvarchar(50),
@U nvarchar(50)
as
declare @idrec as int
set @idrec=(select IdRec from Recintos where IdRec=@IDR)
declare @nomrec as nvarchar(50)
set @nomrec=(select NombreRec from Recintos where NombreRec=@NR)
if(@IDR=@idrec)
begin
  if(@NR='' or @U='')
  begin
    print 'No pueden ser nulos'
  end
  else
  begin
    if(@NR=@nomrec)
	begin
	  print 'No puede duplicarse'
	end
	else
	begin
	  update Recintos set NombreRec=@NR, ubicacion=@U
	  where IdRec=@IDR and EstadoR=1
	end
  end
end
else
begin
  print 'Recinto no encontrado'
end

ModRec 2,'Aldo Urbina','Juigalpa'

-- Procedimiento de Busqueda
create procedure BRect
@IDR int
as
declare @idrec as int
set @idrec=(select IdRec from Recintos where IdRec=@IDR)
if(@IDR=@idrec)
begin
  select * from Recintos where IdRec=@IDR
end
else
begin
  print 'Recinto no encontrado'
end

BRect 1

select * from Recintos

backup database SistVBX to disk='D:\SistVBX.bak'