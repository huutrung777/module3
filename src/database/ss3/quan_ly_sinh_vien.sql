create database if not exists  quan_ly_sinh_vien;
use quan_ly_sinh_vien;
drop table if exists class;
create table class(
id_class int primary key auto_increment,
name varchar(50),
start_date date
);
drop table if exists teacher;
create table teacher(
id_teacher int primary key auto_increment,
name varchar(50),
age date,
country varchar(50)
);
drop table if exists students;
create table students(
id_students int primary key auto_increment,
name varchar(50),
age int,
gender boolean,
email varchar(50),
score float,
class_id int
);
insert into students (name, age, gender, email, score,class_id)
values
('Huy', 12, 1, 'huy@gmail.com', 8.5,1),
('Lan', 13, 0, 'lan@gmail.com', 9.2,2),
('Minh', 14, 1, 'minh@gmail.com', 7.8,3),
('Trang', 15, 0, 'trang@gmail.com', 9.0,4);
insert into class (name,start_date)
values
('10A1', '2024-09-05'),
('10A2', '2024-12-10'),
('11B1', '2024-12-20'),
('12C1', '2024-05-15');
insert into teacher (name, age, country)
values
('Nguyen Van Nam', '1980-05-12', 'Vietnam'),
('Tran Thi Hoa', '1985-08-23', 'Vietnam'),
('John Smith', '1978-11-30', 'USA'),
('Sakura Tanaka', '1990-03-14', 'Japan');

-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select * from students where name like 'H%';
-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12
select * from class where month(start_date)=12;
create table subject(
id_subject int primary key auto_increment,
name_subject varchar(50),
credit int
);
insert into subject(name_subject, credit)
value
('Toán', 3),
('Lý', 4),
('Hóa', 2),
('Văn', 5),
('Tin học', 6),
('Anh văn', 3);
select * from students;
select * from class;
select * from teacher;
-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select * from subject 
where credit >= 3 and credit <= 5;
-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Huy’ là 2.
update class set name='Huy' where id=2;
-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Huy’ là 2.
select id_students, name from students where name = 'Huy';
update students set class_id = 2 where id_students = 1;
select * from students; 
-- Hiển thị các thông tin: id,name,score. Dữ liệu sắp xếp theo điểm thi (score) giảm dần. nếu trùng sắp theo tên tăng dần.
select* from students order by score desc, name asc;








