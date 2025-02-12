create table if not exists t_intermediary(
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    name varchar not null,
    iban varchar not null,
    swift varchar(11) not null,
    bank_name varchar not null,
    bank_address varchar not null,
    user_id uuid not null,
    is_deleted boolean default false,
    created_at TIMESTAMP DEFAULT CURRENT_DATE,
    updated_at TIMESTAMP DEFAULT CURRENT_DATE,
    constraint fk_intermediary_to_user
            foreign key (user_id)
                references t_user(id)
                on delete CASCADE
)