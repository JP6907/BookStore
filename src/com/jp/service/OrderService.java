package com.jp.service;

import java.util.List;

import com.jp.po.OrderCustom;

public interface OrderService {
	
	public OrderCustom selectByOrderid(String orderid) throws Exception;
	
	public List<OrderCustom> selectOrdersByUserid(String orderid) throws Exception;
}
