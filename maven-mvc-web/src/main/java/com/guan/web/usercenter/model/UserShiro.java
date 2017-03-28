package com.guan.web.usercenter.model;

import java.util.Date;

public class UserShiro {
	private int shiro_id;
	private int key;
	private String value;
	private int status;
	private String create_user;
	private Date create_time;

	public int getShiro_id() {
		return shiro_id;
	}

	public void setShiro_id(int shiro_id) {
		this.shiro_id = shiro_id;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getCreate_user() {
		return create_user;
	}

	public void setCreate_user(String create_user) {
		this.create_user = create_user;
	}

	public Date getCreate_time() {
		return create_time;
	}

	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}

	public int getKey() {
		return key;
	}

	public void setKey(int key) {
		this.key = key;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}
    
	public UserShiro() {
		super();

	}

	public UserShiro(int shiro_id, int key, String value, int status, String create_user, Date create_time) {
		super();
		this.shiro_id = shiro_id;
		this.key = key;
		this.value = value;
		this.status = status;
		this.create_user = create_user;
		this.create_time = create_time;
	}
}
