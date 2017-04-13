package com.guan.web.usercenter.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.guan.base.base.PageResult;

@Repository("userCenterMapper")
public interface UserCenterMapper {

	List<Map<String, Object>> selectUserManagers(PageResult<Map<String, Object>> pageResult);

	int selectUserManagersCount(PageResult<Map<String, Object>> pageResult);

	int addSysShiroUser(Map<String, String> params);

	List<Map<String, Object>> selectSysBaseDict(PageResult<Map<String, Object>> pageResult);

	int selectSysBaseDictCount(PageResult<Map<String, Object>> pageResult);

	List<Map<String, Object>> selectSysBaseDictItem(PageResult<Map<String, Object>> pageResult);

	int selectSysBaseDictItemCount(PageResult<Map<String, Object>> pageResult);

	
	
	int addSysBaseDictItem(Map<String, String> params);
	
	int updateSysBaseDictItem(Map<String, String> params);
	
	int addSysBaseDict(Map<String, String> params);
	
	int updateSysBaseDict(Map<String, String> params);

	List<Map<String, Object>> querySelectBoxBaseDict(String dict_name);

	int deleteSysBaseDict(Map<String, String> params);
	
	int deleteSysBaseDictItem(Map<String, String> params);

	int selectSysBaseModuleCount(PageResult<Map<String, Object>> pageResult);

	List<Map<String, Object>> selectSysBaseModule(PageResult<Map<String, Object>> pageResult);

	int deleteSysBaseModule(Map<String, String> params);

	int addSysBaseModule(Map<String, String> params);

	int updateSysBaseModule(Map<String, String> params);

	int updateSysBaseSecurity(Map<String, String> params);

	int addSysBaseSecurity(Map<String, String> params);

	int deleteSysBaseSecurity(Map<String, String> params);

	List<Map<String, Object>> selectSysBaseSecurity(PageResult<Map<String, Object>> pageResult);

	int selectSysBaseSecurityCount(PageResult<Map<String, Object>> pageResult);
	
	int updateSysBaseShiro(Map<String, String> params);
	
	int addSysBaseShiro(Map<String, String> params);
	
	int deleteSysBaseShiro(Map<String, String> params);
	
	List<Map<String, Object>> selectSysBaseShiro(PageResult<Map<String, Object>> pageResult);
	
	int selectSysBaseShiroCount(PageResult<Map<String, Object>> pageResult);


}
