create table lsoaquadrants (
	lsoa text,
	code text,
	localname text,
	quadrant integer,
	imd numeric,
	studentquotient numeric,
	pop integer
);

copy lsoaquadrants from 'C:\Development\DaveBathnes\BathHacked-ANPR-Air\data\lsoa_quadrants.csv' csv header;