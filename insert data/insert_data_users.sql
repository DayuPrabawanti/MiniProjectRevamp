INSERT INTO users.business_entity 
VALUES 
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9)




INSERT INTO users.roles (role_id, role_name, role_type) VALUES ('1', 'Candidat', 'external');
INSERT INTO users.roles (role_id, role_name, role_type) VALUES ('2', 'Talent', 'external');
INSERT INTO users.roles (role_id, role_name, role_type) VALUES ('3', 'Recruiter', 'Internal');
INSERT INTO users.roles (role_id, role_name, role_type) VALUES ('4', 'Instructor', 'Internal');
INSERT INTO users.roles (role_id, role_name, role_type) VALUES ('5', 'Sales', 'Internal');
INSERT INTO users.roles (role_id, role_name, role_type) VALUES ('6', 'Manager', 'Internal');
INSERT INTO users.roles (role_id, role_name, role_type) VALUES ('7', 'Vice President', 'Internal');
INSERT INTO users.roles (role_id, role_name, role_type) VALUES ('8', 'Account Manager', 'Internal');
INSERT INTO users.roles (role_id, role_name, role_type) VALUES ('9', 'Student', 'external');
INSERT INTO users.roles (role_id, role_name, role_type) VALUES ('10', 'Administrator', 'Internal');
INSERT INTO users.roles (role_id, role_name, role_type) VALUES ('11', 'outsource', 'Internal');
INSERT INTO users.roles (role_id, role_name, role_type) VALUES ('12', 'Employee ', 'Internal');



INSERT INTO users.users (user_entity_id, user_name, user_first_name, user_last_name, user_email_promotion, user_modified_date, user_demographic, user_photo, user_current_role, user_password) VALUES ('1', 'kangdian', 'kang', 'dian', '1', '12-Jul-22', '{"latitude":12.90,"longitude":-99.989}', 'photo.png', '4', 'yadfaldjfapdjf;ajfpasdf');
INSERT INTO users.users (user_entity_id, user_name, user_first_name, user_last_name, user_email_promotion, user_modified_date, user_demographic, user_photo, user_current_role, user_password) VALUES ('2', 'nofal', 'nofal', 'firdaus', '0', '12-Jul-22', '{"latitude":12.90,"longitude":-99.989}', 'nofal.png', '4', 'ajdfja;dfpadjfadf');
INSERT INTO users.users (user_entity_id, user_name, user_first_name, user_last_name, user_email_promotion, user_modified_date, user_demographic, user_photo, user_current_role, user_password) VALUES ('3', 'abdul101', 'Abdul', 'Razaq', '1', '12-Jul-22', '{"latitude":12.90,"longitude":-99.989}', 'abdul.png', '1', 'alsdjfapdfaodfadf');
INSERT INTO users.users (user_entity_id, user_name, user_first_name, user_last_name, user_email_promotion, user_modified_date, user_demographic, user_photo, user_current_role, user_password) VALUES ('4', 'ratih', 'ratih wina', 'ludwig', '0', '12-Jul-22', '{"latitude":12.90,"longitude":-99.989}', 'ratih.png', '11', 'yadlfjadjfa');
INSERT INTO users.users (user_entity_id, user_name, user_first_name, user_last_name, user_email_promotion, user_modified_date, user_demographic, user_photo, user_current_role, user_password) VALUES ('5', 'Eka', 'Eka', 'Nugroho', '0', '12-Jul-22', '{"latitude":12.90,"longitude":-99.989}', 'eka.png', '8', 'ynyaldjf;adfadfad;faldfsa');
INSERT INTO users.users (user_entity_id, user_name, user_first_name, user_last_name, user_email_promotion, user_modified_date, user_demographic, user_photo, user_current_role, user_password) VALUES ('6', 'novia', 'novia', 'slebew', '1', '12-Jul-22', '{"latitude":12.90,"longitude":-99.989}', 'novia.png', '9', 'lajdfljaljdfajdf;a');
INSERT INTO users.users (user_entity_id, user_name, user_first_name, user_last_name, user_email_promotion, user_modified_date, user_demographic, user_photo, user_current_role, user_password) VALUES ('7', 'novelina', 'novelina', 'lina', '0', '12-Jul-22', '{"latitude":12.90,"longitude":-99.989}', 'lina.png', '3', 'lkadjfajdf;adf');
INSERT INTO users.users (user_entity_id, user_name, user_first_name, user_last_name, user_email_promotion, user_modified_date, user_demographic, user_photo, user_current_role, user_password) VALUES ('8', 'yugo', 'yugo', 'ardan', '1', '12-Jul-22', '{"latitude":12.90,"longitude":-99.989}', 'yogo.png', '1', 'aldjfadfa;dfjlajdf;a');
INSERT INTO users.users (user_entity_id, user_name, user_first_name, user_last_name, user_email_promotion, user_modified_date, user_demographic, user_photo, user_current_role, user_password) VALUES ('9', 'andhika', 'andhika', 'pratama', '1', '12-Jul-22', '{"latitude":12.90,"longitude":-99.989}', 'andhika.png', '2', 'ladfljafjadfas;f');


