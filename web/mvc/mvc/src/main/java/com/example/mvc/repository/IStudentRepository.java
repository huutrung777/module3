package com.example.mvc.repository;

import com.example.mvc.entity.Student;

import java.util.List;

public interface IStudentRepository {
    List<Student> findAll();
    boolean add(Student student);
    boolean deleteById(int id);
    Student findById(int id);
    boolean update(Student student);


}
