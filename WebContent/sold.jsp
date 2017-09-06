<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resource/css/bootstrap.min.css"> 
    <link rel="stylesheet" href="resource/css/bootstrap-table.min.css">
	<link rel="stylesheet" href="resource/css/font-awesome.min.css" />
	<link rel="stylesheet" href="resource/css/bootstrap-select.min.css">
	<script src="resource/js/jquery-2.0.3.min.js"></script>
	<script src="resource/js/bootstrap.min.js"></script>
	<script src="resource/js/bootstrap-select.min.js"></script>
	<style>
	.vertical-center{
  position: absolute;
  top: 30%;
  left: 40%;
  transform: translate(-50%, -50%);}
</style>
<script>
	$(document).ready(function(){
	
		$.ajax({
			url:"purchase.do",
			data:{},
			dataType:"json",
			type:"post",
			success:function(data){
				temp=data
				var str=""
				for(var i=0;i<data.length;i++){
					str+="<option value="+i+">"+data[i].productName+"</option>"				
				}
				$("#productName").append(str)				
				$("#productName").selectpicker('refresh');
	
			},
			error:function(){
				alert("获取失败")
			}
		})
		$("#productName").change(function money(){
			$("#hidden").val(temp[$("#productName").val()].productNo)
			$("#money").val(temp[$("#productName").val()].productSoldPrice*$("#number").val())
			$("#stock").val(temp[$("#productName").val()].stock)
		})
		$("#number").keyup(function(){
			$("#money").val(temp[$("#productName").val()].productSoldPrice*$("#number").val())
		})
	})
</script>
</script>
</head>
<body>
<div class="vertical-center">
<form class="form-horizontal" role="form" action="sold.do" method="post">
					${requestScope.msg }
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="oldPassword" >请选择出售的产品</label>

										<div class="col-sm-9">
										<select id="productName" class="selectpicker" data-live-search="true"><option selected="selected" value=-1>请选择</option></select>

										</div>
									</div>
									<div class="space-4"></div>									
										<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-2" > 库存  </label>
									
										<div class="col-sm-9">
											<input type="text" id="stock"  readonly="true" name="stock" value=0 size=100 class="col-xs-10 col-sm-5" data-container="body" data-toggle="popover" data-placement="right" />
											<span class="help-inline col-xs-19 col-sm-7">
												
											</span>
										</div>
									</div>
									<div class="space-4"></div>
																		<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-2" > 数量 </label>

										<div class="col-sm-9">
											<input type="number"  required="required"  id="number" value=1 placeholder="请输入一个正整数" name="number"class="col-xs-10 col-sm-5"  data-container="body" data-toggle="popover" data-placement="right" />
												<span class="help-inline col-xs-19 col-sm-7">
											</span>
										</div>
									</div>

									<div class="space-4"></div>									
										<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-2" > 金额  </label>
									
										<div class="col-sm-9">
											<input type="text" id="money"  readonly="true" name="money" value=0 size=100 class="col-xs-10 col-sm-5" data-container="body" data-toggle="popover" data-placement="right" />
											<span class="help-inline col-xs-19 col-sm-7">
												
											</span>
										</div>
									</div>

									<div class="space-4"></div>
									<input type="hidden" name="productNo" id="hidden">
									<div class="clearfix form-actions">
										<div class="col-md-offset-3 col-md-9">
											<button class="btn btn-info" type="submit" id="passwordSubmit">
												<i class="icon-ok bigger-110"  ></i>
												确 定
											</button>

											&nbsp; &nbsp; &nbsp;
											<button class="btn" type="reset">
												<i class="icon-undo bigger-110"></i>
												清 空
											</button>
										</div>
									</div>
									
									
									</form>
									</div>
</body>
</html>