<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
    <li><a href="#">订单列表</a></li>
    </ul>
    </div>

	<c:if test="${identity eq 'admin'}">
     <div class="tools">
    	  <ul class="seachform">
    
	    <form action="order/toModPage" method="POST">
			    <li><label>订单号</label><input name="orderId" id="orderId" type="text" class="scinput" /></li>
	             <li><label>订单类型</label>
	                <select id="orderStatus" name="orderStatus" class="scinput">
	                <option value="等待付款">全部</option>
	                <option value="等待付款">等待付款</option>
	                <option value="准备发货">准备发货</option>
	                <option value="等待确认">等待确认</option>
	                <option value="交易成功">交易成功</option>
	                <option value="已取消">已取消</option>
	                <!-- <option value="未处理">未处理</option>
	                <option value="已处理">已处理</option> -->
	                </select>
	             </li>
			    <li><label>&nbsp;</label><input  type="button" class="scbtn" id="sel" value="查询订单"/></li>
			    </ul>
	    </form>        
    </div>
    </c:if>
    
  
    
    
    <table class="tablelist">
    	<thead>
    	<tr style="text-align:center">
        <th style="text-align:center">订单号</th>
        <th style="text-align:center">订单时间</th>
        <th style="text-align:center">订单状态</th>
        <th style="text-align:center">总金额</th>
        <th style="text-align:center">下单者</th>
        </tr>
        </thead>
        <tbody id="tbody">
        
       <c:forEach items="${orderList}" var="order" varStatus="vs">
                <c:set var="index" value="${index+1}" />
          <tr style="text-align:center">
                    <td>${order.orderid }</td>
                    <td><fmt:formatDate value='${order.ordertime }' type='date' pattern='yyyy年MM月dd HH:mm:ss'/></td>
                    <td>${order.status  }</td>
                    <td>${order.total  }</td>
                    <td>${order.username }</td>
                </tr>
        </c:forEach>
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
                  url: "order/toTargetorderPage",
                  ansyc:false,
                  data:{Page:tag,
                	  orderStatus:$("#orderStatus").val()
                 
                  },
                  dataType:"json",
                  contentType:"application/x-www-form-urlencoded;charset=utf-8",
                  success:function(data){
                      $("#tbody").html("");//清空原来的表格，重新生成表格
                      //alert(data.list.length);
                      for(var i=0;i<data.list.length;i++)
                        {  
                           $("#tbody").append('<tr style=text-align:center id='+i+'>'); 
                           $("#"+i).append('<td>'+data.list[i].orderId+'</td>');
                           $("#"+i).append('<td>'+data.list[i].orderTime +'</td>');
                           $("#"+i).append('<td>'+data.list[i].orderStatus +'</td>');
                           $("#"+i).append('<td>'+data.list[i].orderAssment +'</td>');
                           $("#"+i).append('<td>'+data.list[i].orderDelivery +'</td></tr>');
                        }
                  }
           }); 
       } 
        $("#sel").on('click',function(){
        	var orderId=$("#orderId").val();
        	//alert(orderId);
     		 $.ajax({
   		       type:"POST",
   		       ansyc:false,
   		       url: "order/getSignalorder",
   		       data:{orderId:orderId
   		       },
   		       dataType:"json",
   		       contentType:"application/x-www-form-urlencoded;charset=utf-8",
   		       success:function(data){
   		    	   var info="订单号:"+data.order.orderId+"<br>";
   		    	info=info+"客户名:"+data.order.client.clientName+"<br>";
   		    	info=info+"客户编号:"+data.order.client.clientId+"<br>";
   		    	info=info+"书籍名:"+data.order.bookInfo.bookName+"<br>";
   		    	info=info+"下单时间:"+data.order.orderTime+"<br>";
   		    	info=info+"订单状态:"+data.order.orderStatus+"<br>";
   		    	   layer.open({
   		    		   type: 0,
   		    		   shade: false,
   		    		   title: false, //不显示标题
   		    		   content: info //捕获的元素，注意：最好该指定的元素要存放在body最外层，否则可能被其它的相对元素所影响
   		    		 });
   		       }
   		});
      	}); 
    	$("#del").on('click',function(){
    		var orderId=$("#orderId").val();
    		layer.confirm('是否删除该条信息？', {
    			  btn: ['是','否'] //按钮
    			}, function(){
    				 $.ajax({
    				       type:"POST",
    				       url: "order/delorderByIsbn",
    				       data:{orderId:orderId
    				       },
    				       dataType:"json",
    				       contentType:"application/x-www-form-urlencoded;charset=utf-8",
    				       success:function(data){
    				    	   if(data.flag){
    				    		   layer.msg('删除成功！', {icon: 1});
    				    		   setTimeout(function(){
    				    			   toLimitit(1);
    				    			 }, 2000);
    				    		   
    				    	   }
    				    	   else{
    				    		   layer.msg('删除失败!');
    				    	   }
    				       }
    				}); 
    			
    			});
    	}); 
     });
	</script>
    
    
    
    
    
    </div>


	</body>
</html>