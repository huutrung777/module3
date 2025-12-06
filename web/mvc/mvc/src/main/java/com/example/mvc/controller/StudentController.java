package com.example.mvc.controller;

import com.example.mvc.entity.Student;
import com.example.mvc.service.IStudentService;
import com.example.mvc.service.StudentService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import java.net.URLEncoder;
import java.util.List;

@WebServlet(name = "StudentController", value = "/students")
public class StudentController extends HttpServlet {
    private IStudentService studentService = new StudentService();

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
                findById(req, resp);
                break;
            case "edit":
                showFormEdit(req, resp);
                break;
            default:
                showList(req,resp);
                break;
        }
    }

    private void showFormEdit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Student student = studentService.findById(id);
        if (student != null) {
            req.setAttribute("student", student);
            req.getRequestDispatcher("/view/student/edit.jsp").forward(req, resp);
        } else {
            resp.sendRedirect("/students?mess=" + URLEncoder.encode("Sinh viên không tồn tại", "UTF-8"));
        }
    }

    private void findById(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));

        Student student = studentService.findById(id);

        if (student != null) {
            req.setAttribute("studentList", java.util.List.of(student));
            req.setAttribute("mess", "Tìm thấy sinh viên ID: " + id);
        } else {
            req.setAttribute("studentList", java.util.List.of());
            req.setAttribute("mess", "Không tìm thấy sinh viên ID: " + id);
        }

        try {
            req.getRequestDispatcher("/view/student/list.jsp").forward(req, resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }

    private void showList(HttpServletRequest req, HttpServletResponse resp) {
        List<Student> studentList = studentService.findAll();
        req.setAttribute("studentList", studentList);
        try {
            req.getRequestDispatcher("/view/student/list.jsp").forward(req,resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showForAdd(HttpServletRequest req, HttpServletResponse resp) {
        try {
            req.getRequestDispatcher("/view/student/add.jsp").forward(req,resp);
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
                // lấy dữ liệu thêm và db
                save(req,resp);
                break;
            case "delete":
                // lấy dữ liệu thêm và db
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
        String name = req.getParameter("name");
        boolean gender = Boolean.parseBoolean(req.getParameter("gender"));
        float score = Float.parseFloat(req.getParameter("score"));

        Student student = new Student(id, name, gender, score);
        boolean isSuccess = studentService.update(student);
        String mess = isSuccess ? "Cập nhật thành công" : "Cập nhật thất bại";
        resp.sendRedirect("/students?mess=" + URLEncoder.encode(mess, "UTF-8"));

    }

    private void deleteById(HttpServletRequest req, HttpServletResponse resp) {
        int deleteId = Integer.parseInt(req.getParameter("deleteId"));
        boolean isSuccess = studentService.deleteById(deleteId);
        String mess=isSuccess?"success":"fail";
        try {
            resp.sendRedirect("/students?mess="+ mess);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void save(HttpServletRequest req, HttpServletResponse resp) {
        String name = req.getParameter("name");
        boolean gender = Boolean.parseBoolean(req.getParameter("gender"));
        float score = Float.parseFloat(req.getParameter("score"));
        Student student = new Student(name,gender,score);
        boolean isSuccess = studentService.add(student);
        String mess = isSuccess? "Them moi thanh cong":"Them moi that bai";
        try {
            resp.sendRedirect("/students?mess="+ mess);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
    }

