<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>订单详情页</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="jquery-2.2.3.min.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				$(".dropdown img.flag").addClass("flagvisibility");

				$(".dropdown dt a").click(function() {
					$(".dropdown dd ul").toggle();
				});

				$(".dropdown dd ul li a").click(
						function() {
							var text = $(this).html();
							$(".dropdown dt a span").html(text);
							$(".dropdown dd ul").hide();
							$("#result").html(
									"Selected value is: "
											+ getSelectedValue("sample"));
						});

				function getSelectedValue(id) {
					return $("#" + id).find("dt a span.value").html();
				}

				$(document).bind('click', function(e) {
					var $clicked = $(e.target);
					if (!$clicked.parents().hasClass("dropdown"))
						$(".dropdown dd ul").hide();
				});

				$("#flagSwitcher").click(function() {
					$(".dropdown img.flag").toggleClass("flagvisibility");
				});
			});
</script>
<!-- start menu -->
<link href="css/megamenu.css" rel="stylesheet" type="text/css"
	media="all" />
<script type="text/javascript" src="js/megamenu.js"></script>
<script>
	$(document).ready(function() {
		$(".megamenu").megamenu();
	});
</script>
<!-- end menu -->
<!-- top scrolling -->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event) {
			event.preventDefault();
			$('html,body').animate({
				scrollTop : $(this.hash).offset().top
			}, 1200);
		});
	});
