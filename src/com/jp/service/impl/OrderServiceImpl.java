package com.jp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jp.mapper.OrderMapperCustom;
import com.jp.po.OrderCustom;
import com.jp.service.OrderService;


@Service("orderService")
public class OrderServiceImpl implements OrderService {

	@Autowired
	OrderMapperCustom orderMapperCustom;
	
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

}
