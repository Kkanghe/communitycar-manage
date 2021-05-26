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
       <h3 class="my-5">小区车辆信息修改</h3>
       <div class="row">
	       <form action="<c:url value="/updatecar/${carnum}"/>" class="col-md-6" method="post" enctype="multipart/form-data">
			  <div class="form-group">
			    <label>小区名字:</label>
			    <input type="text" class="form-control" name="xiaoquname" value="${xiaoquname}">
			  </div>
			  <div class="form-group">
			    <label>车牌号:</label>
			    <label> ${carnum}</label>
			  </div>
			  <div class="form-group">
			    <label>类型:</label>
			    <select class="form-control" name="cartype">
			      <option value="">--请选择--</option>
				  <option value="SUV">越野车</option>
				  <option value="SUPER">跑车</option>
				</select>
			  </div>
			  <div class="form-group">
			    <label>品牌:</label>
			     <select class="form-control" name="carbrand">
			      <option value="">--请选择--</option>
				  <option value="BM">宝马</option>
				  <option value="BC">奔驰</option>
				</select>
			  </div>
			  <div class="form-group">
			    <label>特征:</label>
			    <input type="text" class="form-control" name="carfeatures" value="${carfeatures}">
			  </div>
			  <div class="form-group">
			    <label>状态:</label>
			    <select class="form-control" name="carstate">
			      <option value="">--请选择--</option>
				  <option value="INQU">在小区</option>
				  <option value="NOIN">在外</option>
				</select>
			  </div>
			  <button type="submit" class="btn btn-primary mt-3">修改</button>
			</form>
		</div>
   </div>
</body>
</html>