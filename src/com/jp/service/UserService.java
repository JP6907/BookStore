package com.jp.service;

import com.jp.po.User;

/**
 * @ClassName:  UserService   
 * @Description:TODO(用户管理类)   
 * @author      ZJP
 * @date:2018年3月27日 下午3:45:20
 */
public interface UserService {
	
	public User login(String loginname,String password) throws Exception;
}
