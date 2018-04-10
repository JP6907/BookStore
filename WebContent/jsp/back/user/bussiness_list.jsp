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
    <li><a href="#">首页</a></li>
    <li><a href="#">客户列表</a></li>
    </ul>
    </div>

     <div class="tools">
    
    	  <ul class="seachform">
    <form action="bussiness/toModPage" method="POST">
		    <li><label>综合查询</label><input name="bussinessId" id="bussinessId" type="text" class="scinput" /></li>
		    <li><label>&nbsp;</label><input  type="button" class="scbtn" id="sel" value="查询信息"/></li>
		    <li><label>&nbsp;</label><input  type="submit" class="scbtn" id="mod"value="修改信息"/></li>
            <li><label>&nbsp;</label><input  type="button" class="scbtn" id="add" value="增加信息"/></li>
            <li><label>&nbsp;</label><input  type="button" class="scbtn" id="del"value="删除信息"/></li>
		    </ul>
    </form>
        
    </div>
    
  
    
    
    <table class="tablelist">
    	<thead>
    	<tr style="text-align:center">
        <th style="text-align:center">编号</th>
        <th style="text-align:center">姓名</th>
        <th style="text-align:center">地址</th>
         <th style="text-align:center">邮编</th>
        <th style="text-align:center">Email</th>
        <th style="text-align:center">联系电话</th>
        </tr>
        </thead>
        <tbody id="tbody">
        
       <c:forEach items="${list}" var="bussiness" varStatus="vs">
                <c:set var="index" value="${index+1}" />
          <tr style="text-align:center">
        <td>${bussiness.bussinessId }</td>
        <td>${bussiness.bussinessName }</td>
        <td>${bussiness.bussinessAddress }</td>
         <td>${bussiness.bussinessAddressCode}</td>
         <td>${bussiness.bussinessEmail}</td>
         <td>${bussiness.bussinessPhone}</td>
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
                content: 'jsp/bussiness_add.jsp'
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
                  url: "bussiness/toTargetBussinessPage",
                  ansyc:false,
                  data:{Page:tag,
                  },
                  dataType:"json",
                  contentType:"application/x-www-form-urlencoded;charset=utf-8",
                  success:function(data){
                      $("#tbody").html("");//清空原来的表格，重新生成表格
                      //alert(data.list.length);
                      for(var i=0;i<data.list.length;i++)
                        {  
                           $("#tbody").append('<tr style=text-align:center id='+i+'>'); 
                           $("#"+i).append('<td>'+data.list[i].bussinessId+'</td>');
                           $("#"+i).append('<td>'+data.list[i].bussinessName +'</td>');
                           $("#"+i).append('<td>'+data.list[i].bussinessAddress +'</td>');
                           $("#"+i).append('<td>'+data.list[i].bussinessAddressCode +'</td>');
                           $("#"+i).append('<td>'+data.list[i].bussinessEmail +'</td>');
                           $("#"+i).append('<td>'+data.list[i].bussinessPhone +'</td></tr>');
                        }
                  }
           }); 
       } 
        $("#sel").on('click',function(){
      		var bussinessId=$("#bussinessId").val();
      		//alert("编号"+clientId);
      	//alert("客户信息"+clientIsbn);
     		 $.ajax({
   		       type:"POST",
   		       ansyc:false,
   		       url: "bussiness/getSignalBussinessByIsbn",
   		       data:{bussinessId:bussinessId
   		       },
   		       dataType:"json",
   		       contentType:"application/x-www-form-urlencoded;charset=utf-8",
   		       success:function(data){
   		    	   var info="编号:"+data.bussiness.bussinessId+"<br>";
   		    	   info=info+"姓名:"+data.bussiness.bussinessName+"<br>";
   		    	   info=info+"联系电话:"+data.bussiness.bussinessPhone+"<br>";
   		    	   info=info+"邮箱:"+data.bussiness.bussinessEmail+"<br>";
   		    	   info=info+"地址:"+data.bussiness.bussinessAddress+"<br>";
   		    	   info=info+"邮编:"+data.bussiness.bussinessAddressCode+"<br>";
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
    		var bussinessId=$("#bussinessId").val();
    		layer.confirm('是否删除该条信息？', {
    			  btn: ['是','否'] //按钮
    			}, function(){
    				 $.ajax({
    				       type:"POST",
    				       url: "bussiness/delBussinessByIsbn",
    				       data:{bussinessId:bussinessId
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