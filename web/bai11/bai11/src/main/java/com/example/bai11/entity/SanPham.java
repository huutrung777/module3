package com.example.bai11.entity;

public class SanPham {
    private int id;
    private String tenSanPham;
    private double gia;
    private String moTa;
    private String nhaSanXuat;

    public SanPham() {
    }

    public SanPham(int id, String tenSanPham, double gia, String moTa, String nhaSanXuat) {
        this.id = id;
        this.tenSanPham = tenSanPham;
        this.gia = gia;
        this.moTa = moTa;
        this.nhaSanXuat = nhaSanXuat;
    }

    public SanPham(String tenSanPham, double gia, String moTa, String nhaSanXuat) {
        this.tenSanPham = tenSanPham;
        this.gia = gia;
        this.moTa = moTa;
        this.nhaSanXuat = nhaSanXuat;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTenSanPham() {
        return tenSanPham;
    }

    public void setTenSanPham(String tenSanPham) {
        this.tenSanPham = tenSanPham;
    }

    public double getGia() {
        return gia;
    }

    public void setGia(double gia) {
        this.gia = gia;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    public String getNhaSanXuat() {
        return nhaSanXuat;
    }

    public void setNhaSanXuat(String nhaSanXuat) {
        this.nhaSanXuat = nhaSanXuat;
    }

}
