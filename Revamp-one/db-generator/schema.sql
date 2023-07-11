CREATE SCHEMA bootcamp;

ALTER SCHEMA bootcamp OWNER TO postgres;
CREATE TABLE bootcamp.batch (
    batch_id integer NOT NULL,
    batch_entity_id integer NOT NULL,
    batch_name character varying(15),
    batch_description character varying(125),
    batch_start_date timestamp without time zone,
    batch_end_date timestamp without time zone,
    batch_reason character varying(256),
    batch_type character varying(15),
    batch_modified_date timestamp without time zone,
    batch_status character varying(15),
    batch_pic_id integer
);

ALTER TABLE bootcamp.batch OWNER TO postgres;

CREATE TABLE bootcamp.batch_trainee (
    batr_id integer NOT NULL,
    batr_status character varying(15),
    batr_certificated character(1),
    batre_certificate_link character varying(255),
    batr_access_token character varying(255),
    batr_access_grant character(1),
    batr_review character varying(1024),
    batr_total_score integer,
    batr_modified_date timestamp without time zone,
    batr_trainee_entity_id integer,
    batr_batch_id integer NOT NULL
);

ALTER TABLE bootcamp.batch_trainee OWNER TO postgres;

CREATE TABLE bootcamp.batch_trainee_evaluation (
    btev_id integer NOT NULL,
    btev_type character varying(15),
    btev_header character varying(256),
    btev_section character varying(256),
    btev_skill character varying(256),
    btev_week integer,
    btev_skor integer,
    btev_note character varying(256),
    btev_modified_date timestamp without time zone,
    btev_batch_id integer,
    btev_trainee_entity_id integer
);

ALTER TABLE bootcamp.batch_trainee_evaluation OWNER TO postgres;

CREATE TABLE bootcamp.instructor_programs (
    batch_id integer NOT NULL,
    inpro_entity_id integer NOT NULL,
    inpro_emp_entity_id integer,
    inpro_modified_date timestamp without time zone
);

ALTER TABLE bootcamp.instructor_programs OWNER TO postgres;

CREATE TABLE bootcamp.program_apply (
    prap_user_entity_id integer NOT NULL,
    prap_prog_entity_id integer NOT NULL,
    prap_test_score integer,
    prap_gpa integer,
    prap_iq_test integer,
    prap_review character varying(256),
    prap_modified_date timestamp without time zone,
    prap_status character varying(15)
);

ALTER TABLE bootcamp.program_apply OWNER TO postgres;

CREATE TABLE bootcamp.program_apply_progress (
    parog_id integer NOT NULL,
    parog_user_entity_id integer NOT NULL,
    parog_prog_entity_id integer NOT NULL,
    parog_action_date timestamp without time zone,
    parog_modified_date timestamp without time zone,
    parog_comment character varying(512),
    parog_progress_name character varying(15),
    parog_emp_entity_id integer,
    parog_status character varying(15)
);

ALTER TABLE bootcamp.program_apply_progress OWNER TO postgres;