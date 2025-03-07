CREATE TABLE IF NOT EXISTS t_qrcode_tokens(
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    ip_address varchar not null,
    agent varchar not null,
    created_at TIMESTAMP default CURRENT_DATE,
    updated_at TIMESTAMP default CURRENT_DATE,
    enabled boolean not null default true,
)