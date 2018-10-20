create table vehicles (
	id text,
	make text,
	type text ,
	subtype text,
	intro_date date,
	euro_status text,
	fuel_type text,
	engine_capacity integer,
	co2 integer,
	gross_vehicle_weight integer,
	fc_combined numeric,
	fc_extra_urban numeric,
	fc_urban_cold numeric
);

copy vehicles from 'C:\Development\DaveBathnes\BathHacked-ANPR-Air\data\vehicles.csv' csv header;