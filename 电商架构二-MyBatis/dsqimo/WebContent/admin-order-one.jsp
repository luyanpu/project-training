<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="js/html5.js"></script>
<script type="text/javascript" src="js/respond.min.js"></script>
<script type="text/javascript" src="js/PIE_IE678.js"></script>
<![endif]-->
<link type="text/css" rel="stylesheet" href="css/H-ui.css" />
<link type="text/css" rel="stylesheet" href="css/H-ui.admin.css" />
<link type="text/css" rel="stylesheet" href="font/font-awesome.min.css" />
<!--[if IE 7]>
<link href="font/font-awesome-ie7.min.css" rel="stylesheet" type="text/css" />
<![endif]-->
<title>图片列表_js代码</title>
</head>
<body>
	<nav class="Hui-breadcrumb">
	<i class="icon-home"></i> 首页 <span class="c-gray en">&gt;</span> 财务管理<span
		class="c-gray en">&gt;</span> 订单列表 <a
		class="btn btn-success radius r mr-20"
		style="line-height: 1.6em; margin-top: 3px"
		href="javascript:location.replace(location.href);" title="刷新"><i
		class="icon-refresh"></i></a></nav>
	<div class="pd-20">
		<form action="/dsqimo/oneorderlist" >
			<div class="text-c">
			<input type="text" name="name" id="" placeholder="用户名"
				style="width: 250px" class="input-text">
			<button name="" id="" class="btn btn-success" type="submit">
				<i class="icon-search"></i> 搜索
			</button>
		</div>
		</form>
		
		<table
			class="table table-border table-bordered table-bg table-hover table-sort">
			<thead>
				<tr class="text-c">
					<th width="40"><input name="" type="checkbox" value=""></th>
					<th width="80">ID</th>
					<th width="100">用户名</th>
					<th>下单日期</th>
					<th width="150">商品名</th>
					<th width="150">数目</th>
					<th width="60">状态</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${oneorder }" var="p">
					<tr class="text-c">
						<td><input name="check" type="checkbox" value="${p.id }"></td>
						<td>${p.id }</td>
						<td>${p.name }</td>
						<td>${p.date }</td>
						<td>${p.product }</td>
						<td>${p.count }</td>
						
						<c:if test="${p.state==1 }">
							<td><span class="label label-success">已完成</span></td>
						</c:if>
						<c:if test="${p.state==0 }">
							<td><span class="label label-success">未付款</span></td>
						</c:if>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div id="pageNav" class="pageNav"></div>
		
	</div>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="layer/layer.min.js"></script>
	<script type="text/javascript" src="js/pagenav.cn.js"></script>
	<script type="text/javascript"
		src="plugin/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="js/H-ui.js"></script>
	<script type="text/javascript" src="js/H-ui.admin.js"></script>
</body>
</html>