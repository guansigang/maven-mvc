package com.guan.web.usercenter.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.guan.web.usercenter.model.UserAuthBean;
@Repository("userMapper")
public interface UserMapper {

	List<UserAuthBean> getUserByName(String userName);
	
	int userLogin(Map<String, Object> userLogin);

	List<Map<String, Object>> querySelectBoxOption(String dict_code);

}
