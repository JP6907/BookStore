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

    <div class="formtitle"><span>添加信息</span></div>
     <form action="appoint/modifyAppointByIsbn" id="modForm"method="post">
    <ul class="forminfo">
            <li><label>订单号</label><input name="appointId" id="appointId" type="text" readonly="readonly" class="dfinput" value="${appoint.appointId } "></li>
            <li><label>下单时间</label><input name="appointTime" id="appointTime" type="text"  readonly="readonly" class="dfinput" value="${appoint.appointTime } "></li>
            <li><label>客户编号</label><input name="clientIsbn" id="clientIsbn" type="text" readonly="readonly" class="dfinput" value="${appoint.clientIsbn }"></li>
            <input type="hidden" id="dogIsbn" name="dogIsbn" value="${appoint.dogIsbn }"/>
         <li><label>品种</label>
           <select id="dogTypeIsbn" name="dogTypeIsbn" class="dfinput"></select>
         </li>
       <li><label>状态</label>
           <select id="appointStatus" name="appointStatus" class="dfinput">
           <option value="未处理">未处理</option>
           <option value="已处理">已处理</option>
           </select>
        </li>
        <li><label>&nbsp;</label><input name="save" id="save" type="button" class="btn" value="保存" id="save"/></li>
    </ul>
    </form>
    <input type="hidden" name="dog_type_isbn" id="dog_type_isbn" value="${appoint.dog.dogTypeIsbn}"/>
    <input type="hidden" name="appoint_status" id="appoint_status" value="${appoint.appointStatus}"/>
</div>
	</body>
    <script type="text/javascript">
    $(function(){
   	 $.ajax({
	       type:"POST",
	       ansyc:false,
	       url: "dogType/getAllType",
	       data:{
	       },
	       dataType:"json",
	       contentType:"application/x-www-form-urlencoded;charset=utf-8",
	       success:function(data){
	    	   for(var i=0;i<data.list.length;i++)
	   	    	 {  
	   	    		$("#dogTypeIsbn").append('<option value='+data.list[i].dogTypeIsbn+'>'+data.list[i].dogTypeName+'</option>'); 
	   	    	 }
	    	 var dogTypeIsbn=$("#dog_type_isbn").val();
	    	 $("#dogTypeIsbn").val(dogTypeIsbn);
	    	 
	       }
	}); 
    	var appoint_status=$("#appoint_status").val();
    	var dog_type_isbn=$("#dog_type_isbn").val();
    	alert(appoint_status);
    	$("#dogTypeIsbn").val(dog_type_isbn);
    	$("#appointStatus").val(appoint_status);
    	
    	
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
       		$("#modForm").submit();
       	  layer.closeAll('loading');
       	}, 2000);
       	

       });
    	
    	
    	
    });
    
    
    
    </script>
</html>