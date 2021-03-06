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
	<i class="icon-home"></i> 首页 <span class="c-gray en">&gt;</span> 产品库 <span
		class="c-gray en">&gt;</span> 产品列表 <a
		class="btn btn-success radius r mr-20"
		style="line-height: 1.6em; margin-top: 3px"
		href="javascript:location.replace(location.href);" title="刷新"><i
		class="icon-refresh"></i></a></nav>
	<div class="pd-20">
		<div class="text-c">
			<form action="/dsqimo/searchProductName">
				<input type="text" name="name" id="" placeholder=" 产品名称"
				style="width: 250px" class="input-text">
			<button name="" id="" class="btn btn-success" type="submit">
				<i class="icon-search"></i> 搜索
			</button>
			</form>
			
		</div>
		<div class="cl pd-5 bg-1 bk-gray mt-20">
			<span class="l"> <a href="javascript:;" onClick="datadel()"
				class="btn btn-danger radius"> <i class="icon-trash"></i> 批量删除
			</a> <a class="btn btn-primary radius"
				onClick="picture_add('','','添加图片','admin-product-add.jsp')"
				href="javascript:;"> <i class="icon-plus"></i> 添加
			</a>
			</span> <span class="r">共有数据：<strong>${count }</strong> 条
			</span>
		</div>
		<form id="myForm" method="post" action="/dsqimo/backProductDeleteAll">
		<table
			class="table table-border table-bordered table-bg table-hover table-sort">
			<thead>
				<tr class="text-c">
					<th width="40"><input name="" type="checkbox" value=""></th>
					<th width="80">ID</th>
					
					<th width="150">品牌</th>
					<th>图片名称</th>
					<th width="150">价格(元)</th>
					<th width="150">更新时间</th>
					<th width="60">修改</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${prolist }" var="p">
					<tr class="text-c">
						<td><input name="check" type="checkbox" value="${p.id }"></td>
						<td>${p.id }</td>
						
						<td>${p.name }</td>
						<td class="text-l"><a class="maincolor"
							href="/dsqimo/images/pic${p.id }.jpg">${p.name }高清图</a></td>
						<td class="text-c">${p.price }</td>
						<td>2017-12-01 00:00:00</td>
						<td class="picture-status"><a href="/dsqimo/productRevise?id=${ p.id}"><span class="label label-success">修改</span></a></td>
						<!--  <td class="f-14 picture-manage"><a
							style="text-decoration: none"
							onClick="picture_xiajia(this,'10001')" href="javascript:;"
							title="下架"> <i class="icon-hand-down"></i>
						</a> <a style="text-decoration: none" class="ml-5"
							onClick="picture_edit('10001','','','图库编辑','picture-edit.html')"
							href="javascript:;" title="编辑"> <i class="icon-edit"></i>
						</a> <a style="text-decoration: none" class="ml-5"
							onClick="picture_del(this,'10001')" href="javascript:;"
							title="删除"> <i class="icon-trash"></i>
						</a></td>-->
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</form>
		<div id="pageNav" class="pageNav"></div>
		<div>
			<table style="width: 500px; margin: 0 auto;">
				<tr>
					<td>当前第${thispage}页,共${countPage}页,${count}条数据</td>
					<td>
						<%--上一页标签 --%>
						<div class="uppage">
							<a href="/dsqimo/backProductShow?pagenumber=${thispage-1}">上一页</a>
						</div> <%--页数选择下拉菜单 --%>
					</td>
					<td>
						<div>
							<form action="/dsqimo/backProductShow">
								跳转到第 <select name="pagenumber">
									<c:forEach begin="1" end="${countPage}" step="1" varStatus="v">
										<c:if test="${thispage==v.index}">
											<option value="${v.index}" selected="selected">${v.index}</option>
										</c:if>
										<c:if test="${thispage!=v.index}">
											<option value="${v.index}">${v.index}</option>
										</c:if>
									</c:forEach>
								</select> 页 <input type="submit" value="GO">
							</form>
						</div> <%--下一页标签 --%>
					</td>
					<td>
						<div>
							<a href="/dsqimo/backProductShow?pagenumber=${thispage+1}">下一页</a>
						</div>
					</td>
				</tr>
			</table>
		</div>
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