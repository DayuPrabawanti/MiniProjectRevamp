-- TABLE PROGRAM APPLY
CREATE TABLE program_apply (
    prap_user_entity_id INTEGER,
    prap_prog_entity_id INTEGER,
    prap_test_score INTEGER,
    prap_gpa INTEGER,
    prap_iq_test INTEGER,
    prap_review VARCHAR(256),
    prap_modified_date TIMESTAMP,
    prap_status VARCHAR(15),
    FOREIGN KEY (prap_user_entity_id) REFERENCES users(user_entity_id),
    FOREIGN KEY (prap_prog_entity_id) REFERENCES program_entity(prog_entity_id),
    FOREIGN KEY (prap_status) REFERENCES status(status),
    CONSTRAINT program_apply_pk PRIMARY KEY (prap_user_entity_id, prap_prog_entity_id)
);

-- TABLE PROGRAM APPLY PROGRESS
CREATE TABLE program_apply_progress (
    parog_id SERIAL,
    parog_user_entity_id INTEGER,
    parog_prog_entity_id INTEGER,
    parog_action_date TIMESTAMP,
    parog_modified_date TIMESTAMP,
    parog_comment VARCHAR(512),
    parog_progress_name VARCHAR(15),
    parog_emp_entity_id INTEGER,
    parog_status VARCHAR(15),
    FOREIGN KEY (parog_user_entity_id) REFERENCES users(user_entity_id),
    FOREIGN KEY (parog_prog_entity_id) REFERENCES program_entity(prog_entity_id),
    FOREIGN KEY (parog_emp_entity_id) REFERENCES employee(emp_entity_id),
    FOREIGN KEY (parog_status) REFERENCES status(status),
    CONSTRAINT program_apply_progress_pk PRIMARY KEY (parog_id, parog_user_entity_id, parog_prog_entity_id)
);


-- SEQUENCE dengan rumus pada tabel program_apply_progress
CREATE SEQUENCE seq_parog_id
    INCREMENT 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    START 1;

-- Fungsi untuk mengembalikan nilai SEQUENCE dengan format yang diinginkan pada tabel program_apply_progress
CREATE OR REPLACE FUNCTION get_parog_id() 
    RETURNS VARCHAR AS $$
    DECLARE
        seq_val INTEGER;
    BEGIN
        seq_val := nextval('seq_parog_id');
        RETURN LPAD(seq_val::VARCHAR, 4, '0');
    END;
$$ LANGUAGE plpgsql;

-- Mengaitkan fungsi get_parog_id() dengan kolom parog_id pada tabel program_apply_progress
ALTER TABLE program_apply_progress ALTER COLUMN parog_id SET DEFAULT get_parog_id();

-- TABLE BATCH
CREATE TABLE batch (
    batch_id SERIAL,
    batch_entity_id INTEGER,
    batch_name VARCHAR(15) UNIQUE,
    batch_description VARCHAR(125),
    batch_start_date TIMESTAMP,
    batch_end_date TIMESTAMP,
    batch_reason VARCHAR(256),
    batch_type VARCHAR(15),
    batch_modified_date TIMESTAMP,
    batch_status VARCHAR(15),
    batch_pic_id INTEGER,
    FOREIGN KEY (batch_entity_id) REFERENCES program_entity(prog_entity_id),
    FOREIGN KEY (batch_status) REFERENCES status(status),
    FOREIGN KEY (batch_pic_id) REFERENCES employee(emp_entity_id),
    CONSTRAINT batch_pk PRIMARY KEY (batch_id, batch_entity_id)
);

-- SEQUENCE dengan rumus pada tabel batch
CREATE SEQUENCE seq_batch_id
    INCREMENT 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    START 1;

-- Fungsi untuk mengembalikan nilai SEQUENCE dengan format yang diinginkan pada tabel batch
CREATE OR REPLACE FUNCTION get_batch_id() 
    RETURNS VARCHAR AS $$
    DECLARE
        seq_val INTEGER;
    BEGIN
        seq_val := nextval('seq_batch_id');
        RETURN LPAD(seq_val::VARCHAR, 4, '0');
    END;
$$ LANGUAGE plpgsql;

