create database if not exists demo_products;
use demo_products;
drop table products;
create table products (
    id int auto_increment primary key,
    productcode varchar(50),
    productname varchar(50) ,
    productprice double,
    productamount int ,
    productdescription varchar(50),
    productstatus varchar (50)
);
insert into products (productcode, productname, productprice, productamount, productdescription, productstatus)
values 
('p001', 'laptop dell', 1500.00, 10, 'dell inspiron 15', 'available'),
('p002', 'laptop hp', 1400.00, 5, 'hp pavilion x360', 'available'),
('p003', 'mouse logitech', 25.50, 50, 'chuột không dây logitech', 'available'),
('p004', 'keyboard corsair', 70.00, 20, 'bàn phím cơ corsair', 'outofstock'),
('p005', 'monitor samsung', 300.00, 8, 'màn hình samsung 24 inch', 'available'),
('p006', 'usb sandisk', 15.00, 100, 'usb 64gb sandisk', 'available');
explain select * from products where productcode = 'p001';
explain select * from products where productname = 'laptop dell' and productprice = 1500.00;
drop index i_product_code on products;
create unique index i_product_code on products(productcode);
create index i_name_price on products(productname, productprice);
explain select * from products where productcode = 'p001';
explain select * from products where productname = 'laptop dell' and productprice = 1500.00;
create view view_product as
select productcode, productname, productprice, productstatus
from products;
select * from view_product;
create or replace view view_product as
select productcode, productname, productprice, productstatus, productamount
from products;
drop view view_product;
delimiter //
create procedure get_all_products()
begin
    select * from products;
end //
delimiter ;
call get_all_products();


delimiter //
create procedure add_product(
    in p_code varchar(50),
    in p_name varchar(50),
    in p_price double,
    in p_amount int,
    in p_desc varchar(50),
    in p_status varchar(50)
)
begin
    insert into products (productcode, productname, productprice, productamount, productdescription, productstatus)
    values (p_code, p_name, p_price, p_amount, p_desc, p_status);
end //
delimiter ;
call add_product('p007', 'tai nghe sony', 85.00, 30, 'tai nghe bluetooth', 'available');



delimiter //
create procedure update_product_by_id(
    in p_id int,
    in p_code varchar(50),
    in p_name varchar(50),
    in p_price double,
    in p_amount int,
    in p_desc varchar(50),
    in p_status varchar(50)
)
begin
    update products
    set productcode = p_code,
        productname = p_name,
        productprice = p_price,
        productamount = p_amount,
        productdescription = p_desc,
        productstatus = p_status
    where id = p_id;
end //
delimiter ;
call update_product_by_id(1, 'p001', 'laptop dell xps', 1550.00, 12, 'dell xps 13 plus', 'available');

delimiter //
create procedure delete_product_by_id(in p_id int)
begin
    delete from products where id = p_id;
end //
delimiter ;

call delete_product_by_id(4);


