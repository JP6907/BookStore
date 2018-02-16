package com.jp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jp.mapper.TypeMapperCustom;
import com.jp.po.TypeCustom;
import com.jp.service.TypeService;
import com.jp.utils.PageUtil;

@Service("typeService")
public class TypeServiceImpl implements TypeService {

	@Autowired
	private TypeMapperCustom typeMapperCustom;
	
	@Override
	public List<TypeCustom> getTypeList(String name, String descripton) throws Exception {
		
		return typeMapperCustom.getTypeList(name, descripton);
	}

	@Override
	public List<TypeCustom> getTypeListByPage(Integer pageNum, Integer numPerPage) throws Exception {
		//根据页号和每页数量计算起始点
		int startNum = numPerPage*(pageNum-1);
		return typeMapperCustom.getTypeListLimit(startNum, numPerPage);
	}

	@Override
	public int getTypeTotalCount() throws Exception {
		
		return typeMapperCustom.getTypeTotalCount();
	}

	@Override
	public int getTypePagetotalNum() throws Exception {
		
		 int total = this.getTypeTotalCount();
		 if(total%PageUtil.NumPerPageInBack==0){
			 return total/PageUtil.NumPerPageInBack; 
		 }else{
			 return total/PageUtil.NumPerPageInBack + 1;
		 }
	}

}