INSERT INTO users.users_roles (usro_entity_id, usro_role_id, usro_modified_date) VALUES ('1', '1', '12-Jul-22');
INSERT INTO users.users_roles (usro_entity_id, usro_role_id, usro_modified_date) VALUES ('2', '1', '12-Jul-22');
INSERT INTO users.users_roles (usro_entity_id, usro_role_id, usro_modified_date) VALUES ('3', '3', '12-Jul-22');
INSERT INTO users.users_roles (usro_entity_id, usro_role_id, usro_modified_date) VALUES ('4', '5', '12-Jul-22');




INSERT INTO users.phone_number_type (ponty_code, ponty_modified_date) VALUES
('Home', '12-Jul-22');
select * from users.business_entity 
select * from users.roles
select * from users.users
select * from users.users_roles
select * from users.phone_number_type
select * from users.users_phone
select * from users.users_address
select * from users.user_email


INSERT INTO users.users_phone (uspo_entity_id, uspo_number, uspo_ponty_code)
VALUES
(1, 8139809091, 'Cell'),
(1, 022-7890987, 'Home'),
(2, 089898989, 'Cell')

INSERT INTO users.users_address (etad_addr_id, etad_entity_id, etad_adty_id)
VALUES
(1, 1, 1),
(2, 2, 2)

INSERT INTO users.user_email (pmail_id, pmail_entity_id, pmail_address)
VALUES 
(1, 1, 'dian@code.id'),
(2, 1, 'dian@gmail.com'),
(3, 2, 'nofal@code.id')



INSERT INTO users.users_media (usme_id, usme_entity_id, usme_file_link, usme_filename, usme_filesize, usme_filetype, usme_note)
VALUES
(1, 1, 'https://', 'ijazah.png', 2345, 'png', 'ijazah'),
(2, 1, 'https://', 'cv.docx', 1890, 'word', 'cv')

INSERT INTO users.users_education (usdu_id, usdu_entity_id, usdu_school, usdu_degree, usdu_field_study, usdu_start_date, usdu_end_date, usdu_grade, usdu_activities, usdu_description) VALUES ('1', '1', 'MIT', 'Bachelor', 'Informatic', '12-Jul-00', '12-Aug-05', '3.45', 'Im bachelor with cumlaude','');

INSERT INTO users.users_experiences (usex_id, usex_entity_id, usex_title, usex_profile_headline, usex_employment_type, usex_company_name, usex_city_id, usex_is_current, usex_start_date, usex_end_date, usex_industry, usex_description, usex_experience_type) VALUES ('1', '1', 'Head Of Bootcamp', 'Software Engineer, Data Scientist', 'Fulltime', 'Code.id', '1', '1', '12-Jul-19', '12-Jul-20', 'Consultant IT', 'I believe…', 'company');
INSERT INTO users.users_experiences (usex_id, usex_entity_id, usex_title, usex_profile_headline, usex_employment_type, usex_company_name, usex_city_id, usex_is_current, usex_start_date, usex_end_date, usex_industry, usex_description, usex_experience_type) VALUES ('1', '1', 'Motivator', 'Act as volunter', 'Freelance', 'Government', '1', '0', '12-Jul-19', '12-Jul-20', 'Government', 'helping people to learn', 'voluntering');

INSERT INTO users.users_experiences_skill (uesk_usex_id, uesk_uski_id)
VALUES
(1, 1),
(1, 2),
(1, 3)

INSERT INTO users.users_skill (uski_id, uski_entity_id, uski_skty_name)
VALUES
(1, 1, 'java'),
(2, 1, 'dotnet'),
(3, 2, 'javascript')

select * from users.business_entity 
select * from users.roles
select * from users.users
select * from users.users_roles
select * from users.phone_number_type
select * from users.users_phone
select * from users.users_address
select * from users.user_email
select * from users.users_media
select * from users.users_education
select * from users.users_experiences
select * from users.users_experiences_skill
select * from users.users_skill