package com.guan.web.autoCreat.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.guan.base.base.PageResult;
@Repository("authCreatMapper")
public interface AuthCreatMapper {

	List<Map<String, Object>> querySelectDateBase();

	int updateSysDateBaseTable(Map<String, String> params);

	int addSysDateBaseTable(Map<String, String> params);

	List<Map<String, Object>> selectSysDateBaseTable(PageResult<Map<String, Object>> pageResult);

	int selectSysDateBaseTableCount(PageResult<Map<String, Object>> pageResult);


}
