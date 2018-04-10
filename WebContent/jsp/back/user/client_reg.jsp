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
     <form action="dog/addDog" id="addForm"method="post">
    <ul class="forminfo">
     
      <li><label>证件号</label><input name="clientIsbn" id="clientIsbn" type="text" class="dfinput"/></li>
      <li><label>姓名</label><input name="clientName" id="clientName" type="text" class="dfinput"/></li>
        <li><label>年龄</label><input name="clientAge" id="clientAge" type="text" class="dfinput"/></li>
         <li><label>密码</label><input name="password" id="password" type="text" class="dfinput"/></li>
         <li><label>确认密码</label><input name="ConPas" id="ConPas" type="text" class="dfinput"/></li>
           <li><label>性别</label>
           <select id="clientSex" name="clientSex" class="dfinput">
           <option value="男">男</option>
           <option value="女">女</option>
           </select>
        </li>
        <li><label>&nbsp;</label><input name="save" id="save" type="button" class="btn" value="保存" id="save"/></li>
    </ul>
    </form>
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
	    	 
	       }
	}); 
    	
    	
    	
    });
    </script>
    <script type="text/javascript">
    $(function(){
        $("#save").on("click",function(){
        	var pas=$("#password").val();
        	var conPas=$("#ConPas").val();
        	if(pas!=conPas){
        		 layer.msg('密码不一致！');
        		 return false;
        	}
       	layer.msg('拼命上传中,请稍后....', {
       		  icon: 16
       		  ,shade: 0.45
       		});
       	setTimeout(function(){
       	     var formData = new FormData($("#addForm")[0]);
       	     $.ajax({
       	         url: 'client/addClient',
       	         type: 'POST',
       	         data: formData,
       	         async:false,
       	         cache: false,
       	         contentType: false,
       	         enctype: 'multipart/form-data',
       	         processData: false,
       	         success: function (data) {
       	        	   layer.msg('数据上传成功！');
       	        	   parent.layer.closeAll();
       	         }
       	     });
       	  layer.closeAll('loading');
       	}, 2000);
       	 

       });
    	
    	
    	
    });
    
    
    
    </script>
</html>