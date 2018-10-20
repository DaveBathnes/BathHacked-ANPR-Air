create table sitequadrants (
	site_id integer,
	lsoa_code text,
	quadrant_id integer
);

insert into sitequadrants
select s.id, l.lsoa11cd, q.quadrant
from sites s
join lsoas l on ST_Within(ST_Transform(ST_SetSRID(ST_MakePoint(s.longitude, s.latitude), 4326), 27700), ST_SetSRID(l.geom, 27700))
join lsoaquadrants q on q.code = l.lsoa11cd
order by s.id, l.lsoa11cd, q.quadrant;