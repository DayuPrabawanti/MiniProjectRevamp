create database MiniProjectRevamp

create schema master
create schema users
create schema hr
create schema curriculum
create schema bootcamp
create schema jobhire
create schema sales
create schema payment


------ 1 Master -------
create table master.status (
status varchar(15)primary key,
status_modified_date timestamp
)

create table master.industry(
indu_code varchar(15)primary key,
indu_name varchar(85)unique
)

create table master.working_type(
woty_code varchar(15)primary key,
woty_name varchar(55)unique
)


create table master.category(
cate_id serial primary key,
cate_name varchar(255)unique,
cate_cate_id int,
cate_modified_date timestamp,

foreign key (cate_cate_id) references master.category(cate_id)
)	

create table master.education(
edu_code varchar(5)primary key,
edu_name varchar(55)unique
)

create table master.address_type(
adty_id serial primary key,
adty_name varchar(15)unique,
adty_modified_date timestamp	
)

create table master.job_role(
joro_id serial primary key,
joro_name varchar(55)unique,
joro_modified_date timestamp
)


create table master.job_type(
joty_id serial primary key,
joty_name varchar(55)
)

create table master.skil_type(
skty_name varchar (55)primary key
)

create table master.skil_template(
skte_id serial primary key,
skte_skil varchar(256),
skte_description varchar (256),
skte_week integer,
skte_orderby integer,
skte_modified_date timestamp,
skty_name varchar(55),
skte_skte_id integer,
foreign key (skty_name) references master.skil_type(skty_name),
foreign key (skte_skte_id) references master.skil_template(skte_id)
)

create table master.modules(
module_name varchar(125)primary key
)

create table master.route_actions(
roac_id serial primary key,
roac_name varchar(15)unique,
roac_orderby integer,
roac_display integer,
roac_module_name varchar(125),
foreign key (roac_module_name) references master.modules(module_name)
)

create table master.country(
country_code varchar(3)primary key,
country_name varchar(85)unique,
country_modified_date timestamp
)

create table master.province(
prov_id serial primary key,
prov_code varchar(5)unique,
prov_name varchar(85),
	prov_modified_date timestamp,
	prov_country_code varchar(3),
	foreign key (prov_country_code) references master.country(country_code)
)

create table master.city(
city_id serial primary key,
	city_name varchar(155)unique,
	city_modified_date timestamp,
	city_prov_id integer,
	foreign key (city_prov_id) references master.province(prov_id )
)

create table master.address(
addr_id serial primary key,
addr_line1 varchar(255)unique ,
addr_line2 varchar(255)unique,
addr_postal_code varchar(10)unique,
	addr_spatial_location varchar,
	addr_modified_date timestamp,
	addr_city_id integer,
	foreign key (addr_city_id) references  master.city(city_id)
)



--------- 2 Users --------
create table users.roles(
    role_id serial primary key,
    role_name varchar(35) unique,
    role_type varchar(15),
    role_modified_date timestamp
)

create table users.business_entity{
    entity_id serial primary key
}

create table users.users(
    user_entity_id integer primary key,
    user_name varchar(256),
    user_password varchar(256),
    user_first_name varchar(50),
    user_last_name varchar(50),
    user_birth_date timestamp,
    user_email_promoton int,
    user_demographic json,
    user_modified_date timestamp,
    user_photo varchar(255),
    user_current_role integer,
    foreign key (user_entity_id) references users.business_entity(entity_id)

)

create table users.users_roles(
    usro_entity_id integer,
    usro_role_id integer unique,
    usro_modified_date timestamp,
    constraint users_roles_pk primary key (usro_entity_id, usro_role_id),
    foreign key (usro_entity_id) references users.users(user_entity_id),
    foreign key (usro_role_id) references users.roles(role_id)
)

alter table users.users add constraint fk_current_role foreign key (user_current_role) references users.users_roles(usro_role_id)

create table users.users_skill(
    uski_id serial unique,
    uski_entity_id integer,
    uski_modified_date timestamp,
    uski_skty_name varchar(15) unique,
    constraint users_skill_pk primary key (uski_id, uski_entity_id),
    foreign key (uski_entity_id) references users.users(user_entity_id),
    foreign key (uski_skty_name) references master.skill_type(skty_name)
)

