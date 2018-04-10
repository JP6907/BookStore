<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <li><a href="client">首页</a></li>
    <li><a href="#">订单列表</a></li>
    </ul>
    </div>
    <table class="tablelist">
    	<thead>
    	<tr style="text-align:center">
        <th style="text-align:center">订单号</th>
        <th style="text-align:center">快递</th>
        <th style="text-align:center">快递单号</th>
        <th style="text-align:center">书籍名</th>
        <th style="text-align:center">数量</th>
        <th style="text-align:center">收货地址</th>
        <th style="text-align:center">订单状态</th>
        <th style="text-align:center">评价</th>
        </tr>
        </thead>
        <tbody id="tbody">
        </tbody>
        <tfoot>
            <tr style="text-align:center">           
        <td colspan="8"><div id="demo7"></div></td>
                    </tr>
        </tfoot>
       
    </table>
    <input type="hidden" id="count" value="${count }"/>
    <script type="text/javascript">
    $(function(){
    	
        $("#add").on('click',function(){
            
            layer.open({
                type: 2,
                area: ['700px', '530px'],
                fixed: false, //不固定
                maxmin: true,
                content: 'jsp/client_add.jsp'
              });
            
            
        });
    	
    	
    });
    
    </script>
    <script type="text/javascript">
     $(function(){
    	 
    	 
    	 
    	 
     	layui.use(['laypage', 'layer'], function(){
    		  var laypage = layui.laypage
    		  ,layer = layui.layer;
    		  
    		
    	  laypage({
    		    cont: 'demo7'
    		    ,pages:$("#count").val()
    		    ,skip: true
    		    ,jump: function(obj, first){
    		    	layer.msg('数据加载中', {
    		    		  icon: 16
    		    		  ,shade: 0.01
    		    		});
    		    	setTimeout(function(){
    		    		  layer.closeAll('loading');
    		    		  toLimitit(obj.curr);
    		    			 layer.msg('第 '+ obj.curr +' 页');
    		    		}, 2000);
    		    	 
    		    
    		    	 
    		    }
    		  });
    	  
    	  
    	});
    	
        function toLimitit(tag){
            $.ajax({
                  type:"POST",
                  url: "client/toTargetClientAppointPage",
                  ansyc:false,
                  data:{Page:tag
                  },
                  dataType:"json",
                  contentType:"application/x-www-form-urlencoded;charset=utf-8",
                  success:function(data){
                      $("#tbody").html("");//清空原来的表格，重新生成表格
                      //alert(data.list.length);
                      for(var i=0;i<data.list.length;i++)
                        {  
                           $("#tbody").append('<tr style=text-align:center id='+i+'>'); 
                           $("#"+i).append('<td>'+data.list[i].appointId+'</td>');
                           $("#"+i).append('<td>'+data.list[i].appointDelivery +'</td>');
                           $("#"+i).append('<td>'+data.list[i].deliveryIsbn +'</td>');
                           $("#"+i).append('<td>'+data.list[i].bookInfo.bookName +'</td>');
                           $("#"+i).append('<td>'+data.list[i].bookCount+'</td>');
                           $("#"+i).append('<td>'+data.list[i].appointAddress +'</td>');
                           $("#"+i).append('<td>'+data.list[i].appointStatus +'</td>');
                           $("#"+i).append('<td><a href=client/toAssmentPage?appointId='+data.list[i].appointId +'>'+data.list[i].appointAssment+'</a></td></tr>');
                        }
                  }
           }); 
       } 
    
    	
     });
	</script>
    
    
    
    
    
    </div>


	</body>
</html>