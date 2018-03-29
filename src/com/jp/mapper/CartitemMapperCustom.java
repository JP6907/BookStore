package com.jp.mapper;

import com.jp.po.CartDetails;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface CartitemMapperCustom {
    
	public List<CartDetails> getByUserId(@Param("userid")Integer userid) throws Exception;
}