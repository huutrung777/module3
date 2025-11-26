package com.example.bai9;

import java.io.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "DiscountServlet", value = "/discount")
public class DiscountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String mota=req.getParameter("mota");
        double giaNiemYet=Double.parseDouble(req.getParameter("giaNiemYet"));
        double tyLeChietKhau=Double.parseDouble(req.getParameter("tyLeChietKhau"));
        double luongchietKhau=giaNiemYet*tyLeChietKhau*0.01;
        double giasauchietKhau=giaNiemYet-luongchietKhau;
        req.setAttribute("mota",mota);
        req.setAttribute("giaNiemYet",giaNiemYet);
        req.setAttribute("tyLeChietKhau",tyLeChietKhau);
        req.setAttribute("luongchietKhau",luongchietKhau);
        req.setAttribute("giasauchietKhau",giasauchietKhau);
        req.getRequestDispatcher("discount.jsp").forward(req, resp);

    }
}