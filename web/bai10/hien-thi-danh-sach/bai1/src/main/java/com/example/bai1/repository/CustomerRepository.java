package com.example.bai1.repository;

import com.example.bai1.entity.Customer;

import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private static List<Customer> customerList = new ArrayList<Customer>();
    static {
        customerList.add(new Customer(1,"Mai Văn Hoàn","1983-08-20", "Hà Nội"));
        customerList.add(new Customer(2, "Nguyễn Văn Nam","1983-08-21", "Bắc Giang"));
        customerList.add(new Customer(3, "Nguyễn Thái Hòa", "1983-8-22","Nam Định"));
        customerList.add(new Customer(4, "Trần Đăng Khoa", "1983-8-17","Hà Tây"));
    }
    @Override
    public List<Customer> findAll() {
        return customerList;
    }
}
