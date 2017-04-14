package com.guan.web.usercenter.service;

import java.util.List;
import java.util.Map;

import com.guan.base.base.EditResult;
import com.guan.base.base.PageResult;

public interface UserCenterService {

	PageResult<Map<String, Object>> queryUserInfo(PageResult<Map<String, Object>> pageResult) throws Exception;

	EditResult addSysShiroUser(Map<String, String> params) throws Exception;
	
	EditResult updateSysShiroUser(Map<String, String> params);

	// ////////////////////////////////////////////数据字典管理START///////////////////////////////////////////////
	PageResult<Map<String, Object>> querySysBaseDict(PageResult<Map<String, Object>> pageResult) throws Exception;

	PageResult<Map<String, Object>> querySysBaseDictItem(PageResult<Map<String, Object>> pageResult) throws Exception;

	EditResult addSysBaseDictItem(Map<String, String> params) throws Exception;

	EditResult updateSysBaseDictItem(Map<String, String> params) throws Exception;

	EditResult updateSysBaseDict(Map<String, String> params) throws Exception;

	EditResult addSysBaseDict(Map<String, String> params) throws Exception;

	List<Map<String, Object>> querySelectBoxBaseDict(String dict_name) throws Exception;

	EditResult deleteSysBaseDict(Map<String, String> params) throws Exception;

	EditResult deleteSysBaseDictItem(Map<String, String> params) throws Exception;

	// ////////////////////////////////////////////数据字典管理END///////////////////////////////////////////////

	// ////////////////////////////////////////////模块信息管理START///////////////////////////////////////////////
	PageResult<Map<String, Object>> querySysBaseModule(PageResult<Map<String, Object>> pageResult) throws Exception;

	EditResult deleteSysBaseModule(Map<String, String> params) throws Exception;

	EditResult addSysBaseModule(Map<String, String> params) throws Exception;

	EditResult updateSysBaseModule(Map<String, String> params) throws Exception;

	// ////////////////////////////////////////////模块信息管理END///////////////////////////////////////////////

	// ////////////////////////////////////////////权限管理START///////////////////////////////////////////////

	EditResult updateSysBaseSecurity(Map<String, String> params) throws Exception;

	EditResult addSysBaseSecurity(Map<String, String> params) throws Exception;

	EditResult deleteSysBaseSecurity(Map<String, String> params) throws Exception;

	PageResult<Map<String, Object>> querySysBaseSecurity(PageResult<Map<String, Object>> pageResult) throws Exception;

	// ////////////////////////////////////////////权限管理END///////////////////////////////////////////////

	// ////////////////////////////////////////////资源信息管理START///////////////////////////////////////////////
	PageResult<Map<String, Object>> querySysBaseShiro(PageResult<Map<String, Object>> pageResult) throws Exception;

	EditResult deleteSysBaseShiro(Map<String, String> params) throws Exception;

	EditResult updateSysBaseShiro(Map<String, String> params) throws Exception;

	EditResult addSysBaseShiro(Map<String, String> params) throws Exception;

	// ////////////////////////////////////////////资源信息管理END///////////////////////////////////////////////

}
