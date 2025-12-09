package com.example.bai11.repository;

import com.example.bai11.entity.SanPham;
import com.example.bai11.until.ConnectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SanPhamRepository implements ISanPhamRepository {
    private final String SELECT_ALL = "select * from san_pham;";
    private final String INSERT_INTO = "insert into san_pham(ten_san_pham,gia,mo_ta,nha_san_xuat) values(?,?,?,?);";
    private final String DELETE_BY_ID = "delete from san_pham where id = ?;";
    private final String SELECT_BY_ID = "select * from san_pham where id = ?;";
    private final String UPDATE_STUDENT = "update san_pham set ten_san_pham = ?, gia = ?, mo_ta = ?,nha_san_xuat = ? where id = ?;";
    private final String SELECT_BY_NAME = "select * from san_pham where ten_san_pham like ?;";



    @Override
    public List<SanPham> findAll() {
        List<SanPham> sanPhamList = new ArrayList<>();
        try(Connection connection = ConnectDB.getConnectDB()) {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String tenSanPham = resultSet.getString("ten_san_pham");
                double gia = resultSet.getDouble("gia");
                String moTa = resultSet.getString("mo_ta");
                String nhaSanXuat = resultSet.getString("nha_san_xuat");
                SanPham sanPham = new SanPham(id,tenSanPham,gia,moTa,nhaSanXuat);
                sanPhamList.add(sanPham);
            }
        } catch (SQLException e) {
            System.out.println("lỗi do truỳ vấn dữ liệu");
        }
        return sanPhamList;
    }

    @Override
    public boolean add(SanPham sanPham) {
        try(Connection connection = ConnectDB.getConnectDB()) {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO);
            preparedStatement.setString(1,sanPham.getTenSanPham());
            preparedStatement.setDouble(2,sanPham.getGia());
            preparedStatement.setString(3,sanPham.getMoTa());
            preparedStatement.setString(4,sanPham.getNhaSanXuat());
            int effectRow = preparedStatement.executeUpdate();
            return effectRow==1;
        } catch (SQLException e) {
            System.out.println("lỗi do truỳ vấn dữ liệu");
        }
        return false;
    }

    @Override
    public boolean deleteById(int id) {
        try (Connection connection = ConnectDB.getConnectDB()) {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_BY_ID);
            preparedStatement.setInt(1, id);

            int effectRow = preparedStatement.executeUpdate();
            return effectRow == 1;
        } catch (SQLException e) {
            System.out.println("lỗi do truy vấn dữ liệu (deleteById)");
        }
        return false;
    }

    @Override
    public List<SanPham> findByName(String tenSanPham) {
        List<SanPham> sanPhamList = new ArrayList<>();

        try (Connection connection = ConnectDB.getConnectDB()) {
            PreparedStatement preparedStatement =
                    connection.prepareStatement(SELECT_BY_NAME);

            preparedStatement.setString(1, "%" + tenSanPham + "%");

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) { // ✅ DÙNG while
                int id = resultSet.getInt("id");
                String ten = resultSet.getString("ten_san_pham");
                double gia = resultSet.getDouble("gia");
                String moTa = resultSet.getString("mo_ta");
                String nhaSanXuat = resultSet.getString("nha_san_xuat");

                sanPhamList.add(
                        new SanPham(id, ten, gia, moTa, nhaSanXuat)
                );
            }
        } catch (SQLException e) {
            System.out.println("lỗi do truy vấn dữ liệu (findByName)");
        }

        return sanPhamList;
    }


    @Override
    public boolean update(SanPham sanPham) {
        try (Connection connection = ConnectDB.getConnectDB()) {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_STUDENT);
            preparedStatement.setString(1,sanPham.getTenSanPham());
            preparedStatement.setDouble(2,sanPham.getGia());
            preparedStatement.setString(3,sanPham.getMoTa());
            preparedStatement.setString(4,sanPham.getNhaSanXuat());
            preparedStatement.setInt(5, sanPham.getId());
            int effectRow = preparedStatement.executeUpdate();
            return effectRow == 1;
        } catch (SQLException e) {
            System.out.println("lỗi do truy vấn dữ liệu (update)");
        }
        return false;

    }

    @Override
    public SanPham findById(int id) {
        try (Connection connection = ConnectDB.getConnectDB()) {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_ID);
            preparedStatement.setInt(1, id);

            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                String tenSanPham = resultSet.getString("ten_san_pham");
                double gia = resultSet.getDouble("gia");
                String moTa = resultSet.getString("mo_ta");
                String nhaSanXuat = resultSet.getString("nha_san_xuat");
                return new SanPham(id, tenSanPham, gia, moTa, nhaSanXuat);
            }
        } catch (SQLException e) {
            System.out.println("lỗi do truy vấn dữ liệu (findById)");
        }
        return null;
    }
}
