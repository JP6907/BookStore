package com.jp.mapper;

import org.apache.ibatis.annotations.Param;

import com.jp.po.User;

public interface UserMapperCustom {
    
	public User selectByLoginnameAndPassword(@Param("loginname")String loginname,
											@Param("password")String password) throws Exception;
}