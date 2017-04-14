package com.guan.web.usercenter.service;

import java.util.List;
import java.util.Map;

import com.guan.web.usercenter.model.UserAuthBean;

public interface UserService {

	UserAuthBean getUserByName(String userName) throws Exception;
	
	int userLogin(String loginId,String userId,String userIp,String loginTime) throws Exception;

	List<Map<String, Object>> querySelectBoxOption(String dict_code) throws Exception;

	void updateExitTime(String loginId) throws Exception;
	
	/*UserBean getUserByCondition(String userName, String userPass) throws Exception;
	
	int save(String userName,String userPass,int userLevel) throws Exception;
	
	List<UserBean> getAll() throws Exception;

	UserBean getUserByPassword(String password) throws Exception;
	
	int updatePassword(String userName,String password,String new_password)throws Exception;
	
    

    UserShiro getShiroUser(int key) throws Exception;*/
}
