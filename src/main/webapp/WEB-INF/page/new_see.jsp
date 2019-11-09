<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<!--内容中心-->
	<section id="main">
		<div class="container">
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-10">
					<c:choose >
						<c:when test="${ not empty news }">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h2>${news.title}</h2>
									<p>
										<span class="glyphicon glyphicon-user"></span>${news.author}&nbsp;&nbsp;
										发表于: <span class="glyphicon glyphicon-time"></span>
										<fmt:formatDate value="${ news.publishTime}" pattern="yyyy-MM-dd HH:mm:ss" />
										类别：<span class="glyphicon glyphicon-time"></span>${news.types}
										来源：<span class="glyphicon glyphicon-time"></span>${news.sourceFrom}
										置顶文章： <span class="glyphicon glyphicon-time"></span>${news.toTop eq '1' ? '是':'否'}
									</p>
								</div>
								<c:if test="${ not empty news.picUrl}">
									<div class="panel-body">
										<img src="${news.picUrl}" style="display: block;width: 100%;height: auto;" alt="">
									</div>
								</c:if>
								<div class="panel-body">${news.content}</div>
							</div>
							<style type="text/css">.bs-comments::before {content: "一起发现新鲜事吧！评论：" !important;}</style>
							<div class="bs-comments" style="padding-top: 50px;padding-bottom: 10px;">
								<form onsubmit="return false;" style="padding-top: 20px;">
									<input type="hidden" name="newsId" value="${news.id}">
									<div class="form-group">
										<textarea name="content" class="form-control" rows="4" placeholder="评论"></textarea>
									</div>
									<div class="form-group">
										<input type="button" onclick="template.add();" class="btn btn-info" value="提交" />
									</div>
								</form>
							</div>
							<c:if test="${not empty comments}">
								<style type="text/css">.bs-example::before {content: "评论列表：" !important;}</style>
								<div id="comments-box" class="bs-example" style="overflow: hidden;padding-top: 50px;padding-bottom: 50px;" data-example-id="blockquote-reverse">
									<c:forEach var="comment" items="${comments}">
										<blockquote class="blockquote-reverse">
											<p class="text-right">${comment.content}</p>
											<footer>评论时间：<fmt:formatDate value="${ comment.time}" pattern="yyyy-MM-dd HH:mm:ss" />评论来自：<cite title="${not empty comment.sysUser ? comment.sysUser.username : '***'}">${not empty comment.sysUser ? comment.sysUser.username : '***'}</cite></footer>
										</blockquote>
									</c:forEach>
								</div>
							</c:if>
						</c:when>
						<c:otherwise>
							<div class="panel panel-default">暂无数据或加载出错....</div>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="col-md-1"></div>
			</div>
		</div>
	</section>
	<!--内容中心-->
	<!--footer-->
	<jsp:include page="/WEB-INF/include/footer.jsp"/>
	<!--footer-->
	<script type="text/javascript">
		var template = {
			log: true,
			baseUrl : '${pageContext.request.contextPath}/comments/',
			tip : function(tip, type){
				if($("#msg-tip"))$("#msg-tip").remove();
				if(type == "s"){
					type = "alert-success";
				}else if(type == "w"){
					type = "alert-warning";
				}else if(type == 'p'){
					type = "alert-primary";
				}else if(type == "d"){
					type = "alert-danger";
				}else{
					type = "alert-info";
				}
				var timer = null;
				var html = '<div id="msg-tip" class="alert '+ type + '" style="position: fixed;top:0;left:0;width:100%;z-index:9999;"><a href="javascript:;" class="close" data-dismiss="alert">&times;</a><strong>提示！</strong>'+tip+'</div>';
				$("body").after(html);
				timer = setTimeout(function () {
					if($("#msg-tip"))$("#msg-tip").remove();
					if(timer)clearTimeout(timer);
				}, 3000);
			},
			add : function(){
				if($.trim('${sessionScope.SESSION_USER_KEY}')) {
					var data = {
						newsId: $.trim($("input[name='newsId']").val()),
						content: $.trim($("textarea[name='content']").val())
					};
					if (data.content == null || data.content.length < 3) {
						this.tip("不能发布空评论。", 'w');
						$("textarea[name='content']").focus();
						return false;
					}
					if (confirm("确定提交数据吗？")) {
						var timer = null;
						this.ajax({url: this.baseUrl + "comment", m: "POST", data: data}, function (data) {
							if (data.code == 200) {
								this.tip('评论成功。', 's');
								var html = '';
								html += '<blockquote class="blockquote-reverse">';
								html +=	'<p>'+data.data.content+'</p>';
								html += '<footer>评论时间：'+data.data.time+'评论来自：<cite title="'+ ${ not empty sessionScope.SESSION_USER_KEY ? sessionScope.SESSION_USER_KEY.username : "'***'" } + '"></cite>'
										+${ not empty sessionScope.SESSION_USER_KEY ? "'".concat(sessionScope.SESSION_USER_KEY.username).concat("'") : "***"} + '</footer>';
								html += '</blockquote>';
								$("#comments-box").prepend(html);
								$("textarea[name='content']").empty();
							} else {
								this.tip('评论失败。', 'd');
							}
						});
					} else {
						this.tip('已为您取消操作。');
					}
				}else{
					this.tip('您还没有登录不能参与评论', 'd')
				}
			},
			ajax : function(data, callback){
				var that = this;
				$(function(){
					$.ajax({
						type : data.m ? data.m : "get",
						dataType: "json",
						url : data.url,
						data :  data.data,
						success : function(result) {
							if(that.log)console.log(result);
							callback && callback.call(that, result);
						},
						error : function(e){
							alert("操作失败");
						}
					});
				});
			}
		};
	</script>
</body>
</html>