package com.guan.web.usercenter.util;

import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;

import com.guan.base.system.BaseParameter;
import com.guan.base.utils.PropertiesGetConfiguration;
import com.guan.web.base.service.SecurityService;
import com.guan.web.usercenter.model.UserAuthBean;
import com.guan.web.usercenter.service.UserService;


public class ShiroDbRealm extends AuthorizingRealm {
	
	private static Logger logger = Logger.getLogger(ShiroDbRealm.class);
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private SecurityService securityService;
	
	private List<Map<String,String>> securityLevelList = new LinkedList<>();
	private static Long holdTime = System.currentTimeMillis();

	/**
	 * 为当前登录的Subject授予角色和权限
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		System.out.println("测试权限11111");
		SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
		Object currentUser = SecurityUtils.getSubject().getSession().getAttribute("currentUser");
		if (currentUser != null) {
			UserAuthBean user = (UserAuthBean) currentUser;
			if (securityLevelList == null || securityLevelList.isEmpty() || System.currentTimeMillis() - holdTime > (10 * 60 * 1000)) {
				securityLevelList = securityService.findUsers();
				holdTime = System.currentTimeMillis();
				for (Map<String,String> map : securityLevelList) {
					if (StringUtils.equals(map.get("module_id"), String.valueOf(user.getModule_id()))) {
						authorizationInfo.addRole(map.get("module_en"));
						authorizationInfo.addStringPermission(map.get("module_en") + ":all");
					}
				}
			} else {
				for (Map<String,String> map : securityLevelList) {
					if (StringUtils.equals(map.get("module_id"), String.valueOf(user.getModule_id()))) {
						authorizationInfo.addRole(map.get("module_en"));
						authorizationInfo.addStringPermission(map.get("module_en") + ":all");
					}
				}
			}
		}
		return authorizationInfo;
	}

	/**
	 * 验证当前登录的Subject
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken) throws AuthenticationException {
		System.out.println("测试权限2222");
		// 获取基于用户名和密码的令牌
		UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
		logger.debug("验证当前getSubject时获取到token为" + ReflectionToStringBuilder.toString(token, ToStringStyle.MULTI_LINE_STYLE));
		try {
			logger.info("*=*" + token.getUsername() + "尝试登陆*=*");
			UserAuthBean user = userService.getUserByName(token.getUsername());
			// 用户不为空并且是启用状态, 添加authcInfo
			if (user != null && BaseParameter.IS_USEING.equals(user.getUser_state())) {
				logger.debug("this.name=" + this.getName());
				SimpleAuthenticationInfo authcInfo = new SimpleAuthenticationInfo(token.getUsername(), token.getPassword(), this.getName());
				this.setSession("currentUser", user);
				return authcInfo;
			} else {
				// 没有返回登录用户名对应的SimpleAuthenticationInfo对象时, 就会在LoginController中抛出UnknownAccountException异常
				logger.debug("this.name=" + this.getName());
				SimpleAuthenticationInfo authcInfo = new SimpleAuthenticationInfo(token.getUsername(), token.getPassword(), this.getName());
				this.setSession("currentUser", new UserAuthBean()); // 返回空用户
				logger.error("*=*" + token.getUsername() + "用户登陆失败*=*");
				return authcInfo;
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("*=*" + token.getUsername() + "用户登陆失败*=*");
			return null;
		}
	}

	/**
	 * 将一些数据放到ShiroSession中, 以便于其它地方使用
	 */
	private void setSession(Object key, Object value) {
		Subject currentUser = SecurityUtils.getSubject();
		if (currentUser != null) {
			Session session = currentUser.getSession();
			logger.debug("Session默认超时时间为[" + session.getTimeout() + "]毫秒");
			if (session != null) {
				session.setAttribute(key, value);
			}
		}
	}
}