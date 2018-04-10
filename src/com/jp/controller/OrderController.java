package com.jp.controller;

import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.jp.po.BookCustom;
import com.jp.po.CartDetails;
import com.jp.po.OrderCustom;
import com.jp.po.Orders;
import com.jp.po.User;
import com.jp.service.CartItemService;
import com.jp.service.OrderService;
import com.jp.utils.OrderUtil;

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
	
	@Autowired
	@Qualifier("cartitemService")
	private CartItemService cartItemService;
	
	public OrderController() {
		// TODO Auto-generated constructor stub
	}
	
	/**
	 * 前台获取订单列表
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
		
		System.out.println("前台获取订单列表");
	 	User user = (User)session.getAttribute("user");
	 	if(user!=null){
			List<OrderCustom> orderList = orderService.selectOrdersByUser(user);  
			
	        model.addAttribute("orderList" , orderList);
	        
			return "shop/order/list";
	 	}else{
	 		return "login";
	 	}
	}
	/**
	 * 获取订单详情
	 * @Description: TODO(这里用一句话描述这个方法的作用)   
	 * @param: @param model
	 * @param: @param orderid
	 * @param: @return
	 * @param: @throws Exception      
	 * @return: String      
	 * @throws
	 */
	@RequestMapping("/getOrderItems")
	private String getOrderItems(Model model,@Param("orderid")String orderid) throws Exception{
		
		System.out.println("前台获取订单详情");
	 	
		OrderCustom order = orderService.selectByOrderid(orderid);  
		
		List<BookCustom> bookList = order.getBookList();
		for(BookCustom book:bookList){
			System.out.println(book.getNum());
		}
			
	    model.addAttribute("order" , order);
	        
	    return "shop/order/desc";
	}
	/**
	 * 购物车勾选商品创建新订单
	 * @Description: TODO(这里用一句话描述这个方法的作用)   
	 * @param: @param model
	 * @param: @param request
	 * @param: @return
	 * @param: @throws Exception      
	 * @return: String      
	 * @throws
	 */
	@RequestMapping("/createNewOrder")
	private String createNewOrder(Model model,HttpServletRequest request) throws Exception{
		
		System.out.println("创建新订单");
		String[] cartitemid = request.getParameterValues("cartitemid");
	 	
		if(cartitemid!=null){
			
			System.out.println(cartitemid.length);
			
			List<CartDetails> itemList = cartItemService.getCartItemByCartitemid(cartitemid);
			
			System.out.println(itemList.size());
			
			model.addAttribute("itemList",itemList);
			
	        
			return "shop/order/createOrder";
		}else{
			System.out.println("cartitemid is null");
		}
	        
	    return "shop/cart/list";
	}
	/**
	 * 创建订单提交
	 * @Description: TODO(这里用一句话描述这个方法的作用)   
	 * @param: @param model
	 * @param: @param session
	 * @param: @param map
	 * @param: @param request
	 * @param: @param pw
	 * @param: @throws Exception      
	 * @return: void      
	 * @throws
	 */
	@RequestMapping(value="/createNewOrderSubmit",
			method = RequestMethod.POST, consumes = "application/json")
	@ResponseBody
	private void createNewOrderSubmit(Model model,HttpSession session,
			@RequestBody Map<String,Object> map,HttpServletRequest request,
			PrintWriter pw) throws Exception{
		
		System.out.println("创建新订单提交");
		boolean flag = false;
		User user = (User)session.getAttribute("user");
		if(user!=null){
			System.out.println("total:" + map.get("total"));
			System.out.println("address:" + map.get("address"));
			System.out.println("itemlist:" + map.get("itemlist"));
			List<CartDetails> cartDetailslist = JSON.parseArray(map.get("itemlist").toString(), CartDetails.class);
			Orders order = new Orders();
			order.setOrderid(OrderUtil.createOrderId());
			order.setOrdertime(new Date());
			order.setUserid(user.getUserid());
			order.setUsername(user.getUsername());
			order.setStatus("未付款");
			order.setAddress(map.get("address").toString());
			order.setTotal(Double.parseDouble(map.get("total").toString()));
			orderService.createNewOrder(order, cartDetailslist);
			flag = true;
		}
		Map<String,Object> mapout=new HashMap<String,Object>();
		mapout.put("flag" , flag);
        ObjectMapper om=new ObjectMapper();
        try{
            String jsonString =om.writeValueAsString(mapout);
            pw.write(jsonString);
            pw.flush();
            pw.close();
        }catch(JsonProcessingException e){
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
	}
	
	//前台部分
	/////**************************************////////
	//后台部分
	
	/**
	 * 前台获取订单列表
	 * @Description: TODO(这里用一句话描述这个方法的作用)   
	 * @param: @param model
	 * @param: @param session
	 * @param: @return
	 * @param: @throws Exception      
	 * @return: String      
	 * @throws
	 */
	@RequestMapping("/toOrderListInback")
	private String toOrderListInback(Model model,HttpSession session) throws Exception{
		
		System.out.println("后台获取订单列表");
	 	User user = (User)session.getAttribute("admin");
	 	if(user!=null){
			List<OrderCustom> orderList = orderService.selectOrdersByUser(user);  
			
			model.addAttribute("identity" , user.getIdentity());
	        model.addAttribute("orderList" , orderList);
	        
			return "back/order/order_list";
	 	}else{
	 		return "login";
	 	}
	}
	/**
	 * 用户收到的订单
	 * @Description: TODO(这里用一句话描述这个方法的作用)   
	 * @param: @param model
	 * @param: @param session
	 * @param: @return
	 * @param: @throws Exception      
	 * @return: String      
	 * @throws
	 */
	@RequestMapping("/toOrderReceiveListInback")
	private String toOrderReceiveListInback(Model model,HttpSession session) throws Exception{
		
		System.out.println("后台获取用户收到的订单列表");
	 	User user = (User)session.getAttribute("admin");
	 	if(user!=null){
			List<OrderCustom> orderList = orderService.selectOrdersReceiveByUserid(user.getUserid());
			
			model.addAttribute("identity" , user.getIdentity());
	        model.addAttribute("orderList" , orderList);
	        
			return "back/order/order_list";
	 	}else{
	 		return "login";
	 	}
	}
}
