create table sales.special_offer(
	spof_id serial primary key,
	spof_description varchar(256),
	spof_discount number,
	spof_type varchar(15),
	spof_start_date timestamp,
	spof_end_date timestamp,
	spof_min_qty integer,
	spof_max_qty integer,
	spof_modified_date timestamp,
	spof_cate_id integer,
	foreign key spof_cate_id references master.category(cate_id)
)

create table sales.special_offer_programs (
	soco_id serial primary key,
	soco_spof_id integer,
	soco_prof_entity_id integer,
	soco_status varchar(15),
	soco_modified_date timestamp,
	foreign key (soco_spof_id) references special_offer(spof_id),
	foreign key (soco_prof_entity_id) references curriculum.program_entity(prof_entity_id),
	constraint soco primary key (spof_id,prof_entity_id)
)

create table sales.cart_items (
	cait_id serial primary key,
	cait_quantity integer,
	cait_unit_price number,
	cait_modified_date timestamp,
	cait_user_entity_id integer, 
	cait_prog_entity_id integer,
	foreign key (cait_user_entity_id) references users.users(user_entity_id),
	foreign key (user_entity_id) references curriculum.program_entity(prof_entity_id)
)
create table sales.sales_order_header (
	sohe_id serial primary key,
	sohe_order_date timestamp,
	sohe_due_date timestamp,
	sohe_ship_date timestamp,
	sohe_order_number varchar(25)unique,
	sohe_account_number varchar(25),
	sohe_trapa_code_number varchar(25),
	sohe_subtotal number,
	sohe_tax number,
	sohe_total_due number,
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
	sode_unit_price number,
	sode_unit_discount number,
	sode_line_total number,
	sode_modified_date timestamp,
	sode_sohe_id integer,
	sode_prog_entity_id integer,
	foreign key (sode_sohe_id) references sales_order_header(sohe_id),
	foreign key (sode_prog_entity_id) references curriculum.program_entity(prof_entity_id)
)




