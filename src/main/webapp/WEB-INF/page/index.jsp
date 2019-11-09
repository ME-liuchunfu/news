<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
    <title>新闻发布及管理系统</title>
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
	<c:if test="${not empty hotNews}">
		<section id="ontop" class="wow fadeInUp">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h2 class="text-center">置顶文章</h2>
					</div>
					<c:forEach items="${hotNews}" var="item">
						<article class="col-md-3">
							<a class="text-a" href="${pageContext.request.contextPath}/news/see/${item.id}" target="_blank">
								<div class="all-item me-box">
									<span class="me-top"></span>
									<span class="me-right"></span>
									<span class="me-bottom"></span>
									<span class="me-left"></span>
									<div class="item-bg-box">
										<div class="img-on">
											<img width="100%" src="${item.picUrl}" class="img-responsive"/>
										</div>
										<h3 class="font-s12">${item.title}</h3>
										<div class="p-user">
											<span class="glyphicon glyphicon-user"></span>&nbsp;${item.author}
											<span class="glyphicon glyphicon-time"></span>
											<time><fmt:formatDate value="${ item.publishTime}" pattern="yyyy-MM-dd HH:mm:ss" /></time>
										</div>
										<p class="title-main">${ item.content.length() > 60 ? item.content.substring(0,60) : item.content }</p>
										<div class="more"><span class="btn btn-default">阅读详情&gt;&gt;</span></div>
									</div>
								</div>
							</a>
						</article>
					</c:forEach>
				</div>
			</div>
		</section>
	</c:if>
	<!--ontop-->
	<!--article-->
	<c:if test="${not empty otherNews}">
		<section id="article" class="wow fadeInUp">
			<div class="container">
				<div class="row article-new-box">
					<div class="col-md-12">
						<h2 class="text-center">文章新区</h2>
					</div>
					<c:forEach items="${otherNews}" var="item">
						<article class="col-md-3">
							<a class="text-a" href="${pageContext.request.contextPath}/news/see/${item.id}" target="_blank">
								<div class="all-item me-box">
									<span class="me-top"></span>
									<span class="me-right"></span>
									<span class="me-bottom"></span>
									<span class="me-left"></span>
									<div class="item-bg-box">
										<div class="img-on">
											<img width="100%" src="${item.picUrl}" class="img-responsive"/>
										</div>
										<h3 class="font-s12">${item.title}</h3>
										<div class="p-user">
											<span class="glyphicon glyphicon-user"></span>&nbsp;${item.author}
											<span class="glyphicon glyphicon-time"></span>
											<time><fmt:formatDate value="${ item.publishTime}" pattern="yyyy-MM-dd HH:mm:ss" /></time>
										</div>
										<p class="title-main">${ item.content.length() > 60 ? item.content.substring(0,60) : item.content }</p>
										<div class="more"><span class="btn btn-default">阅读详情&gt;&gt;</span></div>
									</div>
								</div>
							</a>
						</article>
					</c:forEach>
				</div>
			</div>
		</section>
	</c:if>
	<!--article-->
	<!--加载按钮-->
	<section id="ay-btn" style="display: none;">
		<div class="container">
			<div class="row">
				<div class="col-md-12 text-center">
					<button  class="java-btn btn btn-primary wow fadeInUp">加载更多</button>
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