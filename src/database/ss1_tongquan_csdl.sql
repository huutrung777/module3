create database m3_c0525l1;
use m3_c0525l1;
-- tạo bảng
create table students(
id int primary key auto_increment,
name varchar(50),
age int,
gender boolean 
);
-- alter table students add primary key (id);
-- thêm dư liệu cho bảng
insert into students(id,name,gender) value(1,'Trung',true);
insert into students value(2,'Trung2',true);
insert into students(id,name)
values (3,'Trung2'),(4,'Trung4');

-- lấy dữ liệu
select id,name from students;
select * from students;
select * from students where gender =1;
 -- chỉnh sửa
UPDATE students SET id = 2 WHERE id = 3;
UPDATE students SET id = 3 WHERE id = 4;
-- xoá dữ liệu
delete from students where id = 4;
-- xoá bảng
drop table students;
drop database m3_c0525l1;



 
