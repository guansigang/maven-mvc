package com.guan.web.base.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.guan.web.base.dao.SecurityMapper;
import com.guan.web.base.service.SecurityService;
/*import com.chens.utils.core.Common;
import com.chens.utils.http.HttpZbusTool;
import com.chens.utils.reverse.ConfigParser;
import com.chens.utils.reverse.RewriteFilter;
import com.chens.web.securitycenter.domain.BaseServerBean;
import com.chens.web.securitycenter.domain.RuleBean;
import com.chens.web.securitycenter.domain.ServersBean;
import com.chens.web.securitycenter.util.CreateBaseServerXmlUtil;
import com.chens.web.securitycenter.util.ReadBaseServerXmlUtil;
import com.chens.web.securitycenter.web.controller.SecurityAction;
import com.chens.web.usercenter.service.IUserService;*/


@Service("securityService")
public class SecurityServiceImpl implements SecurityService {
	private static Logger logger = Logger.getLogger(SecurityServiceImpl.class);

//	@Resource
//	private IUserService userService;
	
	@Resource
	private SecurityMapper securityMapper;
	
	// 注意\r\n前不能有空格
	private static final String CRLF = "\r\n";
	
	
	/*@Override
	public void reloadSecurityConfig(String dateUrl) throws Exception {

		File dataFile = new File(SecurityAction.class.getResource("/").getPath() + dateUrl);
		ConfigParser parser = new ConfigParser(dataFile);
		RewriteFilter.setServerChain(parser.getServerChain());

	}

	@Override
	public void createSecurityConfig(String dateUrl) throws Exception {

		Map<String, Object> params = new HashMap<String, Object>();
		Map<String, String> param = new HashMap<String, String>();
		String whereStr = "jr.server_state=1 AND jrr.rule_state=1 AND jr.server_belong IN (0,1)";
		param.put("whereStr", whereStr);
		param.put("Method", "findServers");
		params.put("parameters", param);
		String res = "";
		try {
			res = HttpZbusTool.connectWithZbusNoHead(Common.ssMq, Common.ssPath, JSON.toJSONString(params));
		} catch (Exception e) {
			e.printStackTrace();
		}
		PageResult<Map<String, Object>> pageResult = JSON.parseObject(res, new TypeReference<PageResult<Map<String, Object>>>() {});
		List<Map<String, Object>> serverList = pageResult.getResultList();
		Map<String, BaseServerBean> baseServerMap = new HashMap<String, BaseServerBean>();
		for (Map<String, Object> serverMap : serverList) {
			Boolean b = serverMap.get("server_id") == null ||
					serverMap.get("server_name") == null ||
					serverMap.get("class_name") == null ||
					serverMap.get("domain_name") == null ||
					serverMap.get("isRewriting") == null ||
					serverMap.get("rule_id") == null ||
					serverMap.get("rule_name") == null ||
					serverMap.get("rule_class_name") == null ||
					serverMap.get("rule_directory") == null ||
					StringUtils.isAnyBlank(
					serverMap.get("server_id").toString(),
					serverMap.get("server_name").toString(),
					serverMap.get("class_name").toString(),
					serverMap.get("domain_name").toString(),
					serverMap.get("isRewriting").toString(),
					serverMap.get("rule_id").toString(),
					serverMap.get("rule_name").toString(),
					serverMap.get("rule_class_name").toString(),
					serverMap.get("rule_directory").toString());
			if (b) throw new Exception("Parameter error!");
			BaseServerBean baseServer = new BaseServerBean();
			String serverId = serverMap.get("server_id").toString();

			if (baseServerMap.containsKey(serverId)) {
				List<RuleBean> ruleBeanList = baseServerMap.get(serverId).getRuleBeanList();
				RuleBean rule = new RuleBean();
				rule.setRule_id(serverMap.get("rule_id").toString()); 					// rule ID
				rule.setRule_name(serverMap.get("rule_name").toString()); 				// rule 名称
				rule.setRule_class_name(serverMap.get("rule_class_name").toString());
				rule.setRule_directory(serverMap.get("rule_directory").toString());
				ruleBeanList.add(rule);
				baseServerMap.get(serverId).setRuleBeanList(ruleBeanList);
			} else {
				RuleBean rule = new RuleBean();
				baseServer.setServer_id(serverMap.get("server_id").toString()); 	// 服务 id
				baseServer.setServer_name(serverMap.get("server_name").toString()); // 服务名称
				baseServer.setClass_name(serverMap.get("class_name").toString()); 	// 固定
				baseServer.setDomain_name(serverMap.get("domain_name").toString()); // 跳转地址
				baseServer.setPath(serverMap.get("path").toString()); 				// 跳转一二级地址
				baseServer.setIsRewriting(serverMap.get("isRewriting").toString()); // 回显
				rule.setRule_id(serverMap.get("rule_id").toString()); 				// rule ID
				rule.setRule_name(serverMap.get("rule_name").toString()); 			// rule 名称
				rule.setRule_class_name(serverMap.get("rule_class_name").toString()); // 固定
				rule.setRule_directory(serverMap.get("rule_directory").toString()); // 对外一二级地址
				List<RuleBean> ruleBeanList = new LinkedList<>();
				ruleBeanList.add(rule);
				baseServer.setRuleBeanList(ruleBeanList);
				baseServerMap.put(serverId, baseServer);
			}
		}
		
		// 更改后的方法
		List<BaseServerBean> baseServerList = new LinkedList<>(baseServerMap.values());

		if (baseServerList.isEmpty() || baseServerList == null) {
			BaseServerBean baseServer = new BaseServerBean();
			RuleBean rule = new RuleBean();
			baseServer.setServer_id("24722977622851627"); 	// 服务 id
			baseServer.setServer_name("qiaqiaface"); 		// 服务名称
			baseServer.setClass_name("com.chens.utils.reverse.servers.BaseServer"); // 固定
			baseServer.setDomain_name("192.168.7.43:2080"); // 跳转地址
			baseServer.setPath("/qiaqiaface"); 				// 跳转一二级地址
			baseServer.setIsRewriting("true"); 				// 回显
			rule.setRule_id("24722977622851632"); 			// rule ID
			rule.setRule_name("qiaqiaface"); 				// rule 名称
			rule.setRule_class_name("com.chens.utils.reverse.rules.DirectoryRule"); // 固定
			rule.setRule_directory("/qiaerpweb"); 			// 对外一二级地址
			List<RuleBean> ruleBeanList = new LinkedList<>();
			ruleBeanList.add(rule);
			baseServer.setRuleBeanList(ruleBeanList);
			baseServerList.add(baseServer);
		}
		CreateBaseServerXmlUtil.create(baseServerList, dateUrl);
	}*/
	
