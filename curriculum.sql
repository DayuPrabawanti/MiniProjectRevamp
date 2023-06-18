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