create table users.users_experiences(
    usex_id serial unique,
    usex_entity_id integer,
    usex_title varchar(255),
    usex_profile_headline varchar(512),
    usex_employment_type varchar(15) CHECK(usex_employment_type in ('fulltime', 'freelance')),
    usex_company_name varchar(255),
    usex_is_current char(1) CHECK(usex_is_current in ('0','1')),
    usex_start_date timestamp,
    usex_industry varchar(15),
    usex_description varchar(512),
    usex_experience_type varchar(15) CHECK(usex_experience_type in ('company','certified','voluntering','organization','reward')),
    usex_city_id integer,
    constraint users_experiences_pk primary key (usex_id, usex_entity_id),
    foreign key (usex_entity_id) references users.users(user_entity_id),
    foreign key (usex_city_id) references master.city(city_id)
)

create table users.users_experiences_skill(
    uesk_usex_id integer,
    uesk_uski_id integer,
    constraint users_experiences_skill_pk primary key (uesk_usex_id, uesk_uski_id),
    foreign key (uesk_usex_id) references users.users_experiences(usex_id),
    foreign key (uesk_uski_id) references users.users_skill(uski_id)
)

create table users.user_lisences(
    usli_id serial,
    usli_license_code varchar(512) unique,
    usli_modified_date timestamp,
    usli_status varchar(15) CHECK(usli_status in ('Active','NonActive')),
    usli_entity_id integer,
    constraint usli_lisences_pk primary key (usli_id, usli_entity_id),
    foreign key (usli_entity_id) references users.users(user_entity_id)

)

create table users.user_email(
    pmail_entity_id integer,
    pmail_id serial,
    pmail_address varchar(50),
    pmail_modified_date timestamp,
    constraint user_email_pk primary key(pmail_entity_id, pmail_id),
    foreign key (pmail_entity_id) references users.users(user_entity_id)
)

create table users.users_media(
    usme_id serial,
    usme_entity_id integer,
    usme_file_link varchar(255),
    usme_filename varchar(55),
    usme_filesize integer,
    usme_filetype varchar(15) CHECK(usme_filetype in ('jpg','pdf','word')),
    usme_note varchar(55),
    usme_modified_date timestamp,
    constraint users_media_pk primary key(usme_id,usme_entity_id),
    foreign key (usme_entity_id) references users.users(user_entity_id)
)

create table users.users_education(
    usdu_id serial,
    usdu_entity_id integer,
    usdu_school varchar(255),
    usdu_degree varchar(15) check(usdu_degree in ('Bachelor','Diploma')),
    usdu_graduate_year varchar(4),
    usdu_start_date timestamp,
    usdu_end_date timestamp,
    usdu_grade varchar(5),
    usdu_activities varchar(512),
    usdu_description varchar(512),
    usdu_modified_date timestamp,
    constraint users_education_pk primary key (usdu_id, usdu_entity_id),
    foreign key (usdu_entity_id) references users.users(user_entity_id)
)

create table users.phone_number_type(
    ponty_code varchar(15) primary key,
    ponty_modified_date timestamp
)

create table users.users_phone(
    uspo_entity_id integer,
    uspo_number varchar(15),
    uspo_modified_date timestamp,
    uspo_ponty_code varchar(15),
    constraint users_phone_pk primary key (uspo_entity_id,uspo_number),
    foreign key (uspo_entity_id) references users.users(user_entity_id),
    foreign key (uspo_ponty_code) references users.phone_number_type(ponty_code)

)

create table users.users_address(
    etad_addr_id integer primary key,
    etad_modified_date timestamp,
    etad_entity_id integer,
    etad_adty_id integer,
    foreign key (etad_addr_id) references master.address_type(adty_id),
    foreign key (etad_entity_id) references users.users(user_entity_id),
    foreign key (etad_adty_id) references master.address(addr_id)
)


----- 3 HR ------
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
    foreign key (emp_emp_entity_id) references hr.employee (emp_entity_id)    
)

create table hr.department(
	dept_id serial primary key,
    dept_name varchar(50) unique,
    dept_modified_date timestamp
)

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
)

