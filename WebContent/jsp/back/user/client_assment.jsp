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
		<title>H5模版:</title>
                   <link rel="stylesheet" href="layui/css/layui.css"  media="all">
          <link href="jsp/css/style.css" rel="stylesheet" type="text/css"/>
	       <script language="JavaScript" src="jsp/js/jquery.js"></script>
           <script src="layer/layer.js"></script>
           <script src="layui/layui.js" charset="utf-8"></script>
   
    </head>
	<body>
		
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
       <li>订单评价</li>
       <li><a href="cient/toClientAppointPage">返回</a></li>
    </ul>
</div>

<div class="formbody">

    <div class="formtitle"><span>订单评价</span></div>
     <form action="client/ClientAssmentPage" id="assForm"method="post">
    <ul class="forminfo" style="margin-left:35%;">
      <li><label>订单编号</label><input name="appointId" id="appointId" type="text" value="${appoint.appointId }" class="dfinput"/></li>
               <li>
               <label>邮编</label>
               <select id="appointAssment" name="appointAssment" class="dfinput">
               <option value="暂无">暂无</option>
               <option value="1星">1星</option>
               <option value="2星">2星</option>
               <option value="3星">3星</option>
               <option value="4星">4星</option>
               <option value="5星">5星</option>
               </select>
               
               </li>
       
       
       
        <li><label>&nbsp;</label><input name="save" id="save" type="button" class="btn" value="保存" id="save"/></li>
    </ul>
    </form>
    <input type="hidden" id="as" value="${appoint.appointAssment }"/>
</div>
	</body>
    <script type="text/javascript">
    $(function(){
    	var assment=$("#as").val();
    	$("#appointAssment").val(assment);
        $("#save").on("click",function(){
       	layer.msg('数据上传中,请稍后....', {
       		  icon: 16
       		  ,shade: 0.45
       		});
       	setTimeout(function(){
       	   $("#assForm").submit();
       	  layer.closeAll('loading');
       	}, 2000);
       	 

       });
    	
    	
    	
    });
    
    
    
    </script>
</html>