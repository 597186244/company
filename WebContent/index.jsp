<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<title>登陆</title>

		<link href="resource/css/bootstrap.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="resource/css/font-awesome.min.css" />

		<link rel="stylesheet" href="http://fonts.useso.com/css?family=Open+Sans:400,300" />
		<link rel="stylesheet" href="resource/css/ace.min.css" />
		<link rel="stylesheet" href="resource/css/ace-rtl.min.css" />
        <script src="resource/js/jquery-2.0.3.min.js"></script>
        <script src="resource/js/bootstrap.min.js"></script>
        <script src="resource/js/jquery.cookie.js"></script>
        <script language="javascript" type="text/javascript">
			if(top.location!=self.location)top.location=self.location;
		</script>
        <script>
        	$(document).ready(function() {
        		if($.cookie("username")!=""){
        		$("#username").val($.cookie("username"))
        		$("#password").val($.cookie("password"))
        		$("#remamberPassword").attr("checked",true)
        		}
				$("#submit").click(function(){
					
					if($("#remamberPassword").is(":checked")){
						 var c_username=$("#username").val();
						 var c_password=$("#password").val();
						$.cookie("username",c_username,{ expires: 7 })
						$.cookie("password",c_password,{ expires: 7 })
					}else{
						$.cookie("username","")
						$.cookie("password","")
					}
					if($("#username").val()==""){
						$("#username").popover({
							content:"请输入用户名",
							trigger:"manual"
							});
						$("#username").popover("show")
						return false
						}else if($("#password").val()==""){
					      
							$("#password").popover({
								
								content:"请输入密码",
								trigger:"manual"
								});
								$("#password").popover("show")

							return false }else{
								
								return true}
					
					})
					
            });
        
    
        </script>
	</head>
	
	<body class="login-layout">	
		
		<% session.invalidate();%>
		<div class="main-container">
			<div class="main-content">
				<div class="row">
					<div class="col-sm-10 col-sm-offset-1">
						<div class="login-container">
							<div class="center">
								<h1>
									<i class="icon-leaf green"></i>
									
									<span class="white">公司管理系统</span>
								</h1>
								
							</div>
							
							<div class="space-6"></div>
							
							<div class="position-relative">
								<div id="login-box" class="login-box visible widget-box no-border">
                                
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header blue lighter bigger" id="msg">
												<i class="icon-coffee"></i>
												请输入你的信息
										  </h4>

											<div class="space-6"></div>

											<form action="loginAction.do" method="post" id="form">
												<fieldset>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" class="form-control" placeholder="用户名" id="username"  name="username" data-container="body" data-toggle="popover" data-placement="right" 
			/>
															<i class="icon-user"></i>
														</span>
													</label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" class="form-control" placeholder="密码" id="password"  name="password" data-container="body" data-toggle="popover" data-placement="right" 
			/>
															<i class="icon-lock"></i>
														</span>
													</label>

													<div class="space"></div>

													<div class="clearfix">
														<label class="inline">
															<input type="checkbox" class="ace" id="remamberPassword"/>
															<span class="lbl"> 记住密码</span>
														</label>

														<button type="submit" class="width-35 pull-right btn btn-sm btn-primary" id="submit">
															<i class="icon-key"></i>
															登陆
														</button>
													</div>

													<div class="space-4"></div>
												</fieldset>
											</form>
												<div class="center alert-danger" >
                            						<h3 style="color:red">${requestScope.error}</h3>
                          						  </div>
										</div><!-- /widget-main -->

										
									</div><!-- /widget-body -->
								</div><!-- /login-box -->
</body>
</html>