create table hr.employee_pay_history(
	ephi_entity_id integer,
    ephi_rate_change_date timestamp,
    ephi_rate_salary integer,
    ephi_pay_frequence smallint CHECK (ephi_pay_frequence in (1,2)),
    ephi_modified_date timestamp,
    constraint entity_changedate_pk primary key (ephi_entity_id, ephi_rate_change_date),
    foreign key (ephi_entity_id) references hr.employee (emp_entity_id)
)

---- 4 job hire ----

CREATE TABLE jobhire.job_category (
	joca_id SERIAL PRIMARY KEY,
	joca_name varchar(255),
	joca_modified_date timestamp
)

CREATE TABLE jobhire.employee_range (
	emra_id SERIAL PRIMARY KEY,
	emra_range_min integer unique,
	emra_range_max integer unique,
	emra_modified_date timestamp
)

CREATE TABLE jobhire.client (
	clit_id integer PRIMARY KEY,
	clit_name varchar (256) unique ,
	clit_about varchar (512),
	clit_modified_date timestamp,
	clit_addr_id integer,
	clit_emra_id integer,
	FOREIGN KEY (clit_addr_id) REFERENCES master.address (addr_id),
	FOREIGN KEY (clit_emra_id) REFERENCES jobhire.employee_range (emra_id)
)

CREATE TABLE jobhire.job_post (
	jopo_entity_id serial PRIMARY KEY,
	jopo_number varchar(25) unique,
	jopo_title varchar(256),
	jopo_start_date timestamp,
	jopo_end_date timestamp,
	jopo_min_salary money,
	jopo_max_salary money,
	jopo_min_experience integer,
	jopo_max_experience integer,
	jopo_primary_skill varchar(256),
	jopo_secondary_skill varchar(256),
	jopo_publish_date timestamp,
	jopo_modified_date timestamp,
	jopo_emp_entity_id integer,
	jopo_clit_id integer,
	jopo_joro_id integer,
	jopo_joty_id integer,
	jopo_joca_id integer,
	jopo_addr_id integer,
	jopo_work_code varchar (15),
	jopo_edu_code varchar(5),
	jopo_indu_code varchar(15),
	jopo_status varchar(15),
	FOREIGN KEY (jopo_emp_entity_id) REFERENCES hr.employee (emp_entity_id),
	FOREIGN KEY (jopo_clit_id) REFERENCES jobhire.client (clit_id),
	FOREIGN KEY (jopo_joro_id) REFERENCES master.job_role (joro_id),
	FOREIGN KEY (jopo_joty_id) REFERENCES master.job_type (joty_id),
	FOREIGN KEY (jopo_joca_id) REFERENCES jobhire.job_category (joca_id),
	FOREIGN KEY (jopo_addr_id) REFERENCES master.address (addr_id),
	FOREIGN KEY (jopo_work_code) REFERENCES master.working_type (woty_code),
	FOREIGN KEY (jopo_edu_code) REFERENCES master.education (edu_code),
	FOREIGN KEY (jopo_indu_code) REFERENCES master.industry (indu_code),
	FOREIGN KEY (jopo_status) REFERENCES master.status (status)
	
)

CREATE TABLE jobhire.job_post_desc (
	jopo_entity_id integer PRIMARY KEY,
	jopo_description json,
	jopo_responsibility json,
	jopo_target json,
	jopo_benefit json,
	FOREIGN KEY (jopo_entity_id) REFERENCES jobhire.job_post (jopo_entity_id)
)

CREATE TABLE jobhire.job_photo (
	jopho_id serial PRIMARY KEY,
	jopho_filename varchar(55),
	jopho_filesize integer,
	jopho_filetype varchar(15) check (jopho_filetype in ('png','jpeg')),
	jopho_modified_date timestamp,
	jopho_entity_id integer,
	FOREIGN KEY (jopho_entity_id) REFERENCES jobhire.job_post (jopo_entity_id)
)

