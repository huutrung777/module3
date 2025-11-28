package com.example.bai1.repository;

import com.example.bai1.entity.Student;

import java.util.List;

public interface IStudentRepository {
    List<Student> findAll();
}
