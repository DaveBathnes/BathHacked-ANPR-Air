create table sites (
	id integer,
	name text,
	description text,
	location_id integer,
	direction character(1),
	radial_group integer,
	in_out integer,
	code character(1),
	longitude numeric,
	latitude numeric
);

copy sites from 'C:\Development\DaveBathnes\BathHacked-ANPR-Air\data\sites.csv' csv header;