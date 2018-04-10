package com.jp.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jp.po.User;

/**
 * @ClassName:  UserService   
 * @Description:TODO(用户管理类)   
 * @author      ZJP
 * @date:2018年3月27日 下午3:45:20
 */
public interface UserService {
	
	public User login(String loginname,String password) throws Exception;
	
	public boolean modifyPassword(String loginname,String newPassword) throws Exception;
	/**
	 * userid 为 null时获取全部用户
	 */
	public List<User> getUserList(Integer userid) throws Exception;
}
