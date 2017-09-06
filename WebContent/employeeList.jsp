<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resource/css/bootstrap.min.css"> 
    <link rel="stylesheet" href="resource/css/bootstrap-table.min.css">
	<link rel="stylesheet" href="resource/css/font-awesome.min.css" />
	<script src="resource/js/jquery-2.0.3.min.js"></script>
	<script src="resource/js/bootstrap.min.js"></script>
	<style>
		th{
		   color: #fff;
 		   background-color: #438eb9;
  			border-color: #269abc;
  			}
  	.tipSpan{
  		position: absolute;
 		 left: 83%;
 		transform: translate(-50%, -50%)
  	}
	.delete{
  position: absolute;
  top: 5%;
  left: 80%;
 transform: translate(-50%, -50%)
  }
  .add{
  position: absolute;
  top: 5%;
  left: 73%;
 transform: translate(-50%, -50%)
  }
   .update{
  position: absolute;
  top: 5%;
  left: 87%;
 transform: translate(-50%, -50%)
  }

	</style>
	
	<script>
		$(document).ready(
		function init() {
			
			$.ajax({
				
				url:"employeeList.do?zz"+new Date(),
				data:{},
				 cache: false,
				type:"post",
				success:function(data){
		
					$("#table").bootstrapTable("load",data)
				},
				error:function(){
					$("#table").bootstrapTable("load",data)
				}
			})

			$("#delete").click(function(){
				 jsonString=JSON.stringify($("#table").bootstrapTable("getSelections"))
				if(jsonString=="[]"){
					alert("请选择要删除的记录")
					return false
				}
				$.ajax({
					url:"employeeDelete.do?zz"+(new Date()).valueOf(),
					data:{"checked":jsonString},
					timeout : 60000,
					traditional:true,
					type:"post",
					 cache: false,
					 success:function(data){
						 if(data[0].msg=="success"){
						alert("删除成功！")
						 }else{
							 alert("删除失败！")
						 }
						
					 },
					error:function(XMLHttpRequest, textStatus, errorThrown){
						alert("error");
						alert(XMLHttpRequest.status);
                        alert(XMLHttpRequest.readyState);
                        alert(textStatus);
                       
					},
					 complete:function(){
						 $.ajax({
								
								url:"employeeList.do?zz"+new Date(),
								data:{},
								 cache: false,
								type:"post",
								success:function(data){
						
									$("#table").bootstrapTable("load",data)
								},
								error:function(){
									$("#table").bootstrapTable("load",data)
								}
							})
					 }
					
				})

			})			
			
			$("#add").click(function(){
				$("#username").attr("readonly",false)
				 $("#form")[0].reset()
			})
			$("#username").change(function check(){
				a=0
				if($(this).val().length>=1){
				
				if($(this).val().match(/^(([a-z]|[0-9])([a-z]|[0-9])+([a-z]|[0-9])$)/)!=null){					
					$("#tip").hide()
					var username=$(this).val()
					$.ajax({
					url:"usernameCheck.do?zz"+(new Date()).valueOf(),
					data:{"username":username},
					timeout : 60000,
					type:"post",
					cache: false,
					success:function(data){
						if(data=="success"){
							$("#tip1").text("")
							a=1
						}else{
							$("#tip1").text("该用户名已被使用")
							$("#tip1").show()
							a=0
						}				
					 },
					error:function(){
						alert("error")					
						a=0
					},
					complete:function(){						
					}
					})
				}else{
					a=0
					$("#tip1").text("非法数据！")
					$("#tip1").show()
				}	
				}else{
					$("#tip1").text("")
				}
			
			})
			$("#modalSubmit").click(function(){
				if(a==1){
					$.ajax({
		                cache: false,
		                type: "POST",
		                url:"employeeAdd.do?zz"+(new Date()).valueOf(),
		                data:$('#form').serialize(),
		                error: function(request) {
		                    alert("Connection error");
		                },
		                success: function(data) {
		                	if(data=="success"){
		                   alert("操作成功！")
		                	location.replace("employeeList.jsp")
		                	}else{
		                		alert("添加失败！")
		                	}
		                }
		            });
					
				}else{
					return false
				}
				return false
			})
			$("#update").click(function(){
				var array = $("#table").bootstrapTable("getSelections")
				
			
				if(array.length<1){
					alert("请选择要修改的记录")
					a=0
					return false
				}else
				if(array.length>1){
					alert("请勿多选！")
					a=0
					return false
				}else{
					$("#username").attr("readonly",true)
					$("#username").val(array[0].username)
					$("#password").val(array[0].password)
					$("#employeeName").val(array[0].employeeName)
					$("#employeeAge").val(array[0].employeeAge)
					$("#role").val(array[0].role)
					a=1
				}
			})
		})
		
	</script>
