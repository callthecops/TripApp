SELECT * FROM jobsearch_plus.activities;

alter table jobsearch_plus.activities
add index FK_lead_id_idx_idx (lead_id ASC);

alter table jobsearch_plus.activities
add constraint FK_lead_id_idx foreign key(lead_id) references jobsearch_plus.leads(lead_id)
on delete restrict
on update cascade,
add constraint FK_activity_type_idx
foreign key(activity_type) references jobsearch_plus.activity_types(activity_type)
on delete restrict
on update cascade;


alter table jobsearch_plus.companies
add constraint FK_business_type_idx
foreign key(business_type) references jobsearch_plus.business_types (business_type)
on delete restrict
on update cascade;


alter table jobsearch_plus.contacts
add constraint FK_contact_company_id_idx
foreign key(company_id)
references jobsearch_plus.companies(company_id)
on delete restrict
on update cascade;

show variables where variable_name like "%dir%";