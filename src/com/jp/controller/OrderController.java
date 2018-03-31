package com.jp.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jp.po.Book;
import com.jp.po.BookCustom;
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
	
	/**
	 * 获取订单列表
	 * @Description: TODO(这里用一句话描述这个方法的作用)   
	 * @param: @param model
	 * @param: @param session
	 * @param: @return
	 * @param: @throws Exception      
	 * @return: String      
	 * @throws
	 */
	@RequestMapping("/toOrderList")
	private String toOrderList(Model model,HttpSession session) throws Exception{
		
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
	
	@RequestMapping("/getOrderItems")
	private String getOrderItems(Model model,@Param("orderid")String orderid) throws Exception{
		
		System.out.println("获取订单详情");
	 	
		OrderCustom order = orderService.selectByOrderid(orderid);  
		
		List<BookCustom> bookList = order.getBookList();
		for(BookCustom book:bookList){
			System.out.println(book.getNum());
		}
			
	    model.addAttribute("order" , order);
	        
	    return "shop/order/desc";
	}
	
}
