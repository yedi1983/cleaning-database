select * 
from vgsales

select * 
from vgsales
order by Rank
--hay valores nulos
select * 
from vgsales
where Year is null or Platform is null or Genre is null or Publisher is null 

--las variables numericas estan mal formateadas, hay puntos en vez de comas
select NA_Sales, EU_Sales, JP_Sales, Other_Sales, Global_Sales
from vgsales
--hay consolas desconocidas en Platform 
select distinct(Platform)
from vgsales

--crear columna con nombre de la compania que ha desarrollado las consolas y seleccion de consolas que queremos ver

select Name, Platform, 
case when Platform in ('wii','DS','3DS','N64','wiiU') then 'Nintendo'
when Platform in ('PS','PS2','PS3','PS4','PSP') then 'Playstation'
when Platform in ('X360','XB','XONE') then 'Microsoft'
else 'PC'
end as CompanyPlatform,
year,
Genre,
Publisher,
cast(replace(NA_Sales,'.',',')as money) as NA_Sales,
cast(replace(EU_Sales,'.',',')as money) as EU_Sales,
cast(replace(JP_Sales,'.',',')as money) as JP_Sales,
cast(replace(Other_Sales,'.',',')as money) as Other_Sales
into
games_clean_1
from vgsales
where Platform is not null and Year is not null and Platform in('Wii','X360','DS','3DS','N64','PC','PS','PS2','PS3','PS4','PSP','WiiU','XB','XONE')


  --llamamos games_clean_1 para ver si los cambios se efectuaron
  select*
  from games_clean_1

  --comprobamos si hay nulos
   select*
  from games_clean_1
  where Year is null or Platform is null or Genre is null or Publisher is null 

  --comprobacion de formato de variables numericas 
 select NA_Sales, EU_Sales, JP_Sales, Other_Sales
 from games_clean_1

 comprobacion de seleccion de plataformas seleccionadas de manera correcta
 select distinct(Platform), CompanyPlatform
from games_clean_1