	/**
	 * 得到固定权限验证规则
	 */
	@Override
	public String getFixedAuthRule() {
		StringBuffer sb = new StringBuffer("");
		List<Map<String,Object>> list=findShiros();
		for(Map<String,Object> map : list){
			sb.append(map.get("shiro_path").toString().trim()).append(" = ").append(map.get("user_name").toString().trim()).append(CRLF);
		}
		logger.debug("加载所有shiro权限:"+sb.toString());
		return sb.toString();
	}

	/**
	 * 获取服务信息
	 *//*
	@Override
	public PageResult<ServersBean> getServers(PageResult<ServersBean> pageResult) throws Exception {

		String res = "";
		try {
			res = HttpZbusTool.connectWithZbusNoHead(Common.ssMq, Common.ssPath, JSON.toJSONString(pageResult));
		} catch (Exception e) {
			e.printStackTrace();
		}
		PageResult<ServersBean> servers = JSON.parseObject(res, new TypeReference<PageResult<ServersBean>>() {
		});
		return servers;
	}

	*//**
	 * 获取rules服务信息
	  *//*
	@Override
	public PageResult<ServersBean> getRulesByServerId(PageResult<ServersBean> pageResult) throws Exception {
		String res = "";
		try {
			res = HttpZbusTool.connectWithZbusNoHead(Common.ssMq, Common.ssPath, JSON.toJSONString(pageResult));
		} catch (Exception e) {
			e.printStackTrace();
		}
		PageResult<ServersBean> rules = JSON.parseObject(res, new TypeReference<PageResult<ServersBean>>() {
		});
		return rules;
	}

	*//**
	 * 更新rule信息
	 *//*
	@Override
	public int updateMsg(String rule_directory, String rule_server_id) throws Exception {
		if (!rule_directory.startsWith("/") && rule_directory != "") {
			rule_directory = "/" + rule_directory;
		}
		if (rule_directory.contains("\\")) {
			rule_directory.replaceAll("\\", "/");
		}
		Map<String, Object> params = new HashMap<String, Object>();
		List<Map<String, Object>> valuesList = new ArrayList<>();
		Map<String, Object> valuesStr = new HashMap<>();
		Map<String, Object> para = new HashMap<>();
		valuesStr.put("rule_directory", "'" + rule_directory + "'");
		valuesStr.put("whereStr", "rule_id = '" + rule_server_id + "'");
		valuesList.add(valuesStr);
		para.put("setStr", "map");
		para.put("Method", "updateMsg");
		params.put("parameters", para);
		params.put("resultList", valuesList);
		String res = "";
		try {
			res = HttpZbusTool.connectWithZbusNoHead(Common.ssMq, Common.ssPath, JSON.toJSONString(params));
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (StringUtils.isBlank(res)) {
			logger.info("调用接口返回空！");
			return 0;
		}
		return 1;
	}

	*//**
	 * 检查server表中数据
	 *//*
	@Override
	public int checkServer(String whereStr) throws Exception {
		Map<String, Object> params = new HashMap<String, Object>();
		Map<String, String> param = new HashMap<String, String>();
		param.put("Method", "findSers");
		param.put("whereStr", whereStr);
		params.put("parameters", param);
		String res = "";
		try {
			res = HttpZbusTool.connectWithZbusNoHead(Common.ssMq, Common.ssPath, JSON.toJSONString(params));
		} catch (Exception e) {
			e.printStackTrace();
		}
		PageResult<ServersBean> servers = JSON.parseObject(res, new TypeReference<PageResult<ServersBean>>() {
		});
		List<ServersBean> serverList = servers.getResultList();
		if (serverList.isEmpty() || serverList == null) {
			return 1;
		}
		return 0;
	}

	*//**
	 * 检查srule表中数据
	 *//*
	@Override
	public int checkRule(String whereStr) throws Exception {
		Map<String, Object> params = new HashMap<String, Object>();
		Map<String, String> param = new HashMap<String, String>();
		param.put("Method", "findRules");
		param.put("whereStr", whereStr);
		params.put("parameters", param);
		String res = "";
		try {
			res = HttpZbusTool.connectWithZbusNoHead(Common.ssMq, Common.ssPath, JSON.toJSONString(params));
		} catch (Exception e) {
			e.printStackTrace();
		}
		PageResult<ServersBean> servers = JSON.parseObject(res, new TypeReference<PageResult<ServersBean>>() {
		});
		List<ServersBean> serverList = servers.getResultList();
		if (serverList.isEmpty() || serverList == null) {
			return 1;
		}
		return 0;
	}

	*//**
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

	/**
	 * 查询所有users信息
	 */
	@Override
	public List<Map<String, String>> findUsers() {
		List<Map<String, String>> users = securityMapper.queryUserModuleInfo();
		return users;
	}

