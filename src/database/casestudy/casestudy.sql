create database if not exists  case_study;
use case_study;
drop table if exists dich_vu_di_kem;
create table dich_vu_di_kem(
ma_dich_vu_di_kem int primary key auto_increment,
ten_dich_vu_di_kem varchar(45),
gia double,
don_vi varchar(10),
trang_thai varchar(45)
);
drop table if exists hop_dong_chi_tiet;
create table hop_dong_chi_tiet(
ma_hop_dong_chi_tiet int primary key auto_increment ,
ma_hop_dong int,
ma_dich_vu_di_kem int,
so_luong int,
foreign key (ma_dich_vu_di_kem) references dich_vu_di_kem(ma_dich_vu_di_kem),
foreign key (ma_hop_dong) references hop_dong(ma_hop_dong)
);
create table loai_dich_vu(
ma_loai_dich_vu int primary key auto_increment,
ten_loai_dich_vu varchar(45)
);
create table kieu_thue(
ma_kieu_thue int primary key auto_increment,
ten_kieu_thue varchar(45)
);
create table dich_vu(
ma_dich_vu int primary key auto_increment,
ten_dich_vu varchar(45),
dien_tich int,
chi_phi_the double,
so_nguoi_toi_da int,
ma_kieu_thue int,
ma_loai_dich_vu int,
foreign key (ma_kieu_thue) references kieu_thue(ma_kieu_thue),
foreign key (ma_loai_dich_vu) references loai_dich_vu(ma_loai_dich_vu),
tieu_chuan_phong varchar(45),
mo_ta_tien_nghi_khac varchar(45),
dien_tich_ho_boi double,
so_tang int
);
create table vi_tri(
ma_vi_tri int primary key auto_increment,
ten_vi_tri varchar(45)
);
drop table if exists trinh_do;
create table trinh_do(
ma_trinh_do int primary key auto_increment,
ten_trinh_do varchar(45)
);
create table bo_phan(
ma_bo_phan int primary key auto_increment,
ten_bo_phan varchar(45)
);
create table loai_khach(
ma_loai_khach int primary key auto_increment,
ten_loai_khach varchar(45)
);
create table nhan_vien(
ma_nhan_vien int primary key auto_increment,
ho_ten varchar(45),
ngay_sinh date,
so_cmnd varchar(45),
luong double,
so_dien_thoai varchar(45),
email varchar(45),
dia_chi varchar(45),
ma_vi_tri int,
ma_trinh_do int,
ma_bo_phan int,
foreign key (ma_bo_phan) references bo_phan(ma_bo_phan),
foreign key (ma_trinh_do) references trinh_do(ma_trinh_do),
foreign key (ma_vi_tri) references vi_tri(ma_vi_tri)
);
drop table if exists khach_hang;
create table khach_hang(
ma_khach_hang int primary key auto_increment,
ma_loai_khach int,
foreign key (ma_loai_khach) references loai_khach(ma_loai_khach),
ho_ten varchar(45),
ngay_sinh date,
gioi_tinh bit(1),
so_cmnd varchar(45),
so_dien_thoai varchar(45),
email varchar(45),
dia_chi varchar(45)
);
create table hop_dong(
ma_hop_dong int primary key auto_increment,
ngay_lam_hop_dong datetime,
ngay_ket_thuc datetime,
tien_dat_coc double,
ma_nhan_vien int,
ma_khach_hang int,
ma_dich_vu int,
foreign key (ma_nhan_vien) references nhan_vien(ma_nhan_vien),
foreign key (ma_khach_hang) references khach_hang(ma_khach_hang),
foreign key (ma_dich_vu) references dich_vu(ma_dich_vu)
);
insert into vi_tri (ten_vi_tri) values
('Quản Lý'),
('Nhân Viên');
select * from vi_tri;
insert into trinh_do (ten_trinh_do) values
('Trung cấp'),
('Cao đẳng'),
('Đại học'),
('Sau đại học');
select * from trinh_do;
insert into bo_phan (ten_bo_phan) values
('Sale-Marketing'),
('Hành chính'),
('Phục vụ'),
('Quản lý');
select * from bo_phan;
insert into nhan_vien
(ho_ten, ngay_sinh, so_cmnd, luong, so_dien_thoai, email, dia_chi, ma_vi_tri, ma_trinh_do, ma_bo_phan)
values
('Nguyễn Văn An', '1970-11-07', '456231786', 10000000, '0901234121', 'annguyen@gmail.com', '295 Nguyễn Tất Thành, Đà Nẵng', 1, 3, 1),
('Lê Văn Bình', '1997-04-09', '654231234', 7000000, '0934212314', 'binhlv@gmail.com', '22 Yên Bái, Đà Nẵng', 1, 2, 2),
('Hồ Thị Yến', '1995-12-12', '999231723', 14000000, '0412352315', 'thiyen@gmail.com', 'K234/11 Điện Biên Phủ, Gia Lai', 1, 3, 2),
('Võ Công Toản', '1980-04-04', '123231365', 17000000, '0374443232', 'toan0404@gmail.com', '77 Hoàng Diệu, Quảng Trị', 1, 4, 4),
('Nguyễn Bỉnh Phát', '1999-12-09', '454363232', 6000000, '0902341231', 'phatphat@gmail.com', '43 Yên Bái, Đà Nẵng', 2, 1, 1),
('Khúc Nguyễn An Nghi', '2000-11-08', '964542311', 7000000, '0978653213', 'annghi20@gmail.com', '294 Nguyễn Tất Thành, Đà Nẵng', 2, 2, 3),
('Nguyễn Hữu Hà', '1993-01-01', '534323231', 8000000, '0941234553', 'nhh0101@gmail.com', '4 Nguyễn Chí Thanh, Huế', 2, 3, 2),
('Nguyễn Hà Đông', '1989-09-03', '234414123', 9000000, '0642123111', 'donghanguyen@gmail.com', '111 Hùng Vương, Hà Nội', 2, 4, 4),
('Tòng Hoang', '1982-09-03', '256781231', 6000000, '0245144444', 'hoangtong@gmail.com', '213 Hàm Nghi, Đà Nẵng', 2, 4, 4),
('Nguyễn Công Đạo', '1994-01-08', '755434343', 8000000, '0988767111', 'nguyencongdao12@gmail.com', '6 Hoà Khánh, Đồng Nai', 2, 3, 2);
select * from nhan_vien;
insert into loai_khach (ten_loai_khach) values
('Diamond'),
('Platinium'),
('Gold'),
('Silver'),
('Member');
select * from loai_khach;
insert into khach_hang (ma_loai_khach, ho_ten, ngay_sinh, gioi_tinh, so_cmnd, so_dien_thoai, email, dia_chi) values
(1, 'Nguyễn Thị Hào', '1990-05-15', 1, '123456111', '0905000001', 'hao@gmail.com', 'Đà Nẵng'),
(3, 'Trương Đình Nghệ', '1988-09-01', 1, '234567222', '0905000002', 'nghe@gmail.com', 'Huế'),
(2, 'Phạm Xuân Diệu', '1989-04-22', 1, '345678333', '0905000003', 'dieu@gmail.com', 'Quảng Nam'),
(5, 'Nguyễn Mỹ Kim', '1994-11-03', 0, '456789444', '0905000004', 'kim@gmail.com', 'Đà Nẵng'),
(4, 'Nguyễn Tâm Đắc', '1992-07-12', 1, '567890555', '0905000005', 'dac@gmail.com', 'Quảng Trị');
select * from khach_hang;
insert into loai_dich_vu (ten_loai_dich_vu) values
('Villa'),
('House'),
('Room');
select * from loai_dich_vu;
insert into kieu_thue (ten_kieu_thue) values
('Theo năm'),
('Theo tháng'),
('Theo ngày'),
('Theo giờ');
select * from kieu_thue;
insert into dich_vu (ten_dich_vu, dien_tich, chi_phi_the, so_nguoi_toi_da, ma_kieu_thue, ma_loai_dich_vu, tieu_chuan_phong, mo_ta_tien_nghi_khac, dien_tich_ho_boi, so_tang)
values
('Villa Beach Front', 25000, 1000000, 10, 3, 1, 'Vip', 'Có hồ bơi riêng', 300, 3),
('House Princess', 14000, 500000, 6, 3, 2, 'Normal', 'Có bếp nấu ăn', 0, 2),
('Room Twin 01', 5000, 100000, 2, 4, 3, 'Standard', 'Có TV, wifi', 0, 1);
select * from dich_vu;
insert into dich_vu_di_kem (ten_dich_vu_di_kem, gia, don_vi, trang_thai) values
('Massage', 100000, 'suất', 'Còn'),
('Thuê xe máy', 80000, 'chiếc', 'Còn'),
('Buffet sáng', 150000, 'suất', 'Còn'),
('Buffet trưa', 200000, 'suất', 'Hết'),
('Buffet tối', 250000, 'suất', 'Còn'),
('Thuê karaoke', 300000, 'giờ', 'Còn');
select * from dich_vu_di_kem;
insert into hop_dong (ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, ma_nhan_vien, ma_khach_hang, ma_dich_vu) values
('2021-07-14', '2021-07-21', 200000, 1, 1, 1),
('2021-03-15', '2021-03-17', 50000, 2, 3, 2),
('2021-06-01', '2021-06-03', 0, 3, 4, 3),
('2021-05-25', '2021-05-27', 100000, 4, 5, 1);
select * from hop_dong;
insert into hop_dong_chi_tiet (ma_hop_dong, ma_dich_vu_di_kem, so_luong) values
(1, 2, 2),
(1, 3, 1),
(2, 1, 1),
(3, 5, 2),
(4, 6, 3);
select * from hop_dong_chi_tiet;
-- 2.Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
select ho_ten, so_dien_thoai, luong
from nhan_vien
where (ho_ten like 'h%' or ho_ten like 't%' or ho_ten like 'k%')
and char_length(ho_ten) <= 15;
-- 3.Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select *
from khach_hang
where (year(curdate()) - year(ngay_sinh)) >= 18 
and (year(curdate()) - year(ngay_sinh)) <= 50
and (dia_chi = 'Đà Nẵng' or dia_chi = 'Quảng Trị');
-- 4.Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần.
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
select kh.ho_ten, count(hd.ma_hop_dong) as so_lan_dat_phong
from khach_hang kh
join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
where lk.ten_loai_khach = 'diamond'
group by kh.ho_ten
order by so_lan_dat_phong asc;
-- 5.Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien (Với tổng tiền được tính theo công thức như sau:
-- Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra). 
select 
    kh.ma_khach_hang,
    kh.ho_ten,
    lk.ten_loai_khach,
    hd.ma_hop_dong,
    dv.ten_dich_vu,
    hd.ngay_lam_hop_dong,
    hd.ngay_ket_thuc,
    (ifnull(dv.chi_phi_the, 0) + ifnull(sum(hdct.so_luong * dvdk.gia), 0)) as tong_tien
