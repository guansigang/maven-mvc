package com.guan.web.usercenter.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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
import org.springframework.web.servlet.ModelAndView;

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
    @RequestMapping("/test")
    public String test(Model model){
    	return "test/test";
    }
    
    @RequestMapping("/gentellelaToPage")
    public String gentellela(String pageFlag){
    	return "bootstrap/"+pageFlag;
    }
    
    /**
     * 
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping("/checklogin")
    public ModelAndView checklogin(HttpServletRequest request, HttpServletResponse response,String username,String password,Model model){
    	
		logger.debug(" *=* 检查登陆账号密码 *=* ");
		HttpSession session = request.getSession();
		Map<String, String> params = getParams(model);
		String userName = StringUtils.isBlank(params.get("username")) ? null : params.get("username").trim();
		String userPass = StringUtils.isBlank(params.get("password")) ? null : params.get("password").trim();
		if (userName == null || userPass == null) {
			logger.debug(" *=* 账号或者密码为空 *=* ");
			return new ModelAndView("login", "EMPTY", "用户名或密码为空。");
		}
		UserAuthBean user = null;
		try {
			SecurityUtils.getSubject().login(new UsernamePasswordToken(userName, userPass));
			user = (UserAuthBean)SecurityUtils.getSubject().getSession().getAttribute("currentUser");
			
			logger.info(" *=* " + userName + "尝试登陆 *=* ");
			String fKey = "4a";	// 必需的密钥
			String sKey = "anquan";
			String tKey = "jiami";
			// 密码加密
			userPass = Encrypt.strEncode(userPass, fKey, sKey, tKey);
			
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
			    String lever = user2.getUser_level();
				int number = userService.userLogin(login_id,user.getUser_id(), ip,loginTime);
				if(number!=1){
					logger.info("用户IP地址为: " + ip);
				}
//				session.setAttribute(login_id, login_id);
//				session.setAttribute(userName, userName);
//				session.setAttribute(ip, ip);
//				session.setAttribute(name, value);
//				session.setAttribute(login_id, login_id);
				return new ModelAndView("bootstrap/gentellela_index", "SUCCESS", "登录成功。");
			} else {
				return new ModelAndView("login", "KEYERROR", "用户名或密码错误。");
			}
			
				
		} catch (Exception te) {
			te.printStackTrace();
		}
		return new ModelAndView("login", "LOGINFAIL", "登录失败。");
    }
    
    
    /**
     * 
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping("/easyuichecklogin")
    public ModelAndView easyuichecklogin(HttpServletRequest request, HttpServletResponse response,String username,String password,Model model){
    	
		logger.debug(" *=* 检查登陆账号密码 *=* ");
		HttpSession session = request.getSession();
		Map<String, String> params = getParams(model);
		String userName = StringUtils.isBlank(params.get("username")) ? null : params.get("username").trim();
		String userPass = StringUtils.isBlank(params.get("password")) ? null : params.get("password").trim();
		if (userName == null || userPass == null) {
			logger.debug(" *=* 账号或者密码为空 *=* ");
			return new ModelAndView("login", "EMPTY", "用户名或密码为空。");
		}
		UserAuthBean user = null;
		try {
			SecurityUtils.getSubject().login(new UsernamePasswordToken(userName, userPass));
			user = (UserAuthBean)SecurityUtils.getSubject().getSession().getAttribute("currentUser");
			
			logger.info(" *=* " + userName + "尝试登陆 *=* ");
			String fKey = "4a";	// 必需的密钥
			String sKey = "anquan";
			String tKey = "jiami";
			// 密码加密
			userPass = Encrypt.strEncode(userPass, fKey, sKey, tKey);
			
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
			    String lever = user2.getUser_level();
				int number = userService.userLogin(login_id,user.getUser_id(), ip,loginTime);
				if(number!=1){
					logger.info("用户IP地址为: " + ip);
				}
//				session.setAttribute(login_id, login_id);
//				session.setAttribute(userName, userName);
//				session.setAttribute(ip, ip);
//				session.setAttribute(name, value);
//				session.setAttribute(login_id, login_id);
				return new ModelAndView("easyui/easyui_index", "SUCCESS", "登录成功。");
			} else {
				return new ModelAndView("login", "KEYERROR", "用户名或密码错误。");
			}
			
				
		} catch (Exception te) {
			te.printStackTrace();
		}
		return new ModelAndView("login", "LOGINFAIL", "登录失败。");
    }
    
    /**
	 * 登录成功后根据用户判断跳转到的位置
	 */
	@RequestMapping(value = "/success", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView success(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("/login");
		HttpSession session = request.getSession();
		UserAuthBean user = (UserAuthBean) session.getAttribute("userSession");
		mav.addObject("msg", request.getParameter("msg"));
		
		//用户信息列表
		if (user.getUser_level() == "") mav = new ModelAndView("redirect:/regist/userMain");
		//财务对账
		if (user.getUser_level() == "") mav = new ModelAndView("redirect:/ordercompara/orderMain");
		//物流对账
		if (user.getUser_level() == "") mav = new ModelAndView("redirect:/logistics/queryLogisticsList");
		//采购需求月计划
		if (user.getUser_level() == "") mav = new ModelAndView("redirect:/purchase/purchaseMain");
		//信息部数据分析
		if (user.getUser_level() == "") mav = new ModelAndView("redirect:/juhuasuaninfo/eleBussSysMain");
		//质量部数据
		if (user.getUser_level() == "") mav = new ModelAndView("redirect:/juhuasuaninfo/qualityMain");
		
//		if (user.getUserLevel() == 0) mav = new ModelAndView("redirect:/regist/add");
//		if (user.getUserLevel() == 1) mav = new ModelAndView("redirect:/ordercompara/query");
//		if (user.getUserLevel() == 3) mav = new ModelAndView("redirect:/logistics/queryLogistics");
//		if (user.getUserLevel() == 4) mav = new ModelAndView("redirect:/logistics/queryLogisticsList");
//		if (user.getUserLevel() == 5) mav = new ModelAndView("redirect:/purchase/queryPurchaseList");
//		if (user.getUserLevel() == 7) mav = new ModelAndView("redirect:/juhuasuaninfo/query");
		return mav;
	}
    
}