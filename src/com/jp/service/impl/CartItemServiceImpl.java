package com.jp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jp.mapper.CartitemMapper;
import com.jp.mapper.CartitemMapperCustom;
import com.jp.po.CartDetails;
import com.jp.po.Cartitem;
import com.jp.service.CartItemService;

@Service("cartitemService")
public class CartItemServiceImpl implements CartItemService{
	
	@Autowired
	CartitemMapperCustom cartitemMapperCustom;
	@Autowired
	CartitemMapper cartitemMapper;
	public CartItemServiceImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public List<CartDetails> getCartItemByUserId(Integer userid) throws Exception {
		// TODO Auto-generated method stub
		return cartitemMapperCustom.getByUserId(userid);
	}

	@Override
	public void addToCart(String lsbn, int userid, int num) throws Exception {
		Cartitem cartitem = new Cartitem();
		cartitem.setLsbn(lsbn);
		cartitem.setUserid(userid);
		cartitem.setNum(num);
		cartitemMapper.insertSelective(cartitem);
	}

	@Override
	public void deleteCartitemByCartitemid(Integer cartitemid) throws Exception {
		cartitemMapper.deleteByPrimaryKey(cartitemid);
	}

	@Override
	public void batchDeleteCartitem(String cartitemids) throws Exception {
		String[] ids = cartitemids.split(",");
		for(String id:ids)
			deleteCartitemByCartitemid(Integer.parseInt(id));
	}

}
