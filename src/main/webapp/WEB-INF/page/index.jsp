<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/include/tag.jsp"/>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
    <title>ME | Blog</title>
	<jsp:include page="/WEB-INF/include/head.jsp"/>
</head>
<body>
	<!--导航栏-->
    <jsp:include page="/WEB-INF/include/topnav.jsp"/>
	<!--导航栏-->
	<!--banner-->
	<section id="banner" class="wow fadeInUp" >
		<div class="lvjing">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h2 class="text-center wow fadeInLeft">人类最大的幸福就在于每天能谈谈道德方面的事情。<br/>无灵魂的生活就失去了人的生活价值。 </h2>
						<div class="icon-btn">
							<a href="#ontop"><span class="glyphicon glyphicon-menu-up"></span></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--banner-->
	<!--ontop-->
	<section id="ontop" class="wow fadeInUp">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h2 class="text-center">置顶文章</h2>
				</div>
				<article class="col-md-3">
					<a class="text-a" href="#">
						<div class="all-item me-box">
							<span class="me-top"></span>
							<span class="me-right"></span>
							<span class="me-bottom"></span>
							<span class="me-left"></span>
							<div class="item-bg-box">
								<div class="img-on">
									<img width="100%" src="${pageContext.request.contextPath}/jsAndCss/img/Bootstrap.jpg" class="img-responsive"/>
								</div>
								<h3 class="font-s12">折腾我的blog</h3>
								<div class="p-user">
									<span class="glyphicon glyphicon-user"></span>&nbsp;admin&nbsp;
									<span class="glyphicon glyphicon-time"></span>
									<time>2018-03-09 20:48:32</time>
								</div>
								<p class="title-main">
									一台将要报废的电脑，一路折腾，更换主板、CPU、内存、电源...变成了重新组装的电脑，对装机也是有了一定的了解，中间遇见一堆奇葩的问题。 机箱也是换了好几个，只不过都是自己做的纸箱子，就是不喜欢铁壳子的箱子，一直都是裸奔或者纸箱子。
								</p>
								<div class="more"><span class="btn btn-default">阅读详情&gt;&gt;</span></div>
							</div>
						</div>
					</a>
				</article>
				<article class="col-md-3">
					<a class="text-a" href="#">
						<div class="all-item me-box">
							<span class="me-top"></span>
							<span class="me-right"></span>
							<span class="me-bottom"></span>
							<span class="me-left"></span>
							<div class="item-bg-box">
								<div class="img-on">
									<img width="100%" height="170" src="${pageContext.request.contextPath}/jsAndCss/img/Bootstrap.jpg" class="img-responsive"/>
								</div>
								<h3 class="font-s12">折腾我的blog</h3>
								<div class="p-user">
									<span class="glyphicon glyphicon-user"></span>&nbsp;admin&nbsp;
									<span class="glyphicon glyphicon-time"></span>
									<time>2018-03-09 20:48:32</time>
								</div>
								<p class="title-main">
									一台将要报废的电脑，一路折腾，更换主板、CPU、内存、电源...变成了重新组装的电脑，对装机也是有了一定的了解，中间遇见一堆奇葩的问题。 机箱也是换了好几个，只不过都是自己做的纸箱子，就是不喜欢铁壳子的箱子，一直都是裸奔或者纸箱子。
								</p>
								<div class="more"><span class="btn btn-default">阅读详情&gt;&gt;</span></div>
							</div>
						</div>
					</a>
				</article>
				<article class="col-md-3">
					<a class="text-a" href="#">
						<div class="all-item me-box">
							<span class="me-top"></span>
							<span class="me-right"></span>
							<span class="me-bottom"></span>
							<span class="me-left"></span>
							<div class="item-bg-box">
								<div class="img-on">
									<img width="100%" height="170" src="${pageContext.request.contextPath}/jsAndCss/img/Bootstrap.jpg" class="img-responsive"/>
								</div>
								<h3 class="font-s12">折腾我的blog</h3>
								<div class="p-user">
									<span class="glyphicon glyphicon-user"></span>&nbsp;admin&nbsp;
									<span class="glyphicon glyphicon-time"></span>
									<time>2018-03-09 20:48:32</time>
								</div>
								<p class="title-main">
									一台将要报废的电脑，一路折腾，更换主板、CPU、内存、电源...变成了重新组装的电脑，对装机也是有了一定的了解，中间遇见一堆奇葩的问题。 机箱也是换了好几个，只不过都是自己做的纸箱子，就是不喜欢铁壳子的箱子，一直都是裸奔或者纸箱子。
								</p>
								<div class="more"><span class="btn btn-default">阅读详情&gt;&gt;</span></div>
							</div>
						</div>
					</a>
				</article>
				<article class="col-md-3">
					<a class="text-a" href="#">
						<div class="all-item me-box">
							<span class="me-top"></span>
							<span class="me-right"></span>
							<span class="me-bottom"></span>
							<span class="me-left"></span>
							<div class="item-bg-box">
								<div class="img-on">
									<img width="100%" height="170" src="${pageContext.request.contextPath}/jsAndCss/img/Bootstrap.jpg" class="img-responsive"/>
								</div>
								<h3 class="font-s12">折腾我的blog</h3>
								<div class="p-user">
									<span class="glyphicon glyphicon-user"></span>&nbsp;admin&nbsp;
									<span class="glyphicon glyphicon-time"></span>
									<time>2018-03-09 20:48:32</time>
								</div>
								<p class="title-main">
									一台将要报废的电脑，一路折腾，更换主板、CPU、内存、电源...变成了重新组装的电脑，对装机也是有了一定的了解，中间遇见一堆奇葩的问题。 机箱也是换了好几个，只不过都是自己做的纸箱子，就是不喜欢铁壳子的箱子，一直都是裸奔或者纸箱子。
								</p>
								<div class="more"><span class="btn btn-default">阅读详情&gt;&gt;</span></div>
							</div>
						</div>
					</a>
				</article>
			</div>
		</div>
	</section>
	<!--ontop-->
	<!--article-->
	<section id="article" class="wow fadeInUp">
		<div class="container">
			<div class="row article-new-box">
				<div class="col-md-12">
					<h2 class="text-center">文章新区</h2>
				</div>
				<article class="col-md-3">
					<a class="text-a" href="#">
						<div class="all-item me-box">
							<span class="me-top"></span>
							<span class="me-right"></span>
							<span class="me-bottom"></span>
							<span class="me-left"></span>
							<div class="item-bg-box">
								<div class="img-on">
									<img width="100%" src="${pageContext.request.contextPath}/jsAndCss/img/Bootstrap.jpg" class="img-responsive"/>
								</div>
								<h3 class="font-s12">折腾我的blog</h3>
								<div class="p-user">
									<span class="glyphicon glyphicon-user"></span>&nbsp;admin&nbsp;
									<span class="glyphicon glyphicon-time"></span>
									<time>2018-03-09 20:48:32</time>
								</div>
								<p class="title-main">
									一台将要报废的电脑，一路折腾，更换主板、CPU、内存、电源...变成了重新组装的电脑，对装机也是有了一定的了解，中间遇见一堆奇葩的问题。 机箱也是换了好几个，只不过都是自己做的纸箱子，就是不喜欢铁壳子的箱子，一直都是裸奔或者纸箱子。
								</p>
								<div class="more"><span class="btn btn-default">阅读详情&gt;&gt;</span></div>
							</div>
						</div>
					</a>
				</article>
				<article class="col-md-3">
					<a class="text-a" href="#">
						<div class="all-item me-box">
							<span class="me-top"></span>
							<span class="me-right"></span>
							<span class="me-bottom"></span>
							<span class="me-left"></span>
							<div class="item-bg-box">
								<div class="img-on">
									<img width="100%" height="170" src="${pageContext.request.contextPath}/jsAndCss/img/Bootstrap.jpg" class="img-responsive"/>
								</div>
								<h3 class="font-s12">折腾我的blog</h3>
								<div class="p-user">
									<span class="glyphicon glyphicon-user"></span>&nbsp;admin&nbsp;
									<span class="glyphicon glyphicon-time"></span>
									<time>2018-03-09 20:48:32</time>
								</div>
								<p class="title-main">
									一台将要报废的电脑，一路折腾，更换主板、CPU、内存、电源...变成了重新组装的电脑，对装机也是有了一定的了解，中间遇见一堆奇葩的问题。 机箱也是换了好几个，只不过都是自己做的纸箱子，就是不喜欢铁壳子的箱子，一直都是裸奔或者纸箱子。
								</p>
								<div class="more"><span class="btn btn-default">阅读详情&gt;&gt;</span></div>
							</div>
						</div>
					</a>
				</article>
				<article class="col-md-3">
					<a class="text-a" href="#">
						<div class="all-item me-box">
							<span class="me-top"></span>
							<span class="me-right"></span>
							<span class="me-bottom"></span>
							<span class="me-left"></span>
							<div class="item-bg-box">
								<div class="img-on">
									<img width="100%" height="170" src="${pageContext.request.contextPath}/jsAndCss/img/Bootstrap.jpg" class="img-responsive"/>
								</div>
								<h3 class="font-s12">折腾我的blog</h3>
								<div class="p-user">
									<span class="glyphicon glyphicon-user"></span>&nbsp;admin&nbsp;
									<span class="glyphicon glyphicon-time"></span>
									<time>2018-03-09 20:48:32</time>
								</div>
								<p class="title-main">
									一台将要报废的电脑，一路折腾，更换主板、CPU、内存、电源...变成了重新组装的电脑，对装机也是有了一定的了解，中间遇见一堆奇葩的问题。 机箱也是换了好几个，只不过都是自己做的纸箱子，就是不喜欢铁壳子的箱子，一直都是裸奔或者纸箱子。
								</p>
								<div class="more"><span class="btn btn-default">阅读详情&gt;&gt;</span></div>
							</div>
						</div>
					</a>
				</article>
				<article class="col-md-3">
					<a class="text-a" href="#">
						<div class="all-item me-box">
							<span class="me-top"></span>
							<span class="me-right"></span>
							<span class="me-bottom"></span>
							<span class="me-left"></span>
							<div class="item-bg-box">
								<div class="img-on">
									<img width="100%" height="170" src="${pageContext.request.contextPath}/jsAndCss/img/Bootstrap.jpg" class="img-responsive"/>
								</div>
								<h3 class="font-s12">折腾我的blog</h3>
								<div class="p-user">
									<span class="glyphicon glyphicon-user"></span>&nbsp;admin&nbsp;
									<span class="glyphicon glyphicon-time"></span>
									<time>2018-03-09 20:48:32</time>
								</div>
								<p class="title-main">
									一台将要报废的电脑，一路折腾，更换主板、CPU、内存、电源...变成了重新组装的电脑，对装机也是有了一定的了解，中间遇见一堆奇葩的问题。 机箱也是换了好几个，只不过都是自己做的纸箱子，就是不喜欢铁壳子的箱子，一直都是裸奔或者纸箱子。
								</p>
								<div class="more"><span class="btn btn-default">阅读详情&gt;&gt;</span></div>
							</div>
						</div>
					</a>
				</article>
				<article class="col-md-3">
					<a class="text-a" href="#">
						<div class="all-item me-box">
							<span class="me-top"></span>
							<span class="me-right"></span>
							<span class="me-bottom"></span>
							<span class="me-left"></span>
							<div class="item-bg-box">
								<div class="img-on">
									<img width="100%" src="${pageContext.request.contextPath}/jsAndCss/img/Bootstrap.jpg" class="img-responsive"/>
								</div>
								<h3 class="font-s12">折腾我的blog</h3>
								<div class="p-user">
									<span class="glyphicon glyphicon-user"></span>&nbsp;admin&nbsp;
									<span class="glyphicon glyphicon-time"></span>
									<time>2018-03-09 20:48:32</time>
								</div>
								<p class="title-main">
									一台将要报废的电脑，一路折腾，更换主板、CPU、内存、电源...变成了重新组装的电脑，对装机也是有了一定的了解，中间遇见一堆奇葩的问题。 机箱也是换了好几个，只不过都是自己做的纸箱子，就是不喜欢铁壳子的箱子，一直都是裸奔或者纸箱子。
								</p>
								<div class="more"><span class="btn btn-default">阅读详情&gt;&gt;</span></div>
							</div>
						</div>
					</a>
				</article>
				<article class="col-md-3">
					<a class="text-a" href="#">
						<div class="all-item me-box">
							<span class="me-top"></span>
							<span class="me-right"></span>
							<span class="me-bottom"></span>
							<span class="me-left"></span>
							<div class="item-bg-box">
								<div class="img-on">
									<img width="100%" height="170" src="${pageContext.request.contextPath}/jsAndCss/img/Bootstrap.jpg" class="img-responsive"/>
								</div>
								<h3 class="font-s12">折腾我的blog</h3>
								<div class="p-user">
									<span class="glyphicon glyphicon-user"></span>&nbsp;admin&nbsp;
									<span class="glyphicon glyphicon-time"></span>
									<time>2018-03-09 20:48:32</time>
								</div>
								<p class="title-main">
									一台将要报废的电脑，一路折腾，更换主板、CPU、内存、电源...变成了重新组装的电脑，对装机也是有了一定的了解，中间遇见一堆奇葩的问题。 机箱也是换了好几个，只不过都是自己做的纸箱子，就是不喜欢铁壳子的箱子，一直都是裸奔或者纸箱子。
								</p>
								<div class="more"><span class="btn btn-default">阅读详情&gt;&gt;</span></div>
							</div>
						</div>
					</a>
				</article>
				<article class="col-md-3">
					<a class="text-a" href="#">
						<div class="all-item me-box">
							<span class="me-top"></span>
							<span class="me-right"></span>
							<span class="me-bottom"></span>
							<span class="me-left"></span>
							<div class="item-bg-box">
								<div class="img-on">
									<img width="100%" height="170" src="${pageContext.request.contextPath}/jsAndCss/img/Bootstrap.jpg" class="img-responsive"/>
								</div>
								<h3 class="font-s12">折腾我的blog</h3>
								<div class="p-user">
									<span class="glyphicon glyphicon-user"></span>&nbsp;admin&nbsp;
									<span class="glyphicon glyphicon-time"></span>
									<time>2018-03-09 20:48:32</time>
								</div>
								<p class="title-main">
									一台将要报废的电脑，一路折腾，更换主板、CPU、内存、电源...变成了重新组装的电脑，对装机也是有了一定的了解，中间遇见一堆奇葩的问题。 机箱也是换了好几个，只不过都是自己做的纸箱子，就是不喜欢铁壳子的箱子，一直都是裸奔或者纸箱子。
								</p>
								<div class="more"><span class="btn btn-default">阅读详情&gt;&gt;</span></div>
							</div>
						</div>
					</a>
				</article>
				<article class="col-md-3">
					<a class="text-a" href="#">
						<div class="all-item me-box">
							<span class="me-top"></span>
							<span class="me-right"></span>
							<span class="me-bottom"></span>
							<span class="me-left"></span>
							<div class="item-bg-box">
								<div class="img-on">
									<img width="100%" height="170" src="${pageContext.request.contextPath}/jsAndCss/img/Bootstrap.jpg" class="img-responsive"/>
								</div>
								<h3 class="font-s12">折腾我的blog</h3>
								<div class="p-user">
									<span class="glyphicon glyphicon-user"></span>&nbsp;admin&nbsp;
									<span class="glyphicon glyphicon-time"></span>
									<time>2018-03-09 20:48:32</time>
								</div>
								<p class="title-main">
									一台将要报废的电脑，一路折腾，更换主板、CPU、内存、电源...变成了重新组装的电脑，对装机也是有了一定的了解，中间遇见一堆奇葩的问题。 机箱也是换了好几个，只不过都是自己做的纸箱子，就是不喜欢铁壳子的箱子，一直都是裸奔或者纸箱子。
								</p>
								<div class="more"><span class="btn btn-default">阅读详情&gt;&gt;</span></div>
							</div>
						</div>
					</a>
				</article>
			</div>
		</div>
	</section>
	<!--article-->
	<!--加载按钮-->
	<section id="ay-btn">
		<div class="container">
			<div class="row">
				<div class="col-md-12 text-center">
					<button class="java-btn btn btn-primary wow fadeInUp">加载更多</button>
				</div>
			</div>
		</div>
	</section>
	<!--加载按钮-->
	<!--footer-->
	<jsp:include page="/WEB-INF/include/footer.jsp"/>
	<script>
		$(function(){
			$('#banner').singlePageNav(function(){
				offset:40
			});
			$('.nav a span').click(function(){
				$('.navbar-collapse').collapse('hide');
			});
			new WOW().init();
			$('.java-btn').click(function(){
				alert("功能尚未完成");
			});
			function ScrollUp(){
				if($(document).scrollTop() > 100){
					$('.goUP').fadeIn('300');
				}
				if($(document).scrollTop() < 100){
					$('.goUP').fadeOut('300');
				}
			}
			$(window).scroll(function () {
				ScrollUp();
			});
		});
	</script>
	<!--footer-->
</body>
</html>