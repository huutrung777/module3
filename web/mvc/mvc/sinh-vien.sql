create database if not exists m3_c0525l1_web;
use m3_c0525l1_web;
drop table students;
create table students(
id int auto_increment primary key,
name varchar(50),
gender boolean,
score float
);
insert into students(name, gender, score) values
('Nguyễn Hữu Trung', true, 7.5),
('Trần Thị Bình', false, 8.0),
('Lê Văn Cường', true, 6.0),
('Phạm Thị Dung', false, 9.2),
('Hoàng Văn Minh', true, 5.8),
('Đỗ Thị Hạnh', false, 7.0),
('Võ Văn Tài', true, 4.5),
('Đinh Thị Như', false, 8.7),
('Phan Văn Kiệt', true, 6.8),
('Bùi Thị Trang', false, 9.0);