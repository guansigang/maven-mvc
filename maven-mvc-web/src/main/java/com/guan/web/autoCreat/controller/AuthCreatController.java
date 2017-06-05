package com.guan.web.autoCreat.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.guan.base.base.EditResult;
import com.guan.base.base.PageResult;
import com.guan.base.system.BaseController;
import com.guan.web.autoCreat.service.AuthCreatService;
import com.guan.web.easyui.model.DaletouHisList;



@Controller
@RequestMapping("/authCreat")
public class AuthCreatController extends BaseController{
 
	private static Logger logger = Logger.getLogger(AuthCreatController.class);

	@Resource
	AuthCreatService authCreatService;
	
	 @RequestMapping("/authCreatToPage")
	    public String authCreat(String pageFlag){
	    	logger.info("authCreat页面跳转："+pageFlag);
	    	return "authCreat/"+pageFlag;
	    }
	
	/**
	 * 查询数据源下数据库信息
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/queryDataBase", method = { RequestMethod.GET, RequestMethod.POST }, produces = "text/html;;charset=UTF-8")
    @ResponseBody
    public String queryDaletouData(HttpServletRequest request, HttpServletResponse response,Model model){
    	logger.info("queryDataBase");
    	PageResult<Map<String, Object>> pageResult = new PageResult<Map<String, Object>>();
    	try {
    		pageResult = authCreatService.queryDataBaseInfoList(pageResult);
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    	return pageResult.toEasyUiJson();
    	
    }
	
	

 // ////////////////////////////////////////////自动生成代码///////////////////////////////////////////////
 	/**
 	 * 数据库下表信息
 	 * 
 	 * @param request
 	 * @param response
 	 * @param model
 	 * @return
 	 */
 	@RequestMapping(value = "/querySysDateBaseTable", method = { RequestMethod.GET, RequestMethod.POST }, produces = "text/html;charset=UTF-8")
 	@ResponseBody
 	public String querySysDateBaseTable(HttpServletRequest request, HttpServletResponse response, Model model) {
 		logger.debug(" *=* 查询数据字典从表*=* ");
 		Map<String, String> params = getParams(model);
 		PageResult<Map<String, Object>> pageResult = new PageResult<Map<String, Object>>();
 		// 封装数据
 		pageResult.setParameters(params);
 		pageResult.setPageNow(Integer.parseInt(params.get("page"), 10));
 		pageResult.setPageSize(Integer.parseInt(params.get("rows"), 10));
 		// 查询结果
 		try {
 			pageResult = this.authCreatService.querySysDateBaseTable(pageResult);
 		} catch (Exception e) {
 			logger.error("管理员查询异常!" + e.getMessage());
 			e.printStackTrace();
 		}
 		return pageResult.toEasyUiJson();
 	}

 	

 	/**
 	 * 添加数据字典从表
 	 * 
 	 * @param request
 	 * @param response
 	 * @param model
 	 * @return
 	 */
 	@RequestMapping(value = "/addSysDateBaseTable", method = { RequestMethod.GET, RequestMethod.POST }, produces = "text/html;charset=UTF-8")
 	@ResponseBody
 	public String addSysDateBaseTable(HttpServletRequest request, HttpServletResponse response, Model model) {
 		logger.debug(" *=* 添加数据字典主表*=* ");
 		Map<String, String> params = getParams(model);
 		EditResult resultStr = new EditResult();
 		// 查询结果
 		try {
 			resultStr = this.authCreatService.addSysDateBaseTable(params);
 		} catch (Exception e) {
 			logger.error("管理员查询异常!" + e.getMessage());
 			e.printStackTrace();
 		}
 		return JSON.toJSONString(resultStr);
 	}

 	/**
 	 * 修改表信息
 	 * 
 	 * @param request
 	 * @param response
 	 * @param model
 	 * @return
 	 */
 	@RequestMapping(value = "/updateSysDateBaseTable", method = { RequestMethod.GET, RequestMethod.POST }, produces = "text/html;charset=UTF-8")
 	@ResponseBody
 	public String updateSysDateBaseTable(HttpServletRequest request, HttpServletResponse response, Model model) {
 		logger.debug(" *=* 添加数据字典从表*=* ");
 		Map<String, String> params = getParams(model);
 		EditResult resultStr = new EditResult();
 		try {
 			resultStr = this.authCreatService.updateSysDateBaseTable(params);
 		} catch (Exception e) {
 			logger.error("管理员查询异常!" + e.getMessage());
 			e.printStackTrace();
 		}
 		return JSON.toJSONString(resultStr);
 	}


 	/**
 	 * easyui数据字典下拉框查询数据字典
 	 */
 	@RequestMapping(value = "/selectBoxDateBase", method = { RequestMethod.GET, RequestMethod.POST }, produces = "text/html;charset=UTF-8")
 	@ResponseBody
 	public String selectBoxDateBase(HttpServletRequest request, HttpServletResponse response, Model model) {

 		List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
 		try {
 			resultList = authCreatService.querySelectDateBase();
 		} catch (Exception e) {
 			logger.error("查库信息失败！");
 			e.printStackTrace();
 		}

 		JSONArray ja = JSONArray.parseArray(JSON.toJSONString(resultList));
 		return ja.toJSONString();
 	}

 	// ////////////////////////////////////////////自动生成代码END///////////////////////////////////////////////
    
}