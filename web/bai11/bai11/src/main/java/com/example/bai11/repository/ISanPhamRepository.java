package com.example.bai11.repository;

import com.example.bai11.entity.SanPham;

import java.util.List;

public interface ISanPhamRepository {
    List<SanPham> findAll();
    boolean add(SanPham sanPham);
    boolean deleteById(int id);
    List<SanPham> findByName(String tenSanPham);
    boolean update(SanPham sanPham);
    SanPham findById(int id);
}
