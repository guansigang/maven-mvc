package com.guan.web.bootstrap.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.guan.base.system.BaseController;



@Controller
@RequestMapping("bootstrap")
public class BootstrapController extends BaseController{
 
	private static Logger logger = Logger.getLogger(BootstrapController.class);

    
    @RequestMapping("/bootstrapToPage")
    public String gentellela(String pageFlag){
    	logger.info("bootstrap页面跳转："+pageFlag);
    	return "bootstrap/"+pageFlag;
    }
    
    
  
    
    
    
}