CREATE TABLE jobhire.talent_apply (
	taap_user_entity_id integer,
	taap_entity_id integer unique,
	taap_intro varchar(512),
	taap_scoring integer,
	taap_modified_date timestamp,
	taap_status varchar(15),
	FOREIGN KEY (taap_user_entity_id) REFERENCES users.users (user_entity_id),
	FOREIGN KEY (taap_entity_id) REFERENCES users.business_entity (entity_id),
	FOREIGN KEY (taap_status) REFERENCES master.status (status),
		CONSTRAINT jh_ta PRIMARY KEY (taap_user_entity_id, taap_entity_id)
)


CREATE TABLE jobhire.talent_apply_progress (
	tapr_id serial,
	taap_user_entity_id integer,
	taap_entity_id integer,
	tapr_modified_date timestamp,
	tapr_status varchar(15) check (tapr_status in ('open','waiting','done','cancelled','closed')),
	tapr_comment varchar(256),
	tapr_progress_name varchar(55),
	FOREIGN KEY (taap_user_entity_id) REFERENCES users.users (user_entity_id),
	FOREIGN KEY (taap_entity_id) REFERENCES jobhire.talent_apply (taap_entity_id),
		CONSTRAINT jh_tapr PRIMARY KEY (taap_user_entity_id, taap_entity_id,tapr_id)	
)

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
    ecco_status varchar(15),
    constraint id_entityid_pk primary key (ecco_id, ecco_entity_id),
    foreign key (ecco_entity_id) references hr.employee (emp_entity_id),
    foreign key (ecco_joty_id) references master.job_type (joty_id),
    foreign key (ecco_account_manager) references hr.employee (emp_entity_id),
    foreign key (ecco_clit_id) references job.client (clit_id),
    foreign key (ecco_status) references master.status (status)
)



--- 5 curiculum----
create table curriculum.program_entity(
    prog_entity_id serial primary key,
    prog_title varchar(256),
    prog_headline varchar(512),
    prog_type varchar(15),
    prog_learning_type varchar(15),
    prog_rating integer,
    prog_total_traniee integer,
    prog_modified_date timestamp,
    prog_image varchar(256),
    prog_best_seller char(1),
    prog_price integer,
    prog_duration integer,
    prog_duration_type varchar(15),
    prog_tag_skill varchar(512),
    prog_city_id integer,
    prog_cate_id integer,
    prog_created_by integer,
    prog_status varchar(15),
    foreign key (prog_city_id) references master.city(city_id),
    foreign key (prog_cate_id) references master.category(cate_id),
    foreign key (prog_created_by) references hr.employee(emp_entity_id),
    foreign key (prog_created_by) references users.business_entity(entity_id),
    foreign key (prog_status) references master.status(status)
)

create table curriculum.progam_reviews(
    prow_user_entity_id integer,
    prow_prog_entity_id integer,
    prow_review varchar(512),
    prow_rating integer,
    prow_modified_date timestamp,
    constraint prow_pk primary key (prow_user_entity_id, row_prog_entity_id),
    foreign key (prow_user_entity_id) references user.users(user_entity_id),
    foreign key (prow_prog_entity_id) references curriculum.program_entity(prog_entity_id)
)

create table curriculum.program_entity_description(
    pred_prog_entity_id integer primary key,
    pred_item_learning json,
    pred_item_include json,
    pred_requirment json,
    pred_description json,
    pred_target_level json,
    foreign key (pred_prog_entity_id) references curriculum.program_entity(prog_entity_id)
)

create table curriculum.sections(
    sect_id serial unique,
    sect_prog_entity_id integer,
    sect_title varchar(100),
    sect_description varchar(256),
    sect_total_section integer,
    sect_total_lecture integer,
    sect_total_minute integer,
    sect_modified_date timestamp,
    constraint sect_pk primary key (sect_id, sect_prog_entity_id),
    foreign key (sect_prog_entity_id) references curriculum.program_entity(prog_entity_id)
)

create table curriculum.section_detail(
    secd_id serial primary key,
    secd_title varchar(256),
    secd_preview char(1),
    secd_score integer,
    secd_note varchar(256),
    secd_minute integer,
    secd_modified_date timestamp,
    secd_sect_id integer,
    foreign key (secd_sect_id) references curriculum.sections(sect_id)
)

