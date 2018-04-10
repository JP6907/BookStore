package com.jp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jp.po.User;

public interface UserMapperCustom {
    
	public User selectByLoginnameAndPassword(@Param("loginname")String loginname,
											@Param("password")String password) throws Exception;
	
	public boolean updatePasswordByLoginname(@Param("loginname")String loginname,
											@Param("newPassword")String newPassword) throws Exception;
	
	public List<User> getUserList(@Param("userid")Integer userid) throws Exception;
}