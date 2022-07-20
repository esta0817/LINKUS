-- Database: "PlacePOI"

-- DROP DATABASE "PlacePOI";

CREATE DATABASE "PlacePOI"
  WITH OWNER = postgres
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'Korean_Korea.949'
       LC_CTYPE = 'Korean_Korea.949'
       CONNECTION LIMIT = -1;

CREATE Table poi(
	poino bigserial NOT NULL,
	latitude double precision,
	longitude double precision,
	typeno integer,
	geom geometry(Point,4326),
	primary key(POIno),
	UNIQUE (latitude, longitude)
)


CREATE Table grouppoi(
	gno bigserial NOT NULL,
	typeno integer,
	cid integer,
	count bigint,
	avgpoint geometry(Point,4326),
	primary key(gno),
	unique (typeno, avgpoint)
)

select * from grouppoi
select * from poi
drop table poi

create table types(
	typeno	int,
	typename char(20),
	primary key(typeno)
)
select * from poi

insert into poi(latitude, longitude) values(123, 215)
insert into poi values(2, 'bar')



create table poi_types(
	poino	int references poi(poino),
	typeno	int references types(typeno),
	primary key(poino, typeno)
)

select * from poi_types

insert into types values(1, 'bakery')
insert into types values(2, 'bar')
insert into types values(3, 'cafe')
insert into types values(4, 'campground')
insert into types values(5, 'department_store')

insert into types values(6, 'library')
insert into types values(7, 'movie_theater')
insert into types values(8, 'park')
insert into types values(9, 'restaurant')
insert into types values(10, 'shopping_mall')
insert into types values(11, 'book_store')

insert into types values(12, 'korean')
insert into types values(13, 'japanese')
insert into types values(14, 'chinese')
insert into types values(15, 'western')

select * from poi

alter table poi add column typeno int 