-- Mengaitkan fungsi get_batr_id() dengan kolom batr_id pada tabel batch_trainee
ALTER TABLE batch_trainee ALTER COLUMN batr_id SET DEFAULT get_batr_id();

-- TABLE BATCH TRAINEE
CREATE TABLE batch_trainee (
    batr_id SERIAL,
    batr_status VARCHAR(15),
    batr_certificated CHAR(1),
    batre_certificate_link VARCHAR(255),
    batr_access_token VARCHAR(255),
    batr_access_grant CHAR(1),
    batr_review VARCHAR(1024),
    batr_total_score INTEGER,
    batr_modified_date TIMESTAMP,
    batr_trainee_entity_id INTEGER,
    batr_batch_id INTEGER,
    FOREIGN KEY (batr_trainee_entity_id) REFERENCES users(user_entity_id),
    FOREIGN KEY (batr_batch_id) REFERENCES batch(batch_id),
    CONSTRAINT batch_trainee_pk PRIMARY KEY (batr_id, batr_batch_id)
);

-- SEQUENCE dengan rumus pada tabel batch_trainee
CREATE SEQUENCE seq_batr_id
    INCREMENT 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    START 1;

-- Fungsi untuk mengembalikan nilai SEQUENCE dengan format yang diinginkan pada tabel batch_trainee
CREATE OR REPLACE FUNCTION get_batr_id() 
    RETURNS VARCHAR AS $$
    DECLARE
        seq_val INTEGER;
    BEGIN
        seq_val := nextval('seq_batr_id');
        RETURN LPAD(seq_val::VARCHAR, 4, '0');
    END;
$$ LANGUAGE plpgsql;

-- Mengaitkan fungsi get_batr_id() dengan kolom batr_id pada tabel batch_trainee
ALTER TABLE batch_trainee ALTER COLUMN batr_id SET DEFAULT get_batr_id();

-- TABLE BATCH TRAINEE EVALUATION
CREATE TABLE batch_trainee_evaluation (
    btev_id SERIAL PRIMARY KEY,
    btev_type VARCHAR(15),
    btev_header VARCHAR(256),
    btev_section VARCHAR(256),
    btev_skill VARCHAR(256),
    btev_week INTEGER,
    btev_skor INTEGER,
    btev_note VARCHAR(256),
    btev_modified_date TIMESTAMP,
    btev_batch_id INTEGER,
    btev_trainee_entity_id INTEGER,
    FOREIGN KEY (btev_batch_id) REFERENCES batch(batch_id),
    FOREIGN KEY (btev_trainee_entity_id) REFERENCES users(user_entity_id)
);

-- SEQUENCE dengan rumus pada tabel batch_trainee_evaluation
CREATE SEQUENCE seq_btev_id
    INCREMENT 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    START 1;

-- Fungsi untuk mengembalikan nilai SEQUENCE dengan format yang diinginkan pada tabel batch_trainee_evaluation
CREATE OR REPLACE FUNCTION get_btev_id() 
    RETURNS VARCHAR AS $$
    DECLARE
        seq_val INTEGER;
    BEGIN
        seq_val := nextval('seq_btev_id');
        RETURN LPAD(seq_val::VARCHAR, 4, '0');
    END;
$$ LANGUAGE plpgsql;

-- Mengaitkan fungsi get_btev_id() dengan kolom btev_id pada tabel batch_trainee_evaluation
ALTER TABLE batch_trainee_evaluation
    ALTER COLUMN btev_id SET DEFAULT get_btev_id();

-- TABLE INSTRUCTOR PROGRAMS
CREATE TABLE instructor_programs (
    batch_id INTEGER,
    inpro_entity_id INTEGER,
    inpro_emp_entity_id INTEGER,
    inpro_modified_date TIMESTAMP,
    FOREIGN KEY (batch_id) REFERENCES batch(batch_id),
    FOREIGN KEY (inpro_entity_id) REFERENCES program_entity(prog_entity_id),
    FOREIGN KEY (inpro_emp_entity_id) REFERENCES employee(emp_entity_id),
    CONSTRAINT instructor_programs_pk PRIMARY KEY (batch_id, inpro_entity_id)
);