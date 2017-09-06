<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <link rel="stylesheet" href="resource/css/bootstrap.min.css"> 
    <link rel="stylesheet" href="resource/css/bootstrap-table.min.css">
	<link rel="stylesheet" href="resource/css/font-awesome.min.css" />
	<script src="resource/js/jquery-2.0.3.min.js"></script>
	<script src="resource/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	$(document).ready(function(){
		function check(data){
			for(var i=0;i<4;i++){
				if(data[0].product.charAt(i)==1){
					$(":checkbox[id='product']").eq(i).prop("checked",true)
				}
			}
		for(var i=0;i<4;i++){
				if(data[0].employee.charAt(i)==1){
					$(":checkbox[id='employee']").eq(i).prop("checked",true)
				}
			}
		for(var i=0;i<4;i++){
			if(data[0].stock.charAt(i)==1){
				$(":checkbox[id='stock']").eq(i).prop("checked",true)
			}
		}
		for(var i=0;i<4;i++){
		if(data[0].permission.charAt(i)==1){
			$(":checkbox[id='permission']").prop("checked",true)
			}
		}
		}
		$.ajax({
			url:"permission.do",
			cache:false,
			dataType:"json",
			success:function(data){
				check(data)
			}
		})
		$(":checkbox").change(function(){
			var product=""
			var stock=""
			var employee=""
			var permission=""
			for(var i=0;i<4;i++){
				if($(":checkbox[id='product']:checked").eq(i).val()!=undefined){
				product+=$(":checkbox[id='product']:checked").eq(i).val()
				}
				if($(":checkbox[id='stock']:checked").eq(i).val()!=undefined){
				stock+=$(":checkbox[id='stock']:checked").eq(i).val()}
				if($(":checkbox[id='employee']:checked").eq(i).val()!=undefined){
				employee+=$(":checkbox[id='employee']:checked").eq(i).val()}
				if($(":checkbox[id='permission']:checked").eq(i).val()!=undefined){
				permission+=$(":checkbox[id='permission']:checked").eq(i).val()}
				
			}
			var d={
					"role":1,				
					"product":0,
					"stock":0,
					"employee":0,
					"permission":0
			}	
			if(product.match(/[0-9]+/)!=null){
			d.product=parseInt(product.match(/[0-9]+/))
			}
			if(stock.match(/[0-9]+/)!=null){
			d.stock=parseInt(stock.match(/[0-9]+/))
			}
			if(employee.match(/[0-9]+/)!=null){
			d.employee=parseInt(employee.match(/[0-9]+/))
			}
			if(permission.match(/[0-9]+/)!=null){
			d.permission=parseInt(permission.match(/[0-9]+/))
			}
		
			 var data=JSON.stringify(d)
			$.ajax({
				url:"changePermission.do",
				data:{"permission":"["+data+"]"},
				dataType:"json",
				success:function(){

				},
				error:function(){
					alert("error!!!")
				}
			})
		})
			
	})
</script>

</head>
<body>
<div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			<div class="accordion" id="accordion">
				<div class="accordion-group">
					<div class="accordion-heading">
						 <a class="accordion-toggle collapsed btn btn-block btn-info" data-toggle="collapse" data-parent="accordion" href="#permission1">产品种类管理</a>
					</div>
					<div id="permission1" class="accordion-body collapse">
						<div class="accordion-inner">
						<br>
						<br>
							<div align="center">
						   <label class="checkbox-inline">
						      <input type="checkbox" id="product" value="8"> 增加
						   </label>
						   <label class="checkbox-inline">
						      <input type="checkbox" id="product" value="4"> 删除
						   </label>
						   <label class="checkbox-inline">
						      <input type="checkbox" id="product" value="2"> 修改
						   </label>
						   <label class="checkbox-inline">
						      <input type="checkbox" id="product" value="1"> 查询
						   </label>
						   </div>
						</div>
					</div>
				</div>
				<br>
				
				<br>
				<div class="accordion-group">
					<div class="accordion-heading">
						 <a class="accordion-toggle collapsed btn btn-block btn-info" data-toggle="collapse" data-parent="accordion" href="#permission2">库存管理</a>
					</div>
					<div id="permission2" class="accordion-body collapse">
						<div class="accordion-inner">
						<br>
						<br>
							<div align="center">
						   <label class="checkbox-inline">
						      <input type="checkbox" id="stock" value="8"> 库存查询
						   </label>
						   <label class="checkbox-inline">
						      <input type="checkbox" id="stock" value="4"> 产品购入
						   </label>
						   <label class="checkbox-inline">
						      <input type="checkbox" id="stock" value="2"> 产品售出
						   </label>
						   <label class="checkbox-inline">
						      <input type="checkbox" id="stock" value="1"> 出入库信息查询
						   </label>
						   </div>
						</div>
					</div>
				</div>
				<br>
				
				<br>
				<div class="accordion-group">
					<div class="accordion-heading">
						 <a class="accordion-toggle collapsed btn btn-block btn-info" data-toggle="collapse" data-parent="accordion" href="#permission3">员工管理</a>
					</div>
					<div id="permission3" class="accordion-body collapse">
						<div class="accordion-inner">
						<br>
						<br>
							<div align="center">
						   <label class="checkbox-inline">
						      <input type="checkbox" id="employee" value="8"> 增加
						   </label>
						   <label class="checkbox-inline">
						      <input type="checkbox" id="employee" value="4"> 删除
						   </label>
						   <label class="checkbox-inline">
						      <input type="checkbox" id="employee" value="2"> 修改
						   </label>
						   <label class="checkbox-inline">
						      <input type="checkbox" id="employee" value="1"> 查询
						   </label>
						   </div>
						</div>
					</div>
				</div>
				<br>
			
				<br>
				<div class="accordion-group">
					<div class="accordion-heading">
						 <a class="accordion-toggle collapsed btn btn-block btn-info" data-toggle="collapse" data-parent="accordion" href="#permission4">权限管理</a>
					</div>
					<div id="permission4" class="accordion-body collapse">
						<div class="accordion-inner">
						<br>
						<br>
							<div align="center">
						   <label class="checkbox-inline">
						      <input type="checkbox" id="permission" value="1"> 权限修改
						   </label>
						   </div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>