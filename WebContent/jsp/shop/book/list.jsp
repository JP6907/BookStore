<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>图书列表</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsp/search/css/normalize.css'/>">
	<link rel="stylesheet" href="<c:url value='/jsp/search/css/font-awesome.min.css'/>">
	<%-- <link rel="stylesheet" type="text/css" href="<c:url value='/jsp/search/css/demo.css'/>"> --%>
	<link rel="stylesheet" href="<c:url value='/jsp/search/css/style.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsp/shop/css/ranking.css'/>">
	
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsp/shop/css/book/list.css'/>">
	<script type="text/javascript" src="<c:url value='/jsp/shop/jquery/jquery-1.5.1.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/jsp/shop/js/book/list.js'/>"></script>

	
	<style type="text/css">
		#listmain{
			float:left;
			border:1px;   
			width:100%;  
		}
		#listleft{
			float:left;
			border:1px;   
			width:18%;  
			-webkit-box-shadow: rgba(0,0,0,.1) 0 1px 5px;
		    -moz-box-shadow: rgba(0,0,0,.1) 0 1px 5px;
		    box-shadow: rgba(0,0,0,.1) 0 1px 5px;
		}
		#listright{
			float:right;
			border:1px;   
			width:82%;  
			-webkit-box-shadow: rgba(0,0,0,.1) 0 1px 5px;
		    -moz-box-shadow: rgba(0,0,0,.1) 0 1px 5px;
		    box-shadow: rgba(0,0,0,.1) 0 1px 5px;
		}
		.listTop {
			height:100px;
			background:#CDB38B;
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
<div id="listmain">
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
			<%-- <c:choose>
				<c:when test="${empty sessionScope.sessionUser }">
					  <a href="<c:url value='/jsps/user/login.jsp'/>" target="_parent">会员登录</a> |&nbsp; 
					  <a href="<c:url value='/jsps/user/regist.jsp'/>" target="_parent">注册会员</a>	
				</c:when>
				<c:otherwise>
					      会员：${sessionScope.sessionUser.loginname }&nbsp;&nbsp;|&nbsp;&nbsp;
					  <a href="<c:url value='/CartItemServlet?method=myCart'/>" target="body">我的购物车</a>&nbsp;&nbsp;|&nbsp;&nbsp;
					  <a href="<c:url value='/OrderServlet?method=myOrders'/>" target="body">我的订单</a>&nbsp;&nbsp;|&nbsp;&nbsp;
					  <a href="<c:url value='/jsps/user/pwd.jsp'/>" target="body">修改密码</a>&nbsp;&nbsp;|&nbsp;&nbsp;
					  <a href="<c:url value='/UserServlet?method=quit'/>" target="_parent">退出</a>&nbsp;&nbsp;|&nbsp;&nbsp;
					  <a href="http://www.itcast.cn/channel/contact.shtml" target="_top">联系我们</a>	
				</c:otherwise>
			</c:choose> --%>
		</div>
	</div>
	<div class="search d1">
	  <form>
	  		<%-- <a href="javascript:document.getElementById('form1').submit();"><img align="top" border="0" src="../shop/images/btn.bmp"/></a>
    		<a href="<c:url value='/shop/gj.jsp'/>" style="font-size: 10pt; color: #404040;" target="body">高级搜索</a> --%>
		  <input type="text" placeholder=" lsbn/类型/书名...">
		  <button type="submit"></button>
	  </form>
	</div>
	<div id="listright" >
	<div>
		<ul>
		<c:forEach items="${bookList }" var="book">
		  <li>
		  <div class="inner">
		   <a class="pic" href="${pageContext.request.contextPath}/bookShop/getBookItems?lsbn=${book.lsbn }"><img src="${pageContext.request.contextPath}/book_img/${book.imageb }" border="0"/></a>
		    <p class="price">
				<span class="price_n">&yen;${book.currprice }</span>
				<span class="price_r">&yen;${book.price }</span>
				(<span class="price_s">${book.discount }折</span>)
			</p>
			<p><a id="bookname" title="${book.name }" href="<c:url value='/BookServlet?method=load&bid=${book.lsbn }'/>">${book.name }</a></p>
			<%-- url标签会自动对参数进行url编码 --%>
			<c:url value="/BookServlet" var="authorUrl">
				<c:param name="method" value="findByAuthor"/>
				<c:param name="author" value="${book.author }"/>
			</c:url>
			<c:url value="/BookServlet" var="pressUrl">
				<c:param name="method" value="findByPress"/>
				<c:param name="press" value="${book.press }"/>
			</c:url>
			<p><a href="${authorUrl }" name='P_zz' title='${book.author }'>${book.author }</a></p>
			<p class="publishing">
				<span>出 版 社：</span><a href="${pressUrl }">${book.press }</a>
			</p>
			<p class="publishing_time"><span>出版时间：</span>${book.publishtime }</p>
		  </div>
		  </li>
		</c:forEach>
		
		</ul>
	</div>
	<div class="page" >
		<table style="font-family:FZYaoti;font-size:14px;width:100%;">
	    	<tr style="height:30px;float:right">
				<td width="40"><a href = "${pageContext.request.contextPath}/bookShop/toBookList?pageNumNow=1" >首页</a></td>
				<td width="50"><a href = "${pageContext.request.contextPath}/bookShop/toBookList?pageNumNow=${pageNumNow-1 }" >上一页 </a></td>
			<c:forEach items="${requestScope.pageList }" var="pageNum">
				<c:choose>
				<c:when test="${pageNumNow eq pageNum }">
					<td width="20" ><a style="color:#000000" href = "${pageContext.request.contextPath}/bookShop/toBookList?pageNumNow=${pageNum }" >${pageNum }</a></td>
				</c:when>
				<c:otherwise>
					<td width="20" ><a href = "${pageContext.request.contextPath}/bookShop/toBookList?pageNumNow=${pageNum }" >${pageNum }</a></td>
				</c:otherwise>
				</c:choose>
			</c:forEach>
				<td width="50"><a href = "${pageContext.request.contextPath}/bookShop/toBookList?pageNumNow=${pageNumNow+1 }" >下一页</a></td>
				<td width="50"><a href = "${pageContext.request.contextPath}/bookShop/toBookList?pageNumNow=${pageNumTotal }" >尾页</a></td>
				<td>第${pageNumNow }页/共${requestScope.pageNumTotal }页 </td>
			</tr>	
		</table>
	</div>
	
	</div>
	
	<div id="listleft">
		<!-- <br><br><br><br><br><br><br><br><br><br><br>图书分类/公告......
		<br><br><br><br><br><br><br><br><br><br><br>图书分类/公告......
		<br><br><br><br><br><br><br><br><br><br><br>图书分类/公告......
		<br><br><br><br><br><br><br><br><br><br><br>图书分类/公告......		 -->
		<div class="ranking">
		<div class="box2" id="book_rank">
			  <h2><a href="#" class="more">更多</a>销售排行榜</h2>
			  <div class="rankinner">
			    <ul class="rank_list">
			        <li class="top3"><em>1</em><a title="Java Web整合开发实战" target="_blank" href="#">
			Java Web整合开发实</a><span>621</span></li>
				    <li class="top3"><em>2</em><a title="OSGi实战" target="_blank" href="#">
			OSGi实战</a><span>589</span></li>
					<li class="top3"><em>3</em><a title="Java核心技术：卷Ⅰ基础知识（原书第8版）" target="_blank" href="#">
			Java核心技术：卷Ⅰ基础知识（原书第8版）</a><span>532</span></li>
					<li  ><em>4</em><a title="Java7入门经典" target="_blank" href="#">
			Java7入门经典</a><span>456</span></li>
					<li  ><em>5</em><a title="Java深入解析——透析Java本质的36个话题" target="_blank" href="#">
			Java深入解析——透析Java本质的36个话题</a><span>431</span></li>
					<li  ><em>6</em><a title="Struts2技术内幕：深入解析Struts架构设计与实现原理" target="_blank" href="#">
			Struts2技术内幕：深入解析Struts架构设计与实现原理</a><span>387</span></li>
					<li  ><em>7</em><a title="Tomcat与Java Web开发技术详解（第2版）" target="_blank" href="#">
			Tomcat与Java Web开发技术详解（第2版）</a><span>335</span></li>
					<li  ><em>8</em><a title="基于MVC的JavaScript Web富应用开发" target="_blank" href="#">
			基于MVC的JavaScript Web富应用开发</a><span>256</span></li>
					<li  ><em>9</em><a title="HTML5+JavaScript动画基础" target="_blank" href="#">
			HTML5+JavaScript动画基础</a><span>153</span></li>
					<li  ><em>10</em><a title="深入浅出Ext JS(第3版)" target="_blank" href="#">
			深入浅出Ext JS(第3版)</a><span>78</span></li>
			    </ul>
			  </div>
			</div>
			</div>
			
			<br>
			
			<div class="ranking">
		<div class="box2" id="book_rank">
			  <h2><a href="#" class="more">更多</a>人气排行榜</h2>
			  <div class="rankinner">
			    <ul class="rank_list">
			    	<li class="top3"><em>1</em><a title="Tomcat与Java Web开发技术详解（第2版）" target="_blank" href="#">
			Tomcat与Java Web开发技术详解（第2版）</a><span>335</span></li>
			        <li class="top3"><em>2</em><a title="Java Web整合开发实战" target="_blank" href="#">
			Java Web整合开发实</a><span>621</span></li>
					<li class="top3"><em>3</em><a title="基于MVC的JavaScript Web富应用开发" target="_blank" href="#">
			基于MVC的JavaScript Web富应用开发</a><span>256</span></li>
				    <li  ><em>4</em><a title="Struts2技术内幕：深入解析Struts架构设计与实现原理" target="_blank" href="#">
			Struts2技术内幕：深入解析Struts架构设计与实现原理</a><span>387</span></li>
					<li ><em>5</em><a title="Java核心技术：卷Ⅰ基础知识（原书第8版）" target="_blank" href="#">
			Java核心技术：卷Ⅰ基础知识（原书第8版）</a><span>532</span></li>
					<li  ><em>6</em><a title="深入浅出Ext JS(第3版)" target="_blank" href="#">
			深入浅出Ext JS(第3版)</a><span>78</span></li>
					<li  ><em>7</em><a title="Java深入解析——透析Java本质的36个话题" target="_blank" href="#">
			Java深入解析——透析Java本质的36个话题</a><span>431</span></li>
					<li  ><em>8</em><a title="Java7入门经典" target="_blank" href="#">
			Java7入门经典</a><span>456</span></li>
					<li  ><em>9</em><a title="HTML5+JavaScript动画基础" target="_blank" href="#">
			HTML5+JavaScript动画基础</a><span>153</span></li>
					<li ><em>10</em><a title="OSGi实战" target="_blank" href="#">
			OSGi实战</a><span>589</span></li>
					
			    </ul>
			  </div>
			</div>
			</div>
		</div>
</div>	

  </body>
 
</html>

