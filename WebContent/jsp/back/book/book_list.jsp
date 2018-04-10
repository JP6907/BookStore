<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	pageContext.setAttribute("path", path);
	pageContext.setAttribute("basePath", basePath);
%>
<!DOCTYPE HTML>
<html>
	<head>

		<base href="${basePath}">
		<meta charset="UTF-8">
		<title>H5模版:</title>
         <link rel="stylesheet" href="layui/css/layui.css"  media="all">
<link href="jsp/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="jsp/js/jquery.js"></script></head>
	     <script src="layer/layer.js"></script>
        <script src="layui/layui.js" charset="utf-8"></script>
    <body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
	    <li><a href="#">首页</a></li>
	    <li><a href="#">书籍列表</a></li>
    </ul>
    </div>

     <div class="tools">
    
  
    <form action="${pageContext.request.contextPath}/book/queryBook" id="searchForm" method="POST">
    	<table>
    		<tr>
    			<td>
    				<li><label>综合查询</label>
    				<input name="lsbn_name_type" id="lsbn_name_type" type="text" class="scinput" placeholder="lsbn编号/书名/图书类型"/>
    				</li>
    			</td>
    			<td>&nbsp;&nbsp;</td>
    			<td class="scbtn">
    				<!-- 需要获取表单中输入框的数据，所以提交表单 -->
    				<a type="submit" onclick="document:searchForm.submit()" 
    				target="rightFrame" style="color:#FFFFFF;font-size:15px;">&nbsp;&nbsp;&nbsp;查询书籍</a>
    			</td>
    			<td>&nbsp;&nbsp;</td>
    			<td class="scbtn">
    				<a href="${pageContext.request.contextPath}/book/addBook" 
    				target="rightFrame" style="color:#FFFFFF;font-size:15px;">&nbsp;&nbsp;&nbsp;添加书籍</a>
    			</td>
    			<td>&nbsp;&nbsp;</td>
    			<td class="scbtn">
    				<a href="#" 
    				target="rightFrame" style="color:#FFFFFF;font-size:15px;">&nbsp;&nbsp;&nbsp;删除书籍</a>
    			</td>
    		</tr>
    	</table>
    </form>

        
    </div>
     
    <table class="tablelist">
    	<thead>
    	<tr style="text-align:center">
    	<th style="text-align:center">选择</th>
        <th style="text-align:center">书籍编号</th>
        <th style="text-align:center">书籍类型</th>
        <th style="text-align:center">书籍名</th>
        <th style="text-align:center">作者</th>
        <th style="text-align:center">原价</th>
        <th style="text-align:center">现价</th>
        <th style="text-align:center">&nbsp;</th>
        <th style="text-align:center">&nbsp;</th>
        </tr>
        </thead>
        <tbody id="tbody">
        
       <c:forEach items="${bookList}" var="book" varStatus="vs">
                <c:set var="index" value="${index+1}" />
          <tr style="text-align:center" >
          <%-- onclick="parent.location='${pageContext.request.contextPath}/book/getBookItems?lsbn=${book.lsbn }'" --%>
          	<td><input type="checkbox" name="lsbn" value="${book.lsbn }"/></td>
	        <td>
	        	<c:choose>	
		    		<c:when test="${fn:length(book.lsbn) >= 15}">     		
		        		<span class="spa2" title="${book.lsbn}">${fn:substring(book.lsbn,0,15)}……</span>
		     		</c:when>
			     	<c:otherwise>
			         	<span class="spa2" title="${book.lsbn}">${book.lsbn}</span>
			     	</c:otherwise>
		 		</c:choose>
	        </td>
	        <td>${book.type }</td>
	         <td>
	         <!-- 实现字数过多是自动用.....代替，鼠标移过去显示全部 -->
		         <c:choose>	
		    		<c:when test="${fn:length(book.name) >= 30}">     		
		        		<span class="spa2" title="${book.name}">${fn:substring(book.name,0,30)}……</span>
		     		</c:when>
			     	<c:otherwise>
			         	<span class="spa2" title="${book.name}">${book.name}</span>
			     	</c:otherwise>
		 		</c:choose>
	         </td>         
	        <td>${book.author }</td>
	        <td>${book.price }</td>
	         <td>${book.currprice}</td>
	         <td><a href="${pageContext.request.contextPath}/book/modifyBook?lsbn=${book.lsbn }" style="color:#4876FF;">修改</a></td>
	         <td><a href="${pageContext.request.contextPath}/book/deleteBook?lsbn=${book.lsbn }" style="color:#6495ED;">删除</a></td>
        </tr>
        </c:forEach>
        </tbody>
        <tfoot>
            <tr style="text-align:center">           
        <td colspan="8"><div id="demo7"></div></td>
                    </tr>
        </tfoot>
       
    </table>    
    
    <table style="float:right;">
    	<tr>
			<td width="30"><a href = "${pageContext.request.contextPath}/book/toBookList?pageNumNow=1" >首页</a></td>
			<td width="50"><a href = "${pageContext.request.contextPath}/book/toBookList?pageNumNow=${pageNumNow-1 }" >上一页 </a></td>
		<c:forEach items="${requestScope.pageList }" var="pageNum">
			<td width="20" ><a href = "${pageContext.request.contextPath}/book/toBookList?pageNumNow=${pageNum }" >${pageNum }</a></td>
		</c:forEach>
			<td width="50"><a href = "${pageContext.request.contextPath}/book/toBookList?pageNumNow=${pageNumNow+1 }" >下一页</a></td>
			<td width="50"><a href = "${pageContext.request.contextPath}/book/toBookList?pageNumNow=${pageNumTotal }" >尾页</a></td>
			<td>第${pageNumNow }页/共${requestScope.pageNumTotal }页 </td>
		</tr>	
	</table>
   
    </div>

	</body>
</html>