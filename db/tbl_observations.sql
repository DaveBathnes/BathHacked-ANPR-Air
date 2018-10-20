create table observations (
	time timestamp,
	site_id integer,
	vehicle_id text
);

copy observations from 'C:\Development\DaveBathnes\BathHacked-ANPR-Air\data\observations.csv' csv header;