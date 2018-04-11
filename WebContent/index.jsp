<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">   
    <title>This is the title</title>       
  <meta http-equiv="pragma" content="no-cache">
  <meta http-equiv="cache-control" content="no-cache">
  <meta http-equiv="expires" content="0">   
  <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
  <meta http-equiv="description" content="This is my page">
 </head>
 
 <body>
 	<center>
	<h1>二手书店</h1><hr>
	<a href="${pageContext.request.contextPath}/login">进入后台管理系统</a>
	<br>
	<br>
	<br>
	<a href="${pageContext.request.contextPath}/jsp/shop/body.jsp">进入书店页面</a>
	<br>
	<br>
	<br>
	书店页面：jsp/shop/main.jsp  （为什么这里 FormController 不会生效）
	<br>
	去边框： jsp/shop/body.jsp
	<br>
	</center>

 </body>
 
</html>