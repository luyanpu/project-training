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
				class="r">共有数据：<strong>${count }</strong> 条
			</span>
		</div>
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
					<th width="100">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${userlist }" var="p">
					<tr class="text-c">
						<td><input type="checkbox" value="${p.id }" name="check"></td>
						<td>${p.id }</td>

						<td><u style="cursor: pointer" class="text-primary"
							onclick="user_show('10001','360','','详细信息','admin-user-show.jsp?name=${p.name }&email=${p.email }')">${p.name }</u></td>
						<td>男</td>
						<td>13000000000</td>
						<td>${p.email }</td>
						<td class="text-l">北京市 海淀区</td>
						<td>2014-6-11 11:11:42</td>
						<c:if test="${p.state==0 }">
							<td class="user-status"><span class="label">未启用</span></td>
						</c:if>
						<c:if test="${p.state==1 }">
							<td class="user-status"><span class="label label-success">已启用</span></td>
						</c:if>
						<%--这里是操作框 --%>
						
						<td class="user-manage">
						<%--对状态的操作--%>
						<c:if test="${p.state==0 }">
							<a style="text-decoration:none" onClick="user_start(this,${p.id})"  title="启用">
								<i class="icon-hand-up">启用</i>
							</a>
						</c:if>
						
						<c:if test="${p.state==1 }">
							<a style="text-decoration:none" onClick="user_stop(this,${p.id})"  title="停用">
								<i class="icon-hand-down">停用</i>
							</a>
						</c:if>
						
						<a title="编辑" href="#"
							onClick="user_edit(${p.id},'550','','编辑','admin-user-revise.jsp?id=${p.id}')"
							class="ml-5" style="text-decoration: none"> 
							<i class="icon-edit">编辑</i>
						</a> 
						<!--<a style="text-decoration: none" class="ml-5"
							onClick="user_password_edit('10001','370','228','修改密码','user-password-edit.html')"
							href="#" title="修改密码"> 
							<i class="icon-key">修改密码</i>
						</a>  -->
						
						<a title="删除"  onClick="user_del(this,${p.id})"
							class="ml-5" style="text-decoration: none"> 
							<i class="icon-trash">删除</i>
						</a></td>

					</tr>
				</c:forEach>

			</tbody>
		</table>
		</form>
		<div>
				<table style="width: 500px; margin: 0 auto;">
					<tr>
						<td>当前第${thispage}页,共${countPage}页,${count}条数据</td>
						<td>
							<%--上一页标签 --%>
							<div class="uppage">
								<a href="/dsqimo/userlist?pagenumber=${thispage-1}">上一页</a>
							</div> <%--页数选择下拉菜单 --%>
						</td>
						<td>
							<div>
								<form action="/dsqimo/userlist">
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
								<a href="/dsqimo/userlist?pagenumber=${thispage+1}">下一页</a>
							</div>
						</td>
					</tr>
				</table>
			</div>
		<div id="pageNav" class="pageNav"></div>
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
		/*window.onload = (function() {
			// optional set
			pageNav.pre = "&lt;上一页";
			pageNav.next = "下一页&gt;";
			// p,当前页码,pn,总页面
			//pageNav.fn = function(p, pn) {
				//$("#pageinfo").text("当前页:" + p + " 总页: " + pn);
			//};
			//重写分页状态,跳到第三页,总页33页
			pageNav.go(1, ${countPage});
		});
		$('.table-sort').dataTable({
			"lengthMenu" : false,//显示数量选择 
			"bFilter" : false,//过滤功能
			"bPaginate" : false,//翻页信息
			"bInfo" : false,//数量信息
			"aaSorting" : [ [ 1, "desc" ] ],//默认第几个排序
			"bStateSave" : true,//状态保存
			"aoColumnDefs" : [
			//{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
			{
				"orderable" : false,
				"aTargets" : [ 0, 8, 9 ]
			} // 制定列不参与排序
			]
		});*/
	</script>

</body>
</html>
