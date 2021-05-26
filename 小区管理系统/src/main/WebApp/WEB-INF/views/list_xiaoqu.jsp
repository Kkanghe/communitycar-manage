<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<c:url value="/resources/vendor/bootstrap-4.4.1-dist/css/bootstrap.min.css"/>" rel="stylesheet">
<script type="text/javascript" src="<c:url value="/resources/vendor/jquery/jquery-3.3.1.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/vendor/popper.js/popper.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/vendor/bootstrap-4.4.1-dist/js/bootstrap.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/common.js"/>"></script>
<title>小区车辆管理系统</title>
<script type="text/javascript">

   
    var Xiaoqunum;
    
    function showRemoveDlg(xiaoqunum,xiaoquname){
    	Xiaoqunum = xiaoqunum;
    	$("#msg").text("您确认要删除小区 [ "+xiaoquname+" ] 的信息吗?");
    	$('#removexiaoquModal').modal('show');
    }
    
    function removexiaoqu(){
    	document.forms['remove'].action+='/remove/'+Xiaoqunum;
    	document.forms['remove'].submit();
    }
    function showLogoutDlg(){
    	$("#exitMsg").text("用户[${loginedUser.userName}], 您确认要退出系统吗?");
    	$('#logoutModal').modal('show');
    }
    function jump()
    {
    	location.href='<c:url value="loadxiaoqucar/"/>'
    }
    function updatexiaoqu(xiaoqunum){
    	location.href='<c:url value="update"/>/'+xiaoqunum;
    }
    
    function regxiaoqu(){
    	document.forms['xiaoquFrm'].submit();
    	$('#regxiaoquModal').modal('hide');
    }
    function logout(){
    	location.href='<c:url value="/logout"/>';
    }
    function logout(){
    	location.href='<c:url value="/logout"/>';
    }

</script>
</head>
<body>

   <form name="remove" action="<c:url value="/"/>" method="post">
      <input type="hidden" name="_method" value="DELETE"/>
   </form>
   
   <!-- 删除学生提示模态窗口 -->
   <div class="modal fade" tabindex="-1" id="removexiaoquModal" >
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">操作提示</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <p id="msg"></p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
	        <button type="button" class="btn btn-primary" onclick="removexiaoqu()">确认删除</button>
	      </div>
	    </div>
	  </div>
   </div>
   
 <!-- 退出系统模态窗口 -->
   <div class="modal fade" tabindex="-1" id="logoutModal" >
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">操作提示</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <p id="exitMsg"></p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
	        <button type="button" class="btn btn-primary" onclick="logout()">确认退出</button>
	      </div>
	    </div>
	  </div>
   </div>   
 
   <!-- 新生注册注册模态窗口 -->
   <div class="modal fade" tabindex="-1" id="regxiaoquModal" >
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">操作提示</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	         <form name="xiaoquFrm" action="<c:url value="/xiaoqu"/>" class="col-12" method="post" enctype="multipart/form-data">
			  <input type="hidden" name="task" value="createxiaoqu"/>
			  <div class="form-group">
			    <label>小区名字</label>
			    <input type="text" class="form-control" name="xiaoquname">
			  </div>
			  <div class="form-group">
			    <label>小区电话</label>
			    <input type="text" class="form-control" name="xiaoqunum">
			  </div>
              <div class="form-group">
			    <label>小区图片预览</label><br>
			    <img id="picImg" src="<c:url value="/resources/pics/shit.png"/>" width="150px" height="150px"/>
			    
			    <input type="file" class="form-control-file" name="quphoto" onchange="previewImage(this)">
			  </div>
			  <div class="form-group">
			    <label>小区地址</label>
			    <input type="text" class="form-control" name="xiaoquadd">
			  </div>
			  <div class="form-group">
			    <label>车辆总数</label>
			    <input type="text" class="form-control" name="cartotal">
			  </div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
	        <button type="button" class="btn btn-primary" onclick="regxiaoqu()">小区登记</button>
	      </div>
	      
	    </div>
	  </div>
   </div>

   <div class="container">
       <h3 class="mt-5 mb-3">小区信息列表&nbsp;&nbsp;|
        <small class="ml-3">操作员:${loginedUser.userName}</small>
        <button class="btn btn-primary btn-sm ml-2" onclick="showLogoutDlg();">退出系统</button></h3>
       <div class="text-right">
       <button class="btn btn-primary btn-sm" onclick="jump()">小区车辆管理</button>
       <button class="btn btn-primary"  data-toggle="modal" data-target="#regxiaoquModal">新小区登记</button>
       </div>
       <div class="row">
			<table class="table">
			  <thead>
			    <tr>
			      <th scope="col">小区名称</th>
			      <th scope="col">小区电话</th>
			      <th scope="col">小区地址</th>
			      <th scope="col">车辆总数</th>
			      <th scope="col">操作</th>
			    </tr>
			  </thead>
			  <tbody>
			    <c:forEach var="xiaoqu" items="${xiaoquList}">
			    <tr> 
			      <td>${xiaoqu.xiaoquname}<br>
			      <img id="picImg" src="<c:url value="/xiaoqu"/>/${xiaoqu.xiaoqunum}/photo" width="125px" height="125px"/></td>
			      <th scope="row">${xiaoqu.xiaoqunum}</th>
			      <td>${xiaoqu.xiaoquadd}</td>
			      <td>${xiaoqu.cartotal}</td>
			      <td>
			        <button class="btn btn-primary btn-sm" onclick="updatexiaoqu(${xiaoqu.xiaoqunum})">修改</button>
			        <button class="btn btn-danger btn-sm" onclick="showRemoveDlg(${xiaoqu.xiaoqunum},'${xiaoqu.xiaoquname}');">删除</button>
			      </td>
			    </tr>
			    </c:forEach>
			  </tbody>
			</table>	      
	   </div>
   </div>
</body>
</html>