package com.example.mvc.service;

import com.example.mvc.entity.Student;
import com.example.mvc.repository.IStudentRepository;
import com.example.mvc.repository.StudentRepository;

import java.util.List;

public class StudentService implements IStudentService {
    IStudentRepository studentRepository=new StudentRepository();
    @Override
    public List<Student> findAll() {
        return studentRepository.findAll();
    }

    @Override
    public boolean add(Student student) {
        return studentRepository.add(student);
    }

    @Override
    public boolean deleteById(int id) {
        return studentRepository.deleteById(id);
    }

    @Override
    public Student findById(int id) {
        return studentRepository.findById(id);
    }

    @Override
    public boolean update(Student student) {
        return studentRepository.update(student);
    }
}
