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
-- Bảng Customer
insert into Customer ( cName, cAge)
values
( 'Minh Quan', 10),
( 'Ngoc Oanh', 20),
( 'Hong Ha', 50);
insert into order1 ( Customer_cID, oDate, oTotalPrice)
values
( 1, '2006-03-21', NULL),
( 2, '2006-03-23', NULL),
( 3, '2006-03-16', NULL);

-- Bảng Product
insert into Product ( pName, pPrice)
values
( 'May Giat', 3),
( 'Tu Lanh', 5),
( 'Dieu Hoa', 7),
('Quat', 1),
( 'Bep Dien', 2);

-- Bảng OrderDetail
insert into OrderDetail (order1_oID, Product_pID, odQTY)
values
(1, 1, 3),
(1, 3, 7),
(1, 4, 2),
(2, 1, 1),
(3, 1, 8),
(2, 5, 4),
(2, 3, 3);
-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select * from order1;
-- Hiển thị danh sách các khách hàng đã mua hàng và danh sách sản phẩm được mua bởi các khách hàng
select c.cName as 'Khach hang', p.pName as 'San pham'
from Customer c
join order1 o on c.cID = o.Customer_cID
join OrderDetail od on o.oID = od.order1_oID
join Product p on od.Product_pID = p.pID;
-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select c.cname
from customer c
left join order1 o on c.cid = o.customer_cid
where o.oid is null;
-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
select 
  o.oid as ma_hoa_don,
  o.odate as ngay_ban,
  sum(od.odqty * p.pprice) as tong_tien
from order1 o
join orderdetail od on o.oid = od.order1_oid
join product p on od.product_pid = p.pid
group by o.oid, o.odate;
