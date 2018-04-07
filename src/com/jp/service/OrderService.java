package com.jp.service;

import java.util.List;

import com.jp.po.CartDetails;
import com.jp.po.OrderCustom;
import com.jp.po.Orderitem;
import com.jp.po.Orders;

public interface OrderService {
	
	public OrderCustom selectByOrderid(String orderid) throws Exception;
	
	public List<OrderCustom> selectOrdersByUserid(String orderid) throws Exception;
	
	public void createNewOrder(Orders order,List<CartDetails> cartDetailslist) throws Exception;
}
