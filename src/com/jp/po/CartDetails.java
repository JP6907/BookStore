package com.jp.po;

public class CartDetails{
	int cartitemid;
	String lsbn;
	String name;
	String currprice;
	int num;
	String imageb;
	double total;  //总金额
	
	public CartDetails() {
		// TODO Auto-generated constructor stub
	}

	public int getCartitemid() {
		return cartitemid;
	}

	public void setCartitemid(int cartitemid) {
		this.cartitemid = cartitemid;
	}
	
	public String getLsbn() {
		return lsbn;
	}

	public void setLsbn(String lsbn) {
		this.lsbn = lsbn;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCurrprice() {
		return currprice;
	}

	public void setCurrprice(String currprice) {
		this.currprice = currprice;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getImageb() {
		return imageb;
	}

	public void setImageb(String imageb) {
		this.imageb = imageb;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	

}
