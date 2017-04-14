package com.guan.web.usercenter.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guan.base.base.EditResult;
import com.guan.base.base.PageResult;
import com.guan.base.base.ResultContent;
import com.guan.web.usercenter.controller.UserCenterController;
import com.guan.web.usercenter.dao.UserCenterMapper;
import com.guan.web.usercenter.service.UserCenterService;

@Service("UserCenterService")
public class UserCenterServiceImpl implements UserCenterService {

	@Autowired
	private UserCenterMapper userCenterMapper;

	private static Logger logger = Logger.getLogger(UserCenterController.class);

	/**
	 * 查询管理员信息
	 */
	@Override
	public PageResult<Map<String, Object>> queryUserInfo(PageResult<Map<String, Object>> pageResult) throws Exception {
		pageResult.setResultList(this.userCenterMapper.selectUserManagers(pageResult));
		pageResult.setTotalRecord(this.userCenterMapper.selectUserManagersCount(pageResult));
		return pageResult;
	}

	@Override
	public EditResult addSysShiroUser(Map<String, String> params) throws Exception {
		EditResult editResult = new EditResult();
		int resultNum = userCenterMapper.addSysShiroUser(params);
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
	public EditResult updateSysShiroUser(Map<String, String> params) {
		EditResult editResult = new EditResult();

		int resultNum = userCenterMapper.updateSysShiroUser(params);
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

	/**
	 * 数据字典报表管理查询数据字典主表
	 */
	@Override
	public PageResult<Map<String, Object>> querySysBaseDict(PageResult<Map<String, Object>> pageResult) throws Exception {
		pageResult.setResultList(this.userCenterMapper.selectSysBaseDict(pageResult));
		pageResult.setTotalRecord(this.userCenterMapper.selectSysBaseDictCount(pageResult));
		return pageResult;
	}

	/**
	 * 数据字典报表管理查询数据字典从表
	 */
	@Override
	public PageResult<Map<String, Object>> querySysBaseDictItem(PageResult<Map<String, Object>> pageResult) throws Exception {
		pageResult.setResultList(this.userCenterMapper.selectSysBaseDictItem(pageResult));
		pageResult.setTotalRecord(this.userCenterMapper.selectSysBaseDictItemCount(pageResult));
		return pageResult;
	}

	/**
	 * 数据字典报表管理查询数据字典从表
	 */
	@Override
	public EditResult addSysBaseDictItem(Map<String, String> params) throws Exception {
		PageResult<Map<String, Object>> pageResult = new PageResult<Map<String, Object>>();
		EditResult editResult = new EditResult();
		pageResult.setParameters(params);
		// 查询数据库中是否已存在相应dict_code
		List<Map<String, Object>> resultList = this.userCenterMapper.selectSysBaseDictItem(pageResult);
		if (resultList.size() != 0) {
			editResult.setResultCode(ResultContent.EDIT_DATA_REPEAT_RESULT_CODE);
			editResult.setResultDesc(ResultContent.EDIT_DATA_REPEAT_RESULT_DESC);
			logger.info(ResultContent.EDIT_DATA_REPEAT_RESULT_DESC);
			return editResult;
		} else {
			String dict_code = params.get("dict_code");
			String item_code = params.get("item_code");
			if (dict_code == null || dict_code == "") {
				editResult.setResultCode(ResultContent.EDIT_DATA_FAIL_RESULT_CODE);
				editResult.setResultDesc("主字典标示编码为空！");
				return editResult;
			}
			if (item_code == null || item_code == "") {
				editResult.setResultCode(ResultContent.EDIT_DATA_FAIL_RESULT_CODE);
				editResult.setResultDesc("从字典标示编码为空！");
				return editResult;
			}

			int resultNum = userCenterMapper.addSysBaseDictItem(params);
			if (resultNum == 1) {
				// 添加成功
				editResult.setResultCode(ResultContent.EDIT_DATA_SUCCESS_RESULT_CODE);
				editResult.setResultDesc(ResultContent.EDIT_DATA_SUCCESS_RESULT_DESC);
			} else {
				// 添加失败
				editResult.setResultCode(ResultContent.EDIT_DATA_FAIL_RESULT_CODE);
				editResult.setResultDesc(ResultContent.EDIT_DATA_FAIL_RESULT_DESC);
				logger.info(ResultContent.EDIT_DATA_FAIL_RESULT_DESC);
			}
			return editResult;
		}
	}

	/**
	 * 数据字典报表管理查询数据字典从表
	 */
	@Override
	public EditResult updateSysBaseDictItem(Map<String, String> params) throws Exception {
		EditResult editResult = new EditResult();

		int resultNum = userCenterMapper.updateSysBaseDictItem(params);
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

	/**
	 * 数据字典报表管理查询数据字典主表
	 */
	@Override
	public EditResult updateSysBaseDict(Map<String, String> params) throws Exception {
		EditResult editResult = new EditResult();

		int resultNum = userCenterMapper.updateSysBaseDict(params);
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

	/**
	 * 数据字典报表管理添加数据字典主表
	 */
	@Override
	public EditResult addSysBaseDict(Map<String, String> params) throws Exception {
		PageResult<Map<String, Object>> pageResult = new PageResult<Map<String, Object>>();
		EditResult editResult = new EditResult();
		pageResult.setParameters(params);
		// 查询数据库中是否已存在相应dict_code
		List<Map<String, Object>> resultList = this.userCenterMapper.selectSysBaseDict(pageResult);
		if (resultList.size() != 0) {
			editResult.setResultCode(ResultContent.EDIT_DATA_REPEAT_RESULT_CODE);
			editResult.setResultDesc(ResultContent.EDIT_DATA_REPEAT_RESULT_DESC);
			return editResult;
		} else {
			String dict_code = params.get("dict_code");
			if (dict_code == null || dict_code == "") {
				editResult.setResultCode(ResultContent.EDIT_DATA_FAIL_RESULT_CODE);
				editResult.setResultDesc("主字典标示编码为空！");
				return editResult;
			}

			int resultNum = userCenterMapper.addSysBaseDict(params);
			if (resultNum == 1) {
				// 添加成功
				editResult.setResultCode(ResultContent.EDIT_DATA_SUCCESS_RESULT_CODE);
				editResult.setResultDesc(ResultContent.EDIT_DATA_SUCCESS_RESULT_DESC);
			} else {
				// 添加失败
				editResult.setResultCode(ResultContent.EDIT_DATA_FAIL_RESULT_CODE);
				editResult.setResultDesc(ResultContent.EDIT_DATA_FAIL_RESULT_DESC);
			}
			return editResult;
		}
	}

	@Override
	public List<Map<String, Object>> querySelectBoxBaseDict(String dict_name) throws Exception {
		List<Map<String, Object>> result_list = userCenterMapper.querySelectBoxBaseDict(dict_name);
		return result_list;
	}

	@Override
	public EditResult deleteSysBaseDict(Map<String, String> params) throws Exception {
		EditResult editResult = new EditResult();
		int resultNum = userCenterMapper.deleteSysBaseDict(params);
		if (resultNum == 1) {
			// 删除成功
			editResult.setResultCode(ResultContent.EDIT_DATA_SUCCESS_RESULT_CODE);
			editResult.setResultDesc(ResultContent.EDIT_DATA_SUCCESS_RESULT_DESC);
		} else {
			// 删除失败
			editResult.setResultCode(ResultContent.EDIT_DATA_FAIL_RESULT_CODE);
			editResult.setResultDesc(ResultContent.EDIT_DATA_FAIL_RESULT_DESC);
		}
		return editResult;
	}

	@Override
	public EditResult deleteSysBaseDictItem(Map<String, String> params) throws Exception {
		EditResult editResult = new EditResult();
		int resultNum = userCenterMapper.deleteSysBaseDictItem(params);
		if (resultNum == 1) {
			// 删除成功
			editResult.setResultCode(ResultContent.EDIT_DATA_SUCCESS_RESULT_CODE);
			editResult.setResultDesc(ResultContent.EDIT_DATA_SUCCESS_RESULT_DESC);
		} else {
			// 删除失败
			editResult.setResultCode(ResultContent.EDIT_DATA_FAIL_RESULT_CODE);
			editResult.setResultDesc(ResultContent.EDIT_DATA_FAIL_RESULT_DESC);
		}
		return editResult;
	}

	@Override
	public PageResult<Map<String, Object>> querySysBaseModule(PageResult<Map<String, Object>> pageResult) throws Exception {
		pageResult.setResultList(this.userCenterMapper.selectSysBaseModule(pageResult));
		pageResult.setTotalRecord(this.userCenterMapper.selectSysBaseModuleCount(pageResult));
		return pageResult;
	}

	@Override
	public EditResult deleteSysBaseModule(Map<String, String> params) throws Exception {
		EditResult editResult = new EditResult();
		int resultNum = userCenterMapper.deleteSysBaseModule(params);
		if (resultNum == 1) {
			// 删除成功
			editResult.setResultCode(ResultContent.EDIT_DATA_SUCCESS_RESULT_CODE);
			editResult.setResultDesc(ResultContent.EDIT_DATA_SUCCESS_RESULT_DESC);
		} else {
			// 删除失败
			editResult.setResultCode(ResultContent.EDIT_DATA_FAIL_RESULT_CODE);
			editResult.setResultDesc(ResultContent.EDIT_DATA_FAIL_RESULT_DESC);
		}
		return editResult;
	}

	@Override
	public EditResult addSysBaseModule(Map<String, String> params) throws Exception {
		EditResult editResult = new EditResult();
		int resultNum = userCenterMapper.addSysBaseModule(params);
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
	public EditResult updateSysBaseModule(Map<String, String> params) throws Exception {
		EditResult editResult = new EditResult();
		int resultNum = userCenterMapper.updateSysBaseModule(params);
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
	public EditResult updateSysBaseSecurity(Map<String, String> params) throws Exception {
		EditResult editResult = new EditResult();
		int resultNum = userCenterMapper.updateSysBaseSecurity(params);
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
	public EditResult addSysBaseSecurity(Map<String, String> params) throws Exception {
		EditResult editResult = new EditResult();
		int resultNum = userCenterMapper.addSysBaseSecurity(params);
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
	public EditResult deleteSysBaseSecurity(Map<String, String> params) throws Exception {
		EditResult editResult = new EditResult();
		int resultNum = userCenterMapper.deleteSysBaseSecurity(params);
		if (resultNum == 1) {
			// 删除成功
			editResult.setResultCode(ResultContent.EDIT_DATA_SUCCESS_RESULT_CODE);
			editResult.setResultDesc(ResultContent.EDIT_DATA_SUCCESS_RESULT_DESC);
		} else {
			// 删除失败
			editResult.setResultCode(ResultContent.EDIT_DATA_FAIL_RESULT_CODE);
			editResult.setResultDesc(ResultContent.EDIT_DATA_FAIL_RESULT_DESC);
		}
		return editResult;
	}

	@Override
	public PageResult<Map<String, Object>> querySysBaseSecurity(PageResult<Map<String, Object>> pageResult) throws Exception {
		pageResult.setResultList(this.userCenterMapper.selectSysBaseSecurity(pageResult));
		pageResult.setTotalRecord(this.userCenterMapper.selectSysBaseSecurityCount(pageResult));
		return pageResult;
	}

	@Override
	public PageResult<Map<String, Object>> querySysBaseShiro(PageResult<Map<String, Object>> pageResult) throws Exception {
		pageResult.setResultList(this.userCenterMapper.selectSysBaseShiro(pageResult));
		pageResult.setTotalRecord(this.userCenterMapper.selectSysBaseShiroCount(pageResult));
		return pageResult;
	}

	@Override
	public EditResult deleteSysBaseShiro(Map<String, String> params) throws Exception {
		EditResult editResult = new EditResult();
		int resultNum = userCenterMapper.deleteSysBaseShiro(params);
		if (resultNum == 1) {
			// 删除成功
			editResult.setResultCode(ResultContent.EDIT_DATA_SUCCESS_RESULT_CODE);
			editResult.setResultDesc(ResultContent.EDIT_DATA_SUCCESS_RESULT_DESC);
		} else {
			// 删除失败
			editResult.setResultCode(ResultContent.EDIT_DATA_FAIL_RESULT_CODE);
			editResult.setResultDesc(ResultContent.EDIT_DATA_FAIL_RESULT_DESC);
		}
		return editResult;
	}

	@Override
	public EditResult updateSysBaseShiro(Map<String, String> params) throws Exception {
		EditResult editResult = new EditResult();
		int resultNum = userCenterMapper.updateSysBaseShiro(params);
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
	public EditResult addSysBaseShiro(Map<String, String> params) throws Exception {
		EditResult editResult = new EditResult();
		int resultNum = userCenterMapper.addSysBaseShiro(params);
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

}