from khach_hang kh
left join loai_khach lk 
    on kh.ma_loai_khach = lk.ma_loai_khach
left join hop_dong hd 
    on kh.ma_khach_hang = hd.ma_khach_hang
left join dich_vu dv 
    on hd.ma_dich_vu = dv.ma_dich_vu
left join hop_dong_chi_tiet hdct 
    on hd.ma_hop_dong = hdct.ma_hop_dong
left join dich_vu_di_kem dvdk 
    on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
group by 
    kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach,
    hd.ma_hop_dong, dv.ten_dich_vu, 
    hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, dv.chi_phi_the;

-- 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_the as chi_phi_thue, ldv.ten_loai_dich_vu
from dich_vu dv
join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
where dv.ma_dich_vu not in (
    select ma_dich_vu
    from hop_dong
    where year(ngay_lam_hop_dong) = 2021 and month(ngay_lam_hop_dong) in (1, 2, 3)
);
-- 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.so_nguoi_toi_da, dv.chi_phi_the as chi_phi_thue, ldv.ten_loai_dich_vu
from dich_vu dv
join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
where dv.ma_dich_vu in (
    select ma_dich_vu
    from hop_dong
    where year(ngay_lam_hop_dong) = 2020
)
and dv.ma_dich_vu not in (
    select ma_dich_vu
    from hop_dong
    where year(ngay_lam_hop_dong) = 2021
);
-- 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.
select distinct ho_ten from khach_hang;

-- 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng
select month(ngay_lam_hop_dong) as thang, count(distinct ma_khach_hang) as so_khach_hang
from hop_dong
where year(ngay_lam_hop_dong) = 2021
group by month(ngay_lam_hop_dong)
order by thang;
-- 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
select hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc,
       ifnull(sum(hdct.so_luong), 0) as so_luong_dich_vu_di_kem
from hop_dong hd
left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
group by hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc;
-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
select distinct dvdk.*
from dich_vu_di_kem dvdk
join hop_dong_chi_tiet hdct on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
join hop_dong hd on hdct.ma_hop_dong = hd.ma_hop_dong
join khach_hang kh on hd.ma_khach_hang = kh.ma_khach_hang
join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
where lk.ten_loai_khach = 'diamond'
and kh.dia_chi in ('vinh', 'quảng ngãi');
