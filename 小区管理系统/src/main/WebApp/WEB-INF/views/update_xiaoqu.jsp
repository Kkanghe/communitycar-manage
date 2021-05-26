<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<c:url value="/resources/vendor/bootstrap-4.4.1-dist/css/bootstrap.min.css"/>" rel="stylesheet">
<script type="text/javascript" src="<c:url value="/resources/js/common.js"/>"></script>
<title>Insert title here</title>
</head>
<body>
   <div class="container">
       <h3 class="my-5">小区信息修改</h3>
       <div class="row">
	       <form action="<c:url value="/update/${xiaoqunum}"/>" class="col-md-6" method="post" enctype="multipart/form-data">
			  <div class="form-group">
			    <label>小区电话: ${xiaoqunum}</label>
			  </div>
			  <div class="form-group">
			    <label>小区名称</label>
			    <input type="text" class="form-control" name="xiaoquname" value="${xiaoquname}">
			  </div>
			 <img id="picImg" src="<c:url value="/xiaoqu"/>/${xiaoqunum}/photo" width="125px" height="125px"/>
			  <div class="form-group">
			    <label>小区图片</label>
			    <input type="file" class="form-control-file" name="quphoto" onchange="previewImage(this)">
			  </div>
			  <div class="form-group">
			    <label>小区地址</label>
			    <input type="text" class="form-control" name="xiaoquadd" value="${xiaoquadd}">
			  </div> 
			  <div class="form-group">
			    <label>车辆总数</label>
			    <input type="text" class="form-control" name="cartotal" value="${cartotal}">
			  </div> 
			  <button type="submit" class="btn btn-primary mt-3">修改</button>
			</form>
		</div>
   </div>
</body>
</html>