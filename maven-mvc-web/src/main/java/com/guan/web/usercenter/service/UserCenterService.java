package com.guan.web.usercenter.service;

import java.util.List;
import java.util.Map;

import com.guan.base.base.EditResult;
import com.guan.base.base.PageResult;

public interface UserCenterService {

	PageResult<Map<String, Object>> queryUserInfo(PageResult<Map<String, Object>> pageResult)throws Exception;

	PageResult<Map<String, Object>> querySysBaseDict(PageResult<Map<String, Object>> pageResult)throws Exception;
	
	PageResult<Map<String, Object>> querySysBaseDictItem(PageResult<Map<String, Object>> pageResult)throws Exception;

	EditResult addSysBaseDictItem(Map<String, String> params)throws Exception;
	
	EditResult updateSysBaseDictItem(Map<String, String> params)throws Exception;

	EditResult updateSysBaseDict(Map<String, String> params)throws Exception;

	EditResult addSysBaseDict(Map<String, String> params)throws Exception;

	List<Map<String, Object>> querySelectBoxBaseDict(String dict_name)throws Exception;

	EditResult deleteSysBaseDict(Map<String, String> params)throws Exception;
	
	EditResult deleteSysBaseDictItem(Map<String, String> params)throws Exception;

}
