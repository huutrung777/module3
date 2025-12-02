package com.example.bai11.controller;

import com.example.bai11.entity.SanPham;
import com.example.bai11.service.ISanPhamService;
import com.example.bai11.service.SanPhamService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

@WebServlet(name = "SanphamController",value = "/sanphams")

public class SanphamController extends HttpServlet {
    private ISanPhamService sanphamService = new SanPhamService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                showForAdd(req,resp);
                break;
            case "find":
                findByName(req, resp);
                break;
            case "edit":
                showFormEdit(req, resp);
                break;
            default:
                showList(req, resp);
                break;

        }

    }

    private void findByName(HttpServletRequest req, HttpServletResponse resp) {
        String tenSanPham = (req.getParameter("tenSanPham"));

        SanPham sanPham = sanphamService.findByName(tenSanPham);

        if (sanPham != null) {
            req.setAttribute("sanPhamList", java.util.List.of(sanPham));
            req.setAttribute("mess", "Tìm thấy tên: " + tenSanPham);
        } else {
            req.setAttribute("studentList", java.util.List.of());
            req.setAttribute("mess", "Không tìm thấy tên: " + tenSanPham);
        }

        try {
            req.getRequestDispatcher("/view/sanpham/list.jsp").forward(req, resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }

    private void showForAdd(HttpServletRequest req, HttpServletResponse resp) {
        try {
            req.getRequestDispatcher("/view/sanpham/add.jsp").forward(req,resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }

    private void showFormEdit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        SanPham sanPham = sanphamService.findById(id);
        if (sanPham != null) {
            req.setAttribute("sanPham", sanPham);
            req.getRequestDispatcher("/view/sanpham/edit.jsp").forward(req, resp);
        } else {
            resp.sendRedirect("/sanphams?mess=" + URLEncoder.encode(" không tồn tại", "UTF-8"));
        }
    }

    private void showList(HttpServletRequest req, HttpServletResponse resp) {
        List<SanPham> sanPhamList = sanphamService.findAll();
        req.setAttribute("sanPhamList", sanPhamList);
        try {
            req.getRequestDispatcher("/view/sanpham/list.jsp").forward(req, resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";

        }
        switch (action) {
            case "add":

                save(req,resp);
                break;
            case "delete":
                deleteById(req,resp);
                break;
            case "update":
                update(req, resp);
                break;
            default:
                resp.sendRedirect("/students");
                break;

        }
    }

    private void update(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String tenSanPham = req.getParameter("tenSanPham");
        double gia = Double.parseDouble(req.getParameter("gia"));
        String moTa = req.getParameter("moTa");
        String nhaSanXuat=req.getParameter("nhaSanXuat");

        SanPham sanPham = new SanPham(id,tenSanPham,gia,moTa,nhaSanXuat);
        boolean isSuccess = sanphamService.add(sanPham);
        String mess = isSuccess ? "Cập nhật thành công" : "Cập nhật thất bại";
        resp.sendRedirect("/sanphams?mess=" + URLEncoder.encode(mess, "UTF-8"));

    }

    private void deleteById(HttpServletRequest req, HttpServletResponse resp) {
        int deleteId = Integer.parseInt(req.getParameter("deleteId"));
        boolean isSuccess = sanphamService.deleteById(deleteId);
        String mess=isSuccess?"success":"fail";
        try {
            resp.sendRedirect("/sanphams?mess="+ mess);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }


    private void save(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        String tenSanPham = req.getParameter("tenSanPham");
        double gia = Double.parseDouble(req.getParameter("gia"));
        String moTa = req.getParameter("moTa");
        String nhaSanXuat=req.getParameter("nhaSanXuat");

        SanPham sanPham = new SanPham(id,tenSanPham,gia,moTa,nhaSanXuat);
        boolean isSuccess = sanphamService.add(sanPham);
        String mess = isSuccess? "Them moi thanh cong":"Them moi that bai";
        try {
            resp.sendRedirect("/sanphams?mess="+ mess);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }
}


