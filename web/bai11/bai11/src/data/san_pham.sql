create database if not exists san_pham;
use san_pham;
CREATE TABLE san_pham (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ten_san_pham VARCHAR(255) NOT NULL,
    gia DOUBLE NOT NULL,
    mo_ta TEXT,
    nha_san_xuat VARCHAR(255)
);
INSERT INTO san_pham (ten_san_pham, gia, mo_ta, nha_san_xuat)
VALUES
('Laptop Dell Inspiron', 18000000, 'Laptop học tập và văn phòng', 'Dell'),
('iPhone 14', 21000000, 'Điện thoại cao cấp của Apple', 'Apple'),
('Tai nghe Sony WH-1000XM5', 8500000, 'Tai nghe chống ồn cao cấp', 'Sony'),
('Chuột Logitech MX Master 3', 2500000, 'Chuột không dây cho dân thiết kế', 'Logitech');
SELECT * FROM san_pham;

