
insert into users.users(user_entity_id,user_name,user_password,user_first_name,user_last_name,user_birth_date,user_email_promoton,user_demographic,user_modified_date,user_photo,user_current_role) values
(1, ' kangdian', 'yadfaldjfapdjf;ajfpasdf', 'kang', 'dian', null, 1, '{latitude:12.90,longitude:-99.989}', '12-Jul-22', 'photo.png', 4),
(2, 'nofal', 'ajdfja;dfpadjfadf', 'nofal', 'firdaus', null, 0, '{latitude:12.90,longitude:-99.989}', '12-Jul-22', 'nofal.png', 4),
(3, 'abdul101', 'alsdjfapdfaodfadf', 'Abdul', 'Razaq', null, 1, '{latitude:12.90,longitude:-99.989}', '12-Jul-22', 'abdul.png', 1),
(4, 'ratih', 'yadlfjadjfa', 'ratih wina', 'ludwig', null, 0, '{latitude:12.90,longitude:-99.989}', '12-Jul-22', 'ratih.png', 11),
(5, 'Eka', 'ynyaldjf;adfadfad;faldfsa', 'Eka', 'nugroho', null, 0, '{latitude:12.90,longitude:-99.989}', '12-Jul-22', 'eka.png', 8),
(6, 'novia', 'lajdfljaljdfajdf;a', 'novia', 'slebew', null, 1, '{latitude:12.90,longitude:-99.989}', '12-Jul-22', 'novia.png', 9),
(7, 'novelina', 'lkadjfajdf;adf', 'novelina', 'lina', null, 0, '{latitude:12.90,longitude:-99.989}', '12-Jul-22', 'lina.png', 3),
(8, 'yugo', 'aldjfadfa;dfjlajdf;a', 'yugo', 'ardan', null, 1, '{latitude:12.90,longitude:-99.989}', '12-Jul-22', 'yogo.png', 1),
(9, 'andhika', 'ladfljafjadfas;f', 'andhika', 'pratama', null, 1, '{latitude:12.90,longitude:-99.989}', '12-Jul-22', 'andhika.png', 2);
select * from users.users;

insert into payment.bank(bank_entity_id,bank_code,bank_name) values
(5, 'BCA', 'Bank Central Asia'),
(4, 'BNI', 'Bank Negara Indonesia'),
(3, 'MAN', 'Bank Mandiri'),
(2, 'JAGO', 'Bank Jago');
select * from payment.bank


insert into payment.fintech(fint_entity_id,fint_code,fint_name) values
(1, 'GOTO', 'Payment GoTo'),
(2, 'OVO', 'OVO'),
(3, 'SP', 'Shopee Paylater');
select * from payment.fintech

insert into payment.users_account(usac_bank_entity_id,usac_user_entity_id,usac_account_number,usac_saldo,usac_type,usac_status) values
(3, 3, 131899555, 100000, 'debet', 'blokir'),
(2, 3, 087654321, 50000, 'payment', 'active');
select * from payment.users_account

insert into payment.users_account(usac_bank_entity_id,usac_user_entity_id,usac_account_number,usac_saldo,usac_type,usac_status) values
(3, 3, 131899555, 100000, 'debet', 'blokir'),
(2, 3, 087654321, 50000, 'payment', 'active');
select * from payment.users_account

insert into payment.transaction_payment(trpa_id,trpa_code_number,trpa_debet,trpa_credit,trpa_type,trpa_note,trpa_source_id,trpa_target_id,trpa_user_entity_id) values
(1, 20220727#000001, 0, 50000, 'topup', 'topup bank ke goto', 131899555, 087654321, 3),
(2, 20220727#000002, 50000, 0, 'topup', 'receive topup', 087654321, 131899555, 3),
(3, 20220727#000003, null, 10000, 'order', 'bayar shopee order', 131899555, 99999, 3);
select * from payment.transaction_payment