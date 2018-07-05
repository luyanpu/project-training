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
<title>分类管理_js代码</title>
</head>
<body>
	<nav class="Hui-breadcrumb">
	<i class="icon-home"></i> 首页 <span class="c-gray en">&gt;</span> 资讯管理 <span
		class="c-gray en">&gt;</span> 分类管理 <a
		class="btn btn-success radius r mr-20"
		style="line-height: 1.6em; margin-top: 3px"
		href="javascript:location.replace(location.href);" title="刷新"><i
		class="icon-refresh"></i></a></nav>
	<div class="pd-20 text-c">

		<div class="cl pd-5 bg-1 bk-gray">
			<span class="l"> <a href="javascript:;" onClick="datadel()"
				class="btn btn-danger radius"><i class="icon-trash"></i> 批量删除</a>
			</span>
			<form class="Huiform" action="/dsqimo/articleClassAdd" method="post">
				<input type="hidden" id="hid_ccid" value=""> <input
					class="input-text" style="width: 250px" type="text" value=""
					placeholder="输入分类" name="name">
				<button type="submit" class="btn btn-success">
					<i class="icon-plus"></i> 添加
				</button>
			</form>
		</div>
		<div class="article-class-list cl mt-20">
			<form action="/dsqimo/articleClassDeleteAll" method="post" id="myForm">
				<table
					class="table table-border table-bordered table-hover table-bg">
					<thead>
						<tr class="text-c">
							<th width="25"><input type="checkbox" name="" value=""></th>
							<th width="80">ID</th>
							<th>分类名称</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${producttypelist }" var="p">
							<tr class="text-c">
								<td><input type="checkbox" name="check" value="${p.id }"></td>
								<td class="text-l">${p.id }</td>
								<td class="text-l">${p.name }</td>
								<!--  <td class="f-14"><a title="编辑" href="javascript:;"
									onClick="article_class_edit('1','620','160','分类编辑','article-class-edit.html')"
									style="text-decoration: none"><i class="icon-edit"></i></a> <a
									title="删除" href="javascript:;"
									onClick="article_class_del(this,'1')" class="ml-5"
									style="text-decoration: none"><i class="icon-trash"></i></a></td>-->
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</form>
		</div>
	</div>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/Validform_v5.3.2_min.js"></script>
	<script type="text/javascript" src="layer/layer.min.js"></script>
	<script type="text/javascript" src="js/H-ui.js"></script>
	<script type="text/javascript" src="js/H-ui.admin.js"></script>

</body>
</html>