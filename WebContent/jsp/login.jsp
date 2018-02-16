<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<title>欢迎登录后台管理系统</title>
<link href="jsp/css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="jsp/js/jquery.js"></script>
<script src="jsp/js/cloud.js" type="text/javascript"></script>

<script language="javascript">
	$(function(){
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
	$(window).resize(function(){  
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
    })  
});  
</script> 
	</head>
<body style="background-color:#1c77ac; background-image:url(images/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden;">



<!--     <div id="mainBody">
      <div id="cloud1" class="cloud"></div>
      <div id="cloud2" class="cloud"></div>
    </div>   -->


<div class="logintop">    
    <span>欢迎登录商城管理界面平台</span>    
    <ul>
    <li><a href="#">回首页</a></li>
    <li><a href="#">帮助</a></li>
    <li><a href="#">关于</a></li>
    </ul>    
    </div>
    
    <div class="loginbody">
    
       
    <div class="loginbox" style="margin-top:100px;">
    
    <ul>
    <form action="${pageContext.request.contextPath}/admin/login" method="POST">
    <li><input name="loginname" type="text" class="loginuser" value="admin"/></li>
    <li><input name="password" type="password" class="loginpwd" value="123456" /></li>
    <li><input  type="submit" class="loginbtn" value="登录" style="margin-left:100px;"/></li>
    </form>
    </ul>
    </div>
    
    </div>
    
    
    
    <div class="loginbm">版权所有  @CopyRight书店商城 </div>
	
    
</body>

</html>