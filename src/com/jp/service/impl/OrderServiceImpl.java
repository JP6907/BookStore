package com.jp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jp.mapper.OrderMapperCustom;
import com.jp.mapper.OrderitemMapper;
import com.jp.mapper.OrdersMapper;
import com.jp.po.CartDetails;
import com.jp.po.OrderCustom;
import com.jp.po.Orderitem;
import com.jp.po.Orders;
import com.jp.service.OrderService;


@Service("orderService")
public class OrderServiceImpl implements OrderService {

	@Autowired
	OrderMapperCustom orderMapperCustom;
	
	@Autowired
	OrdersMapper orderMapper;
	
	@Autowired
	OrderitemMapper orderitemMapper;
	
	public OrderServiceImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public OrderCustom selectByOrderid(String orderid) throws Exception {
		// TODO Auto-generated method stub
		return orderMapperCustom.selectByOrderid(orderid);
	}

	@Override
	public List<OrderCustom> selectOrdersByUserid(String userid) throws Exception {
		// TODO Auto-generated method stub
		return orderMapperCustom.selectOrdersByUserid(userid);
	}

	@Override
	public void createNewOrder(Orders order, List<CartDetails> cartDetailslist) throws Exception {
		orderMapper.insertSelective(order);
		for(CartDetails cartDetails:cartDetailslist){
			Orderitem item = new Orderitem();
			item.setOrderid(order.getOrderid());
			item.setLsbn(cartDetails.getLsbn());
			item.setNum(cartDetails.getNum());
			orderitemMapper.insert(item);
		}
	}

}
