package com.jp.service;

import java.util.List;

import com.jp.po.CartDetails;
import com.jp.po.Cartitem;

public interface CartItemService {
	
	public List<CartDetails> getCartItemByUserId(Integer userid) throws Exception;
	
	public void addToCart(String lsbn,int userid,int num) throws Exception;
	
	public void deleteCartitemByCartitemid(Integer cartitemid) throws Exception;
	
	public void batchDeleteCartitem(String cartitemids) throws Exception;
}
