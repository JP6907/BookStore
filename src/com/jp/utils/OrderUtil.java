package com.jp.utils;

import java.util.UUID;

public class OrderUtil {

	public OrderUtil() {
		// TODO Auto-generated constructor stub
	}
	
	public static String createOrderId(){
		return UUID.randomUUID().toString().replace("-", "").toUpperCase();
	}
}