	/**
	 * 删除Rules
	 *//*
	@Override
	public int deleteRules(PageResult<Map<String, Object>> pageResult) throws Exception {
		String res = "";
		try {
			res = HttpZbusTool.connectWithZbusNoHead(Common.ssMq, Common.ssPath, JSON.toJSONString(pageResult));
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (StringUtils.isNotBlank(res)) {
			return 1;
		}
		return 0;
	}

	*//**
	 * 插入rule
	 *//*
	@Override
	public int insertRule(String serverId, String name, String ruleName, String ruleDirectory, String createPerson) throws Exception{
		if (!ruleDirectory.startsWith("/") && ruleDirectory != "") {
			ruleDirectory = "/" + ruleDirectory;
		}
		if (ruleDirectory.contains("\\")) {
			ruleDirectory.replaceAll("\\", "/");
		}
		Map<String, Object> params = new HashMap<String, Object>();
		Map<String, String> param = new HashMap<String, String>();
		List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("serverId", "'" + serverId + "'");
		resultMap.put("name", "'" + name + "'");
		resultMap.put("ruleName", "'" + ruleName + "'");
		resultMap.put("ruleDirectory", "'" + ruleDirectory + "'");
		resultMap.put("createPerson", "'" + createPerson + "'");
		param.put("values", "map");
		resultList.add(resultMap);
		param.put("Method", "insertRule");
		params.put("resultList", resultList);
		params.put("parameters", param);
		String res = "";
		try {
			res = HttpZbusTool.connectWithZbusNoHead(Common.ssMq, Common.ssPath, JSON.toJSONString(params));
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (StringUtils.isBlank(res)) {
			logger.error("调用接口返回空！");
			return 0;
		}
		return 1;
	}

	*//**
	 * 插入server和rule
	 *//*
	@Override
	public int insertServer(String serverName, String className, String domainName, String path, String isRewriting,String name, String ruleName, String ruleDirectory, String createPerson,Integer server_belong) throws Exception {
		if (!path.startsWith("/") && path != "") {
			path = "/" + path;
		}
		if (path.contains("\\")) {
			path.replaceAll("\\", "/");
		}
		if (!ruleDirectory.startsWith("/") && ruleDirectory != "") {
			ruleDirectory = "/" + ruleDirectory;
		}
		if (ruleDirectory.contains("\\")) {
			ruleDirectory.replaceAll("\\", "/");
		}
		Map<String, Object> params = new HashMap<String, Object>();
		Map<String, String> param = new HashMap<String, String>();
		List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("serverName", "'" + serverName + "'");
		resultMap.put("className", "'" + className + "'");
		resultMap.put("domainName", "'" + domainName + "'");
		resultMap.put("path", "'" + path + "'");
		resultMap.put("isRewriting", "'" + isRewriting + "'");
		resultMap.put("createPerson", "'" + createPerson + "'");
		resultMap.put("server_belong", server_belong);
		param.put("values", "map");
		resultList.add(resultMap);
		param.put("Method", "insertServer");
		params.put("resultList", resultList);
		params.put("parameters", param);
		String res = "";
		try {
			res = HttpZbusTool.connectWithZbusNoHead(Common.ssMq, Common.ssPath, JSON.toJSONString(params));
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (StringUtils.isBlank(res)) {
			logger.info("调用接口返回空！");
			return 0;
		}
		String whereStr = "server_name = '" + serverName + "'";
		Map<String, Object> sparams = new HashMap<String, Object>();
		Map<String, String> sparam = new HashMap<String, String>();
		sparam.put("Method", "findSers");
		sparam.put("whereStr", whereStr);
		sparams.put("parameters", sparam);
		String sres = "";
		try {
			sres = HttpZbusTool.connectWithZbusNoHead(Common.ssMq, Common.ssPath, JSON.toJSONString(sparams));
		} catch (Exception e) {
			e.printStackTrace();
		}
		PageResult<ServersBean> servers = JSON.parseObject(sres, new TypeReference<PageResult<ServersBean>>() {
		});
		List<ServersBean> serverList = servers.getResultList();
		String serverId = serverList.get(0).getServer_id();
		Map<String, Object> paramsr = new HashMap<String, Object>();
		Map<String, String> paramr = new HashMap<String, String>();
		List<Map<String, Object>> resultListr = new ArrayList<Map<String, Object>>();
		Map<String, Object> resultMapr = new HashMap<String, Object>();
		resultMapr.put("serverId", "'" + serverId + "'");
		resultMapr.put("name", "'" + name + "'");
		resultMapr.put("ruleName", "'" + ruleName + "'");
		resultMapr.put("ruleDirectory", "'" + ruleDirectory + "'");
		resultMapr.put("createPerson", "'" + createPerson + "'");
		paramr.put("values", "map");
		resultListr.add(resultMapr);
		paramr.put("Method", "insertRule");
		paramsr.put("resultList", resultListr);
		paramsr.put("parameters", paramr);
		String resr = "";
		try {
			resr = HttpZbusTool.connectWithZbusNoHead(Common.ssMq, Common.ssPath, JSON.toJSONString(paramsr));
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (StringUtils.isBlank(resr)) {
			logger.info("调用接口返回空！");
			return 0;
		}
		return 1;
	}

	*//**
	 * 删除Servers 和所有Rules
	 *//*
	@Override
	public int deleteServers(PageResult<Map<String, Object>> pageResult) throws Exception {
		String res = "";
		try {
			res = HttpZbusTool.connectWithZbusNoHead(Common.ssMq, Common.ssPath, JSON.toJSONString(pageResult));
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (StringUtils.isBlank(res)) {
			return 0;
		}
		pageResult.getParameters().put("Method", "deleteRules");
		String resr = "";
		try {
			resr = HttpZbusTool.connectWithZbusNoHead(Common.ssMq, Common.ssPath, JSON.toJSONString(pageResult));
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (StringUtils.isBlank(resr)) {
			return 0;
		}
		return 1;
	}

	*//**
	 * 更新server
	 *//*
	@Override
	public int updateServer(String domainName, String path, String isRewriting, String whereStr) throws Exception {
		if (!path.startsWith("/") && path != "") {
			path = "/" + path;
		}
		if (path.contains("\\")) {
			path.replaceAll("\\", "/");
		}
		Map<String, Object> params = new HashMap<String, Object>();
		Map<String, String> param = new HashMap<String, String>();
		List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("domainName", "'" + domainName + "'");
		resultMap.put("path", "'" + path + "'");
		resultMap.put("isRewriting", "'" + isRewriting + "'");
		resultMap.put("whereStr", whereStr);
		param.put("setStr", "map");
		resultList.add(resultMap);
		param.put("Method", "updateServer");
		params.put("resultList", resultList);
		params.put("parameters", param);
		String res = "";
		try {
			res = HttpZbusTool.connectWithZbusNoHead(Common.ssMq, Common.ssPath, JSON.toJSONString(params));
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (StringUtils.isBlank(res)) {
			logger.info("调用接口返回空！");
			return 0;
		}
		return 1;
	}

	*//**
	 * 启用或禁用levels
	 * 
	 * @return
	 *//*
	@Override
	public int updateServerState(PageResult<Map<String, Object>> pageResult) throws Exception {
		String res = "";
		try {
			res = HttpZbusTool.connectWithZbusNoHead(Common.ssMq, Common.ssPath, JSON.toJSONString(pageResult));
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (StringUtils.isNotBlank(res)) {
			return 1;
		}
		return 0;
	}

	*//**
	 * 用户登录时 根据配置文件 更新数据库中server服务 ??? 登陆时更新权限 ???
	 * 1、配置文件和数据库都存在的服务 更新数据库中服务的状态为1（即开启状态）
	 * 2、配置文件中存在，但数据库中不存在的服务，将服务插入到数据库中，并开启服务
	 * 3、数据库中存在，但配置文件中不存在的服务，将数据库中服务的状态更新为2（即禁用状态）
	 *//*
	@Override
	public void checkServers(String dataUrl) throws Exception {
		List<BaseServerBean> baseServerListFromXml = ReadBaseServerXmlUtil.read(dataUrl);
		PageResult<BaseServerBean> page = new PageResult<>();
		page.setResultList(baseServerListFromXml);
		String res = "";
		try {
			res = HttpZbusTool.connectWithZbusNoHead(Common.ssMq, Common.sePath, JSON.toJSONString(page));
		} catch (Exception e) {
			throw e;
		} finally {
			if (StringUtils.isBlank(res)) {
				throw new Exception("Creat BaseReverseServer fail, Maybe caused by backservice error.");
			}
		}
	}*/
}
