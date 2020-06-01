use jobsearch_plus;
insert into companies
		(company_name, city, co_state) values ('Jameson Corporation','Boston', 'MA');
insert into jobsearch_plus.companies(company_name, city, co_state,zip) values ('Alexis Systems','Manchester','NH','03103');
insert into jobsearch_plus.companies(company_name,city,co_state,agency)values('Northeast Technologies','Rochester','Ny',1);

insert into Companies(company_name,city,co_state) values ('Galactix internationa','New York','NY');       
select * from companies;
select company_id,company_name,city,co_state from companies;

update companies set business_type = 'Information Technology' where company_name = 'Alexis Systems';
insert into business_types(business_type) values('Information Technology');
select * from companies;

update companies set business_type = 'Manufacturing' where company_name = 'Nautica Supply';

insert into activity_types(activity_type) values ('Inquiry');
insert into activity_types(activity_type) values ('Application');
insert into activity_types(activity_type) values ('Contact');
insert into activity_types(activity_type) values ('Interview');
insert into activity_types(activity_type) values ('Follow-up');
insert into activity_types(activity_type) values ('Correspondence');
insert into activity_types(activity_type) values ('Documentation');
insert into activity_types(activity_type) values ('Closure');
insert into activity_types(activity_type) values ('Other');

insert into leads(job_title, employment_type, company_id, location)values('DB Administrator', 'Full-time',4,'Atlanta,GA');
insert into leads(job_title, employment_type, company_id, location)values('DB Programmer', 'Full-time',2,'Montgomery,AL');

insert into activities(lead_id,activity_date,activity_type)values(1,'2015-08-03','Application');
insert into activities(lead_id,activity_date,activity_type)values(1,'2015-08-05','Contact');

select l.lead_id,l.job_title,l.employment_type,c.company_name,a.activity_type from leads l
	left join companies c on c.company_id = l.company_id
    left join activities a on a.lead_id = l.lead_id
    where l.location = 'Atlanta, GA' and l.active <> 0
    order by l.job_title asc;