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
				
				url:"productList.do?zz"+new Date(),
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
					url:"productDelete.do?zz"+(new Date()).valueOf(),
					data:{"checked":jsonString},
					timeout : 60000,
					traditional:true,
					type:"post",
					 cache: false,
					 success:function(){
						alert("删除成功！")
						
					 },
					error:function(XMLHttpRequest, textStatus, errorThrown){
						alert("error");
						alert(XMLHttpRequest.status);
                        alert(XMLHttpRequest.readyState);
                        alert(textStatus);
                       
					},
					 complete:function(){
						 $.ajax({
								
								url:"productList.do?zz"+new Date(),
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
				$("#productNo").attr("readonly",false)
				 $("#form")[0].reset()
			})
			$("#productNo").change(function check(){
				a=0
				if($(this).val().length>=1){
				
				if($(this).val().match(/^[0-9]\d{4}[0-9]$/)!=null){					
					$("#tip").hide()
					var productNo=$(this).val()
					$.ajax({
					url:"productNoCheck.do?zz"+(new Date()).valueOf(),
					data:{"productNo":productNo},
					timeout : 60000,
					type:"post",
					cache: false,
					success:function(data){
						if(data=="success"){
							$("#tip").text("")
							a=1
						}else{
							$("#tip").text("该编号已存在")
							$("#tip").show()
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
					$("#tip").text("非法数据！")
					$("#tip").show()
				}	
				}else{
					$("#tip").text("")
				}
			
			})
			$("#modalSubmit").click(function(){
				if(a==1){
					$.ajax({
		                cache: false,
		                type: "POST",
		                url:"productAdd.do?zz"+(new Date()).valueOf(),
		                data:$('#form').serialize(),
		                error: function(request) {
		                    alert("Connection error");
		                },
		                success: function(data) {
		                	if(data=="success"){
		                   alert("操作成功！")
		                	location.replace("productList.jsp")
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
					$("#productNo").attr("readonly",true)
					$("#productNo").val(array[0].productNo)
					$("#productName").val(array[0].productName)
					$("#productBuyPrice").val(array[0].productBuyPrice)
					$("#productCategory").val(array[0].productCategory)
					$("#productNote").val(array[0].productNote)
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
            <th data-field="productNo" data-formatter="idFormatter">编号</th>
            <th data-field="productName">名称</th>
            <th data-field="productBuyPrice">买入价格</th>
            <th data-field="productSoldPrice">卖出价格</th>
             <th data-field="productCategory">类型</th>
              <th data-field="productNote">备注</th>
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
				<form method="post"  id="form" class="form-horizontal" style="text-align:center" role="form" action="productAdd.do" method="post">
					<div class="form-group">
						<label >编号：&nbsp; &nbsp; &nbsp;</label>
						<input type="number" name="productNo" style="width: 176px"min="0" max="6" id="productNo"required="required" placeholder="请输入6位整数" ><span class="tipSpan"style="color:red;display:none" id="tip"></span>
					</div>
					<div class="form-group">
						<label >名称：&nbsp; &nbsp; &nbsp;</label>
						<input type="text" class="text"  name="productName"  id="productName" required="required" placeholder="请输入名称">
					</div>
					<div class="form-group">
						<label >价格：&nbsp; &nbsp; &nbsp;</label>
						<input type="number" class="text" name="productBuyPrice" id="productBuyPrice"required="required" placeholder="请输入价格">
					</div>
					<div class="form-group" >
						<label >类型：&nbsp; &nbsp; &nbsp;</label>
						<input type="text" class="text" name="productCategory" id="productCategory"required="required" placeholder="请输入类型">
					</div>
					<div class="form-group" >
						<label >备注：&nbsp; &nbsp; &nbsp;</label>
						<input type="text" class="text" name="productNote"  id="productNote"placeholder="此处选填">
					</div>
					
				
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
