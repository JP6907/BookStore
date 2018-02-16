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
        <li>测试表单数据</li>
    </ul>
</div>

<div class="formbody">

    <div class="formtitle"><span>修改信息</span></div>
     <form action="client/modifyClientByIsbn" id="modForm"method="post">
    <ul class="forminfo">
               <li><label>编号</label><input name="clientId" id="clientId" value="${client.clientId }" readonly="readonly" type="text" class="dfinput"/></li>
    
               <li><label>姓名</label><input name="clientName" id="clientName" value="${client.clientName }"  type="text" class="dfinput"/></li>
               <li><label>联系电话</label><input name="clientPhone" id="clientPhone" value="${client.clientPhone }" type="text" class="dfinput"/></li>
       
               <li><label>邮编</label><input name="clientAddressCode" id="clientAddressCode"  value="${client.clientAddressCode }" type="text" class="dfinput"/></li>
       
               <li><label>邮箱</label><input name="clientEmail" id="clientEmail" type="text" value="${client.clientEmail }" class="dfinput"/></li>
       
               <li><label>地址</label><input name="clientAddress" id="clientAddress" type="text" value="${client.clientAddress }" class="dfinput"/></li>
       
        <li><label>&nbsp;</label><input name="save" id="save" type="button" class="btn" value="保存" id="save"/></li>
    </ul>
    </form>
</div>
	</body>
    <script type="text/javascript">
    $(function(){
        $("#save").on("click",function(){
       	layer.msg('拼命上传中,请稍后....', {
       		  icon: 16
       		  ,shade: 0.45
       		});
       	setTimeout(function(){
			$("#modForm").submit();
       	}, 2000);
       	 

       });
    	
    	
    	
    });
    
    
    
    </script>
</html>