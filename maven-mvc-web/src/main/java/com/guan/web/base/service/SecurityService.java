package com.guan.web.base.service;

import java.util.List;
import java.util.Map;



public interface SecurityService {
//	public void reloadSecurityConfig(String dateUrl) throws Exception;

//	public void createSecurityConfig(String dateUrl) throws Exception;
		
	public String getFixedAuthRule();
	
//	PageResult<ServersBean> getServers(PageResult<ServersBean> pageResult) throws Exception;

	List<Map<String,Object>> findShiros();
	
	List<Map<String, String>> findUsers();
	
	/*PageResult<ServersBean> getRulesByServerId(PageResult<ServersBean> pageResult) throws Exception;

	int updateMsg(String rule_directory,String rule_server_id)throws Exception;

	int checkServer(String whereStr)throws Exception;
	
	int checkRule(String whereStr)throws Exception;
	
	
	
	int deleteRules(PageResult<Map<String,Object>> pageResult) throws Exception;
	
	int deleteServers(PageResult<Map<String,Object>> pageResult) throws Exception;
	
	int updateServerState(PageResult<Map<String,Object>> pageResult) throws Exception;
	
	int insertRule(String serverId, String name, String ruleName, String ruleDirectory, String createPerson) throws Exception;
	
	int insertServer(String serverName, String className, String domainName, String path, String isRewriting,
			String name, String ruleName, String ruleDirectory, String createPerson,Integer server_belong) throws Exception;

	int updateServer(String domainName, String path, String isRewriting, String whereStr) throws Exception;

	void checkServers(String dateUrl) throws Exception;*/
}
