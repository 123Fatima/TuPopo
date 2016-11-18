drop database if exists gastos;
create database gastos;
use gastos;

drop table if exists gastos;
create table gastos(
idGasto int not null primary key,
nombreG nvarchar(50) not null,
servicio nvarchar(50) not null,
prestador nvarchar(50) not null,
fechaG date not null

);
 
 drop procedure if exists spInsertaGasto;
 delimiter $$
 create procedure spInsertaGasto(nombre nvarchar(50),
service nvarchar(50),
presta nvarchar(50),
fecha date
) 
begin

declare ec int;
declare idG int;
declare mensaje nvarchar(100);

set ec =(select count(*)from gastos where nombreG = nombre);
if (ec = 0) then
		set idG = (select ifnull(max(idGasto), 0) + 1 from gastos);
        insert into gastos(idGastos, nombreG, servicio, prestador, fechaG)
				values(idG, nombre, service, presta , fecha);
		set mensaje = 'Gasto insertado';
else 
         set idG = -1;
         set mensaje = 'Gasto ya ingresado, INGRESE UNO VÁLIDO';
end if;
      select idG,mensaje as pack;
   end; $$
   select * from gastos;