</head>
<body>
<div class="container">
    <table id="table"
           data-toggle="table"
           data-search="true"
           data-pagination="true"
           data-striped="true"
           data-page-size=5
           data-search-align="left"
           data-sort-name="productNo"
           >
        
        <thead>
        <a class="add btn btn-success" id="add" data-toggle="modal" data-target="#modal" >
        <i class="icon-plus icon-large"></i>
        	添加
        </a>
        <a class="delete btn btn-danger"  id="delete">
        <i class="icon-trash icon-large"></i>
        	删除
        </a>
        </a>
        <a class="update btn btn-warning"  id="update" data-toggle="modal" data-target="#modal">
        <i class="icon-pencil icon-large"></i>
        	修改
        </a>
        <tr >
          <th data-field="state" data-checkbox="true" ></th>
            <th data-field="username">用户名</th>
            <th data-field="password">密码</th>
            <th data-field="employeeName">姓名</th>
             <th data-field="employeeAge">年龄</th>
              <th data-field="role">角色</th>
        </tr>
        </thead>
    </table>
    
</div>
<!-- 模态框 -->
<div class="modal fade" id="modal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header" >
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<div>				
				<h4 class="modal-title"  id="myModalLabel" >
					<i class="icon-exclamation-sign"></i>输入信息
				</h4>
			
			</div>
			<div class="modal-body">
				<form method="post"  id="form" class="form-horizontal"  role="form" action="employeeAdd.do" method="post">
					
					<table border="0" align="center" >
					<tr>
						<td>
							用户名：&nbsp; &nbsp; &nbsp;
						</td>
						
						<td>
							<input type="text" name="username" style="width: 176px"min="0" max="6" id="username"required="required" placeholder="只允许数字和字母" >
						</td>
						<td><span class="tipSpan"style="color:red;display:none" id="tip1"></span></td>
					</tr>
					<tr>
						<td>密	 码：&nbsp; &nbsp; &nbsp;</td>
						<td><input type="password" class="text"  name="password"  id="password" required="required" placeholder="请输入密码"></td>
						<td><span class="tipSpan"style="color:red;display:none" id="tip2"></span></td>
					</tr>
					<tr>
						<td>姓	 名：&nbsp; &nbsp; &nbsp;</td>
						<td><input type="text" class="text" name="employeeName" id="employeeName"required="required" placeholder="请输入姓名"></td>
						<td><span class="tipSpan"style="color:red;display:none" id="tip3"></span></td>
					</tr>
					<tr>
						<td>年	 龄：&nbsp; &nbsp; &nbsp;</td>
						<td><input type="number" class="text" name="employeeAge" id="employeeAge"required="required" placeholder="请输入年龄"></td>
						<td><span class="tipSpan"style="color:red;display:none" id="tip4"></span></td>
					</tr>
					<tr>
						<td >角  色：&nbsp; &nbsp; &nbsp;</td>
						<td><select name="role">
							<option value=1 selected="selected">普通人</option>
							<option value=2>采购员</option>
							<option value=3>售货员</option>
							<option value=4>管理员</option>
						</select></td>
						<td><span class="tipSpan"style="color:red;display:none" id="tip5"></span></td>
					</tr>
					</table>
				
			</div>
			<div class="modal-footer" style="text-align:center">
				
				<button type=button class="btn btn-primary" id="modalSubmit">
					确定
				</button>
				&nbsp; &nbsp; &nbsp;
				<button type="button" class="btn btn-default" data-dismiss="modal">取消
				</button>
			</div>
			
			</form>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>


<script src="resource/js/jquery.min.js"></script>
<script src="resource/js/bootstrap.min.js"></script>
<!--<script src="assets/bootstrap2.3/js/bootstrap.min.js"></script>-->
<script src="resource/js/tableExport.js"></script>
<script src="resource/js/jquery.base64.js"></script>
<script src="resource/js/bootstrap-table.js"></script>
<script src="resource/js/bootstrap-table-export.js"></script>

</body>
</html>
