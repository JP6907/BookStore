package com.jp.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jp.po.OrderCustom;


public interface OrderMapperCustom {
    
	public OrderCustom selectByOrderid(String orderid) throws Exception;
	/**
	 * userid为空时获取全部数据
	 * @Description: TODO(这里用一句话描述这个方法的作用)   
	 * @param: @param userid
	 * @param: @return
	 * @param: @throws Exception      
	 * @return: List<OrderCustom>      
	 * @throws
	 */
	public List<OrderCustom> selectOrdersByUserid(@Param("userid")Integer userid) throws Exception;
	
	/**
	 * 获取用户收到的订单
	 * @Description: TODO(这里用一句话描述这个方法的作用)   
	 * @param: @param userid
	 * @param: @return
	 * @param: @throws Exception      
	 * @return: List<OrderCustom>      
	 * @throws
	 */
	public List<OrderCustom> selectOrdersReceiveByUserid(@Param("userid")Integer userid) throws Exception;

}