create table curriculum.section_detail_material(
    sedm_id serial primary key,
    sedm_filename varchar(55),
    sedm_filesize integer,
    sedm_filetype varchar(15),
    sedm_filelink varchar(255),
    sedm_modified_date timestamp,
    sedm_secd_id integer,
    foreign key (sedm_secd_id) references curriculum.section_detail(secd_id)
)

----- 6 bootcamp ----
alter table curriculum.program_entity add constraint fk_program_entity foreign key (prog_entity_id) references users.business_entity(entity_id)



CREATE TABLE bootcamp.program_apply (
    prap_user_entity_id INTEGER,
    prap_prog_entity_id INTEGER,
    prap_test_score INTEGER,
    prap_gpa INTEGER,
    prap_iq_test INTEGER,
    prap_review VARCHAR(256),
    prap_modified_date TIMESTAMP,
    prap_status VARCHAR(15) check( prap_status in ('recomendation','passed','failed')),
    FOREIGN KEY (prap_user_entity_id) REFERENCES users.users(user_entity_id),
    FOREIGN KEY (prap_prog_entity_id) REFERENCES curriculum.program_entity(prog_entity_id),
    FOREIGN KEY (prap_status) REFERENCES master.status(status),
    CONSTRAINT program_apply_pk PRIMARY KEY (prap_user_entity_id, prap_prog_entity_id)
)


CREATE TABLE bootcamp.program_apply_progress (
    parog_id SERIAL,
    parog_user_entity_id INTEGER,
    parog_prog_entity_id INTEGER,
    parog_action_date TIMESTAMP,
    parog_modified_date TIMESTAMP,
    parog_comment VARCHAR(512),
    parog_progress_name VARCHAR(15),
    parog_emp_entity_id INTEGER,
    parog_status VARCHAR(15),
    FOREIGN KEY (parog_user_entity_id) REFERENCES users.users(user_entity_id),
    FOREIGN KEY (parog_prog_entity_id) REFERENCES curriculum.program_entity(prog_entity_id),
    FOREIGN KEY (parog_emp_entity_id) REFERENCES hr.employee(emp_entity_id),
    FOREIGN KEY (parog_status) REFERENCES master.status(status),
    CONSTRAINT program_apply_progress_pk PRIMARY KEY (parog_id, parog_user_entity_id, parog_prog_entity_id)
);



CREATE TABLE bootcamp.batch (
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
    FOREIGN KEY (batch_entity_id) REFERENCES curriculum.program_entity(prog_entity_id),
    FOREIGN KEY (batch_status) REFERENCES master.status(status),
    FOREIGN KEY (batch_pic_id) REFERENCES hr.employee(emp_entity_id),
    CONSTRAINT batch_pk PRIMARY KEY (batch_id, batch_entity_id)
);


CREATE TABLE bootcamp.batch_trainee (
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
    FOREIGN KEY (batr_trainee_entity_id) REFERENCES users.users(user_entity_id),
    FOREIGN KEY (batr_batch_id) REFERENCES bootcamp.batch(batch_id),
    CONSTRAINT batch_trainee_pk PRIMARY KEY (batr_id, batr_batch_id)
);


CREATE TABLE bootcamp.batch_trainee_evaluation (
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
    FOREIGN KEY (btev_batch_id) REFERENCES bootcamp.batch(batch_id),
    FOREIGN KEY (btev_trainee_entity_id) REFERENCES users.users(user_entity_id)
);


CREATE TABLE bootcamp.instructor_programs (
    batch_id INTEGER,
    inpro_entity_id INTEGER,
    inpro_emp_entity_id INTEGER,
    inpro_modified_date TIMESTAMP,
    FOREIGN KEY (batch_id) REFERENCES bootcamp.batch(batch_id),
    FOREIGN KEY (inpro_entity_id) REFERENCES curriculum.program_entity(prog_entity_id),
    FOREIGN KEY (inpro_emp_entity_id) REFERENCES hr.employee(emp_entity_id),
    CONSTRAINT instructor_programs_pk PRIMARY KEY (batch_id, inpro_entity_id)
);


