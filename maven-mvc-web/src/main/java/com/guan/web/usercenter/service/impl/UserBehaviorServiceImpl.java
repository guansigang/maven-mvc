package com.guan.web.usercenter.service.impl;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guan.web.usercenter.dao.UserMapper;
import com.guan.web.usercenter.model.UserAuthBean;
import com.guan.web.usercenter.service.UserService;

@Service("userBehaviorService")
public class UserBehaviorServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;
	
	/**
	 * 查询登录用户的权限信息
	 */
	@Override
	public UserAuthBean getUserByName(String userName) throws Exception {
		
		List<UserAuthBean> list = userMapper.getUserByName(userName);
		if (list != null && !list.isEmpty()) {
			return list.get(0);
		}
		return null;
	}
	
	/**
	 * 添加登录日志
	 */
	public int userLogin(String loginId,String userId,String userIp,String loginTime) throws Exception{
		Map<String, Object> loginLog = new HashMap<String, Object>(); 
		loginLog.put("login_id", loginId);
		loginLog.put("user_id", userId);
		loginLog.put("login_ip", userIp);
		loginLog.put("login_time", loginTime);
		
		int num = userMapper.userLogin(loginLog);
		return num;
	}
	
	/*
	@Override
	public UserBean getUserByCondition(String userName, String userPass) throws Exception {
		List<UserBean> list = userMapper.getUserByCondition(userName, userPass);
		if (list != null && !list.isEmpty()) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public int save(String userName,String userPass,int userLevel) throws Exception{
		UserBean user=getUserByName(userName);
		if(user!=null){
			return 0;
		}
		
		UserBean userBean= new UserBean();
		
		
		String fKey = "4a"; 必需的密钥 
		String sKey = "anquan";  
		String tKey = "jiami";
		
		String md5UserPass=Encrypt.strEncode(userPass,fKey, sKey, tKey);
		userBean.setUserName(userName);
		userBean.setUserPass(md5UserPass);
		userBean.setUserState(1);
		userBean.setUserLevel(userLevel);
		int num=userMapper.save(userBean);
		
		
		return num;
	}

	@Override
	public List<UserBean> getAll() throws Exception {
		List<UserBean> list = userMapper.getAll();
		if (list != null && !list.isEmpty()) {
			return list;
		}
		return null;
	}

	@Override
	public PageResult<UserBean> getUsers(PageResult<UserBean> pageResult) throws Exception {
		pageResult.setResultList(this.userMapper.getUsers(pageResult));
		pageResult.setTotalRecord(this.userMapper.getUserCount());
		return pageResult;
	}

	@Override
	public UserBean getUserByPassword(String password) throws Exception {
		String fKey = "4a"; 必需的密钥 
		String sKey = "anquan";  
		String tKey = "jiami";
		
		String md5UserPass=Encrypt.strEncode(password,fKey, sKey, tKey);
		List<UserBean> list = userMapper.getUserByPassWord(md5UserPass);
		if (list != null && !list.isEmpty()) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public int updatePassword(String userName,String password,String new_password) throws Exception {
		String fKey = "4a"; 必需的密钥 
		String sKey = "anquan";  
		String tKey = "jiami";
		
		String oldPass=Encrypt.strEncode(password,fKey,sKey,tKey);
		UserBean user=getUserByCondition(userName, oldPass);
		
		if(user==null){
			return 0;
		}
		
		UserBean userBean= new UserBean();
		String md5UserPass=Encrypt.strEncode(new_password,fKey, sKey, tKey);
		userBean.setUserName(userName);
		userBean.setUserPass(md5UserPass);
		userMapper.updatePassword(userBean);
		
		return 1;
	}
    
	
	public int updateExitTime(String loginId,String exitTime) throws Exception{
		UserInfo userInfo = new UserInfo();
		
		userInfo.setExit_time(exitTime);
		userInfo.setLogin_id(loginId);
		userMapper.updateExitTime(userInfo);
		return 1;
	}
	
	@Override
	public PageResult<UserInfo> getUserLogin(PageResult<UserInfo> pageResult) throws Exception {
		pageResult.setResultList(this.userMapper.getUserLogin(pageResult));
		pageResult.setTotalRecord(this.userMapper.getUserLoginCount(pageResult));
		return pageResult;
	}

//	@Override
//	public List<UserInfo> getLoginAll() throws Exception {
//		List<UserInfo> list = userMapper.getLoginAll();
//		if (list != null && !list.isEmpty()) {
//			return list;
//		}
//		return null;
//	}

	@Override
	public UserShiro getShiroUser(int key) throws Exception {
		UserShiro userShiro = userMapper.getShiroUser(key);
		if (userShiro != null) {
			return userShiro;
		}
		return new UserShiro();
	}*/
}

