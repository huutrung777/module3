package com.example.mvc.repository;

import com.example.mvc.entity.Student;
import com.example.mvc.util.ConnectDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StudentRepository implements IStudentRepository {
    private final String SELECT_ALL = "select * from students;";
    private final String INSERT_INTO = "insert into students(name,gender,score) values(?,?,?);";
    private final String DELETE_BY_ID = "delete from students where id = ?;";
    private final String SELECT_BY_ID = "select * from students where id = ?;";
    private final String UPDATE_STUDENT = "update students set name = ?, gender = ?, score = ? where id = ?;";


    @Override
    public List<Student> findAll() {
        List<Student> studentList = new ArrayList<>();
        try(Connection connection = ConnectDB.getConnectDB()) {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                boolean gender = resultSet.getBoolean("gender");
                float score = resultSet.getFloat("score");
                Student student = new Student(id,name,gender,score);
                studentList.add(student);
            }
        } catch (SQLException e) {
            System.out.println("lỗi do truỳ vấn dữ liệu");
        }
        return studentList;

    }

    @Override
    public boolean add(Student student) {

        try(Connection connection = ConnectDB.getConnectDB()) {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO);
            preparedStatement.setString(1,student.getName());
            preparedStatement.setBoolean(2,student.isGender());
            preparedStatement.setFloat(3,student.getScore());
            int effectRow = preparedStatement.executeUpdate();
            return effectRow==1;
        } catch (SQLException e) {
            System.out.println("lỗi do truỳ vấn dữ liệu");
        }
        return false;
    }

    @Override
    public boolean deleteById(int id) {
        try (Connection connection = ConnectDB.getConnectDB()) {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_BY_ID);
            preparedStatement.setInt(1, id);

            int effectRow = preparedStatement.executeUpdate();
            return effectRow == 1;
        } catch (SQLException e) {
            System.out.println("lỗi do truy vấn dữ liệu (deleteById)");
        }
        return false;

    }

    @Override
    public Student findById(int id) {
        try (Connection connection = ConnectDB.getConnectDB()) {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_ID);
            preparedStatement.setInt(1, id);

            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                String name = resultSet.getString("name");
                boolean gender = resultSet.getBoolean("gender");
                float score = resultSet.getFloat("score");

                return new Student(id, name, gender, score);
            }
        } catch (SQLException e) {
            System.out.println("lỗi do truy vấn dữ liệu (findById)");
        }
        return null;

    }

    @Override
    public boolean update(Student student) {
        try (Connection connection = ConnectDB.getConnectDB()) {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_STUDENT);

            preparedStatement.setString(1, student.getName());
            preparedStatement.setBoolean(2, student.isGender());
            preparedStatement.setFloat(3, student.getScore());
            preparedStatement.setInt(4, student.getId());

            int effectRow = preparedStatement.executeUpdate();
            return effectRow == 1;
        } catch (SQLException e) {
            System.out.println("lỗi do truy vấn dữ liệu (update)");
        }
        return false;
    }

}
