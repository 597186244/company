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
	<script src="resource/js/jquery-2.0.3.min.js"></script>
	<script src="resource/js/bootstrap.min.js"></script>
	<style>
		th{
		   color: #fff;
 		   background-color: #438eb9;
  			border-color: #269abc;
  			}
  		
	</style>
	<script>
		$(document).ready(function(){
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
      
        <tr >
       
            <th data-field="productName">名称</th>
            <th data-field="productBuyPrice">买入价格</th>
              <th data-field="productSoldPrice">卖出价格</th>
             <th data-field="productCategory">类型</th>
              <th data-field="stock">库存</th>
        </tr>
        </thead>
    </table>
    
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