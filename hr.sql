-- MEMBUAT SCHEMA HR
create schema hr

-- MENGHAPUS TABEL
drop table hr.employee
drop table hr.employee_client_contract
drop table hr.department
drop table hr.employee_department_history
drop table hr.employee_pay_history


-- TABEL EMPLOYEE
create table hr.employee(
	emp_entity_id integer primary key,
    emp_emp_number varchar(25) unique,
    emp_national_id varchar(25) unique,
    emp_birth_date date,
    emp_marital_status char(1) CHECK (emp_marital_status in ('M', 'S')),
    emp_gender char(1) CHECK (emp_gender in ('M', 'F')),
    emp_hire_date timestamp,
    emp_salaried_flag char(1) CHECK (emp_salaried_flag in ('0', '1')),
    emp_vacation_hours smallint,
    emp_sickleave_hours smallint,
    emp_current_flag smallint CHECK (emp_current_flag in (0, 1)),
    emp_modified_date timestamp,
    emp_type varchar(15) CHECK (emp_type in ('internal','outsource')),
    emp_joro_id integer,
    emp_emp_entity_id integer,
    foreign key (emp_entity_id) references users.users (user_entity_id),
    foreign key (emp_joro_id) references master.job_role (joro_id),
    foreign key (emp_emp_entity_id) references hr.employee (user_entity_id)    
);

-- TABEL EMPLOYEE CLIENT CONTRACT
create table hr.employee_client_contract(
	ecco_id serial,
    ecco_entity_id integer,
    ecco_contract_no varchar(55),
    ecco_contract_date timestamp,
    ecco_start_date timestamp,
    ecco_end_date timestamp,
    ecco_notes varchar(512),
    ecco_modified_date timestamp,
    ecco_media_link varchar(255),
    ecco_joty_id integer,
    ecco_account_manager integer,
    ecco_clit_id integer,
    ecco_status varchar(15) CHECK (ecco_status in ('onsite','online','hybrid')),
    constraint id_entityid_pk primary key (ecco_id, ecco_entity_id),
    foreign key (ecco_entity_id) references hr.employee (user_entity_id),
    foreign key (ecco_joty_id) references master.job_type (joty_id),
    foreign key (ecco_account_manager) references hr.employee (emp_entity_id),
    foreign key (ecco_clit_id) references job.client (clit_id),
    foreign key (ecco_status) references master.status (status)
);

-- TABEL DEPARTMENT
create table hr.department(
	dept_id serial primary key,
    dept_name varchar(50) unique,
    dept_modified_date timestamp
);

-- TABEL EMPLOYEE DEPARTMENT HISTORY
create table hr.employee_department_history(
	edhi_id serial,
    edhi_entity_id integer,
    edhi_start_date timestamp,
    edhi_end_date timestamp,
    edhi_modified_date timestamp,
    edhi_dept_id integer,
    constraint edhi_id_entity_pk primary key (edhi_id, edhi_entity_id),
    foreign key (edhi_entity_id) references hr.employee (emp_entity_id),
    foreign key (edhi_dept_id) references hr.department (dept_id)
);

-- TABEL EMPLOYEE PAY HISTORY
create table hr.employee_pay_history(
	ephi_entity_id integer,
    ephi_rate_change_date timestamp,
    ephi_rate_salary integer,
    ephi_pay_frequence smallint CHECK (ephi_pay_frequence in (1,2)),
    ephi_modified_date timestamp,
    constraint entity_changedate_pk primary key (ephi_entity_id, ephi_rate_change_date),
    foreign key (ephi_entity_id) references hr.employee (emp_entity_id),
);



-- MEMBUAT SEQUENCE ECCO_ID DI TABEL EMPLOYEE CLIENT CONTRACT
CREATE SEQUENCE seq_employee_client_contract
    INCREMENT 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    START 1
create or replace function eccoIdSeq()
    returns varchar as $$
    select lpad(''||nextval('seq_employee_client_contract'),4,'0')
end;$$
language sql

alter table hr.employee_client_contract alter column ecco_id set default eccoIdSeq()

-- MEMBUAT SEQUENCE EDHI_ID DI TABEL EMPLOYEE DEPARTMENT HISTORY
CREATE SEQUENCE seq_employee_department_history
    INCREMENT 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    START 1
create or replace function edhiIdSeq()
    returns varchar as $$
    select lpad(''||nextval('seq_employee_department_history'),4,'0')
end;$$
language sql

alter table hr.employee_department_history alter column edhi_id set default edhiIdSeq()

-- MEMBUAT SEQUENCE dep_id DI TABEL DEPARTMENT
CREATE SEQUENCE seq_department
    INCREMENT 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    START 1
create or replace function deptIdSeq()
    returns varchar as $$
    select lpad(''||nextval('seq_department'),4,'0')
end;$$
language sql

alter table hr.department alter column dept_id set default deptIdSeq()