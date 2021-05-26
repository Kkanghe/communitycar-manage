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

   
    var Carnum;
    
    function showRemoveDlg(carnum){
    	Carnum = carnum;
    	$("#msg").text("您确认要删除车牌号为 [ "+carnum+" ] 的信息吗?");
    	$('#removexiaoqucarModal').modal('show');
    }
    
    function removexiaoqucar(){
    	document.forms['remove'].action+='removecar/'+Carnum;
    	document.forms['remove'].submit();

    }

    function updatexiaoqucar(carnum){
    	location.href='<c:url value="updatecar"/>/'+carnum;
    }
    
    function regxiaoqucar(){
    	document.forms['carFrm'].submit();
    	$('#regxiaoqucarModal').modal('hide');
    }
    function doQuery(pageNo){	    
    	
  	   if(pageNo<1 || pageNo>${page.totalPageNum})
         {
            alert('页号超出范围，有效范围：[1-${page.totalPageNum}]!');
            $('#pageNo').select();
            return;
         }
         else
         {
  	         document.forms['xiaoqucarFrm'].pageNo.value=''+pageNo;
  	         document.forms['xiaoqucarFrm'].submit();
  	    }
  	   
     }  


</script>
</head>
<body>

   <form name="remove" action="<c:url value="/"/>" method="post">
      <input type="hidden" name="_method" value="DELETE"/>
   </form>
   
   <!-- 删除学生提示模态窗口 -->
   <div class="modal fade" tabindex="-1" id="removexiaoqucarModal" >
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
	        <button type="button" class="btn btn-primary" onclick="removexiaoqucar()">确认删除</button>
	      </div>
	    </div>
	  </div>
   </div>

   <!-- 新生注册注册模态窗口 -->
   <div class="modal fade" tabindex="-1" id="regxiaoqucarModal" >
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">操作提示</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	         <form name="carFrm" action="<c:url value="/xiaoqucar/save"/>" class="col-12" method="post" enctype="multipart/form-data">
			  <input type="hidden" name="task" value="createxiaoqucar"/>
			  <div class="form-group">
			    <label>小区名字</label>
			    <input type="text" class="form-control" name="xiaoquname">
			  </div>
			  <div class="form-group">
			    <label>车牌号</label>
			    <input type="text" class="form-control" name="carnum">
			  </div>
			  <div class="form-group">
			  <label>类型：</label>
			    <select class="form-control" name="cartype">
			      <option value="">--请选择--</option>
				  <option value="SUV">越野车</option>
				  <option value="SUPER">跑车</option>
				</select>
			  </div>
			  <div class="form-group">
			  <label>品牌：</label>
			    <select class="form-control" name="carbrand">
			      <option value="">--请选择--</option>
				  <option value="BM">宝马</option>
				  <option value="BC">奔驰</option>
				</select>
			  </div>
			  <div class="form-group">
			    <label>特征</label>
			    <input type="text" class="form-control" name="carfeatures">
			  </div>
			  <div class="form-group">
			  <label>状态：</label>
			    <select class="form-control" name="carstate">
			      <option value="">--请选择--</option>
				  <option value="INQU">在小区</option>
				  <option value="NOIN">在外</option>
				</select>
			  </div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
	        <button type="button" class="btn btn-primary" onclick="regxiaoqucar()">小区车辆登记</button>
	      </div>
	      
	    </div>
	  </div>
   </div>

   <div class="container">
       <h3 class="mt-5 mb-3">小区车辆信息列表</h3>
       <div class="text-right">
       <button class="btn btn-primary mb-2"  data-toggle="modal" data-target="#regxiaoqucarModal">新车辆登记</button>       
       </div>
              <form name="xiaoqucarFrm" action="<c:url value="/loadxiaoqucar"/>" method="get">
              	  
	      		 <div class="row g-3 align-items-center my-2">
	      		 <input type="hidden" name="pageNo" value="1"/>
				  <div class="col-auto">
				    <label class="col-form-label">小区名:</label>
				  </div>
				  <div class="col-2">
				    <input type="text" 
				           name="qryxiaoquname" 
				           class="form-control" placeholder="支持模糊查询" value="${helper.qryxiaoquname}">
				  </div>
				  <div class="col-2">
					  <select class="form-control" name="qrycartype">
					      <option value="">-选择类型-</option>
					         <option value="SUV" <c:if test="${helper.qrycartype=='SUV'}">selected</c:if>>越野车</option>
						     <option value="SUPER" <c:if test="${helper.qrycartype=='SUPER'}">selected</c:if>>跑车</option>  
					  </select>
				  </div>				  
				  <div class="col-2">
					  <select class="form-control" name="qrycarbrand">
					      <option value="">-选择品牌-</option>
						  <option value="BM" <c:if test="${helper.qrycarbrand=='BM'}">selected</c:if>>宝马</option>
						  <option value="BC" <c:if test="${helper.qrycarbrand=='BC'}">selected</c:if>>奔驰</option>
					  </select>
				  </div>
				  <div class="col-2">
					  <select class="form-control" name="qrycarstate">
					      <option value="">-选择状态-</option>
						  <option value="INQU" <c:if test="${helper.qrycarstate=='INQU'}">selected</c:if>>在小区内</option>
						  <option value="NOIN" <c:if test="${helper.qrycarstate=='NOIN'}">selected</c:if>>在外</option>
					  </select>
				  </div>
				  <div class="col-2">
				    <button class="btn btn-primary"> 查 询 </button>
				  </div>
		  		 </div>
	   </form>
       <div class="row">
			<table class="table">
			  <thead>
			    <tr>
			      <th scope="col">小区名称</th>
			      <th scope="col">车牌号</th>
			      <th scope="col">类型</th>
			      <th scope="col">品牌</th>
			      <th scope="col">特征</th>
			      <th scope="col">状态</th>
			      <th scope="col">操作</th>
			    </tr>
			  </thead>
			  <tbody>
			    <c:forEach var="xiaoqucar" items="${page.pageContent}">
			    <tr> 
			      <td>${xiaoqucar.xiaoquname}<br>
			      <td>${xiaoqucar.carnum}</td>
			      <th scope="row">
			        <c:if test="${xiaoqucar.cartype=='SUV'}">越野车</c:if>
			        <c:if test="${xiaoqucar.cartype=='SUPER'}">跑车</c:if>
			      </th>
			      <th scope="row">
			        <c:if test="${xiaoqucar.carbrand=='BM'}">宝马</c:if>
			        <c:if test="${xiaoqucar.carbrand=='BC'}">奔驰</c:if>
			      </th>
			      <td>${xiaoqucar.carfeatures}</td>
			      <th scope="row">
			        <c:if test="${xiaoqucar.carstate=='INQU'}">在小区</c:if>
			        <c:if test="${xiaoqucar.carstate=='NOIN'}">在外</c:if>
			      </th>
			      <td>
			        <button class="btn btn-primary btn-sm" onclick="updatexiaoqucar(&quot;${xiaoqucar.carnum}&quot;)">修改</button>
			        <button class="btn btn-danger btn-sm" onclick="showRemoveDlg(&quot;${xiaoqucar.carnum}&quot;);">删除</button>
			      </td>
			    </tr>
			    </c:forEach>
			  </tbody>
			</table>
			      <!-- 页面情况信息 -->
            <div class="col-12 text-right">
		               共${page.totalRecNum}条, 当前显示${page.startIndex+1}-${page.endIndex}条, 第${page.pageNo}/${page.totalPageNum}页
		            |
		           <c:if test="${page.pageNo>1}">
		             <button class="btn btn-sm btn-outline-info" onclick="doQuery(1)">首页</button>&nbsp;
		           </c:if>
		           <c:if test="${page.prePage}">
		             <button class="btn btn-sm btn-outline-info" onclick="doQuery(${page.pageNo-1})">上一页</button>&nbsp;
		           </c:if>
		           <c:if test="${page.nextPage}">
		             <button class="btn btn-sm btn-outline-info" onclick="doQuery(${page.pageNo+1})">下一页</button>&nbsp;
		           </c:if>
		           <c:if test="${page.pageNo!=page.totalPageNum}">
		             <button class="btn btn-sm btn-outline-info" onclick="doQuery(${page.totalPageNum})">末页</button>&nbsp;
		           </c:if>
		           |
		                      到&nbsp;<input type="text" class="text-center" id="pageNo" size=4 style="text-align:right;"/>&nbsp;页
		           <button class="btn btn-sm btn-success" onclick="doQuery(parseInt($('#pageNo').val()));"> 跳 转 </button>	
	            </div>					      				      
	   </div>
   </div>
</body>
</html>
					
						  