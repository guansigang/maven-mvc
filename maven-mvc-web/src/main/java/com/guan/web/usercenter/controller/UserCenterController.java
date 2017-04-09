package com.guan.web.usercenter.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import com.guan.web.usercenter.model.UserAuthBean;
import com.guan.web.usercenter.service.UserCenterService;
@Controller
@RequestMapping("/userCenter")
public class UserCenterController extends BaseController{
	private static Logger logger = Logger.getLogger(UserCenterController.class);
	@Resource
	UserCenterService userCenterService;

    @RequestMapping("/userCenterToPage")
    public String gentellela(String pageFlag){
    	return "easyui/"+pageFlag;
    }
    
    /**
     * 管理员权限等主信息
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "/queryUserInfo", method = { RequestMethod.GET,RequestMethod.POST }, produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String queryUserInfo(HttpServletRequest request, HttpServletResponse response,Model model){
		logger.debug(" *=* 查询用户信息 *=* ");
		HttpSession session = request.getSession();
		Map<String, String> params = getParams(model);
		UserAuthBean user = null;
//		if (user == null || user.getUserState() != 1) {
//			return("登陆状态失效, 请注销后重新登陆!");
//		}
		PageResult<Map<String, Object>> pageResult = new PageResult<Map<String, Object>>();
		// 封装数据
		pageResult.setParameters(params);
		pageResult.setPageNow(Integer.parseInt(params.get("page"), 10));
		pageResult.setPageSize(Integer.parseInt(params.get("rows"), 10));
		// 查询结果
		try {
			pageResult = this.userCenterService.queryUserInfo(pageResult);
		} catch (Exception e) {
			logger.error("管理员查询异常!" + e.getMessage());
			e.printStackTrace();
		}
		return pageResult.toEasyUiJson();
    }
    
    
    /**
     * 管理员权限等主信息
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "/querySysBaseDict", method = { RequestMethod.GET,RequestMethod.POST }, produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String querySysBaseDict(HttpServletRequest request, HttpServletResponse response,Model model){
    	logger.debug(" *=* 数据字典主表 *=* ");
    	HttpSession session = request.getSession();
    	Map<String, String> params = getParams(model);
    	UserAuthBean user = null;
//		if (user == null || user.getUserState() != 1) {
//			return("登陆状态失效, 请注销后重新登陆!");
//		}
    	PageResult<Map<String, Object>> pageResult = new PageResult<Map<String, Object>>();
    	// 封装数据
    	pageResult.setParameters(params);
    	pageResult.setPageNow(Integer.parseInt(params.get("page"), 10));
    	pageResult.setPageSize(Integer.parseInt(params.get("rows"), 10));
    	// 查询结果
    	try {
    		pageResult = this.userCenterService.querySysBaseDict(pageResult);
    	} catch (Exception e) {
    		logger.error("管理员查询异常!" + e.getMessage());
    		e.printStackTrace();
    	}
    	return pageResult.toEasyUiJson();
    }
    
    
    /**
     * 管理员权限等主信息
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "/querySysBaseDictItem", method = { RequestMethod.GET,RequestMethod.POST }, produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String querySysBaseDictItem(HttpServletRequest request, HttpServletResponse response,Model model){
    	logger.debug(" *=* 查询数据字典从表*=* ");
    	HttpSession session = request.getSession();
    	Map<String, String> params = getParams(model);
    	UserAuthBean user = null;
//		if (user == null || user.getUserState() != 1) {
//			return("登陆状态失效, 请注销后重新登陆!");
//		}
    	PageResult<Map<String, Object>> pageResult = new PageResult<Map<String, Object>>();
    	// 封装数据
    	pageResult.setParameters(params);
    	pageResult.setPageNow(Integer.parseInt(params.get("page"), 10));
    	pageResult.setPageSize(Integer.parseInt(params.get("rows"), 10));
    	// 查询结果
    	try {
    		pageResult = this.userCenterService.querySysBaseDictItem(pageResult);
    	} catch (Exception e) {
    		logger.error("管理员查询异常!" + e.getMessage());
    		e.printStackTrace();
    	}
    	return pageResult.toEasyUiJson();
    }
    
    /**
     * 添加数据字典主表
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "/addSysBaseDict", method = { RequestMethod.GET,RequestMethod.POST }, produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String addSysBaseDict(HttpServletRequest request, HttpServletResponse response,Model model){
    	logger.debug(" *=* 添加数据字典主表*=* ");
    	HttpSession session = request.getSession();
    	Map<String, String> params = getParams(model);
    	UserAuthBean user = null;
//		if (user == null || user.getUserState() != 1) {
//			return("登陆状态失效, 请注销后重新登陆!");
//		}
    	EditResult resultStr = new EditResult();
    	// 查询结果
    	try {
    		resultStr = this.userCenterService.addSysBaseDict(params);
    	} catch (Exception e) {
    		logger.error("管理员查询异常!" + e.getMessage());
    		e.printStackTrace();
    	}
    	return JSON.toJSONString(resultStr);
    }
    
    /**
     * 添加数据字典从表
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "/updateSysBaseDict", method = { RequestMethod.GET,RequestMethod.POST }, produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String updateSysBaseDict(HttpServletRequest request, HttpServletResponse response,Model model){
    	logger.debug(" *=* 添加数据字典从表*=* ");
    	HttpSession session = request.getSession();
    	Map<String, String> params = getParams(model);
    	UserAuthBean user = null;
//		if (user == null || user.getUserState() != 1) {
//			return("登陆状态失效, 请注销后重新登陆!");
//		}
    	EditResult resultStr = new EditResult();
    	// 查询结果
    	try {
    		resultStr = this.userCenterService.updateSysBaseDict(params);
    	} catch (Exception e) {
    		logger.error("管理员查询异常!" + e.getMessage());
    		e.printStackTrace();
    	}
    	return JSON.toJSONString(resultStr);
    }
    
    
    /**
     * 添加数据字典主表
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "/addSysBaseDictItem", method = { RequestMethod.GET,RequestMethod.POST }, produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String addSysBaseDictItem(HttpServletRequest request, HttpServletResponse response,Model model){
    	logger.debug(" *=* 添加数据字典主表*=* ");
    	HttpSession session = request.getSession();
    	Map<String, String> params = getParams(model);
    	UserAuthBean user = null;
//		if (user == null || user.getUserState() != 1) {
//			return("登陆状态失效, 请注销后重新登陆!");
//		}
    	EditResult resultStr = new EditResult();
    	// 查询结果
    	try {
    		resultStr = this.userCenterService.addSysBaseDictItem(params);
    	} catch (Exception e) {
    		logger.error("管理员查询异常!" + e.getMessage());
    		e.printStackTrace();
    	}
    	return JSON.toJSONString(resultStr);
    }
    
    /**
     * 添加数据字典从表
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "/updateSysBaseDictItem", method = { RequestMethod.GET,RequestMethod.POST }, produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String updateSysBaseDictItem(HttpServletRequest request, HttpServletResponse response,Model model){
    	logger.debug(" *=* 添加数据字典从表*=* ");
    	HttpSession session = request.getSession();
    	Map<String, String> params = getParams(model);
    	UserAuthBean user = null;
//		if (user == null || user.getUserState() != 1) {
//			return("登陆状态失效, 请注销后重新登陆!");
//		}
    	EditResult resultStr = new EditResult();
    	try {
    		resultStr = this.userCenterService.updateSysBaseDictItem(params);
    	} catch (Exception e) {
    		logger.error("管理员查询异常!" + e.getMessage());
    		e.printStackTrace();
    	}
    	return JSON.toJSONString(resultStr);
    }
    
    
    
    /**
     * 删除数据字典主表
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "/deleteSysBaseDict", method = { RequestMethod.GET,RequestMethod.POST }, produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String deleteSysBaseDict(HttpServletRequest request, HttpServletResponse response,Model model){
    	logger.debug(" *=* 删除数据字典主表*=* ");
    	HttpSession session = request.getSession();
    	Map<String, String> params = getParams(model);
    	UserAuthBean user = null;
//		if (user == null || user.getUserState() != 1) {
//			return("登陆状态失效, 请注销后重新登陆!");
//		}
    	EditResult resultStr = new EditResult();
    	try {
    		resultStr = this.userCenterService.deleteSysBaseDict(params);
    	} catch (Exception e) {
    		logger.error("删除数据字典主表异常!" + e.getMessage());
    		e.printStackTrace();
    	}
    	return JSON.toJSONString(resultStr);
    }
    /**
     * 删除数据字典从表
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "/deleteSysBaseDictItem", method = { RequestMethod.GET,RequestMethod.POST }, produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String deleteSysBaseDictItem(HttpServletRequest request, HttpServletResponse response,Model model){
    	logger.debug(" *=* 删除数据字典从表*=* ");
    	HttpSession session = request.getSession();
    	Map<String, String> params = getParams(model);
    	UserAuthBean user = null;
//		if (user == null || user.getUserState() != 1) {
//			return("登陆状态失效, 请注销后重新登陆!");
//		}
    	EditResult resultStr = new EditResult();
    	try {
    		resultStr = this.userCenterService.deleteSysBaseDictItem(params);
    	} catch (Exception e) {
    		logger.error("删除数据字典从表异常!" + e.getMessage());
    		e.printStackTrace();
    	}
    	return JSON.toJSONString(resultStr);
    }
    /**
	 * easyui下拉框查询数据字典
	 */
	@RequestMapping(value = "/selectBoxBaseDict", method = { RequestMethod.GET, RequestMethod.POST }, produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String selectBoxBaseDict(HttpServletRequest request, HttpServletResponse response,Model model) {
		
		Map<String, String> params = getParams(model);
		String dict_name = "";
		if(params.get("dict_name")!=null){
			dict_name=params.get("dict_name").trim();
		}
		List<Map<String, Object>> resultList=new ArrayList<Map<String, Object>>();
		try {
			resultList = userCenterService.querySelectBoxBaseDict(dict_name);
		} catch (Exception e) {
			logger.error(dict_name+"查询数据字典主表失败！");
			e.printStackTrace();
		}
		
		JSONArray ja = JSONArray.parseArray(JSON.toJSONString(resultList));
		return ja.toJSONString();
	}
	
	
	
	 /**
     * 模块信息查询
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "/querySysBaseModule", method = { RequestMethod.GET,RequestMethod.POST }, produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String querySysBaseModule(HttpServletRequest request, HttpServletResponse response,Model model){
    	logger.debug(" *=* 模块信息查询 *=* ");
    	HttpSession session = request.getSession();
    	Map<String, String> params = getParams(model);
    	UserAuthBean user = null;
//		if (user == null || user.getUserState() != 1) {
//			return("登陆状态失效, 请注销后重新登陆!");
//		}
    	PageResult<Map<String, Object>> pageResult = new PageResult<Map<String, Object>>();
    	// 封装数据
    	pageResult.setParameters(params);
    	pageResult.setPageNow(Integer.parseInt(params.get("page"), 10));
    	pageResult.setPageSize(Integer.parseInt(params.get("rows"), 10));
    	// 查询结果
    	try {
    		pageResult = this.userCenterService.querySysBaseModule(pageResult);
    	} catch (Exception e) {
    		logger.error("管理员查询异常!" + e.getMessage());
    		e.printStackTrace();
    	}
    	return pageResult.toEasyUiJson();
    }
    
    
    
    /**
     * 删除数据字典主表
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "/deleteSysBaseModule", method = { RequestMethod.GET,RequestMethod.POST }, produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String deleteSysBaseModule(HttpServletRequest request, HttpServletResponse response,Model model){
    	logger.debug(" *=* 删除数据字典主表*=* ");
    	HttpSession session = request.getSession();
    	Map<String, String> params = getParams(model);
    	UserAuthBean user = null;
//		if (user == null || user.getUserState() != 1) {
//			return("登陆状态失效, 请注销后重新登陆!");
//		}
    	EditResult resultStr = new EditResult();
    	try {
    		resultStr = this.userCenterService.deleteSysBaseModule(params);
    	} catch (Exception e) {
    		logger.error("删除数据字典主表异常!" + e.getMessage());
    		e.printStackTrace();
    	}
    	return JSON.toJSONString(resultStr);
    }
    
    
    
    /**
     * 添加数据字典主表
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "/addSysBaseModule", method = { RequestMethod.GET,RequestMethod.POST }, produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String addSysBaseModule(HttpServletRequest request, HttpServletResponse response,Model model){
    	logger.debug(" *=* 添加数据字典主表*=* ");
    	HttpSession session = request.getSession();
    	Map<String, String> params = getParams(model);
    	String module_id = UUID.randomUUID().toString().replaceAll("-", "");
    	params.put("module_id", module_id);
    	UserAuthBean user = null;
//		if (user == null || user.getUserState() != 1) {
//			return("登陆状态失效, 请注销后重新登陆!");
//		}
    	EditResult resultStr = new EditResult();
    	// 查询结果
    	try {
    		resultStr = this.userCenterService.addSysBaseModule(params);
    	} catch (Exception e) {
    		logger.error("管理员查询异常!" + e.getMessage());
    		e.printStackTrace();
    	}
    	return JSON.toJSONString(resultStr);
    }
    
    /**
     * 添加数据字典从表
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "/updateSysBaseModule", method = { RequestMethod.GET,RequestMethod.POST }, produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String updateSysBaseModule(HttpServletRequest request, HttpServletResponse response,Model model){
    	logger.debug(" *=* 添加数据字典从表*=* ");
    	HttpSession session = request.getSession();
    	Map<String, String> params = getParams(model);
    	UserAuthBean user = null;
//		if (user == null || user.getUserState() != 1) {
//			return("登陆状态失效, 请注销后重新登陆!");
//		}
    	EditResult resultStr = new EditResult();
    	// 查询结果
    	try {
    		resultStr = this.userCenterService.updateSysBaseModule(params);
    	} catch (Exception e) {
    		logger.error("管理员查询异常!" + e.getMessage());
    		e.printStackTrace();
    	}
    	return JSON.toJSONString(resultStr);
    }
    
    
   
    
}