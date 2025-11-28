package com.example.bai1.repository;

import com.example.bai1.entity.Student;

import java.util.ArrayList;
import java.util.List;

public class StudentRepository implements IStudentRepository{
    private static List<Student> studentList = new ArrayList<Student>();
    static {}
    @Override
    public List<Student> findAll() {
        return List.of();
    }
}
