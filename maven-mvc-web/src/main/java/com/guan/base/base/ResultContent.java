package com.guan.base.base;

public final class ResultContent {
	/**
	 * 数据重复
	 */
	public static final String EDIT_DATA_REPEAT_RESULT_CODE = "-2";
	
	public static final String EDIT_DATA_REPEAT_RESULT_DESC = "数据存在重复";
	/**
	 * 编辑出现错误
	 */
	public static final String EDIT_DATA_ERROR_RESULT_CODE = "-1";
	
	public static final String EDIT_DATA_ERROR_RESULT_DESC = "编辑数据错误";
	/**
	 * 编辑失败
	 */
	public static final String EDIT_DATA_FAIL_RESULT_CODE = "0";
	
	public static final String EDIT_DATA_FAIL_RESULT_DESC = "数据不存在";
	/**
	 * 编辑失败
	 */
	public static final String EDIT_DATA_SUCCESS_RESULT_CODE = "1";
	
	public static final String EDIT_DATA_SUCCESS_RESULT_DESC = "数据编辑成功";
	
	
	
	/**
	 * 登录返回结果编码（result_code）
	 */
	//登录成功
	public static final String LOGIN_SUCCESS_RESULT_CODE = "RC0100";
	
	public static final String LOGIN_SUCCESS_RESULT_DESC = "登录成功！";
	
	//用户名或者密码为空
	public static final String LOGIN_NULL_RESULT_CODE = "RC0101";
	
	public static final String LOGIN_NULL_RESULT_DESC = "用户名或者密码为空！";
	
	//登录成功但是无权限
	public static final String LOGIN_NO_AUTHORITY_RESULT_CODE = "RC0102";
	
	public static final String LOGIN_NO_AUTHORITY_RESULT_DESC = "没有权限！";
	
	//用户名或者密码错误
	public static final String LOGIN_FAIL_RESULT_CODE = "RC0103";
		
	public static final String LOGIN_FAIL_RESULT_DESC = "用户名或者密码错误";
	
	//系统错误
	public static final String LOGIN_ERROR_RESULT_CODE = "RC0104";
			
	public static final String LOGIN_ERROR_RESULT_DESC = "系统错误，请联系管理员";
	
	
	
	
	
	
	
}
