create database if not exists  quan_ly_sinh_vien;
use quan_ly_sinh_vien;
create table class(
id int primary key auto_increment,
name varchar(50)
);
create table teracher(
id int primary key auto_increment,
name varchar(50),
age date,
country varchar(50)
);
