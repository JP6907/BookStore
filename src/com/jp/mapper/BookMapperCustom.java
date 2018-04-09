package com.jp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jp.po.Book;
import com.jp.po.BookCustom;
import com.jp.po.User;

public interface BookMapperCustom {
 
	List<BookCustom> getBookListLimit(@Param("identity")String identity,
									@Param("userid")Integer userid,
									@Param("startNum")Integer startNum,
									@Param("num")Integer num) throws Exception;

	//获取书的总数量
	int getBookTotalCount(@Param("identity")String identity,
							@Param("userid")Integer userid) throws Exception;
	//根据lsbn编号，书名，或类型搜索
	List<BookCustom> queryBookList(@Param("value")String lsbn_name_type) throws Exception;
	
	Book selectByOrderid(@Param("orderid")String orderid) throws Exception;
}