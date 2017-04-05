package com.guan.web.usercenter.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.guan.base.base.PageResult;

@Repository("userCenterMapper")
public interface UserCenterMapper {

	List<Map<String, Object>> selectUserManagers(PageResult<Map<String, Object>> pageResult);

	int selectUserManagersCount(PageResult<Map<String, Object>> pageResult);

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

}
