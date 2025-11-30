package com.example.bai1.repository;

import com.example.bai1.entity.Customer;

import java.util.List;

public interface ICustomerRepository {
    List<Customer> findAll();
}
