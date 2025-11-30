package com.example.bai1.service;

import com.example.bai1.entity.Customer;
import com.example.bai1.repository.CustomerRepository;
import com.example.bai1.repository.ICustomerRepository;

import java.util.List;

public class CustomerService implements ICustomerService {
    private ICustomerRepository customerRepository=new CustomerRepository();
    @Override
    public List<Customer> findAll() {
        return customerRepository.findAll();
    }
}
