package com.jp.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jp.po.Book;
import com.jp.po.OrderCustom;
import com.jp.po.User;
import com.jp.service.OrderService;

/**
 * 订单控制类
 * @ClassName:  OrderController   
 * @Description:TODO(Description)   
 * @author      ZJP
 * @date:2018年3月30日 上午11:51:04
 */
@Controller
@RequestMapping("/order")
public class OrderController {
	
	
	@Autowired
	@Qualifier("orderService")
	private OrderService orderService;
	
	public OrderController() {
		// TODO Auto-generated constructor stub
	}
	
	
	@RequestMapping("/toOrderList")
	private String toBookList(Model model,HttpSession session) throws Exception{
		
		System.out.println("获取订单列表");
	 	User user = (User)session.getAttribute("user");
	 	if(user!=null){
			List<OrderCustom> orderList = orderService.selectOrdersByUserid(user.getUserid()+"");  
			
	        model.addAttribute("orderList" , orderList);
	        
			return "shop/order/list";
	 	}else{
	 		return "login";
	 	}
	}
	
}
