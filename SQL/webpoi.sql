
CREATE Table webpoi(
	poino bigserial NOT NULL,
	poiname character(20),
	rating double precision,
	latitude double precision,
	longitude double precision,
	type character(10),
	primary key(poino),
	UNIQUE (latitude, longitude)
)

drop table webpoi

insert into webpoi(poiname, rating, latitude, longitude, type) values('롤링라이스 홍대점',null ,37.5573402, 126.9255305, 'food')

select * from webpoi

delete from webpoi where(poino<10)