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
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.guan.base.base.BaseContent;
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
		Map<String, String> params = getParams(model);
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
    * 添加模块信息
    * @param request
    * @param response
    * @param model
    * @return
    */
    @RequestMapping(value = "/addSysShiroUser", method = { RequestMethod.GET,RequestMethod.POST }, produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String addSysShiroUser(HttpServletRequest request, HttpServletResponse response,Model model){
    logger.debug(" *=* 添加权限信息表*=* ");
    Map<String, String> params = getParams(model);
    String user_id = UUID.randomUUID().toString().replaceAll("-", "");
    params.put("user_id", user_id);
    params.put("login_pwd", BaseContent.DEFAULT_SECRET_CODE);
    Subject currentUser = SecurityUtils.getSubject();
    UserAuthBean user = (UserAuthBean)currentUser.getSession().getAttribute("currentUser");
    String add_user = user.getUser_id();
    params.put("add_user", add_user);
    EditResult resultStr = new EditResult();
    //查询结果
    try {
    resultStr = this.userCenterService.addSysShiroUser(params);
    } catch (Exception e) {
    logger.error("管理员查询异常!" + e.getMessage());
    e.printStackTrace();
    }
    return JSON.toJSONString(resultStr);
    }
    
    
    
    //////////////////////////////////////////////数据字典管理START///////////////////////////////////////////////
    /**
     * 数据字典查询
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "/querySysBaseDict", method = { RequestMethod.GET,RequestMethod.POST }, produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String querySysBaseDict(HttpServletRequest request, HttpServletResponse response,Model model){
    	logger.debug(" *=* 数据字典主表 *=* ");
    	Map<String, String> params = getParams(model);
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
     * 数据字典子表查询
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
     * 修改数据字典主表
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
     * 添加数据字典从表
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
     * 修改数据字典从表
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
	 * easyui数据字典下拉框查询数据字典
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
	
	
//////////////////////////////////////////////数据字典管理END///////////////////////////////////////////////
	
	
	
	
//////////////////////////////////////////////数据字典管理START///////////////////////////////////////////////
	
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
   	 * easyui数据字典下拉框查询数据字典
   	 */
   	@RequestMapping(value = "/selectModuleSelectBox", method = { RequestMethod.GET, RequestMethod.POST }, produces = "text/html;charset=UTF-8")
   	@ResponseBody
   	public String selectModuleSelectBox(HttpServletRequest request, HttpServletResponse response,Model model) {
   		
   		Map<String, String> params = getParams(model);
   		PageResult<Map<String, Object>> pageResult = new PageResult<Map<String, Object>>();
    	// 封装数据
    	pageResult.setParameters(params);
    	// 查询结果
    	try {
    		pageResult = this.userCenterService.querySysBaseModule(pageResult);
    	} catch (Exception e) {
    		logger.error("管理员查询异常!" + e.getMessage());
    		e.printStackTrace();
    	}
    	List<Map<String, Object>> resultList = pageResult.getResultList();
   		JSONArray ja = JSONArray.parseArray(JSON.toJSONString(resultList));
   		return ja.toJSONString();
   	}
    
    
    
    /**
     * 删除模块信息
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "/deleteSysBaseModule", method = { RequestMethod.GET,RequestMethod.POST }, produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String deleteSysBaseModule(HttpServletRequest request, HttpServletResponse response,Model model){
    	logger.debug(" *=* 删除模块信息表*=* ");
    	Map<String, String> params = getParams(model);
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
     * 添加模块信息
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "/addSysBaseModule", method = { RequestMethod.GET,RequestMethod.POST }, produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String addSysBaseModule(HttpServletRequest request, HttpServletResponse response,Model model){
    	logger.debug(" *=* 添加模块信息表*=* ");
    	
    	Map<String, String> params = getParams(model);
    	String module_id = UUID.randomUUID().toString().replaceAll("-", "");
    	params.put("module_id", module_id);
    	Subject currentUser = SecurityUtils.getSubject();
    	UserAuthBean user = (UserAuthBean)currentUser.getSession().getAttribute("currentUser");
    	String user_id = user.getUser_id();
    	params.put("add_user", user_id);
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
     * 修改模块信息
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "/updateSysBaseModule", method = { RequestMethod.GET,RequestMethod.POST }, produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String updateSysBaseModule(HttpServletRequest request, HttpServletResponse response,Model model){
    	logger.debug(" *=* 添加模块信息表*=* ");
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
    
//////////////////////////////////////////////模块信息管理END///////////////////////////////////////////////
    
    
    

	
	
//////////////////////////////////////////////权限信息管理START///////////////////////////////////////////////

/**
* 权限信息查询
* @param request
* @param response
* @param model
* @return
*/
@RequestMapping(value = "/querySysBaseSecurity", method = { RequestMethod.GET,RequestMethod.POST }, produces = "text/html;charset=UTF-8")
@ResponseBody
public String querySysBaseSecurity(HttpServletRequest request, HttpServletResponse response,Model model){
logger.debug(" *=* 权限信息查询 *=* ");
HttpSession session = request.getSession();
Map<String, String> params = getParams(model);
UserAuthBean user = null;
//if (user == null || user.getUserState() != 1) {
//return("登陆状态失效, 请注销后重新登陆!");
//}
PageResult<Map<String, Object>> pageResult = new PageResult<Map<String, Object>>();
// 封装数据
pageResult.setParameters(params);
pageResult.setPageNow(Integer.parseInt(params.get("page"), 10));
pageResult.setPageSize(Integer.parseInt(params.get("rows"), 10));
// 查询结果
try {
pageResult = this.userCenterService.querySysBaseSecurity(pageResult);
} catch (Exception e) {
logger.error("管理员查询异常!" + e.getMessage());
e.printStackTrace();
}
return pageResult.toEasyUiJson();
}

/**
 * easyui Security权限下拉框查询数据字典
 */
@RequestMapping(value = "/selectSecuritySelectBox", method = { RequestMethod.GET, RequestMethod.POST }, produces = "text/html;charset=UTF-8")
@ResponseBody
public String selectSecuritySelectBox(HttpServletRequest request, HttpServletResponse response,Model model) {
	
	Map<String, String> params = getParams(model);
	PageResult<Map<String, Object>> pageResult = new PageResult<Map<String, Object>>();
	// 封装数据
	pageResult.setParameters(params);
	// 查询结果
	try {
		pageResult = this.userCenterService.querySysBaseSecurity(pageResult);
	} catch (Exception e) {
		logger.error("管理员查询异常!" + e.getMessage());
		e.printStackTrace();
	}
	List<Map<String, Object>> resultList = pageResult.getResultList();
	JSONArray ja = JSONArray.parseArray(JSON.toJSONString(resultList));
	return ja.toJSONString();
}

/**
* 删除权限信息
* @param request
* @param response
* @param model
* @return
*/
@RequestMapping(value = "/deleteSysBaseSecurity", method = { RequestMethod.GET,RequestMethod.POST }, produces = "text/html;charset=UTF-8")
@ResponseBody
public String deleteSysBaseSecurity(HttpServletRequest request, HttpServletResponse response,Model model){
logger.debug(" *=* 删除数据字典主表*=* ");
HttpSession session = request.getSession();
Map<String, String> params = getParams(model);
UserAuthBean user = null;
//if (user == null || user.getUserState() != 1) {
//return("登陆状态失效, 请注销后重新登陆!");
//}
EditResult resultStr = new EditResult();
try {
resultStr = this.userCenterService.deleteSysBaseSecurity(params);
} catch (Exception e) {
logger.error("删除权限信息表异常!" + e.getMessage());
e.printStackTrace();
}
return JSON.toJSONString(resultStr);
}



/**
* 添加模块信息
* @param request
* @param response
* @param model
* @return
*/
@RequestMapping(value = "/addSysBaseSecurity", method = { RequestMethod.GET,RequestMethod.POST }, produces = "text/html;charset=UTF-8")
@ResponseBody
public String addSysBaseSecurity(HttpServletRequest request, HttpServletResponse response,Model model){
logger.debug(" *=* 添加权限信息表*=* ");
Map<String, String> params = getParams(model);
String security_id = UUID.randomUUID().toString().replaceAll("-", "");
params.put("security_id", security_id);
Subject currentUser = SecurityUtils.getSubject();
UserAuthBean user = (UserAuthBean)currentUser.getSession().getAttribute("currentUser");
String user_id = user.getUser_id();
params.put("add_user", user_id);
EditResult resultStr = new EditResult();
// 查询结果
try {
resultStr = this.userCenterService.addSysBaseSecurity(params);
} catch (Exception e) {
logger.error("管理员查询异常!" + e.getMessage());
e.printStackTrace();
}
return JSON.toJSONString(resultStr);
}

/**
* 修改权限信息
* @param request
* @param response
* @param model
* @return
*/
@RequestMapping(value = "/updateSysBaseSecurity", method = { RequestMethod.GET,RequestMethod.POST }, produces = "text/html;charset=UTF-8")
@ResponseBody
public String updateSysBaseSecurity(HttpServletRequest request, HttpServletResponse response,Model model){
logger.debug(" *=* 添加数据字典从表*=* ");
Map<String, String> params = getParams(model);
EditResult resultStr = new EditResult();
// 查询结果
try {
resultStr = this.userCenterService.updateSysBaseSecurity(params);
} catch (Exception e) {
logger.error("管理员查询异常!" + e.getMessage());
e.printStackTrace();
}
return JSON.toJSONString(resultStr);
}

//////////////////////////////////////////////权限信息管理END///////////////////////////////////////////////
   






//////////////////////////////////////////////数据字典管理START///////////////////////////////////////////////

/**
* 权限信息查询
* @param request
* @param response
* @param model
* @return
*/
@RequestMapping(value = "/querySysBaseShiro", method = { RequestMethod.GET,RequestMethod.POST }, produces = "text/html;charset=UTF-8")
@ResponseBody
public String querySysBaseShiro(HttpServletRequest request, HttpServletResponse response,Model model){
logger.debug(" *=* 权限信息查询 *=* ");
Map<String, String> params = getParams(model);

PageResult<Map<String, Object>> pageResult = new PageResult<Map<String, Object>>();
//封装数据
pageResult.setParameters(params);
pageResult.setPageNow(Integer.parseInt(params.get("page"), 10));
pageResult.setPageSize(Integer.parseInt(params.get("rows"), 10));
//查询结果
try {
pageResult = this.userCenterService.querySysBaseShiro(pageResult);
} catch (Exception e) {
logger.error("管理员查询异常!" + e.getMessage());
e.printStackTrace();
}
return pageResult.toEasyUiJson();
}


/**
* 删除权限信息
* @param request
* @param response
* @param model
* @return
*/
@RequestMapping(value = "/deleteSysBaseShiro", method = { RequestMethod.GET,RequestMethod.POST }, produces = "text/html;charset=UTF-8")
@ResponseBody
public String deleteSysBaseShiro(HttpServletRequest request, HttpServletResponse response,Model model){
logger.debug(" *=* 删除数据字典主表*=* ");
Map<String, String> params = getParams(model);
EditResult resultStr = new EditResult();
try {
resultStr = this.userCenterService.deleteSysBaseShiro(params);
} catch (Exception e) {
logger.error("删除权限信息表异常!" + e.getMessage());
e.printStackTrace();
}
return JSON.toJSONString(resultStr);
}



/**
* 添加模块信息
* @param request
* @param response
* @param model
* @return
*/
@RequestMapping(value = "/addSysBaseShiro", method = { RequestMethod.GET,RequestMethod.POST }, produces = "text/html;charset=UTF-8")
@ResponseBody
public String addSysBaseShiro(HttpServletRequest request, HttpServletResponse response,Model model){
logger.debug(" *=* 添加权限信息表*=* ");
Map<String, String> params = getParams(model);
String shiro_id = UUID.randomUUID().toString().replaceAll("-", "");
params.put("shiro_id", shiro_id);
Subject currentUser = SecurityUtils.getSubject();
UserAuthBean user = (UserAuthBean)currentUser.getSession().getAttribute("currentUser");
String user_id = user.getUser_id();
params.put("add_user", user_id);
EditResult resultStr = new EditResult();
//查询结果
try {
resultStr = this.userCenterService.addSysBaseShiro(params);
} catch (Exception e) {
logger.error("管理员查询异常!" + e.getMessage());
e.printStackTrace();
}
return JSON.toJSONString(resultStr);
}

/**
* 修改权限信息
* @param request
* @param response
* @param model
* @return
*/
@RequestMapping(value = "/updateSysBaseShiro", method = { RequestMethod.GET,RequestMethod.POST }, produces = "text/html;charset=UTF-8")
@ResponseBody
public String updateSysBaseShiro(HttpServletRequest request, HttpServletResponse response,Model model){
logger.debug(" *=* 添加数据字典从表*=* ");
Map<String, String> params = getParams(model);
EditResult resultStr = new EditResult();
//查询结果
try {
resultStr = this.userCenterService.updateSysBaseShiro(params);
} catch (Exception e) {
logger.error("管理员查询异常!" + e.getMessage());
e.printStackTrace();
}
return JSON.toJSONString(resultStr);
}

//////////////////////////////////////////////权限信息管理END///////////////////////////////////////////////

    
}