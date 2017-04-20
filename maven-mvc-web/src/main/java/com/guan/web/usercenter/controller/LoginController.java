package com.guan.web.usercenter.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.guan.base.base.BaseContent;
import com.guan.base.base.ResultContent;
import com.guan.base.system.BaseController;
import com.guan.base.system.BaseParameter;
import com.guan.base.utils.Encrypt;
import com.guan.base.utils.IpUtil;
import com.guan.web.usercenter.model.UserAuthBean;
import com.guan.web.usercenter.service.UserService;



@Controller
@RequestMapping
public class LoginController extends BaseController{
 
	private static Logger logger = Logger.getLogger(LoginController.class);

	@Resource
	UserService userService;

    @RequestMapping("/login")
    public String showPersons(Model model){
        return "login";
    }
    
    /**
     * 后台登陆
     * @param model
     * @return
     */
    @RequestMapping("/backlogin")
    public String backlogin(Model model){
    	return "backlogin";
    }
//    @RequestMapping("/gentellelaToPage")
//    public String gentellela(String pageFlag){
//    	return "bootstrap/"+pageFlag;
//    }
    /**
     * 
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping("/checklogin")
    public ModelAndView checklogin(HttpServletRequest request, HttpServletResponse response,String username,String password,Model model){
    	
//    	方法返回客户端发出请求时的完整URL。
    	String testStr1 = request.getRequestURL().toString();
//    	方法返回请求行中的资源名部分。
    	String testStr2 = request.getRequestURI();
//    	 方法返回请求行中的参数部分。
    	String testStr3 = request.getQueryString();
//    	方法返回请求URL中的额外路径信息。额外路径信息是请求URL中的位于Servlet的路径之后和查询参数之前的内容，它以“/”开头。
    	String testStr4 = request.getPathInfo();
//    	方法返回发出请求的客户机的IP地址。
    	String testStr5 = request.getRemoteAddr();
//    	方法返回发出请求的客户机的完整主机名。
    	String testStr6 = request.getRemoteHost();
//    	方法返回客户机所使用的网络端口号。
    	String testStr7 = String.valueOf(request.getRemotePort());
//    	方法返回WEB服务器的IP地址。
    	String testStr8 = request.getLocalAddr();
//    	方法返回WEB服务器的主机名。
    	String testStr9 = request.getLocalName();
    	
    	System.out.println("***"+testStr1);
    	System.out.println("***"+testStr2);
    	System.out.println("***"+testStr3);
    	System.out.println("***"+testStr4);
    	System.out.println("***"+testStr5);
    	System.out.println("***"+testStr6);
    	System.out.println("***"+testStr7);
    	System.out.println("***"+testStr8);
    	System.out.println("***"+testStr9);
    	
    	
    	
    	
    	
    	
		logger.debug(" *=* 检查登陆账号密码 *=* ");
		HttpSession session = request.getSession();
		Map<String, String> params = getParams(model);
		String userName = StringUtils.isBlank(params.get("username")) ? null : params.get("username").trim();
		String userPass = StringUtils.isBlank(params.get("password")) ? null : params.get("password").trim();
		//没有登录页面信息这直接跳转到系统首页
		String loginUrl = StringUtils.isBlank(params.get("loginUrl")) ? "../../../index" : params.get("loginUrl").trim();
		
		if (userName == null || userPass == null) {
			logger.debug(" *=* 账号或者密码为空 *=* ");
			ModelAndView mav=new ModelAndView(loginUrl);
			mav.getModel().put("LOGIN_RESULT_CODE", ResultContent.LOGIN_NULL_RESULT_CODE);
			mav.getModel().put("LOGIN_RESULT_DESC", ResultContent.LOGIN_NULL_RESULT_DESC);
			return mav;
		}
		UserAuthBean user = null;
		try {
			SecurityUtils.getSubject().login(new UsernamePasswordToken(userName, userPass));
			user = (UserAuthBean)SecurityUtils.getSubject().getSession().getAttribute("currentUser");
			
			logger.info(" *=* " + userName + "尝试登陆 *=* ");
			// DES密码加密
			userPass = Encrypt.strEncode(userPass, BaseContent.SECRET_FIRST_BASE_CODE, BaseContent.SECRET_SECOND_BASE_CODE, BaseContent.SECRET_THIRD_BASE_CODE);
			
			if (user.getLogin_pwd() != null && user.getLogin_pwd().equals(userPass) && BaseParameter.IS_USEING.equals(user.getUser_state())) {
				// 登录成功，添加登录记录
				session.setAttribute("userSession", user);
				// 根据login_id用来退出登录
				String login_id = UUID.randomUUID().toString().replaceAll("-", "");
				session.setAttribute("login_id_session", login_id);
		
				// 获取用户IP
				IpUtil ipUtil = new IpUtil();
				String ip = ipUtil.getIpAddr(request);
				
				// 添加记录的方法
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String loginTime = sdf.format(new Date());
				
				UserAuthBean user2 = (UserAuthBean) session.getAttribute("userSession");
				int number = userService.userLogin(login_id,user.getUser_id(), ip,loginTime);
				if(number!=1){
					logger.info("用户IP地址为: " + ip);
				}
				return new ModelAndView(user2.getModule_index(), "SUCCESS", "登录成功。");
			} else {
				ModelAndView mav=new ModelAndView(loginUrl);
				mav.getModel().put("LOGIN_RESULT_CODE", ResultContent.LOGIN_FAIL_RESULT_CODE);
				mav.getModel().put("LOGIN_RESULT_DESC", ResultContent.LOGIN_FAIL_RESULT_DESC);
				return mav;
			}
			
				
		} catch (Exception te) {
			te.printStackTrace();
		}
		ModelAndView mav=new ModelAndView(loginUrl);
		mav.getModel().put("LOGIN_RESULT_CODE", ResultContent.LOGIN_ERROR_RESULT_CODE);
		mav.getModel().put("LOGIN_RESULT_DESC", ResultContent.LOGIN_ERROR_RESULT_DESC);
		return mav;
    }
    
    
    
    @RequestMapping(value = "/logout", method = { RequestMethod.GET,RequestMethod.POST })
	public ModelAndView logout(HttpServletRequest request) throws Exception {
		
		logger.debug(" *=* 用户注销 *=* ");
		HttpSession session = request.getSession();
		UserAuthBean user = (UserAuthBean) session.getAttribute("currentUser");
		String loginId = (String) session.getAttribute("login_id_session");
//		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		String exitTime = sd.format(new Date());
	    userService.updateExitTime(loginId);
		session.removeAttribute("login_id_session");
		session.removeAttribute("currentUser");
		session.removeAttribute("userSession");
		ModelAndView mav = new ModelAndView();
		// 初始化Session
		request.getSession().invalidate();
		// 关闭shiro验证
		SecurityUtils.getSubject().logout();
		mav.setViewName("redirect:"+user.getModule_path());
		mav.addObject("logstate", 1);
		
		return mav;
	}
    
    
    
    /**
	 * easyui下拉框查询数据字典
	 */
	@RequestMapping(value = "/selectBoxQuery", method = { RequestMethod.GET, RequestMethod.POST }, produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String selectBoxQuery(HttpServletRequest request, HttpServletResponse response,Model model) {
		
		Map<String, String> params = getParams(model);
		String dict_code = params.get("dict_code").trim();
		if(dict_code==null||dict_code==""){
			return "";
		}
		List<Map<String, Object>> resultList=new ArrayList<Map<String, Object>>();
		try {
			resultList = userService.querySelectBoxOption(dict_code);
		} catch (Exception e) {
			logger.error(dict_code+"查询数据字典失败！");
			e.printStackTrace();
		}
		
		JSONArray ja = JSONArray.parseArray(JSON.toJSONString(resultList));
		return ja.toJSONString();
	}
    
}