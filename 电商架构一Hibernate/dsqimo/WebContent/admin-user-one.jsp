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
<title>用户管理_js代码</title>
</head>
<body>
	<nav class="Hui-breadcrumb"> <i class="icon-home"></i> 首页 <span
		class="c-gray en">&gt;</span> 用户中心 <span class="c-gray en">&gt;</span>
	用户管理 <a class="btn btn-success radius r mr-20"
		style="line-height: 1.6em; margin-top: 3px"
		href="javascript:location.replace(location.href);" title="刷新"><i
		class="icon-refresh"></i></a></nav>
	<div class="pd-20">
		<div class="text-c">
			<form action="/dsqimo/searchName">
				<input type="text" class="input-text" style="width: 250px"
				placeholder="用户名" id="" name="name">
			<button type="submit" class="btn btn-success" id="" name="">
				<i class="icon-search"></i> 搜用户
			</button>
			</form>
			

		</div>
		<div class="cl pd-5 bg-1 bk-gray mt-20">
			<span class="l"><a href="javascript:;" onClick="datadel()"
				class="btn btn-danger radius"><i class="icon-trash"></i> 批量删除</a> <a
				href="javascript:;"
				onClick="user_add('550','','添加用户','admin-user-add.html')"
				class="btn btn-primary radius"><i class="icon-plus"></i> 添加用户</a></span> <span
				class="r">共有数据：<strong>1</strong> 条
			</span>
		</div>
		<c:if test="${thisuser==null }">
			<h1>不存在用户</h1>
		</c:if>
		<c:if test="${thisuser!=null }">
			<form action="/dsqimo/userDeleteAll" method="post" id="myForm">
		<table
			class="table table-border table-bordered table-hover table-bg table-sort">
			<thead>
				<tr class="text-c">
					<th width="25"><input type="checkbox" name="" value=""></th>
					<th width="80">ID</th>
					<th width="100">用户名</th>
					<th width="40">性别</th>
					<th width="90">手机</th>
					<th width="150">邮箱</th>
					<th width="">地址</th>
					<th width="130">加入时间</th>
					<th width="70">状态</th>
				
				</tr>
			</thead>
			<tbody>
					<tr class="text-c">
						<td><input type="checkbox" value="${thisuser.id }" name="check"></td>
						<td>${thisuser.id }</td>

						<td><u style="cursor: pointer" class="text-primary"
							onclick="user_show('10001','360','','详细信息','admin-user-show.jsp?name=${thisuser.name }&email=${thisuser.email }')">${thisuser.name }</u></td>
						<td>男</td>
						<td>13000000000</td>
						<td>${thisuser.email }</td>
						<td class="text-l">北京市 海淀区</td>
						<td>2014-6-11 11:11:42</td>
						<c:if test="${thisuser.state==0 }">
							<td class="user-status"><span class="label">未启用</span></td>
						</c:if>
						<c:if test="${thisuser.state==1 }">
							<td class="user-status"><span class="label label-success">已启用</span></td>
						</c:if>
						<%--这里是操作框 --%>
						

					</tr>
			</tbody>
		</table>
		</form>
		</c:if>
	</div>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="layer/layer.min.js"></script>
	<script type="text/javascript" src="js/pagenav.cn.js"></script>
	<script type="text/javascript" src="js/H-ui.js"></script>
	<script type="text/javascript"
		src="plugin/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="js/H-ui.admin.js"></script>
	<script type="text/javascript">
		
	</script>

</body>
</html>