---- 7 sales -----
create table sales.special_offer(
	spof_id serial primary key,
	spof_description varchar(256),
	spof_discount integer,
	spof_type varchar(15),
	spof_start_date timestamp,
	spof_end_date timestamp,
	spof_min_qty integer,
	spof_max_qty integer,
	spof_modified_date timestamp,
	spof_cate_id integer,
	foreign key (spof_cate_id) references master.category(cate_id)
)

create table sales.special_offer_programs (
	soco_id serial unique,
	soco_spof_id integer,
	soco_prof_entity_id integer,
	soco_status varchar(15) check(soco_status in('open','cancelled','closed')),
	soco_modified_date timestamp,
	foreign key (soco_spof_id) references sales.special_offer(spof_id),
	foreign key (soco_prof_entity_id) references curriculum.program_entity(prog_entity_id),
	constraint soco_pk primary key (soco_id,soco_spof_id,soco_prof_entity_id)
)

create table sales.cart_items (
	cait_id serial primary key,
	cait_quantity integer,
	cait_unit_price money,
	cait_modified_date timestamp,
	cait_user_entity_id integer, 
	cait_prog_entity_id integer,
	foreign key (cait_user_entity_id) references users.users(user_entity_id),
	foreign key (cait_prog_entity_id) references curriculum.program_entity(prog_entity_id)
)


create table sales.sales_order_header (
	sohe_id serial primary key,
	sohe_order_date timestamp,
	sohe_due_date timestamp,
	sohe_ship_date timestamp,
	sohe_order_number varchar(25)unique,
	sohe_account_number varchar(25),
	sohe_trapa_code_number varchar(25),
	sohe_subtotal money,
	sohe_tax money,
	sohe_total_due money,
	sohe_license_code varchar(512)unique,
	sohe_modified_date timestamp,
	sohe_user_entity_id integer,
	sohe_status varchar(15),
	foreign key (sohe_user_entity_id) references users.users(user_entity_id),
	foreign key (sohe_status) references master.status(status)
)

create table sales.sales_order_detail (
	sode_id integer primary key,
	sode_qty integer,
	sode_unit_price money,
	sode_unit_discount money,
	sode_line_total money,
	sode_modified_date timestamp,
	sode_sohe_id integer,
	sode_prog_entity_id integer,
	foreign key (sode_sohe_id) references sales.sales_order_header(sohe_id),
	foreign key (sode_prog_entity_id) references curriculum.program_entity(prog_entity_id)
)


----- 8 payment -----
create table payment.bank(
    bank_entity_id integer primary key,
    bank_code varchar(10) unique,
    bank_name varchar(55) unique,
    bank_modified_date timestamp,
    foreign key (bank_entity_id) references users.business_entity(entity_id)
)

create table payment.fintech(
    fint_entity_id integer primary key,
    fint_code varchar(10) unique,
    fint_name varchar(55) unique,
    fint_modified_date timestamp,
    foreign key (fint_entity_id) references users.business_entity(entity_id)
)

create table payment.users_account(
    usac_bank_entity_id integer,
    usac_user_entity_id integer,
    usac_account_number varchar(25) unique,
    usac_saldo money,
    usac_type varchar(15) check(usac_type in ('debet','credit card','payment')),
    usac_start_date timestamp,
    usac_end_date timestamp,
    usac_modified_date timestamp,
    usac_status varchar(15) check(usac_status in('active','inactive','blokir')),
    constraint users_account_pk primary key (usac_bank_entity_id, usac_user_entity_id),
    foreign key (usac_bank_entity_id) references payment.bank(bank_entity_id),
    foreign key (usac_bank_entity_id) references payment.fintech(fint_entity_id),
    foreign key (usac_user_entity_id) references users.users(user_entity_id)
)

create table payment.transaction_payment(
    trpa_id serial primary key,
    trpa_code_number varchar(55) unique,
    trpa_order_number varchar(25),
    trpa_debet money,
    trpa_credit money,
    trpa_type varchar(15) check( trpa_type in('topup','transfer','order','refund')),
    trpa_note varchar(255),
    trpa_modified_date timestamp,
    trpa_source_id varchar(25) not null,
    trpa_target_id varchar(25) not null,
    trpa_user_entity_id integer,
    foreign key (trpa_user_entity_id) references users.users(user_entity_id)
)