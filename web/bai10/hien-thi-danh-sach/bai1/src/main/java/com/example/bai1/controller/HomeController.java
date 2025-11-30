package com.example.bai1.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.example.bai1.entity.Customer;
import com.example.bai1.service.CustomerService;
import com.example.bai1.service.ICustomerService;

import java.io.IOException;

@WebServlet(name = "homeController", value = "/home")
public class HomeController extends HttpServlet {
        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            req.getRequestDispatcher("/view/home.jsp").forward(req,resp);
        }
}
