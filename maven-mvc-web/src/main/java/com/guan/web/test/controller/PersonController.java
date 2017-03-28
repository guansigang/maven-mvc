package com.guan.web.test.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.guan.web.test.model.Person;
import com.guan.web.test.service.IPersonService;




@Controller
@RequestMapping("/personController")
public class PersonController {
	
	@Autowired
    private IPersonService personService;

    @RequestMapping("/showPerson")
    public String showPersons(Model model){
        List<Person> persons = personService.loadPersons();
        model.addAttribute("persons", persons);
        return "showperson";
    }
    
    @RequestMapping("/showAuthcode1")
    public String showAuthCode1(Model model){
        List<Person> persons = personService.loadPersons();
        model.addAttribute("persons", persons);
        return "authcode1";
    }
    
    @RequestMapping("/showAuthcode2")
    public String showAuthCode2(Model model){
        List<Person> persons = personService.loadPersons();
        model.addAttribute("persons", persons);
        return "authcode2";
    }
}