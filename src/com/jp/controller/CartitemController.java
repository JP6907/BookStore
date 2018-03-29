package com.jp.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import com.jp.po.CartDetails;
import com.jp.po.User;
import com.jp.service.CartItemService;

@Controller
@RequestMapping(value="/cartitem")
public class CartitemController {
	
	@Autowired
	@Qualifier("cartitemService")
	private CartItemService cartItemService;

	/**
	 * 购物车
	 * @throws Exception 
	 * */
	@RequestMapping(value="/getCartitem")
	 public String getCartitem(Model model,HttpSession session) throws Exception{
		
		System.out.println("获取购物车信息......");
		User user = (User)session.getAttribute("user");
		if(user!=null){
			System.out.println(user.getUserid());
			Integer userid = user.getUserid();
			List<CartDetails> itemList = cartItemService.getCartItemByUserId(userid);
			
			model.addAttribute("itemList",itemList);
		}
		
		return "shop/cart/list";
	}
	
	@RequestMapping(value="/addToCart")
	public String addToCart(Model model,@Param("lsbn")String lsbn,
				@Param("num")Integer num,HttpSession session) throws Exception{
		System.out.println("加入购物车");
		User user = (User)session.getAttribute("user");
		if(user!=null){
			int userid = user.getUserid();
			System.out.println(lsbn+","+userid+","+num);
			cartItemService.addToCart(lsbn, userid, num);
		}
		return "forward:/cartitem/getCartitem";
	} 
	
	@RequestMapping(value="deleteCartitem")
	public String deleteCartitem(Model model,@Param("cartitemid")Integer cartitemid) throws Exception{
		System.out.println("删除购物车商品");
		System.out.println("cartitemid:" + cartitemid);
		cartItemService.deleteCartitemByCartitemid(cartitemid);
		
		return "forward:/cartitem/getCartitem";
	}
	
	@RequestMapping(value="batchDeleteCartitem")
	public String batchDeleteCartitem(Model model,@Param("cartitemids")String cartitemids) throws Exception{
		System.out.println("批量删除购物车商品");
		System.out.println("cartitemids:" + cartitemids);
		cartItemService.batchDeleteCartitem(cartitemids);
		return "forward:/cartitem/getCartitem";
	}
}
