<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>图书详细</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script src="<c:url value='/jsp/shop/jquery/jquery-1.5.1.js'/>"></script>
	
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsp/shop/css/book/desc.css'/>">
	<script src="<c:url value='/jsp/shop/js/book/desc.js'/>"></script>
	<style type="text/css">
		body{
			margin:0px;
		}
		.descMain{
			/* margin:0 auto;  */
			margin-left: 120px;
			width:1200px;  
		}
		.listTop {
			height:100px;
			background: #CDB38B;
			margin: 0px;
			color: #ffffff;
		}
		.listTop a {
			text-decoration:none;
			color: #ffffff;
			font-weight: 900;
		} 
		.listTop a:hover {
			text-decoration: underline;
			color: #ffffff;
			font-weight: 900;
		}	
		.page a{text-decoration:none;  }
		.page a:link {color: #708090}            
		.page a:visited {color: #708090}        
		.page a:hover {color: #6495ED}          
		.page a:active {color: #708090}  
	</style>
  </head>

  <body>
  
  <div>
  		<div class="listTop" style="font-size: 10pt;">
			<div class="current">&nbsp;当前位置：
				<a href="javascript:void(0)" style="color:#6E6E6E;">书店</a> &gt;      
				<a href="javascript:void(0)" style="color:#6E6E6E;">图书列表</a>
				<a href="#" style="float:right;margin-right:10px">退出</a>
			</div>
			
			<h1 style="text-align: center;">二手旧书网</h1>
			<div style="float:right;margin-right:10px">
					<%-- 根据用户是否登录，显示不同的链接 --%>
				<a href="#" >登录</a> |&nbsp; 
				<a href="#" >注册</a>	
			</div>
		</div>
	<div class="descMain">
	  <div class="divBookName">${book.name }&nbsp;&nbsp[简介：
	  		<c:choose>	
				<c:when test="${fn:length(book.description) >= 20}">     		
				      <span title="${book.description}">${fn:substring(book.description,0,20)}……</span>
				</c:when>
				<c:otherwise>
					  <span title="${book.description}">${book.description}</span>
				</c:otherwise>
			</c:choose>
			]
	  </div>
	  <div>
	    <img align="top" src="${pageContext.request.contextPath}/book_img/${book.imagew }" class="img_image_w"/>
	    <div class="divBookDesc">
		    <ul>
		    	<li>商品编号：${book.lsbn }</li>
		    	<li>出售价：<span class="price_n">&yen;${book.currprice }</span></li>
		    	<li>定价：<span class="spanPrice">&yen;${book.price }</span>　折扣：<span style="color: #c30;">${book.discount }</span>折</li>
		    </ul>
			<hr class="hr1"/>
			<table>
				<tr>
					<td colspan="3">
						作者：${book.author } 著
					</td>
				</tr>
				<tr>
					<td colspan="3">
						出版社：${book.press }
					</td>
				</tr>
				<tr>
					<td colspan="3">出版时间：${book.publishtime }</td>
				</tr>
				<tr>
					<td>版次：${book.edition }</td>
					<td>页数：${book.pagenum }</td>
					<td>字数：${book.wordnum }</td>
				</tr>
				<tr>
					<td width="180">印刷时间：${book.printtime }</td>
					<td>开本：${book.booksize }开</td>
					<td>纸张：${book.paper }</td>
				</tr>
			</table>
			<div class="divForm">
				<form id="form1" action="<c:url value='/CartItemServlet'/>" method="post">
					<input type="hidden" name="method" value="add"/>
					<input type="hidden" name="bid" value="${book.lsbn }"/>
	  				我要买：<input id="cnt" style="width: 40px;text-align: center;" type="text" name="quantity" value="1"/>件
	  			</form>
	  			<a id="btn" href="javascript:$('#form1').submit();"></a>
	  		</div>
		</div>
	  </div>
	  </div>
  </div>
  </body>
</html>
