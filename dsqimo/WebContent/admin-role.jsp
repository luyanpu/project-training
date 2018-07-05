<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="js/html5.js"></script>
<script type="text/javascript" src="js/respond.min.js"></script>
<script type="text/javascript" src="js/PIE_IE678.js"></script>
<![endif]-->
<link type="text/css" rel="stylesheet" href="css/H-ui.css"/>
<link type="text/css" rel="stylesheet" href="css/H-ui.admin.css"/>
<link type="text/css" rel="stylesheet" href="font/font-awesome.min.css"/>
<!--[if IE 7]>
<link href="font/font-awesome-ie7.min.css" rel="stylesheet" type="text/css" />
<![endif]-->
<title>角色管理_js代码</title>
</head>
<body>
<nav class="Hui-breadcrumb"><i class="icon-home"></i> 首页 <span class="c-gray en">&gt;</span> 管理员管理 <span class="c-gray en">&gt;</span> 角色管理 <a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="icon-refresh"></i></a></nav>
<div class="pd-20">
  <div class="cl pd-5 bg-1 bk-gray">
    <span class="l">
      <a href="javascript:;" onClick="datadel()" class="btn btn-danger radius"><i class="icon-trash"></i> 批量删除</a>
      <a class="btn btn-primary radius" href="javascript:;" onClick="admin_role_add('750','','添加角色','admin-role-add.jsp')"><i class="icon-plus"></i> 添加角色</a>
    </span>
   	<span class="r">共有数据：<strong>${count}</strong> 条</span>
  </div>
  <form action="/dsqimo/adminDeleteAll" method="post" id="myForm">
  <table class="table table-border table-bordered table-hover table-bg">
    <thead>
      <tr>
        <th scope="col" colspan="6">角色管理</th>
      </tr>
      <tr class="text-c">
        <th width="25"><input type="checkbox" value="" name=""></th>
        <th width="40">ID</th>
        <th width="200">角色名</th>
        <th>用户列表</th>
        <th width="300">描述</th>
        <th width="70">操作</th>
      </tr>
    </thead>
    
    <tbody>
    <c:forEach items="${adminlist }" var="p">
    	<tr class="text-c">
    	<c:if test="${p.id!=1 }">
    	 	<td><input type="checkbox" value="${p.id }" name="check"></td>
    	</c:if>
    	<c:if test="${p.id==1 }">
    	 	<td></td>
    	</c:if>
        <td>${p.id }</td>
        <td>${p.job}</td>
        <td><a href="#">${p.name }</a></td>
        <td>${p.intro }</td>
        <td class="f-14"><a title="编辑" href="javascript:;" onClick="admin_role_edit('1','750','','角色编辑','admin-role-add.html')" style="text-decoration:none"><i class="icon-edit"></i></a> <a title="删除" href="javascript:;" onClick="admin_role_del(this,'1')" class="ml-5" style="text-decoration:none"><i class="icon-trash"></i></a></td>
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
								<a href="/dsqimo/adminlist?pagenumber=${thispage-1}">上一页</a>
							</div> <%--页数选择下拉菜单 --%>
						</td>
						<td>
							<div>
								<form action="/dsqimo/adminlist">
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
								<a href="/dsqimo/adminlist?pagenumber=${thispage+1}">下一页</a>
							</div>
						</td>
					</tr>
				</table>
			</div>
</div>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="layer/layer.min.js"></script> 
<script type="text/javascript" src="js/H-ui.js"></script> 
<script type="text/javascript" src="js/H-ui.admin.js"></script>

</body>
</html>