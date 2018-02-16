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
        <li>订单信息</li>
    </ul>
</div>

<div class="formbody">

    <div class="formtitle"><span>客户下单</span></div>
     <form action="dog/addClientApooint" id="addForm"method="post">
    <ul class="forminfo" style="margin-left:33%;">
      <li><label>书籍编号</label><input name="bookIsbn" id="bookIsbn" type="text" readonly="readonly" value="${bookInfo.bookIsbn }"class="dfinput"/></li>
      <li><label>书籍名</label><input name="bookName" id="bookName" type="text" readonly="readonly" value="${bookInfo.bookName }"class="dfinput"/></li>
      <li><label>收货地址</label><input name="appointAddress" id="appointAddress" type="text" readonly="readonly" value="${client.clientAddress }"class="dfinput"/></li>
      <li><label>数量</label><input name="bookCount" id="bookCount" type="text"  value=""class="dfinput"/></li>
      <!--<li>
      <label>收货地址</label>
       <select id="appointDelivery" name="appointDelivery" class="dfinput">
      <option value="中通">中通</option>
      <option value="圆通">圆通</option>
      <option value="韵达">韵达</option>
      <option value="顺丰">顺丰</option>
      </select> 
      </li>-->
        
         <li><label>书籍图片</label>
           <img alt="" src="upload/${bookInfo.bookImg }">
         </li>
        <li><label>&nbsp;</label><input name="save" id="save" type="button" class="btn" value="确认下单" id="save"/></li>
    </ul>
    </form>
</div>
	</body>
    <script type="text/javascript">
    $(function(){
    });
    </script>
    <script type="text/javascript">
    $(function(){
        $("#save").on("click",function(){
       	layer.msg('拼命上传中,请稍后....', {
       		  icon: 16
       		  ,shade: 0.45
       		});
       	setTimeout(function(){
          	 $.ajax({
      	       type:"POST",
      	       ansyc:false,
      	       url: "client/clientAddAppoint",
      	       data:{bookIsbn:$("#bookIsbn").val(),
      	    	   appointAddress:$("#appointAddress").val(),
      	    	   bookCount:$("#bookCount").val()
      	       },
      	       dataType:"json",
      	       contentType:"application/x-www-form-urlencoded;charset=utf-8",
      	       success:function(data){
      	    	   var info="下单成功！<br>";
		    	   info=info+"订单号为:"+data.appoint.appointId+"<br>";
		    	 layer.alert(info, {
		    		  skin: 'layui-layer-molv' //样式类名
		    		  ,closeBtn: 0
		    		}, function(){
		    		   parent.layer.closeAll();
		    		});
      	    	
      	       }
      	}); 
       	  layer.closeAll('loading');
       	}, 2000);
       	 

       });
    	
    	
    	
    });
    
    
    
    </script>
</html>