</script>
</head>
<body>
	<div class="header-top">
		<div class="wrap">
			<div class="logo">
				<a href="/dsqimo/indexshow"><img src="images/logo.png" alt="商城静态网页模板" /></a>
			</div>
			<div class="cssmenu">
				<ul>
					<li><a href="shop.html">Store Locator</a></li>
					<li><a href="login.html">My Account</a></li>
				</ul>
			</div>
			<!-- 这里加入判断如果登录了显示以下信息 -->
			<c:if test="${user==null}">
				<div style="width: 46px; float: left; margin-top: 16px;">
					<ul class="icon2 sub-icon2 profile_img">
						<li><a class="active-icon c2" href="#"></a>
							<ul class="sub-icon2 list">
								<li><h3>请先登录</h3></li>
								<li><p>
										<a href="login.html">Sign In</a>
									</p></li>
							</ul></li>
					</ul>
				</div>
			</c:if>
			<c:if test="${user!=null}">
				<div style="width: 70px; float: left; margin-top: 16px;">
					<ul class="icon2 sub-icon2 profile_img">
						<li><a class="active-icon c2" href="#"> </a>
							<ul class="sub-icon2 list">
								<li>Welcome:<span style="font-size: 20px;">${user.name }</span>
								</li>
								<li><p>Lorem ipsum dolor sit amet, consectetuer</p>
									<p>
										<a href="/dsqimo/checkOut">My order</a> <a
											href="/dsqimo/userSpace.jsp">Personal Center</a>
									</p>
									<p>
										<a href="/dsqimo/loginAction/c">Cancellation</a> <a
											href="/dsqimo/login.html">Switch account</a>
									</p></li>
							</ul></li>
					</ul>
				</div>
			</c:if>
			<div class="clear"></div>
		</div>
	</div>
	<div class="header-bottom">
		<div class="wrap">
			<!-- start header menu -->
			<ul class="megamenu skyblue">
				<li><a class="color1" href="#">Home</a></li>
				<li class="grid"><a class="color2" href="#">Men</a>
					<div class="megapanel">
						<div class="row">
							<div class="col1">
								<div class="h_nav">
									<h4>popular</h4>
									<ul>
										<li><a href="shop.html">new arrivals</a></li>
										<li><a href="shop.html">men</a></li>
										<li><a href="shop.html">women</a></li>
										<li><a href="shop.html">accessories</a></li>
										<li><a href="shop.html">kids</a></li>
										<li><a href="shop.html">login</a></li>
									</ul>
								</div>
								<div class="h_nav">
									<h4 class="top">men</h4>
									<ul>
										<li><a href="shop.html">new arrivals</a></li>
										<li><a href="shop.html">men</a></li>
										<li><a href="shop.html">women</a></li>
										<li><a href="shop.html">accessories</a></li>
										<li><a href="shop.html">kids</a></li>
										<li><a href="shop.html">style videos</a></li>
									</ul>
								</div>
							</div>
							<div class="col1">
								<div class="h_nav">
									<h4>style zone</h4>
									<ul>
										<li><a href="shop.html">men</a></li>
										<li><a href="shop.html">women</a></li>
										<li><a href="shop.html">accessories</a></li>
										<li><a href="shop.html">kids</a></li>
										<li><a href="shop.html">brands</a></li>
									</ul>
								</div>
							</div>
							<div class="col1"></div>
							<div class="col1"></div>
							<div class="col1"></div>
							<div class="col1"></div>
							<img src="images/nav_img.jpg" alt="" />
						</div>
					</div></li>
				<li class="active grid"><a class="color4" href="#">Women</a>
					<div class="megapanel">
						<div class="row">
							<div class="col1">
								<div class="h_nav">
									<h4>shop</h4>
									<ul>
										<li><a href="shop.html">new arrivals</a></li>
										<li><a href="shop.html">men</a></li>
										<li><a href="shop.html">women</a></li>
										<li><a href="shop.html">accessories</a></li>
										<li><a href="shop.html">kids</a></li>
										<li><a href="shop.html">brands</a></li>
									</ul>
								</div>
							</div>
							<div class="col1">
								<div class="h_nav">
									<h4>help</h4>
									<ul>
										<li><a href="shop.html">trends</a></li>
										<li><a href="shop.html">sale</a></li>
										<li><a href="shop.html">style videos</a></li>
										<li><a href="shop.html">accessories</a></li>
										<li><a href="shop.html">kids</a></li>
										<li><a href="shop.html">style videos</a></li>
									</ul>
								</div>
							</div>
							<div class="col1">
								<div class="h_nav">
									<h4>my company</h4>
									<ul>
										<li><a href="shop.html">trends</a></li>
										<li><a href="shop.html">sale</a></li>
										<li><a href="shop.html">style videos</a></li>
										<li><a href="shop.html">accessories</a></li>
										<li><a href="shop.html">kids</a></li>
										<li><a href="shop.html">style videos</a></li>
									</ul>
								</div>
							</div>
							<div class="col1">
								<div class="h_nav">
									<h4>account</h4>
									<ul>
										<li><a href="shop.html">login</a></li>
										<li><a href="shop.html">create an account</a></li>
										<li><a href="shop.html">create wishlist</a></li>
										<li><a href="shop.html">my shopping bag</a></li>
										<li><a href="shop.html">brands</a></li>
										<li><a href="shop.html">create wishlist</a></li>
									</ul>
								</div>
							</div>
							<div class="col1">
								<div class="h_nav">
									<h4>popular</h4>
									<ul>
										<li><a href="shop.html">new arrivals</a></li>
										<li><a href="shop.html">men</a></li>
										<li><a href="shop.html">women</a></li>
										<li><a href="shop.html">accessories</a></li>
										<li><a href="shop.html">kids</a></li>
										<li><a href="shop.html">style videos</a></li>
									</ul>
								</div>
							</div>
							<div class="col1">
								<div class="h_nav">
									<img src="images/nav_img1.jpg" alt="" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col2"></div>
							<div class="col1"></div>
							<div class="col1"></div>
							<div class="col1"></div>
							<div class="col1"></div>
						</div>
					</div></li>
				<li><a class="color5" href="#">Kids</a>
					<div class="megapanel">
						<div class="row">
							<div class="col1">
								<div class="h_nav">
									<h4>popular</h4>
									<ul>
										<li><a href="shop.html">new arrivals</a></li>
										<li><a href="shop.html">men</a></li>
										<li><a href="shop.html">women</a></li>
										<li><a href="shop.html">accessories</a></li>
										<li><a href="shop.html">kids</a></li>
										<li><a href="shop.html">login</a></li>
									</ul>
								</div>
								<div class="h_nav">
									<h4 class="top">man</h4>
									<ul>
										<li><a href="shop.html">new arrivals</a></li>
										<li><a href="shop.html">men</a></li>
										<li><a href="shop.html">women</a></li>
										<li><a href="shop.html">accessories</a></li>
										<li><a href="shop.html">kids</a></li>
										<li><a href="shop.html">style videos</a></li>
									</ul>
								</div>
							</div>
							<div class="col1">
								<div class="h_nav">
									<h4>style zone</h4>
									<ul>
										<li><a href="shop.html">men</a></li>
										<li><a href="shop.html">women</a></li>
										<li><a href="shop.html">accessories</a></li>
										<li><a href="shop.html">kids</a></li>
										<li><a href="shop.html">brands</a></li>
									</ul>
								</div>
							</div>
							<div class="col1"></div>
							<div class="col1"></div>
							<div class="col1"></div>
							<div class="col1"></div>
							<img src="images/nav_img2.jpg" alt="" />
						</div>
					</div></li>
				<li><a class="color6" href="#">Sale</a>
					<div class="megapanel">
						<div class="row">
							<div class="col1">
								<div class="h_nav">
									<h4>shop</h4>
									<ul>
										<li><a href="shop.html">new arrivals</a></li>
										<li><a href="shop.html">men</a></li>
										<li><a href="shop.html">women</a></li>
										<li><a href="shop.html">accessories</a></li>
										<li><a href="shop.html">kids</a></li>
										<li><a href="shop.html">brands</a></li>
									</ul>
								</div>
								<div class="h_nav">
									<h4 class="top">my company</h4>
									<ul>
										<li><a href="shop.html">trends</a></li>
										<li><a href="shop.html">sale</a></li>
										<li><a href="shop.html">style videos</a></li>
										<li><a href="shop.html">accessories</a></li>
										<li><a href="shop.html">kids</a></li>
										<li><a href="shop.html">style videos</a></li>
									</ul>
								</div>
							</div>
							<div class="col1">
								<div class="h_nav">
									<h4>man</h4>
									<ul>
										<li><a href="shop.html">new arrivals</a></li>
										<li><a href="shop.html">men</a></li>
										<li><a href="shop.html">women</a></li>
										<li><a href="shop.html">accessories</a></li>
										<li><a href="shop.html">kids</a></li>
										<li><a href="shop.html">style videos</a></li>
									</ul>
								</div>
							</div>
							<div class="col1">
								<div class="h_nav">
									<h4>help</h4>
									<ul>
										<li><a href="shop.html">trends</a></li>
										<li><a href="shop.html">sale</a></li>
										<li><a href="shop.html">style videos</a></li>
										<li><a href="shop.html">accessories</a></li>
										<li><a href="shop.html">kids</a></li>
										<li><a href="shop.html">style videos</a></li>
									</ul>
								</div>
							</div>
							<div class="col1">
								<div class="h_nav">
									<h4>account</h4>
									<ul>
										<li><a href="shop.html">login</a></li>
										<li><a href="shop.html">create an account</a></li>
										<li><a href="shop.html">create wishlist</a></li>
										<li><a href="shop.html">my shopping bag</a></li>
										<li><a href="shop.html">brands</a></li>
										<li><a href="shop.html">create wishlist</a></li>
									</ul>
								</div>
							</div>
							<div class="col1">
								<div class="h_nav">
									<h4>my company</h4>
									<ul>
										<li><a href="shop.html">trends</a></li>
										<li><a href="shop.html">sale</a></li>
										<li><a href="shop.html">style videos</a></li>
										<li><a href="shop.html">accessories</a></li>
										<li><a href="shop.html">kids</a></li>
										<li><a href="shop.html">style videos</a></li>
									</ul>
								</div>
							</div>
							<div class="col1">
								<div class="h_nav">
									<h4>popular</h4>
									<ul>
										<li><a href="shop.html">new arrivals</a></li>
										<li><a href="shop.html">men</a></li>
										<li><a href="shop.html">women</a></li>
										<li><a href="shop.html">accessories</a></li>
										<li><a href="shop.html">kids</a></li>
										<li><a href="shop.html">style videos</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col2"></div>
							<div class="col1"></div>
							<div class="col1"></div>
							<div class="col1"></div>
							<div class="col1"></div>
						</div>
					</div></li>
				<li><a class="color7" href="#">Customize</a>
					<div class="megapanel">
						<div class="row">
							<div class="col1">
								<div class="h_nav">
									<h4>shop</h4>
									<ul>
										<li><a href="shop.html">new arrivals</a></li>
										<li><a href="shop.html">men</a></li>
										<li><a href="shop.html">women</a></li>
										<li><a href="shop.html">accessories</a></li>
										<li><a href="shop.html">kids</a></li>
										<li><a href="shop.html">brands</a></li>
									</ul>
								</div>
							</div>
							<div class="col1">
								<div class="h_nav">
									<h4>help</h4>
									<ul>
										<li><a href="shop.html">trends</a></li>
										<li><a href="shop.html">sale</a></li>
										<li><a href="shop.html">style videos</a></li>
										<li><a href="shop.html">accessories</a></li>
										<li><a href="shop.html">kids</a></li>
										<li><a href="shop.html">style videos</a></li>
									</ul>
								</div>
							</div>
							<div class="col1">
								<div class="h_nav">
									<h4>my company</h4>
									<ul>
										<li><a href="shop.html">trends</a></li>
										<li><a href="shop.html">sale</a></li>
										<li><a href="shop.html">style videos</a></li>
										<li><a href="shop.html">accessories</a></li>
										<li><a href="shop.html">kids</a></li>
										<li><a href="shop.html">style videos</a></li>
									</ul>
								</div>
							</div>
							<div class="col1">
								<div class="h_nav">
									<h4>account</h4>
									<ul>
										<li><a href="shop.html">login</a></li>
										<li><a href="shop.html">create an account</a></li>
										<li><a href="shop.html">create wishlist</a></li>
										<li><a href="shop.html">my shopping bag</a></li>
										<li><a href="shop.html">brands</a></li>
										<li><a href="shop.html">create wishlist</a></li>
									</ul>
								</div>
							</div>
							<div class="col1">
								<div class="h_nav">
									<h4>my company</h4>
									<ul>
										<li><a href="shop.html">trends</a></li>
										<li><a href="shop.html">sale</a></li>
										<li><a href="shop.html">style videos</a></li>
										<li><a href="shop.html">accessories</a></li>
										<li><a href="shop.html">kids</a></li>
										<li><a href="shop.html">style videos</a></li>
									</ul>
								</div>
							</div>
							<div class="col1">
								<div class="h_nav">
									<h4>popular</h4>
									<ul>
										<li><a href="shop.html">new arrivals</a></li>
										<li><a href="shop.html">men</a></li>
										<li><a href="shop.html">women</a></li>
										<li><a href="shop.html">accessories</a></li>
										<li><a href="shop.html">kids</a></li>
										<li><a href="shop.html">style videos</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col2"></div>
							<div class="col1"></div>
							<div class="col1"></div>
							<div class="col1"></div>
							<div class="col1"></div>
						</div>
					</div></li>
				<li><a class="color8" href="#">Shop</a>
					<div class="megapanel">
						<div class="row">
							<div class="col1">
								<div class="h_nav">
									<h4>style zone</h4>
									<ul>
										<li><a href="shop.html">men</a></li>
										<li><a href="shop.html">women</a></li>
										<li><a href="shop.html">accessories</a></li>
										<li><a href="shop.html">kids</a></li>
										<li><a href="shop.html">brands</a></li>
									</ul>
								</div>
							</div>
							<div class="col1">
								<div class="h_nav">
									<h4>popular</h4>
									<ul>
										<li><a href="shop.html">new arrivals</a></li>
										<li><a href="shop.html">men</a></li>
										<li><a href="shop.html">kids</a></li>
										<li><a href="shop.html">accessories</a></li>
										<li><a href="shop.html">login</a></li>
									</ul>
								</div>
								<div class="h_nav">
									<h4 class="top">man</h4>
									<ul>
										<li><a href="shop.html">new arrivals</a></li>
										<li><a href="shop.html">accessories</a></li>
										<li><a href="shop.html">kids</a></li>
										<li><a href="shop.html">style videos</a></li>
									</ul>
								</div>
								<div class="col1"></div>
								<div class="col1"></div>
								<div class="col1"></div>
								<div class="col1"></div>
							</div>
						</div></li>
				<li><a class="color9" href="#">Football</a>
					<div class="megapanel">
						<div class="row">
							<div class="col1">
								<div class="h_nav">
									<h4>shop</h4>
									<ul>
										<li><a href="shop.html">new arrivals</a></li>
										<li><a href="shop.html">men</a></li>
										<li><a href="shop.html">women</a></li>
										<li><a href="shop.html">accessories</a></li>
										<li><a href="shop.html">kids</a></li>
										<li><a href="shop.html">brands</a></li>
									</ul>
								</div>
							</div>
							<div class="col1">
								<div class="h_nav">
									<h4>help</h4>
									<ul>
										<li><a href="shop.html">trends</a></li>
										<li><a href="shop.html">sale</a></li>
										<li><a href="shop.html">style videos</a></li>
										<li><a href="shop.html">accessories</a></li>
										<li><a href="shop.html">kids</a></li>
										<li><a href="shop.html">style videos</a></li>
									</ul>
								</div>
							</div>
							<div class="col1">
								<div class="h_nav">
									<h4>my company</h4>
									<ul>
										<li><a href="shop.html">trends</a></li>
										<li><a href="shop.html">sale</a></li>
										<li><a href="shop.html">style videos</a></li>
										<li><a href="shop.html">accessories</a></li>
										<li><a href="shop.html">kids</a></li>
										<li><a href="shop.html">style videos</a></li>
									</ul>
								</div>
							</div>
							<div class="col1">
								<div class="h_nav">
									<h4>account</h4>
									<ul>
										<li><a href="shop.html">login</a></li>
										<li><a href="shop.html">create an account</a></li>
										<li><a href="shop.html">create wishlist</a></li>
										<li><a href="shop.html">my shopping bag</a></li>
										<li><a href="shop.html">brands</a></li>
										<li><a href="shop.html">create wishlist</a></li>
									</ul>
								</div>
							</div>
							<div class="col1">
								<div class="h_nav">
									<h4>my company</h4>
									<ul>
										<li><a href="shop.html">trends</a></li>
										<li><a href="shop.html">sale</a></li>
										<li><a href="shop.html">style videos</a></li>
										<li><a href="shop.html">accessories</a></li>
										<li><a href="shop.html">kids</a></li>
										<li><a href="shop.html">style videos</a></li>
									</ul>
								</div>
							</div>
							<div class="col1">
								<div class="h_nav">
									<h4>popular</h4>
									<ul>
										<li><a href="shop.html">new arrivals</a></li>
										<li><a href="shop.html">men</a></li>
										<li><a href="shop.html">women</a></li>
										<li><a href="shop.html">accessories</a></li>
										<li><a href="shop.html">kids</a></li>
										<li><a href="shop.html">style videos</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col2"></div>
							<div class="col1"></div>
							<div class="col1"></div>
							<div class="col1"></div>
							<div class="col1"></div>
						</div>
					</div></li>
				<li><a class="color10" href="#">Running</a></li>
				<li><a class="color11" href="#">Originals</a></li>
				<li><a class="color12" href="#">Basketball</a></li>
			</ul>
			<div class="clear"></div>
		</div>
	</div>



	<div class="login">

		<div class="wrap">
			<c:if test="${user==null}">
		
				 <h4 class="title">请先登录</h4>
    	     	<p class="cart">You can click <a href="/dsqimo/login.html"> here</a> to return to the Sign In</p>
		
	
			</c:if>

			<c:if test="${user!=null}">
				<c:if test="${cart==null }">
					<h4 class="title">Shopping cart is empty</h4>
					<p class="cart">
						You have no items in your shopping cart.<br>Click<a
							href="/dsqimo/indexshow"> here</a> to continue shopping
					</p>
				</c:if>

				<c:if test="${cart!=null }">
					<form action="" method="post" id="myForm" ">
						<table border="1" cellpadding="10" style="text-align: center;">
							<tr>
								<th><input type="checkbox" id="checkall" />全选</th>
								<th>商品名</th>
								<th>价格</th>
								<th>数量</th>
								<th>操作</th>
							</tr>
							<c:forEach items="${cartitem}" var="p">
								<tr>
									<td><input type="checkbox" class="ck" name="productid"
										value="${p.id}"> <span class="price"
										style="display: none;">${p.total}</span>
									</td>
									<%--给后台传入商品的id --%>
									<td>${p.name}</td>
									<td>${p.total }</td>
									<td>${p.count }</td>
									<td><a href="/dsqimo/delct?id=${p.proid }">删除</td>
									<%--得到是购物车里商品的数量 --%>
								</tr>
							</c:forEach>
							<tr>
								<td colspan="3">总金额:<span id="balance"></span></td>
								<td>
								<button type="submit"  onClick="tijiao1()">结算</button>
								<button type="submit"  onClick="tijiao2()">批量删除</button>
								</td>
							</tr>
						</table>
					</form>
				</c:if>

				<script type="text/javascript">
					function tijiao1(){
							$("#myForm").removeAttr('action');
							$("#myForm").attr('action','/dsqimo/cartAction/balance');
							$("#myForm").submit(function(e){
								var total=$("#balance").text();
								if(total=="0" || total==""){//如果没有购买商品
										e.preventDefault();
			    						alert("请购买商品");	 
								}
							});
					}
					function tijiao2(){
						$("#myForm").removeAttr('action');
						$("#myForm").attr('action','/dsqimo/delsct');
						$("#myForm").submit(function(e){
							var total=$("#balance").text();
							if(total=="0" || total==""){//如果没有购买商品
									e.preventDefault();
		    						alert("请购买商品");	 
							}
						});
					}
					$(
							function() {
								//计算总金额
								function totalMoney() {
									//计算金额
									var total_price = 0;
									$(".ck").each(function() {
														if ($(this).prop('checked') == true) {
															var obj1 = $(this).siblings(".price").text();//获取一行的商品金额
															total_price += parseInt(obj1);
														}
													});
									$("#balance").text(total_price);//将计算出的总数量显示
									//更改name属性，把选择的商品传入后台
									$(".ck").each(function() {
										if ($(this).prop('checked') == true) {
											$(this).attr("name", "buyid");
										}
										if ($(this).prop('checked') == false) {
											$(this).attr("name", "productid");
										}
									});
								}
								//全选juery
								$("#checkall").change(function() {
									var status = $(this).prop("checked");
									$(".ck").each(function() {
										$(".ck").prop("checked", status);
									});
									totalMoney();
								});
								//实时计算商品的总金额
								$(".ck").change(function() {
									totalMoney();
								});
							})
						
				</script>
			</c:if>

		</div>

	</div>




	<div class="footer">
		<div class="footer-top">
			<div class="wrap">
				<div class="col_1_of_footer-top span_1_of_footer-top">
					<ul class="f_list">
						<li><img src="images/f_icon.png" alt="" /><span
							class="delivery">Free delivery on all orders over £100*</span></li>
					</ul>
				</div>
				<div class="col_1_of_footer-top span_1_of_footer-top">
					<ul class="f_list">
						<li><img src="images/f_icon1.png" alt="" /><span
							class="delivery">Customer Service :<span class="orange">
									(800) 000-2587 (freephone)</span></span></li>
					</ul>
				</div>
				<div class="col_1_of_footer-top span_1_of_footer-top">
					<ul class="f_list">
						<li><img src="images/f_icon2.png" alt="" /><span
							class="delivery">Fast delivery & free returns</span></li>
					</ul>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<div class="footer-middle">
			<div class="wrap">
				<div class="section group">
					<div class="col_1_of_middle span_1_of_middle">
						<dl id="sample" class="dropdown">
							<dt>
								<a href="#"><span>Please Select a Country</span></a>
							</dt>
							<dd>
								<ul>
									<li><a href="#">Australia<img class="flag"
											src="images/as.png" alt="" /><span class="value">AS</span></a></li>
									<li><a href="#">Sri Lanka<img class="flag"
											src="images/srl.png" alt="" /><span class="value">SL</span></a></li>
									<li><a href="#">Newziland<img class="flag"
											src="images/nz.png" alt="" /><span class="value">NZ</span></a></li>
									<li><a href="#">Pakistan<img class="flag"
											src="images/pk.png" alt="" /><span class="value">Pk</span></a></li>
									<li><a href="#">United Kingdom<img class="flag"
											src="images/uk.png" alt="" /><span class="value">UK</span></a></li>
									<li><a href="#">United States<img class="flag"
											src="images/us.png" alt="" /><span class="value">US</span></a></li>
								</ul>
							</dd>
						</dl>
					</div>
					<div class="col_1_of_middle span_1_of_middle">
						<ul class="f_list1">
							<li><span class="m_8">Sign up for email and Get 15%
									off</span>
								<div class="search">
									<input type="text" name="s" class="textbox" value="Search"
										onfocus="this.value = '';"
										onblur="if (this.value == '') {this.value = 'Search';}">
									<input type="submit" value="Subscribe" id="submit"
										name="submit">
									<div id="response"></div>
								</div>
								<div class="clear"></div></li>
						</ul>
					</div>
					<div class="clear"></div>
				</div>
			</div>
		</div>
		<div class="footer-bottom">
			<div class="wrap">
				<div class="section group">
					<div class="col_1_of_5 span_1_of_5">
						<h3 class="m_9">Shop</h3>
						<ul class="sub_list">
							<h4 class="m_10">Men</h4>
							<li><a href="shop.html">Men's Shoes</a></li>
							<li><a href="shop.html">Men's Clothing</a></li>
							<li><a href="shop.html">Men's Accessories</a></li>
						</ul>
						<ul class="sub_list">
							<h4 class="m_10">Women</h4>
							<li><a href="shop.html">Women's Shoes</a></li>
							<li><a href="shop.html">Women's Clothing</a></li>
							<li><a href="shop.html">Women's Accessories</a></li>
						</ul>
						<ul class="sub_list">
							<h4 class="m_10">Kids</h4>
							<li><a href="shop.html">Kids Shoes</a></li>
							<li><a href="shop.html">Kids Clothing</a></li>
							<li><a href="shop.html">Kids Accessories</a></li>
						</ul>
						<ul class="sub_list">
							<h4 class="m_10">style</h4>
							<li><a href="shop.html">Porsche Design Sport</a></li>
							<li><a href="shop.html">Porsche Design Shoes</a></li>
							<li><a href="shop.html">Porsche Design Clothing</a></li>
						</ul>
						<ul class="sub_list">
							<h4 class="m_10">Adidas Neo Label</h4>
							<li><a href="shop.html">Adidas NEO Shoes</a></li>
							<li><a href="shop.html">Adidas NEO Clothing</a></li>
						</ul>
						<ul class="sub_list1">
							<h4 class="m_10">Customise</h4>
							<li><a href="shop.html">mi adidas</a></li>
							<li><a href="shop.html">mi team</a></li>
							<li><a href="shop.html">new arrivals</a></li>
						</ul>
					</div>
					<div class="col_1_of_5 span_1_of_5">
						<h3 class="m_9">Sports</h3>
						<ul class="list1">
							<li><a href="shop.html">Basketball</a></li>
							<li><a href="shop.html">Football</a></li>
							<li><a href="shop.html">Football Boots</a></li>
							<li><a href="shop.html">Predator</a></li>
							<li><a href="shop.html">F50</a></li>
							<li><a href="shop.html">Football Clothing</a></li>
							<li><a href="shop.html">Golf</a></li>
							<li><a href="shop.html">Golf Shoes</a></li>
							<li><a href="shop.html">Golf Clothing</a></li>
							<li><a href="shop.html">Outdoor</a></li>
							<li><a href="shop.html">Outdoor Shoes</a></li>
							<li><a href="shop.html">Outdoor Clothing</a></li>
							<li><a href="shop.html">Rugby</a></li>
							<li><a href="shop.html">Running</a></li>
							<li><a href="shop.html">Running Shoes</a></li>
							<li><a href="shop.html">Boost</a></li>
							<li><a href="shop.html">Supernova</a></li>
							<li><a href="shop.html">Running Clothing</a></li>
							<li><a href="shop.html">Swimming</a></li>
							<li><a href="shop.html">Tennis</a></li>
							<li><a href="shop.html">Tennis Shoes</a></li>
							<li><a href="shop.html">Tennis Clothing</a></li>
							<li><a href="shop.html">Training</a></li>
							<li><a href="shop.html">Training Shoes</a></li>
							<li><a href="shop.html">Training Clothing</a></li>
							<li><a href="shop.html">Training Accessories</a></li>
							<li><a href="shop.html">miCoach</a></li>
							<li><a href="shop.html">All Sports</a></li>
						</ul>
					</div>
					<div class="col_1_of_5 span_1_of_5">
						<h3 class="m_9">Originals</h3>
						<ul class="list1">
							<li><a href="shop.html">Originals Shoes</a></li>
							<li><a href="shop.html">Gazelle</a></li>
							<li><a href="shop.html">Samba</a></li>
							<li><a href="shop.html">LA Trainer</a></li>
							<li><a href="shop.html">Superstar</a></li>
							<li><a href="shop.html">SL</a></li>
							<li><a href="shop.html">ZX</a></li>
							<li><a href="shop.html">Campus</a></li>
							<li><a href="shop.html">Spezial</a></li>
							<li><a href="shop.html">Dragon</a></li>
							<li><a href="shop.html">Originals Clothing</a></li>
							<li><a href="shop.html">Firebird</a></li>
							<li><a href="shop.html">Originals Accessories</a></li>
							<li><a href="shop.html">Men's Originals</a></li>
							<li><a href="shop.html">Women's Originals</a></li>
							<li><a href="shop.html">Kid's Originals</a></li>
							<li><a href="shop.html">All Originals</a></li>
						</ul>
					</div>
					<div class="col_1_of_5 span_1_of_5">
						<h3 class="m_9">Product Types</h3>
						<ul class="list1">
							<li><a href="shop.html">Shirts</a></li>
							<li><a href="shop.html">Pants & Tights</a></li>
							<li><a href="shop.html">Shirts</a></li>
							<li><a href="shop.html">Jerseys</a></li>
							<li><a href="shop.html">Hoodies & Track Tops</a></li>
							<li><a href="shop.html">Bags</a></li>
							<li><a href="shop.html">Jackets</a></li>
							<li><a href="shop.html">Hi Tops</a></li>
							<li><a href="shop.html">SweatShirts</a></li>
							<li><a href="shop.html">Socks</a></li>
							<li><a href="shop.html">Swimwear</a></li>
							<li><a href="shop.html">Tracksuits</a></li>
							<li><a href="shop.html">Hats</a></li>
							<li><a href="shop.html">Football Boots</a></li>
							<li><a href="shop.html">Other Accessories</a></li>
							<li><a href="shop.html">Sandals & Flip Flops</a></li>
							<li><a href="shop.html">Skirts & Dresseses</a></li>
							<li><a href="shop.html">Balls</a></li>
							<li><a href="shop.html">Watches</a></li>
							<li><a href="shop.html">Fitness Equipment</a></li>
							<li><a href="shop.html">Eyewear</a></li>
							<li><a href="shop.html">Gloves</a></li>
							<li><a href="shop.html">Sports Bras</a></li>
							<li><a href="shop.html">Scarves</a></li>
							<li><a href="shop.html">Shinguards</a></li>
							<li><a href="shop.html">Underwear</a></li>
						</ul>
					</div>
					<div class="col_1_of_5 span_1_of_5">
						<h3 class="m_9">Support</h3>
						<ul class="list1">
							<li><a href="shop.html">Store finder</a></li>
							<li><a href="shop.html">Customer Service</a></li>
							<li><a href="shop.html">FAQ</a></li>
							<li><a href="shop.html">Online Shop Contact Us</a></li>
							<li><a href="shop.html">about adidas Products</a></li>
							<li><a href="shop.html">Size Charts </a></li>
							<li><a href="shop.html">Ordering </a></li>
							<li><a href="shop.html">Payment </a></li>
							<li><a href="shop.html">Shipping </a></li>
							<li><a href="shop.html">Returning</a></li>
							<li><a href="shop.html">Using out Site</a></li>
							<li><a href="shop.html">Delivery Terms</a></li>
							<li><a href="shop.html">Site Map</a></li>
							<li><a href="shop.html">Gift Card</a></li>

						</ul>
						<ul class="sub_list2">
							<h4 class="m_10">Company Info</h4>
							<li><a href="shop.html">About Us</a></li>
							<li><a href="shop.html">Careers</a></li>
							<li><a href="shop.html">Press</a></li>
						</ul>
					</div>
					<div class="clear"></div>
				</div>
			</div>
		</div>
		<div class="copy">
			<div class="wrap">
				<p>Copyright &copy; 2014.Company name All rights reserved.</p>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {

			var defaults = {
				containerID : 'toTop', // fading element id
				containerHoverID : 'toTopHover', // fading element hover id
				scrollSpeed : 1200,
				easingType : 'linear'
			};

			$().UItoTop({
				easingType : 'easeOutQuart'
			});

		});
	</script>
	<a href="#" id="toTop" style="display: block;"><span
		id="toTopHover" style="opacity: 1;"></span></a>
</body>
</html>