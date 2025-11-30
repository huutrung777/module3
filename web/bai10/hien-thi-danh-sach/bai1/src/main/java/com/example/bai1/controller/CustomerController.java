package com.example.bai1.controller;

import com.example.bai1.entity.Customer;
import com.example.bai1.service.CustomerService;
import com.example.bai1.service.ICustomerService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name ="CustomerController",value ="/customer")
public class CustomerController  extends HttpServlet {
    private ICustomerService customerService = new CustomerService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                // trả về trang thêm mới
                req.getRequestDispatcher("/view/customer/add.jsp").forward(req, resp);
            default:
                List<Customer> customerList = customerService.findAll();
                req.setAttribute("customerList", customerList);
                req.getRequestDispatcher("/view/customer/list.jsp").forward(req, resp);
        }


    }

}
