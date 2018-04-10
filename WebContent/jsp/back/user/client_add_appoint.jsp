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

<div class="formbody" >

    <div class="formtitle"><span>下单</span></div>
     <form action="client/clientToAddAppoint" id="modForm"method="post">
    <ul class="forminfo" style="margin-left:30%;">
     
      <li><label>书籍编号</label><input name="bookIsbn" id="bookIsbn" readonly="readonly" type="text" value="${bookInfo.bookIsbn }" class="dfinput"/></li>
      <li><label>书籍名</label><input name="bookName" id="bookName" type="text" readonly="readonly" value="${bookInfo.bookName }" class="dfinput"/></li>
      <li><label>价格</label><input name="bookPrice" id="bookPrice" type="text" readonly="readonly" value="${bookInfo.bookPrice}" class="dfinput"/></li>
      <li><label>作者</label><input name="bookAuthor" id="bookAuthor" type="text" readonly="readonly" value="${bookInfo.bookAuthor}" class="dfinput"/></li>
      <li><label>出版社</label><input name="bookPublish" id="bookPublish" type="text" readonly="readonly" value="${bookInfo.bookPublish}" class="dfinput"/></li>
      <li><label>书籍介绍</label>
        <textarea rows="5" cols="20" readonly="readonly" id="bookIntroduce" name="bookIntroduce">${bookInfo.bookIntroduce}</textarea>
      </li>
      <li><label>图片</label><img alt="" src="upload/${bookInfo.bookImg }"></li>
        <li>
        <label>&nbsp;</label><input name="add" id="add" type="button" class="btn" value="加入购物车" id="save"/>
           <label>&nbsp;</label><input name="save" id="save" type="button" class="btn" value="下单" id="save"/>
        </li>
        
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
       	  layer.closeAll('loading');
       	}, 2000);
       	 

       });
        
        $("#add").on("click",function(){
           	layer.msg('添加中,请稍后....', {
           		  icon: 16
           		  ,shade: 0.45
           		});
           	setTimeout(function(){
            	  $.ajax({
                      type:"POST",
                      url: "client/addToShopCar",
                      ansyc:false,
                      data:{bookIsbn:$("#bookIsbn").val()
                      },
                      dataType:"json",
                      contentType:"application/x-www-form-urlencoded;charset=utf-8",
                      success:function(data){
                    	  layer.msg('添加成功!');
                      }
               }); 
            	
            	
           	  layer.closeAll('loading');
           	}, 1000);
           	 

           });
    	
        
    	
    	
    });
    
    
    
    </script>
</html>