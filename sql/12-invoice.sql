CREATE TABLE t_invoice (
    id UUID PRIMARY KEY,
    invoicer_number VARCHAR(36) NOT NULL,
    issue_date TIMESTAMP NOT NULL,
    due_date TIMESTAMP NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    is_deleted BOOLEAN NOT NULL,
    company_id UUID NOT NULL,
    customer_id UUID NOT NULL,
    
    -- Company snapshot fields
    company_name VARCHAR(100) NOT NULL,
    company_document VARCHAR(50) NOT NULL,
    company_address_line1 VARCHAR(500) NOT NULL,
    company_address_line2 VARCHAR(500),
    company_city VARCHAR(100) NOT NULL,
    company_zip_code VARCHAR(20) NOT NULL,
    company_state VARCHAR(500) NOT NULL,
    company_country_code VARCHAR(20) NOT NULL,
    
    -- Customer snapshot fields
    customer_name VARCHAR(100) NOT NULL,
    
    -- Primary bank details (required)
    primary_swift_id VARCHAR(50) NOT NULL,
    primary_iban_id VARCHAR(50) NOT NULL,
    primary_bank_name VARCHAR(100) NOT NULL,
    primary_bank_address VARCHAR(500) NOT NULL,
    
    -- Intermediary bank details (optional)
    intermediary_swift_id VARCHAR(50),
    intermediary_iban_id VARCHAR(50),
    intermediary_bank_name VARCHAR(100),
    intermediary_bank_address VARCHAR(500),
    
    -- Foreign key constraints (referencing current entities for reporting)
    CONSTRAINT fk_invoice_company FOREIGN KEY (company_id) REFERENCES t_user_company(id),
    CONSTRAINT fk_invoice_customer FOREIGN KEY (customer_id) REFERENCES t_customer(id)
);

CREATE TABLE IF NOT EXISTS t_invoice_activity(
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    description varchar not null,
    quantity integer not null,
    unit_price bigint not null,
    invoice_id uuid not null,
    created_at TIMESTAMP default CURRENT_DATE,
    updated_at TIMESTAMP default CURRENT_DATE,
    constraint fk_invoice
        foreign key (invoice_id)
            references t_invoice(id)
            ON DELETE CASCADE
);
