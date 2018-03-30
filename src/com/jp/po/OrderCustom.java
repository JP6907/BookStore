package com.jp.po;

import java.util.List;

public class OrderCustom extends Orders {
	
	private List<Book> bookList;
	
	public OrderCustom() {
		// TODO Auto-generated constructor stub
	}

	public List<Book> getBookList() {
		return bookList;
	}

	public void setBookList(List<Book> bookList) {
		this.bookList = bookList;
	}
	

}
