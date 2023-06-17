---Table module master city---1
create table city(
		city_id serial primary key
);

---Table module master skill_type---2
create table skill_type(
		skill_name varchar(15) primary key
);

---Table users_experiences---3
create table users_experiences(
	usex_id serial primary key unique,
	usex_entity_id int,
	esex_title varchar(255),
	usex_profile_headline varchar(512),
	usex_company_name varchar(255),
	usex_is_current char(1),
	usex_start_date timestamp,
	usex_end_date timestamp,
	usex_industry varchar(15),
	usex_description varchar(512),
	usex_experience_type varchar(15),
	usex_city_id int
);
drop table users_experiences cascade

---Table users_skill---4
create table users_skill (
	uski_id serial unique,
	uski_entity_id integer,
	uski_modified_date timestamp,
	uski_skty_name varchar(15) unique,
	constraint users_skill_pk primary key (uski_id, uski_entity_id),
	foreign key (uski_entity_id) references users (user_entity_id)
);
drop table users_skill cascade

---Table users_experiences_skill---9
create table users_experiences_skill (
	uesk_usex_id int,
	uesk_uski_id int,
	foreign key (uesk_uski_id) references users_skill (uski_id),
	foreign key (uesk_usex_id) references users_experiences(usex_id),
	constraint users_experiences_skill_pk primary key (uesk_usex_id, uesk_uski_id)
);
drop table users_experiences_skill cascade


---Table users_license---10
create table users_license(
	usli_id serial,
	usli_license_code varchar(512)unique,
	usli_modified_date timestamp,
	usli_status varchar(15),
	uslientity_id int,
	foreign key (uslientity_id) references users(user_entity_id),
	constraint users_license_pk primary key (usli_id, usli_license_code)
);

---Table users_email---11
create table users_email(
	pmail_entity_id int,
	pmail_id serial,
	pmail_address varchar(50),
	pmail_modified_date timestamp,
	foreign key (pmail_entity_id) references users(user_entity_id),
	constraint users_email_pk primary key (pmail_entity_id, pmail_id)
);

---Table users_media---12
create table users_media (
	usme_id serial,
	usme_entity_id int,
	usme_file_link varchar(255),
	usme_filename varchar(55),
	usme_filesize int,
	usme_filetype varchar(15),
	usme_note varchar(55),
	usme_modified_date timestamp,
	foreign key (usme_entity_id) references users(user_entity_id),
	constraint users_media_pk primary key (usme_id, usme_entity_id)
);

---Table users_education---13
create table users_education(
	usdu_id serial,
	usme_entity_id int,
	usdu_school varchar(255),
	usdu_degree varchar(15),
	usdu_field_study varchar(125),
	usdu_graduate_year varchar(4),
	usdu_start_date timestamp,
	usdu_end_date timestamp,
	usdu_grade varchar(5),
	usdu_activities varchar(512),
	usdu_description varchar(512),
	usdu_modified_date timestamp,
	foreign key (usme_entity_id) references users(user_entity_id),
	constraint users_education_pk primary key (usdu_id, usdu_school)
);

---Table users_phone---14
create table users_phone(
	uspo_entity_id int,
	uspo_number	varchar(15),
	uspo_modified_date timestamp,
	uspo_ponty_code varchar(15),
	foreign key (uspo_ponty_code) references phone_number_type(ponty_code),
	foreign key (uspo_entity_id) references users(user_entity_id),
	constraint users_phone_pk primary key (uspo_entity_id, uspo_number)
);
drop table users_phone cascade

---Table users_address---15
create table users_address(
	etad_addr_id int primary key,
	etad_modified_date timestamp,
	etad_entity_id int,
	etad_adty_id int,
	foreign key (etad_entity_id) references users(user_entity_id)
);

---Table business_entity---5
create table business_entity (
	entity_id serial primary key
);

---Table users--6
create table users (
	user_entity_id int primary key,
	foreign key (user_entity_id) references business_entity(entity_id),
	user_name varchar(15) unique,
	user_password varchar(256),
	user_first_name varchar(50),
	user_last_name varchar(50),
	user_birth_date timestamp,
	user_email_promotion int,
	user_demographic json,
	user_modified_date timestamp,
	user_photo varchar(255),
	user_current_role int
);

alter table users add constraint fk_user_current_role 
foreign key (user_current_role) references users_roles(usro_role_id);

---Table roles---7
create table roles(
	role_id serial primary key,
	role_name varchar(35) unique,
	role_type varchar(15),
	role_modified_date timestamp
);

---Table users_roles---8
create table users_roles(
	usro_entity_id int unique,
	usro_role_id int unique,
	constraint users_roles_pk primary key (usro_entity_id,usro_role_id),
	usro_modified_date timestamp,
	foreign key (usro_role_id) references roles(role_id)
);

alter table users_roles add constraint fk_usro_entity_id 
foreign key (usro_entity_id) references users_roles(usro_entity_id);

---Table users_experiences---3(usex_city_id=master)
create table users_experiences(
	usex_id serial,
	usex_entity_id int,
	constraint users_experiences_pk primary key (usex_id,usex_entity_id),
	foreign key (usex_entity_id) references users(user_entity_id),
	esex_title varchar(255),
	usex_profile_headline varchar(512),
	usex_company_name varchar(255),
	usex_is_current char(1),
	usex_start_date timestamp,
	usex_end_date timestamp,
	usex_industry varchar(15),
	usex_description varchar(512),
	usex_experience_type varchar(15),
	usex_city_id int
);

---Table phone_number_type---16
create table phone_number_type(
	ponty_code varchar(15) primary key,
	ponty_modified_date timestamp
);

---Table module master address---17
create table address(
	address_id serial primary key
);

---Table module master address_type---18
create table address_type(
		adty_id serial primary key
);

select * from business_entity
select * from roles
select * from users



























