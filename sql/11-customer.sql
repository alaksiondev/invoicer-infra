create table if not exists t_customer(
    id uuid primary key default gen_random_uuid(),
    name varchar(255) not null,
    email varchar(255) not null,
    phone varchar(30),
    created_at timestamp not null default CURRENT_TIMESTAMP,
    updated_at timestamp not null default CURRENT_TIMESTAMP,
    is_deleted bool not null default false,
    company_id uuid not null,
    constraint fk_company
        foreign key (company_id)
        references t_user_company(id)
        on delete cascade,
    constraint unique_email unique(email, company_id),
);