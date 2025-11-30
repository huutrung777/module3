package com.example.mvc.service;

import com.example.mvc.entity.Student;

import java.util.List;

public interface IStudentService {
    List<Student> findAll();
    boolean add(Student student);
    boolean deleteById(int id);
    Student findById(int id);
    boolean update(Student student);
}
