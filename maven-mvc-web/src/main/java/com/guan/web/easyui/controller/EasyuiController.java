package com.guan.web.easyui.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.guan.base.base.PageResult;
import com.guan.base.system.BaseController;
import com.guan.web.easyui.model.DaletouHisList;
import com.guan.web.easyui.service.DaLeTouService;



@Controller
@RequestMapping("easyui")
public class EasyuiController extends BaseController{
 
	private static Logger logger = Logger.getLogger(EasyuiController.class);

	@Resource
	DaLeTouService daLeTouService;

	@RequestMapping("/toJs300Page")
    public String toJs300Page(){
    	return "test/js-300";
    }
    
    @RequestMapping("/easyuiToPage")
    public String gentellela(String pageFlag){
    	return "bootstrap/"+pageFlag;
    }
}