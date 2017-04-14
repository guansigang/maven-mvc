package com.guan.web.usercenter.model;

import java.io.Serializable;

public class UserAuthBean implements Serializable {

	private static final long serialVersionUID = 6325500465533878564L;
	
	/*
	 * 主键
	 */
	private String user_id;
	/*
	 * 登录名
	 */
	private String login_name;
	/*
	 * 登陆密码
	 */
	private String login_pwd;
	/*
	 * 关联信息ID
	 */
	private String user_info_id;
	/*
	 * 用户是否在用
	 */
	private String user_state;
	/*
	 * 用户状态
	 */
	private String user_status;
	/*
	 * 用户类型
	 */
	private String user_type;
	/*
	 * 用户等级
	 */
	private String user_level;
	/*
	 * 用户角色
	 */
	private String user_role;
	/*
	 * 用户职位
	 */
	private String user_position;
	/*
	 * 用户权限id
	 */
	private String security_id;
	/*
	 * 登录成功后首页
	 */
	private String module_index;
	/*
	 * 登录页面
	 */
	private String module_path;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getLogin_name() {
		return login_name;
	}
	public void setLogin_name(String login_name) {
		this.login_name = login_name;
	}
	public String getLogin_pwd() {
		return login_pwd;
	}
	public void setLogin_pwd(String login_pwd) {
		this.login_pwd = login_pwd;
	}
	public String getUser_info_id() {
		return user_info_id;
	}
	public void setUser_info_id(String user_info_id) {
		this.user_info_id = user_info_id;
	}
	public String getUser_state() {
		return user_state;
	}
	public void setUser_state(String user_state) {
		this.user_state = user_state;
	}
	public String getUser_status() {
		return user_status;
	}
	public void setUser_status(String user_status) {
		this.user_status = user_status;
	}
	public String getUser_type() {
		return user_type;
	}
	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}
	public String getUser_level() {
		return user_level;
	}
	public void setUser_level(String user_level) {
		this.user_level = user_level;
	}
	public String getUser_role() {
		return user_role;
	}
	public void setUser_role(String user_role) {
		this.user_role = user_role;
	}
	
	public String getUser_position() {
		return user_position;
	}
	public void setUser_position(String user_position) {
		this.user_position = user_position;
	}
	public String getSecurity_id() {
		return security_id;
	}
	public void setSecurity_id(String security_id) {
		this.security_id = security_id;
	}
	public String getModule_index() {
		return module_index;
	}
	public void setModule_index(String module_index) {
		this.module_index = module_index;
	}
	public String getModule_path() {
		return module_path;
	}
	public void setModule_path(String module_path) {
		this.module_path = module_path;
	}
	

	
	
	
}
