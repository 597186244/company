<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="resource/css/bootstrap.min.css" rel="stylesheet" />
<script src="resource/js/jquery-2.0.3.min.js"></script>
<script src="resource/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="resource/css/font-awesome.min.css" />

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	.vertical-center{
  position: absolute;
  top: 30%;
  left: 40%;
  transform: translate(-50%, -50%);}
</style>
<script>

	$(document).ready(function(){
		
		$("#passwordSubmit").click(function(){
			if(a==0){
				return false
			}else{
				return true
			}
			
		})
		
	})
	var a=1
	function check1(){
			 var val1 = $("#newPassword").val()
			 var val2 = $("#newpassword2").val()
			 if(val2==""){
			if(val1.length>=6){
				$("#icon-ok").show()
				$("#icon-error").hide()
			}else{
				$("#icon-error").show()
				$("#icon-ok").hide()
			}
			 }else{
				 check2()
			 }
			
		}
	function check2(){
		var val1 = $("#newPassword").val()
		 var val2 = $("#newpassword2").val()
		if(val1!=val2||val1.length<6){
			$("#icon-error").show()
			$("#icon-ok").hide()
			$("#icon-error2").show()
			$("#icon-ok2").hide()
			a=0
		}else{
			$("#icon-ok").show()
			$("#icon-error").hide()
			$("#icon-ok2").show()
			$("#icon-error2").hide()
			a=1
		}
	}
</script>
</head>
<body >
	
	<div class="vertical-center">
		${requestScope.msg2 }
		<form class="form-horizontal" role="form" action="passwordChange.do" method="post">
					
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="oldPassword" >请输入 原密码</label>

										<div class="col-sm-9">
										
											<input type="password"  required="required" id="oldPassword"  name="oldPassword" placeholder="Password" class="col-xs-10 col-sm-5"  size="100"  data-container="body" data-toggle="popover" data-placement="right"  />
											
										</div>
									</div>

									<div class="space-4"></div>
																		<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-2" > 请输入新密码 </label>

										<div class="col-sm-9">
											<input type="password"  required="required"  id="newPassword" placeholder="长度不得小于6位" name="newPassword"class="col-xs-10 col-sm-5"  size="100"  onchange="check1()" data-container="body" data-toggle="popover" data-placement="right" />
												<span class="help-inline col-xs-19 col-sm-7">
												<i class="icon-ok-sign"  style="color:green;font-size:23px;display:none" id="icon-ok" ></i>
												<i class="icon-remove-circle"  style="color:red;font-size:23px;display:none" id="icon-error" ></i>
											</span>
										</div>
									</div>

									<div class="space-4"></div>									
										<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-2" > 再次输入  </label>

										<div class="col-sm-9">
											<input type="password"  required="required" id="newpassword2" placeholder="注意大小写" class="col-xs-10 col-sm-5"  size="100" onchange="check2()" data-container="body" data-toggle="popover" data-placement="right" />
											<span class="help-inline col-xs-19 col-sm-7">
												<i class="icon-ok-sign"  style="color:green;font-size:23px;display:none" id="icon-ok2" ></i>
												<i class="icon-remove-circle"  style="color:red;font-size:23px;display:none" id="icon-error2" ></i>
											</span>
										</div>
									</div>

									<div class="space-4"></div>

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
									<input type="hidden" name="username" value=${sessionScope.user.username} >								
									<input type="hidden" name="employeeNo" value=${sessionScope.user.employeeNo} >								
									<input type="hidden" name="employeeAge" value=${sessionScope.user.employeeAge} >								
									<input type="hidden" name="employeeName" value=${sessionScope.user.employeeName} >								
									<input type="hidden" name="role" value=${sessionScope.user.role} >								
									
									</form>
									</div>
										<% if(request.getAttribute("flg")=="1"){
													out.print("<script>$('#oldPassword').popover({content:'密码打错啦！',trigger:'manual'});$('#oldPassword').popover('show')</script>");
										} %>
										
</body>
</html>