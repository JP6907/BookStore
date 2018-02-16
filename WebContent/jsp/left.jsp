﻿<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    pageContext.setAttribute("path", path);
    pageContext.setAttribute("basePath", basePath);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="${basePath}">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="jsp/css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="jsp/js/jquery.js"></script>

<script type="text/javascript">
$(function(){   
    //导航切换
    $(".menuson li").click(function(){
        $(".menuson li.active").removeClass("active")
        $(this).addClass("active");
    });
    
    $('.title').click(function(){
        var $ul = $(this).next('ul');
        $('dd').find('ul').slideUp();
        if($ul.is(':visible')){
            $(this).next('ul').slideUp();
        }else{
            $(this).next('ul').slideDown();
        }
    });
})  
</script>


</head>

<body style="background:#f0f9fd;">
    <div class="lefttop"><span></span>菜单</div>
    
    <dl class="leftmenu">
        
    
    <dd>
    <div class="title">
    <span><img src="jsp/images/leftico02.png" /></span>书籍管理
    </div>
    <ul class="menuson">
        <li><cite></cite><a href="book/toBookList" target="rightFrame">书籍列表</a><i></i></li>
        <li><cite></cite><a href="type/toTypeList" target="rightFrame">书籍类型</a><i></i></li>
        </ul>     
    </dd> 
    
    
    <dd><div class="title"><span><img src="jsp/images/leftico03.png" /></span>客户管理</div>
    <ul class="menuson">
        <li><cite></cite><a href="client/toClientList" target="rightFrame">客户信息列表</a><i></i></li>
    </ul>    
    </dd>  
    
    
    <dd><div class="title"><span><img src="jsp/images/leftico04.png" /></span>订单管理</div>
    <ul class="menuson">
        <li><cite></cite><a href="appoint/toAppointPage" target="rightFrame">订单信息列表</a><i></i></li>
    </ul>
    
    </dd>   
    
    <dd><div class="title"><span><img src="jsp/images/leftico04.png" /></span>新闻管理</div>
    <ul class="menuson">
        <li><cite></cite><a href="news/toNewsPage" target="rightFrame">书籍资讯</a><i></i></li>
    </ul>
    
    </dd> 
        <dd><div class="title"><span><img src="jsp/images/leftico04.png" /></span>商家管理</div>
    <ul class="menuson">
        <li><cite></cite><a href="bussiness/toBussinessList" target="rightFrame">商家信息</a><i></i></li>
    </ul>
    
    </dd> 
       <dd><div class="title"><span><img src="jsp/images/leftico04.png" /></span>修改密码</div>
    <ul class="menuson">
        <li><cite></cite><a href="user/toModifPassPage" target="rightFrame">修改密码</a><i></i></li>
    </ul>
    
    </dd> 
    
    </dl>
    
</body>
</html>
