<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>角色编辑_js代码</title>
</head>
<body>
<div class="pd-20">
  <form class="Huiform" id="myform" action="/dsqimo/adminAdd" method="post">
    <table class="table table-border table-bordered table-bg">
      <tbody>
        <tr>
          <th class="text-r" width="80">角色名称：</th>
          <td><input name="job" type="text" class="input-text" id="" value="超级管理员" datatype="*1-20" nullmsg="角色名称不能为空！"> 
          </td>
        </tr>
        <tr>
          <th class="text-r" width="80">昵称:</th>
          <td><input name="name" type="text" class="input-text" id="" datatype="*1-20" nullmsg="昵称不能为空！"> 
          </td>
        </tr>
        <tr>
          <th class="text-r" width="80">密码:</th>
          <td><input name="password" type="text" class="input-text" id="" datatype="*1-20" nullmsg="密码不能为空！"> 
          </td>
        </tr>
        <tr>
          <th class="text-r" width="80">权限:</th>
          <td>
          	<select name="state">
          		<option value="1">1</option>
          		<option value="2">2</option>
         	 </select>
          </td>
        </tr>
        <tr>
          <th class="text-r va-t">权限：</th>
          <td>
            <table class="table table-border table-bordered table-bg">
              <tbody>
                <tr>
                  <th width="70">用户管理（会员）</th>
                  <td class="permission-list">
               
                    <div class="cl">
                    <label class="item"><input name="" type="checkbox" value=""> 添加</label>
                    <label class="item"><input name="" type="checkbox" value=""> 删除</label>
                    <label class="item"><input name="" type="checkbox" value=""> 编辑</label>
                    <label class="item"><input name="" type="checkbox" value=""> 排序</label>
                    </div>
         
                    <div class="cl">
                    <label class="item"><input name="" type="checkbox" value=""> 查看</label></div>
                  </td>
                </tr>
                <tr>
                  <th>资讯管理</th>
                  <td class="permission-list">
                    <div class="cl">
                      <b class="item">分类：</b>
                      <label class="item"><input name="" type="checkbox" value=""> 添加</label>
                      <label class="item"><input name="" type="checkbox" value=""> 删除</label>
                      <label class="item"><input name="" type="checkbox" value=""> 编辑</label>
                      <label class="item"><input name="" type="checkbox" value=""> 查看</label>
                    </div>
                    <div class="cl">
                      <b class="item">资讯：</b>
                      <label class="item"><input name="" type="checkbox" value=""> 添加</label>
                      <label class="item"><input name="" type="checkbox" value=""> 删除</label>
                      <label class="item"><input name="" type="checkbox" value=""> 编辑</label>
                      <label class="item"><input name="" type="checkbox" value=""> 查看</label>
                    </div>
                    <div class="cl"><label class="item c-orange"><input name="" type="checkbox" value=""> 只能操作自己发布的</label></div>
                  </td>
                </tr>
                <tr>
                  <th>图片库</th>
                  <td class="permission-list">
                    <div class="cl">
                      <b class="item">分类：</b>
                      <label class="item"><input name="" type="checkbox" value=""> 添加</label>
                      <label class="item"><input name="" type="checkbox" value=""> 删除</label>
                      <label class="item"><input name="" type="checkbox" value=""> 编辑</label>
                      <label class="item"><input name="" type="checkbox" value=""> 查看</label>
                    </div>
                    <div class="cl">
                      <b class="item">图片：</b>
                      <label class="item"><input name="" type="checkbox" value=""> 添加</label>
                      <label class="item"><input name="" type="checkbox" value=""> 删除</label>
                      <label class="item"><input name="" type="checkbox" value=""> 编辑</label>
                      <label class="item"><input name="" type="checkbox" value=""> 查看</label>
                    </div>
                    <div class="cl"><label class="item c-orange"><input name="" type="checkbox" value=""> 只能操作自己发布的</label></div>
                  </td>
                </tr>
                <tr>
                  <th>产品库</th>
                  <td class="permission-list">
                    <div class="cl">
                      <b class="item">分类：</b>
                      <label class="item"><input name="" type="checkbox" value=""> 添加</label>
                      <label class="item"><input name="" type="checkbox" value=""> 删除</label>
                      <label class="item"><input name="" type="checkbox" value=""> 编辑</label>
                      <label class="item"><input name="" type="checkbox" value=""> 查看</label>
                    </div>
                    <div class="cl">
                      <b class="item">产品：</b>
                      <label class="item"><input name="" type="checkbox" value=""> 添加</label>
                      <label class="item"><input name="" type="checkbox" value=""> 删除</label>
                      <label class="item"><input name="" type="checkbox" value=""> 编辑</label>
                      <label class="item"><input name="" type="checkbox" value=""> 查看</label>
                    </div>
                    <div class="cl"><label class="item c-orange"><input name="" type="checkbox" value=""> 只能操作自己发布的</label></div>
                  </td>
                </tr>
                <tr>
                  <th>页面管理</th>
                  <td class="permission-list">
                    <label class="item"><input name="" type="checkbox" value=""> 添加</label>
                    <label class="item"><input name="" type="checkbox" value=""> 删除</label>
                    <label class="item"><input name="" type="checkbox" value=""> 编辑</label>
                    <label class="item"><input name="" type="checkbox" value=""> 查看</label>
                  </td>
                </tr>
                <tr>
                  <th>管理员管理</th>
                  <td class="permission-list">
                    <label class="item"><input name="" type="checkbox" value=""> 管理员添加</label>
                    <label class="item"><input name="" type="checkbox" value=""> 管理员删除</label>
                    <label class="item"><input name="" type="checkbox" value=""> 权限编辑</label>
                    <label class="item"><input name="" type="checkbox" value=""> 角色编辑</label>
                  </td>
                </tr>
                <tr>
                  <th>系统管理</th>
                  <td class="permission-list">
                    <label class="item"><input name="" type="checkbox" value=""> 基本设置</label>
                    <label class="item"><input name="" type="checkbox" value=""> 栏目设置</label>
                    <label class="item"><input name="" type="checkbox" value=""> 数据字典</label>
                    <label class="item"><input name="" type="checkbox" value=""> 系统日志</label>
                  </td>
                </tr>
                <tr>
                  <th>统计管理</th>
                  <td class="permission-list">
                    <label class="item"><input name="" type="checkbox" value=""> 产看</label>
                  </td>
                </tr>
              </tbody>
            </table>
          </td>
        </tr>
        
        
        <tr>
          <th class="text-r va-t">描述：</th>
          <td><textarea name="intro" class="textarea" id="newpassword" placeholder="描述下角色所具有的权限" style="width:500px; height:50px; resize:none"></textarea> 
          </td>
        </tr>
        
        <tr>
          <th></th>
          <td>
            <button type="submit" class="btn btn-success radius" id="admin-role-save" name="admin-role-save"><i class="icon-ok"></i> 确定</button>
          </td>
        </tr>
        
        
      </tbody>
    </table>
  </form>
</div>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/Validform_v5.3.2_min.js"></script> 
<script type="text/javascript" src="layer/layer.min.js"></script> 
<script type="text/javascript" src="js/H-ui.js"></script> 
<script type="text/javascript" src="js/H-ui.admin.js"></script> 
<script type="text/javascript">
$(".Huiform").Validform(); 
</script>

</body>
</html>