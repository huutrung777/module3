create database if not exists bai2_ss2;
use bai2_ss2;
create table Customer(
cID int primary key auto_increment,
cName varchar(50),
cAge int
);
drop table if exists order1;
create table order1(
oID int primary key auto_increment,
Customer_cID int,
oDate date,
oTotalPrice float,
foreign key (Customer_cID) references Customer(cID)
);
create table Product(
pID int primary key auto_increment,
pName varchar(50),
pPrice  float
);
create table OrderDetail(
order1_oID int,
Product_pID int,
odQTY varchar(20),
primary key(order1_oID,Product_pID),
foreign key(order1_oID) references order1(oID),
foreign key(Product_pID) references Product(pID)
);