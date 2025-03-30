CREATE TYPE invoice_pdf_status AS ENUM ('pending', 'error', 'success');

create table t_invoice_pdf (
	id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    file_path varchar not null,
    status invoice_pdf_status not null,
    invoice_id uuid not null,
    created_at TIMESTAMP DEFAULT CURRENT_DATE,
    updated_at TIMESTAMP DEFAULT CURRENT_DATE,
    foreign key (invoice_id) 
    	references t_invoice (id)
    	on delete CASCADE	
);

