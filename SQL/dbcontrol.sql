select * from poi where typeno=8 order by poino

insert into poi(latitude, longitude, typeno) values(37, 38.2, 2)
insert into poi values(37, 38.2, 3)

select * from poi

select * from types

delete from poi where poino <= 1500
delete from poi_types where poino <= 20 

delete from types where typeno = 11

insert into types values(17, 'westernfood')

alter table poi add unique(latitude, longitude)

drop table poi

select * from grouppoi

delete from grouppoi where gno=15

select * from grouppoi
SELECT *, ST_AsText(avgpoint) FROM grouppoi