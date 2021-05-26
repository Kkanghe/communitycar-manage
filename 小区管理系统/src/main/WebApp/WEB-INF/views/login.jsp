<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title></title>    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" href="<c:url value="/resources/vendor/bootstrap-4.4.1-dist/css/bootstrap.min.css"/>" media="all" />
	
	<script type="text/javascript" src="<c:url value="/resources/vendor/jquery/jquery-3.3.1.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/vendor/popper.js/popper.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/vendor/bootstrap-4.4.1-dist/js/bootstrap.min.js"/>"></script>

  </head>
  
  <body>

    <div class="container">
       <div class="row col-12 col-md-6 offset-md-2" style="margin-top:100px">
         <h2><b>小区车辆管理系统</b></h2>
         <hr>
       </div>
       <div class="row py-5">
        <form action='<c:url value="/login"/>' method="post" class="col-12 col-md-6 offset-md-3">
           <div class="form-group">
		    <label for="userno">账户名称</label>
		    <input name="userNo" class="form-control" placeholder="请输入账号" maxlength="6" value="${param.userNo}">
		   </div>
           <div class="form-group">
		    <label for="userno">账户密码</label>
		    <input name="userPwd" type="password" class="form-control" placeholder="请输入密码" maxlength="20">
		   </div>
		   <c:if test="${not empty errMsg}">
            <div class="alert alert-danger text-center">
			  ${errMsg}
		    </div>		
		   </c:if>		   
		   <div>
		    <input type="submit" class="btn btn-primary" value="系 统 登 录">
		   </div>		   		               
        </form>
      </div>
    </div> 
  </body>
</html>
