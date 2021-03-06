package com.guan.web.autoCreat.service;

import java.util.List;
import java.util.Map;

import com.guan.base.base.EditResult;
import com.guan.base.base.PageResult;
import com.guan.web.easyui.model.DaletouHisList;

public interface AuthCreatService {
	
	PageResult<Map<String, Object>> queryDataBaseInfoList(PageResult<Map<String, Object>> pageResult);

	// ////////////////////////////////////////////自动生成代码START///////////////////////////////////////////////

	List<Map<String, Object>> querySelectDateBase();

	EditResult updateSysDateBaseTable(Map<String, String> params);

	EditResult addSysDateBaseTable(Map<String, String> params);

	PageResult<Map<String, Object>> querySysDateBaseTable(PageResult<Map<String, Object>> pageResult);


	// ////////////////////////////////////////////自动生成代码END///////////////////////////////////////////////

}
