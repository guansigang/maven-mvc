package com.guan.web.base.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
@Repository("securityMapper")
public interface SecurityMapper {
	List<Map<String, Object>> queryShiroSecurity();
	
	List<Map<String, String>> queryUserSecurityInfo();
	
}
