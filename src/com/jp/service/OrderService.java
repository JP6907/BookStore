package com.jp.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jp.po.CartDetails;
import com.jp.po.OrderCustom;
import com.jp.po.Orderitem;
import com.jp.po.Orders;
import com.jp.po.User;

public interface OrderService {
	
	public OrderCustom selectByOrderid(String orderid) throws Exception;
	
	public List<OrderCustom> selectOrdersByUser(User user) throws Exception;
	
	public void createNewOrder(Orders order,List<CartDetails> cartDetailslist) throws Exception;
	
	public List<OrderCustom> selectOrdersReceiveByUserid(Integer userid) throws Exception;
}
