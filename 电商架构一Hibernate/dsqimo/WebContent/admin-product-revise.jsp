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
<title>添加用户_js代码</title>
</head>
<body>
<div class="pd-20">
  <div class="Huiform">
    <form action="/dsqimo/productRevise" method="post">
      <table class="table table-bg">
        <tbody>
         <tr style="display:none">
            <th width="100" class="text-r" ><span class="c-red">*</span> id：</th>
            <td><input type="text" style="width:200px" class="input-text" value="${pro.id }"  name="id" ></td>
          </tr>
          <tr>
            <th width="100" class="text-r"><span class="c-red">*</span> 品牌：</th>
            <td><input type="text" style="width:200px" class="input-text" value="${pro.name }"  name="name" datatype="*2-16" nullmsg="品牌不能为空"></td>
          </tr>
          <tr>
            <th width="100" class="text-r"><span class="c-red">*</span> 价格：</th>
            <td><input type="text" style="width:200px" class="input-text" value="${pro.price }"  name="price"  nullmsg="价格不能为空"></td>
          </tr>
           <tr>
            <th width="100" class="text-r"><span class="c-red">*</span> 折后价格：</th>
            <td><input type="text" style="width:200px" class="input-text" value="${pro.salePrice }"  name="salePrice"  nullmsg="折后价格不能为空"></td>
          </tr>
          <tr>
            <th width="100" class="text-r"><span class="c-red">*</span> 数量：</th>
            <td><input type="text" style="width:200px" class="input-text" value="${pro.count }"  name="count" nullmsg="数量不能为空"></td>
          </tr>
          <tr>
            <th width="100" class="text-r"><span class="c-red">*</span> 类型：</th>
            <td>
            	<select name="typ">
            		<option value="">篮球</option>
            	</select>
            </td>
          </tr>
          <tr>
            <th></th>
            <td><button class="btn btn-success radius" type="submit"><i class="icon-ok"></i> 确定</button></td>
          </tr>
        </tbody>
      </table>
    </form>
  </div>
</div>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/Validform_v5.3.2_min.js"></script> 
<script type="text/javascript" src="js/H-ui.js"></script> 
<script type="text/javascript" src="js/H-ui.admin.js"></script> 
<script type="text/javascript">
$(".Huiform").Validform(); 
</script>

</body>
</html>