package com.guan.web.test.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.guan.web.test.model.Person;

@Repository
public interface PersonMapper {
    
    /**
     * 查询所有
     * @return
     */
    List<Person> queryAll();
}