CREATE TABLE IF NOT EXISTS t_qrcode_tokens(
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    ip_address varchar not null,
    agent varchar not null,
    base64_content varchar not null,
    content varchar not null unique,
    expires_at TIMESTAMP not null,
    created_at TIMESTAMP default CURRENT_DATE,
    updated_at TIMESTAMP default CURRENT_DATE,
    status varchar check (status in ('generated', 'consumed', 'expired'))
);