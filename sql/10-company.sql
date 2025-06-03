
create table if not exists t_user_company(
	id uuid primary key default gen_random_uuid(),
	name varchar (500) not null,
	registration_document varchar(100) not null,
	created_at timestamp not null default CURRENT_DATE,
	updated_at timestamp not null default CURRENT_DATE,
	is_deleted bool not null default false,
	user_id uuid not null,
	constraint fk_user
		foreign key (user_id)
		references t_user(id)
		on delete cascade
);

create table if not exists t_company_address(
	id uuid primary key default gen_random_uuid(),
	address_line_1 varchar(500) not null,
	address_line_2 varchar(500) null,
	city varchar(200) not null,
	state varchar(200) not null,
	postal_code varchar(100) not null,
	country_code varchar(3) not null,
	company_id uuid not null,
	created_at timestamp not null default CURRENT_DATE,
	updated_at timestamp not null default CURRENT_DATE,
	is_deleted bool not null default false,
	constraint fk_company
		foreign key(company_id)
		references t_user_company(id)
		on delete cascade
);


create table if not exists t_company_pay_account(
	id uuid primary key default gen_random_uuid(),
	swift_code varchar(50) not null unique,
	iban_code varchar(100) not null unique,
	bank_name varchar(200) not null,
	bank_address varchar(500) not null,
	type varchar(20) not null check (type in ('primary', 'intermediary')),
	company_id uuid not null,
	created_at timestamp not null default CURRENT_DATE,
	updated_at timestamp not null default CURRENT_DATE,
	is_deleted bool not null default false,	
	constraint fk_company
		foreign key(company_id)
		references t_user_company(id)
		on delete cascade,
	constraint unique_account unique(type, company_id)
);