package com.guan.web.base.service.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.filter.mgt.DefaultFilterChainManager;
import org.apache.shiro.web.filter.mgt.PathMatchingFilterChainResolver;
import org.apache.shiro.web.servlet.AbstractShiroFilter;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;

import com.guan.web.base.dao.SecurityMapper;
import com.guan.web.base.service.AuthService;
import com.guan.web.base.service.SecurityService;

@Service("authService")
public class AuthServiceImpl implements AuthService {

	private static final Logger logger = Logger.getLogger(AuthServiceImpl.class);

	// 注意/r/n前不能有空格
	private static final String CRLF = "\r\n";
	private static final String LAST_AUTH_STR = "/** =authc\r\n";
	
	@Resource
	private SecurityMapper securityMapper;
	
	@Resource
	private ShiroFilterFactoryBean shiroFilterFactoryBean;

	// @Resource
	// private IBaseDao dao;

	@Override
	public String loadFilterChainDefinitions() {

		StringBuffer sb = new StringBuffer("");
		sb.append(this.getFixedAuthRule()).append(getDynaAuthRule()).append(getRestfulOperationAuthRule()).append(LAST_AUTH_STR);

		return sb.toString();
	}

	// 生成restful风格功能权限规则
	private String getRestfulOperationAuthRule() {

		// List<Operation> operations = dao.queryEntitys("from Operation o", new
		// Object[]{});
		//
		// Set<String> restfulUrls = newHashSet<String>();
		// for(Operation op : operations) {
		// restfulUrls.add(op.getUrl());
		// }
		StringBuffer sb = new StringBuffer("");
		// for(Iterator<String> urls = restfulUrls.iterator(); urls.hasNext(); )
		// {
		// String url = urls.next();
		// if(! url.startsWith("/")) {
		// url = "/"+ url ;
		// }
		// sb.append(url).append("=").append("authc,
		// rest[").append(url).append("]").append(CRLF);
		// }
		return sb.toString();

	}
	
	
	
	/**
	 * 得到固定权限验证规则
	 */
	@Override
	public String getFixedAuthRule() {
		StringBuffer sb = new StringBuffer("");
		List<Map<String,Object>> list=this.findShiros();
		for(Map<String,Object> map : list){
			sb.append(map.get("shiro_path").toString().trim()).append(" = ").append(map.get("user_name").toString().trim()).append(CRLF);
		}
		logger.debug("加载所有shiro权限:"+sb.toString());
		return sb.toString();
	}
	
	
	/**
	 * 查询所有shiro信息
	 */
	@Override
	public List<Map<String, Object>> findShiros() {
		List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
		try {
			resultList = securityMapper.queryShiroSecurity();
		} catch (Exception e) {
			e.printStackTrace();
		}
		/*PageResult<Map<String, String>> shirosPage = JSON.parseObject(res, new TypeReference<PageResult<Map<String, String>>>() {
		});
		List<Map<String, String>> shiros = shirosPage.getResultList();*/
		return resultList;
	}
	
	

	// 根据角色，得到动态权限规则
	private String getDynaAuthRule() {

		StringBuffer sb = new StringBuffer("");
		Map<String, Set<String>> rules = new HashMap<String, Set<String>>();

		// List<Role> roles = dao.queryEntitys("from Role r left join fetch
		// r.menus", new Object[]{});
		// for(Role role: roles) {
		// for(Iterator<Menu> menus =role.getMenus().iterator();
		// menus.hasNext();) {
		// String url = menus.next().getUrl();
		// if(!url.startsWith("/")) {
		// url = "/"+ url;
		// }
		// if(!rules.containsKey(url)) {
		// rules.put(url, newHashSet<String>());
		// }
		// rules.get(url).add((role.getRoleCode()));
		// }
		// }

		for (Map.Entry<String, Set<String>> entry : rules.entrySet()) {
			sb.append(entry.getKey()).append(" = ").append("authc,roleOrFilter").append(entry.getValue()).append(CRLF);
		}

		return sb.toString();
	}

	// 得到固定权限验证规则
/*	private String getFixedAuthRule() {

		StringBuffer sb = new StringBuffer("");

		ClassPathResource cp = new ClassPathResource("properties/shiro_fixed_auth_res.properties");
		Properties properties = new Properties();
		try {
			properties.load(cp.getInputStream());
		} catch (IOException e) {
			log.error("shiro_fixed_auth_res.properties error!", e);
			throw new RuntimeException("load shiro_fixed_auth_res.properties error!");
		}
		for (Iterator its = properties.keySet().iterator(); its.hasNext();) {
			String key = (String) its.next();
			sb.append(key).append(" = ").append(properties.getProperty(key).trim()).append(CRLF);
		}
		return sb.toString();

	}*/

	@Override
	// 此方法加同步锁
	public synchronized void reCreateFilterChains() {

		AbstractShiroFilter shiroFilter = null;
		try {
			shiroFilter = (AbstractShiroFilter) shiroFilterFactoryBean.getObject();
		} catch (Exception e) {
			logger.error("getShiroFilter from shiroFilterFactoryBean error!", e);
			throw new RuntimeException("get ShiroFilter from shiroFilterFactoryBean error!");
		}

		PathMatchingFilterChainResolver filterChainResolver = (PathMatchingFilterChainResolver) shiroFilter
				.getFilterChainResolver();
		DefaultFilterChainManager manager = (DefaultFilterChainManager) filterChainResolver.getFilterChainManager();

		// 清空老的权限控制
		manager.getFilterChains().clear();

		shiroFilterFactoryBean.getFilterChainDefinitionMap().clear();
		shiroFilterFactoryBean.setFilterChainDefinitions(loadFilterChainDefinitions());
		// 重新构建生成
		Map<String, String> chains = shiroFilterFactoryBean.getFilterChainDefinitionMap();
		for (Map.Entry<String, String> entry : chains.entrySet()) {
			String url = entry.getKey();
			String chainDefinition = entry.getValue().trim().replace(" ", "");
			manager.createChain(url, chainDefinition);
		}
	}
}
