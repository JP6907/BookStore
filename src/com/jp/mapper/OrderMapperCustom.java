package com.jp.mapper;


import java.util.List;

import com.jp.po.OrderCustom;


public interface OrderMapperCustom {
    
	public OrderCustom selectByOrderid(String orderid) throws Exception;
	
	public List<OrderCustom> selectOrdersByUserid(String userid) throws Exception;

}