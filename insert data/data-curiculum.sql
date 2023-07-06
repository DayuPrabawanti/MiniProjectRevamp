// program_entity
insert into curriculum.program_entity (prog_entity_id,prog_title,prog_headline,prog_type,prog_learning_type,prog_rating, 
prog_total_traniee,prog_modified_date,prog_image,prog_best_seller,prog_price,prog_language,prog_duration,prog_duration_type, prog_tag_skill,
prog_city_id, prog_cate_id,prog_created_by,prog_status) values 
(1,'Javascript Fullstack From Zero To Expert','Modern javascript for everyone with projects, challenge and theory. More Course in one !',
'course','online',5,3,'2023-01-23','javascript.png',1,750000,'bahasa', 10,'days',null,1,2,null,'Publish'),
(2,'Java Technology','Join bootcamp and become java developer','bootcamp','offline',7,2,'2023-03-12','java.png',1,200000,'bahasa',2,'month',
null,1,3,null,'Publish'),
(3,'Golang','Develop application with golang','bootcamp','offline',9,5,'2023-05-15','golang.png',5,550000,'bahasa',3,'month',null,2,2,null,'Publish')

// Program_review
insert into curriculum.program_review (prow_user_entity_id,prow_prog_entity_id,prow_review,prow_rating,prow_modified_date)
values
(6,1,'Course javascript sangat comprehensif, mudah diikutin, trainer sangat menguasai materi',4,'2023-02-23'),
(2,3,'Very good, has allowed me to grasp the basic syntax and structure of Golang. Also provides effective challenges.',7,'2023-05-30'),
(4,1,'we going to practice variables and strings in JavaScript so you can hone your skills and feel confident taking them to the real world.',5,'2023-03-12')

// Program_entity_description
insert into curriculum.program_entity_description (pred_prog_entity_id,pred_item_learning,pred_item_include,pred_requirment,pred_description,pred_target_level)
values
(1, '{ "items" : ["Become an advanced, confident, and modern JavaScript developer from scratch","Become job-ready by understanding how JavaScript really works behind the scenes","JavaScript fundamentals: variables, if/else, operators, boolean logic, functions, arrays, objects, loops, strings, etc."]}', 
'{"items":[{"value" : "69 hours on-demand video","icon" : "video"},{"value" : "22 article","icon" : "list"},{"value" : "18 downloadable resources","icon" : "download"},{"value" : "Full lifetime access","icon" : "infinite"},{"value" : "Access on mobile and TV","icon" : "phone"},{"value" : "Certificate of completion","icon" : "reward"}]}', 
'{"items" : ["No coding experience is necessary to take this course! I take you from beginner to expert!","Any computer and OS will work — Windows, macOS or Linux. We will set up your text editor the course.","A basic understanding of HTML and CSS is a plus, but not a must! The course includes an HTML and CSS crash course."]}', 
'{"items" : "JavaScript is the most popular programming language in the world. It powers the entire modern web. It provides millions of high-paying jobs all over the world."}', 
'{"items" : "Take this course if you want to gain a true and deep understanding of JavaScript"}'),

// Sections
insert into curriculum.sections (sect_id,sect_prog_entity_id,sect_title,sect_description,sect_total_section,sect_total_lecture,sect_total_minute,sect_modified_date)
values
(1,1,'Javascript Fundamental',null,12,5,60,'2022-08-01'),
(2,1,'Iteration',null,23,8,120,'2022-03-10'),
(3,1,'Data Structure',null,8,7,80,'2023-01-15')

//Section Detail
insert into curriculum.section_detail (secd_id,secd_title,secd_preview,secd_score,secd_note,secd_minute,secd_modified_date)
values
(1,'Course Structure And Project',1,7,'you will learning how to create new project',03:05:00,'2023-03-23'),
(2,'Setting up Visual Code',1,9,null,01:15:00,'2023-05-15')

// Section_detail_material
insert into curriculum.section_detail_material (sedm_id,sedm_filename,sedm_filesize,sedm_filetype,sedm_filelink,sedm_modified_date,sedm_secd_id)
values
(1,'video1.mp4',12345,'MP4','https://codeacademy/assets','2023-01-23',1),
(2,'video2.mp4',2435,'MP4','https://codeacademy/assets/gol','2023-01-23',3)


