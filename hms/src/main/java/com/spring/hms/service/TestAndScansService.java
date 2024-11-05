package com.spring.hms.service;

import com.spring.hms.model.TestAndScans;
import com.spring.hms.repository.TestAndScansRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TestAndScansService {
    @Autowired
    private TestAndScansRepository testAndScansRepository;

    public List<TestAndScans> findAll() {
        return testAndScansRepository.findAll();
    }

    public void save(TestAndScans test) {
        testAndScansRepository.save(test);
    }

    public void delete(Long id) {
        testAndScansRepository.delete(id);
    }

    public void softDelete(Long id) {
        testAndScansRepository.softDelete(id);
    }
}
