package com.guan.web.test.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guan.web.test.dao.PersonMapper;
import com.guan.web.test.model.Person;
import com.guan.web.test.service.IPersonService;



@Service
public class PersonServiceImpl implements IPersonService {
	
    private PersonMapper personMapper;

    @Override
    public List<Person> loadPersons() {
        return personMapper.queryAll();
    }
    
}