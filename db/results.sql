select 
	q.quadrant_id as quadrant,
	site_vehicles.location_id, 
	site_vehicles.make, 
	site_vehicles.type, 
	site_vehicles.subtype,
	site_vehicles.euro_status,
	count(*) as count_vehicles
from 
	(select 
		distinct
		s.location_id as location_id,
		v.id as vehicle_id,
		v.make, 
		v.type, 
		v.subtype,
		v.fuel_type,
	 	v.euro_status
	from observations o
	join 
		(select
			v.id as vehicle_id,
			to_char(o.time, 'YYYY-MM-DD') as observation_day,
			min(o.time) as observation_time
		from observations o
		join vehicles v on v.id = o.vehicle_id
		group by v.id, observation_day) as first_ob
	on first_ob.observation_time = o.time and first_ob.vehicle_id = o.vehicle_id
	join sites s on s.id = o.site_id
	join vehicles v on v.id = o.vehicle_id
	where s.location_id in (12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25)
	and s.in_out = 1) as site_vehicles
join sites s on s.location_id = site_vehicles.location_id
join sitequadrants q on s.site_id = q.site_id
group by quadrant, location_id, make, type, subtype, euro_status
order by quadrant, location_id, make, type, subtype, euro_status;



--

select 
	q.quadrant as quadrant,
	case 
		when site_vehicles.euro_status = 'E4' and lower(site_vehicles.fuel_type) LIKE '%petrol%' then 'Compliant'
		when site_vehicles.euro_status = 'E5' and lower(site_vehicles.fuel_type) LIKE '%petrol%' then 'Compliant'
		when site_vehicles.euro_status = 'E6' then 'Compliant'
	else 'NonCompliant' end as status,
	count(*) as count_vehicles
from 
	(select
		s.location_id as location_id,
		v.id as vehicle_id,
		v.make, 
		v.type, 
		v.subtype,
		v.fuel_type,
	 	v.euro_status
	from observations o
	join 
		(select
			v.id as vehicle_id,
			to_char(o.time, 'YYYY-MM-DD') as observation_day,
			min(o.time) as observation_time
		from observations o
		join vehicles v on v.id = o.vehicle_id
		group by v.id, observation_day) as first_ob
	on first_ob.observation_time = o.time and first_ob.vehicle_id = o.vehicle_id
	join sites s on s.id = o.site_id
	join vehicles v on v.id = o.vehicle_id
	where s.location_id in (12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25)
	and v.type = 'CARS'
	and s.in_out = 1) as site_vehicles
join quadrants q on site_vehicles.location_id = q.location_id
group by quadrant, status
order by quadrant, status;




