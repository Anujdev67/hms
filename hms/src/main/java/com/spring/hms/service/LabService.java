package com.spring.hms.service;

import com.spring.hms.model.Lab;
import com.spring.hms.repository.LabRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.spring.hms.exception.InvalidCredentialsException;

import java.util.List;

@Service
public class LabService {
    @Autowired
    private LabRepository labRepository;

    public boolean verifyLogin(String username, String password) throws InvalidCredentialsException {
        if ("laboperator1".equals(username) && "Sansu@2002".equals(password)) {
            return true;
        } else {
            throw new InvalidCredentialsException("Invalid username or password.");
        }
    }

    public Lab findById(Long id) {
        return labRepository.findById(id);
    }

    public List<Lab> findAll() {
        return labRepository.findAll();
    }

    public void save(Lab lab) {
        labRepository.save(lab);
    }

    public void delete(Long id) {
        labRepository.delete(id);
    }

    public void softDelete(Long id) {
        labRepository.softDelete(id);
    }
}
