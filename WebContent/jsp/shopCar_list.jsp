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
    <li><a href="#">客户列表</a></li>
    </ul>
    </div>

     <div class="tools">
    
    	  <ul class="seachform">
    <form action="client/toModPage" method="POST">
		    <li><label>综合查询</label><input name="shopId" id="shopId" type="text" class="scinput" /></li>
		    <li><label>&nbsp;</label><input  type="button" class="scbtn" id="sel" value="查询信息"/></li>
		
		    </ul>
    </form>
        
    </div>
    
  
    
    
    <table class="tablelist">
    	<thead>
    	<tr style="text-align:center">
        <th style="text-align:center"width="25%">编号</th>
        <th style="text-align:center" width="25%">书名</th>
        <th style="text-align:center" width="25%">价格</th>
        <th style="text-align:center" width="25%">操作</th>
        </tr>
        </thead>
        <tbody id="tbody">
        
       <c:forEach items="${list}" var="shopCar" varStatus="vs">
                <c:set var="index" value="${index+1}" />
          <tr style="text-align:center">
        <td>${shopCar.shopId }</td>
        <td>${shopCar.bookInfo.bookName }</td>
        <td>${shopCar.bookInfo.bookPrice }</td>
        </tr>
        </c:forEach>
        </tbody>
        <tfoot>
            <tr style="text-align:center">           
        <td colspan="8"><div id="demo7"></div></td>
                    </tr>
        </tfoot>
       
    </table>
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
    		    ,pages:2
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
                  url: "shopCar/toTargetShopCarPage",
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
                           $("#"+i).append('<td>'+data.list[i].shopId+'</td>');
                           $("#"+i).append('<td>'+data.list[i].bookInfo.bookName  +'</td>');
                           $("#"+i).append('<td>'+data.list[i].bookInfo.bookPrice  +'/元</td>');
                           $("#"+i).append('<td><a href=client/clientToAddAppoint?bookIsbn='+data.list[i].bookIsbn +'>下单</a>|<a id=del'+data.list[i].shopId +' onclick=del(this)>删除</a></td></tr>');
                        }
                  }
           }); 
       } 
        $("#sel").on('click',function(){
      		var shopId=$("#shopId").val();
      		//alert("编号"+clientId);
      	//alert("客户信息"+clientIsbn);
     		 $.ajax({
   		       type:"POST",
   		       ansyc:false,
   		       url: "shopCar/getSignalShopCar",
   		       data:{shopId:shopId
   		       },
   		       dataType:"json",
   		       contentType:"application/x-www-form-urlencoded;charset=utf-8",
   		       success:function(data){
   		    	   var info="编号:"+data.shopCar.shopId+"<br>";
   		    	   info=info+"姓名:"+data.shopCar.bookInfo.bookName+"<br>";
   		    	   info=info+"价格:"+data.shopCar.bookInfo.bookPrice+"<br>";
   		    	   info=info+"作者:"+data.shopCar.bookInfo.bookAuthor+"<br>";
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
    		var clientId=$("#clientId").val();
    		layer.confirm('是否删除该条信息？', {
    			  btn: ['是','否'] //按钮
    			}, function(){
    				 $.ajax({
    				       type:"POST",
    				       url: "client/delClientByIsbn",
    				       data:{clientId:clientId
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
     function del(tag){
     	var roomTyId=tag.id;
 		shopId=roomTyId.substring(3,roomTyId.length);
 	  
     	alert(roomTyId);
     	layer.confirm('是否删除该方见信息？', {
   		  btn: ['是','否'] //按钮
   		}, function(){
   			 $.ajax({
   			       type:"POST",
   			       url: "shopCar/deleteShopCarByIsbn",
   			       data:{shopId:shopId
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
 	}
	</script>
    
    
    
    
    
    </div>


	</body>
</html>