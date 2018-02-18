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
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsp/shop/css/book/list.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsp/shop/pager/pager.css'/>" />
    <script type="text/javascript" src="<c:url value='/jsp/shop/pager/pager.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/jsp/shop/jquery/jquery-1.5.1.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/jsp/shop/js/book/list.js'/>"></script>
  </head>
  
  <body>

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

	<table style="float:right;">
    	<tr>
			<td width="40"><a href = "${pageContext.request.contextPath}/bookShop/toBookList?pageNumNow=1" >首页</a></td>
			<td width="50"><a href = "${pageContext.request.contextPath}/bookShop/toBookList?pageNumNow=${pageNumNow-1 }" >上一页 </a></td>
		<c:forEach items="${requestScope.pageList }" var="pageNum">
			<td width="20" ><a href = "${pageContext.request.contextPath}/bookShop/toBookList?pageNumNow=${pageNum }" >${pageNum }</a></td>
		</c:forEach>
			<td width="50"><a href = "${pageContext.request.contextPath}/bookShop/toBookList?pageNumNow=${pageNumNow+1 }" >下一页</a></td>
			<td width="50"><a href = "${pageContext.request.contextPath}/bookShop/toBookList?pageNumNow=${pageNumTotal }" >尾页</a></td>
			<td>第${pageNumNow }页/共${requestScope.pageNumTotal }页 </td>
			<td>第${pageNumNow }页/共${requestScope.pageNumTotal }页 </td>
		</tr>	
	</table>

  </body>
 
</html>

