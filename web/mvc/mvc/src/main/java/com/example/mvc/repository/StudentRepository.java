package com.example.mvc.repository;

import com.example.mvc.entity.Student;

import java.util.ArrayList;
import java.util.List;

public class StudentRepository  implements IStudentRepository{
    private static List<Student> studentList = new ArrayList<>();
    static {
        studentList.add(new Student(1,"chánh",true,3.0f));
        studentList.add(new Student(2,"Hương",false,8.0f));
        studentList.add(new Student(3,"Tiến",true,6.0f));
    }
    @Override
    public List<Student> findAll() {
        return studentList;
    }

    @Override
    public boolean add(Student student) {
        return studentList.add(student);
    }

    @Override
    public boolean deleteById(int id) {
        for (int i = 0; i <studentList.size() ; i++) {
            if (studentList.get(i).getId()==id){
                studentList.remove(i);
                return true;
            }
        }
        return false;
    }

    @Override
    public Student findById(int id) {
        for (Student s : findAll()) {
            if (s.getId() == id) {
                return s;
            }
        }
        return null;
    }

    @Override
    public boolean update(Student student) {
        Student existing = findById(student.getId());
        if (existing != null) {
            existing.setName(student.getName());
            existing.setGender(student.isGender());
            existing.setScore(student.getScore());
            return true;
        }
        return false;
    }
}
