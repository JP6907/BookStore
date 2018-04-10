package com.jp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jp.mapper.UserMapperCustom;
import com.jp.po.User;
import com.jp.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService{
	
	@Autowired 
	UserMapperCustom userMapperCustom;

	public UserServiceImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public User login(String loginname, String password) throws Exception {
		// TODO Auto-generated method stub
		return userMapperCustom.selectByLoginnameAndPassword(loginname, password);
	}

	@Override
	public boolean modifyPassword(String loginname, String newPassword) throws Exception {
		// TODO Auto-generated method stub
		boolean flag = false;
		flag = userMapperCustom.updatePasswordByLoginname(loginname, newPassword);
		return flag;
	}
	
	@Override
	/**
	 * userid 为 null时获取全部用户
	 */
	public List<User> getUserList(Integer userid) throws Exception {
		// TODO Auto-generated method stub
		return userMapperCustom.getUserList(userid);
	}

}
