--funciones agregadas

use SistVBX

select * from Productos

create view FnA as 
select min(preciop) as PrecioMin,
max(preciop) as PrecioMax, avg(preciop) as PrecioProm, count(CodProd) as CantProd,
sum(existp) as CantExist, var(preciop) as VarianzaP, stdev(preciop) as DesvEsp
from productos
 
 select * from FnA

 --funciones standart del sistema
 --I. funciones de fecha y hora
 --1. getdate(): retorna fecha y hora ctual 

 select getdate() as FHActual
 --2. year(): obtine un año a partir de una fecha 
 select year(getdate()) as AñoActual, year('1990-10-02') as AñoNac
 --3. month(): obtienee un mes a partir de una fecha
  select month(getdate()) as MesActual, month('1990-10-02') as MesNac
  --4. day(): obtiene el dia a traves de una fecha


  --5.datename

  select datename(weekday, getdate()) as NameDiaA, 
  datename(weekday,'1971-06-19') as DiaMiNac,
  datename(dayofyear, getdate()) as NameDiaA, 
  datename(dayofyear,'1971-06-19') as DiaMiNac

  --6. datediff(): diferencia de fechas
  select datediff(year, '1971-06-19', getdate()) as EdadA,
  datediff(month, '1971-06-19', getdate()) as EdadM,
  datediff(week, '1971-06-19', getdate()) as EdadS,
  datediff(day, '1971-06-19', getdate()) as EdadD,
  datediff(hour, '1971-06-19', getdate()) as EdadH

  --7. dateadd() suma de fechas

  select dateadd(day,7,getdate()) as SieteDD

  --8. datepar() obtiene la parte de una fecha 
  select datepart(year, getdate()) as AñoA, datepart(month,getdate())
  as MesA, datepart(day,getdate()) asDiaA, datepart(week,getdate()) as SemanaA

  --II. funciones de cadena 
 --1. len() devuelve la longitud de una cadena
 select len('Nestor') as CantLetters

 --2. char() devuelve el caracter a partir de su numero ascii
 select char(164) as Car
  --3. ascii() devuelve el numero ascii de un caracter
 select ascii('ñ') as Car


 --4. lower() transfrorma a minuscula
 select lower('UNI') as minuscula
  --5. upper() transfrorma a minuscula
 select upper('base de datos') as minuscula
 --6. reverse() invierte una cadena
 select reverse('Juan') as CadenInv
 --7. ltrim() elimina los espacios en blanco a la izquierda
 select ltrim('   Base de datos')
  --8. rtrim() elimina los espacios en blanco a la derecha
 select rtrim('Base de datos   ')
  --9. trim() elimina los espacios en blanco a la derecha como a la derecha 
 select trim('   Base de datos   ')
   --10. substring() abstraer una subcadena
 select substring('001-290671-0011y',12,5) as FechaNac

 --11. concat() concatena cadenas
SELECT CONCAT ( 'Happy ', 'Birthday ', 11, '/', '25' ) AS FechaNac;  

--12. format() 
DECLARE @d DATE = '2001-06-14'  

SELECT FORMAT( @d, 'd', 'en-US' ) 'US English'  
      ,FORMAT( @d, 'd', 'en-gb' ) 'British English'  
      ,FORMAT( @d, 'd', 'de-de' ) 'German'  
      ,FORMAT( @d, 'd', 'zh-cn' ) 'Chinese Simplified (PRC)';  
  
SELECT FORMAT( @d, 'D', 'en-US' ) 'US English'  
      ,FORMAT( @d, 'D', 'en-gb' ) 'British English'  
      ,FORMAT( @d, 'D', 'de-de' ) 'German'  
      ,FORMAT( @d, 'D', 'zh-cn' ) 'Chinese Simplified (PRC)';  

	  --13. reemplaza cadenas
	SELECT REPLACE('abcdefghicde','cde','xxx');  

	--14. soundec() retorna un codigo de 4 caracteres para evaluar la similitud de dos cadenas 
	SELECT SOUNDEX ('Smith'), SOUNDEX ('Smythe');  

	--15.retorna un entero al comprar dos cadenas
	-- retorna 4 si la diferencia es la menor porible y cero en caso contrario   
SELECT SOUNDEX('Green'), SOUNDEX('Greene'), DIFFERENCE('Green','Greene');  
GO  


--16. replicate repite una cadena un numero especifico de veces
SELECT NombreFac  
, REPLICATE('0', 4) + CodFac as 'Nuevo Codigo' 
from Facultad
select *from Facultad
--17. charindex() busca la posicion de una subcadena en una cadena 
DECLARE @document VARCHAR(64);  
SELECT @document = 'Reflectors are vital safety' +  
                   ' components of your bicycle.';  
SELECT CHARINDEX('bicycle', @document) as posicion  
GO  

--III. funciones de conversion
--cast,convert,parse, try_cast, try_convert, try_parse
--convierten de un tipo de dato a otro