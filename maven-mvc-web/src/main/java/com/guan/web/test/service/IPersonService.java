package com.guan.web.test.service;

import java.util.List;

import com.guan.web.test.model.Person;


public interface IPersonService {

    /**
     * 加载全部的person
     * @return
     */
    List<Person> loadPersons();
}