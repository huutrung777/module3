package com.example.bai11.service;

import com.example.bai11.entity.SanPham;
import com.example.bai11.repository.ISanPhamRepository;
import com.example.bai11.repository.SanPhamRepository;

import java.util.List;

public class SanPhamService implements ISanPhamService {
    ISanPhamRepository khachHangRepository = new SanPhamRepository();
    @Override
    public List<SanPham> findAll() {
        return khachHangRepository.findAll();
    }

    @Override
    public boolean add(SanPham sanPham) {
        return khachHangRepository.add(sanPham);
    }

    @Override
    public boolean deleteById(int id) {
        return khachHangRepository.deleteById(id);
    }

    @Override
    public List<SanPham> findByName(String tenSanPham) {
        return khachHangRepository.findByName(tenSanPham);
    }

    @Override
    public boolean update(SanPham sanPham) {
        return khachHangRepository.update(sanPham);
    }

    @Override
    public SanPham findById(int id) {
        return khachHangRepository.findById(id);
    }
}
