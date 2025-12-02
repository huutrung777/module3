package com.example.bai11.repository;

import com.example.bai11.entity.SanPham;

import java.util.ArrayList;
import java.util.List;

public class SanPhamRepository implements ISanPhamRepository {
    private static List<SanPham> sanPhamList = new ArrayList<>();
    static {
        sanPhamList.add(new SanPham(1, "IPhone 15", 25000000, "Điện thoại cao cấp", "Apple"));
        sanPhamList.add(new SanPham(2, "Samsung S24", 21000000, "Flagship Samsung", "Samsung"));
        sanPhamList.add(new SanPham(3, "Macbook Pro", 45000000, "Laptop cấu hình mạnh", "Apple"));
        sanPhamList.add(new SanPham(4, "Dell XPS 13", 32000000, "Ultrabook sang trọng", "Dell"));
        sanPhamList.add(new SanPham(5, "Sony WH-1000XM5", 9000000, "Tai nghe chống ồn", "Sony"));
        sanPhamList.add(new SanPham(6, "iPad Air 5", 16000000, "Máy tính bảng nhẹ", "Apple"));
        sanPhamList.add(new SanPham(7, "Asus Rog Phone", 23000000, "Điện thoại gaming", "Asus"));
        sanPhamList.add(new SanPham(8, "Logitech MX Master 3", 2500000, "Chuột văn phòng cao cấp", "Logitech"));
        sanPhamList.add(new SanPham(9, "HP Spectre x360", 35000000, "Laptop 2 trong 1", "HP"));
        sanPhamList.add(new SanPham(10, "Xiaomi Redmi Note 14", 6000000, "Điện thoại giá rẻ", "Xiaomi"));
    }
    @Override
    public List<SanPham> findAll() {
        return sanPhamList;
    }

    @Override
    public boolean add(SanPham sanPham) {
        return sanPhamList.add(sanPham);
    }

    @Override
    public boolean deleteById(int id) {
        for (int i = 0; i < sanPhamList.size() ; i++) {
            if (sanPhamList.get(i).getId() == id) {
                sanPhamList.remove(i);
                return true;
            }
        }
        return false;
    }

    @Override
    public SanPham findByName(String tenSanPham) {
        for (SanPham sp : findAll()) {
            if (sp.getTenSanPham().equalsIgnoreCase(tenSanPham)) {
                return sp; // trả sản phẩm đầu tiên trùng tên
            }
        }
        return null;
    }

    @Override
    public boolean update(SanPham sanPham) {
        SanPham existing=findByName(sanPham.getTenSanPham());
        if(existing!=null){
            existing.setTenSanPham(sanPham.getTenSanPham());
            existing.setGia(sanPham.getGia());
            existing.setMoTa(sanPham.getMoTa());
            existing.setNhaSanXuat(sanPham.getNhaSanXuat());
            return true;

        }
        return false;
    }

    @Override
    public SanPham findById(int id) {
        for (SanPham s : findAll()) {
            if (s.getId() == id) {
                return s;
            }
        }
        return null;
    }
}
