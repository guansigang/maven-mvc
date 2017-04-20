package com.guan.web.autoCreat.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guan.base.base.EditResult;
import com.guan.base.base.PageResult;
import com.guan.base.base.ResultContent;
import com.guan.web.autoCreat.dao.AuthCreatMapper;
import com.guan.web.autoCreat.service.AuthCreatService;
@Service("authCreatService")
public class AuthCreatServiceImpl implements AuthCreatService {

	@Autowired
	private AuthCreatMapper authCreatMapper;

	private static Logger logger = Logger.getLogger(AuthCreatServiceImpl.class);
	
	
	
	@Override
	public List<Map<String, Object>> querySelectDateBase() {
		List<Map<String, Object>> result_list = authCreatMapper.querySelectDateBase();
		return result_list;
	}

	@Override
	public EditResult updateSysDateBaseTable(Map<String, String> params) {
		EditResult editResult = new EditResult();
		int resultNum = authCreatMapper.updateSysDateBaseTable(params);
		if (resultNum == 1) {
			// 编辑成功
			editResult.setResultCode(ResultContent.EDIT_DATA_SUCCESS_RESULT_CODE);
			editResult.setResultDesc(ResultContent.EDIT_DATA_SUCCESS_RESULT_DESC);
		} else {
			// 编辑失败
			editResult.setResultCode(ResultContent.EDIT_DATA_FAIL_RESULT_CODE);
			editResult.setResultDesc(ResultContent.EDIT_DATA_FAIL_RESULT_DESC);
			logger.error(ResultContent.EDIT_DATA_FAIL_RESULT_DESC);
		}
		return editResult;
	}

	@Override
	public EditResult addSysDateBaseTable(Map<String, String> params) {
		EditResult editResult = new EditResult();
		int resultNum = authCreatMapper.addSysDateBaseTable(params);
		if (resultNum == 1) {
			// 编辑成功
			editResult.setResultCode(ResultContent.EDIT_DATA_SUCCESS_RESULT_CODE);
			editResult.setResultDesc(ResultContent.EDIT_DATA_SUCCESS_RESULT_DESC);
		} else {
			// 编辑失败
			editResult.setResultCode(ResultContent.EDIT_DATA_FAIL_RESULT_CODE);
			editResult.setResultDesc(ResultContent.EDIT_DATA_FAIL_RESULT_DESC);
		}
		return editResult;
	}

	@Override
	public PageResult<Map<String, Object>> querySysDateBaseTable(PageResult<Map<String, Object>> pageResult) {
		pageResult.setResultList(this.authCreatMapper.selectSysDateBaseTable(pageResult));
		pageResult.setTotalRecord(this.authCreatMapper.selectSysDateBaseTableCount(pageResult));
		return pageResult;
	}

	

}
