<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/include/tag.jsp"/>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
    <title>注册-新闻发布及管理系统</title>
	<jsp:include page="/WEB-INF/include/head.jsp"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/jsAndCss/css/bootstrap-meblog-register.css" />
</head>
<body>
	<!--导航栏-->
	<jsp:include page="/WEB-INF/include/topnav.jsp"/>
	<!--导航栏-->
	<!--form-->
	<section>
		<div class="container">
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<form action="${pageContext.request.contextPath}/user/register" method="post" onsubmit="return meSubmit();">
						<div class="input-group" style="${ not empty msg ? 'display: block;' : 'display: none;' }">
						  <span class="input-group-addon me-form-icon" id="msg">MSG</span>
						  <font type="text" class="form-control" aria-describedby="msg">${ msg }</font>
						</div>
						<div class="input-group">
						  <span class="input-group-addon me-form-icon" id="sizing-addon1"><span class="glyphicon glyphicon-user"></span></span>
						  <input type="text" class="form-control username" name="username" placeholder="username" aria-describedby="sizing-addon1">
						</div>
						<div class="input-group">
						  <span class="input-group-addon me-form-icon" id="sizing-addon2"><span class="glyphicon glyphicon-lock"></span></span>
						  <input type="password" class="form-control password" name="password" placeholder="password" aria-describedby="sizing-addon2">
						</div>
						<div class="input-group">
						    <span class="input-group-addon me-form-icon" id="sizing-addon6"><span class="glyphicon glyphicon-copyright-mark"></span></span>
						    <input type="email" class="form-control" placeholder="input your email" name="email" aria-describedby="sizing-addon6">
						</div>
						<div class="input-group">
						    <span class="input-group-addon me-form-icon" id="sizing-addon7"><span class="glyphicon glyphicon-copyright-mark"></span></span>
						    <input type="text" class="form-control" placeholder="input your mobile" name="mobile" aria-describedby="sizing-addon7">
						</div>
						<div class="input-group text-center me-btn-all">
							<input type="submit" class="form-control me-btn" value="注册"/>
							<input type="reset" class="form-control me-btn" value="重置"/>
						</div>
					</form>
				</div>
				<div class="col-md-3"></div>
			</div>
		</div>
	</section>
	<!--form-->
	<!--footer-->
	<jsp:include page="/WEB-INF/include/footer.jsp"/>
	<!--footer-->
	<script type="text/javascript">
		function meSubmit(){
			if($.trim($('.username').val()) == null || $.trim($('.username').val()).length < 3){
				$('.username').focus();
				alert("用户名为空或者长度小于3");
				return false;
			}
			if($.trim($('.password').val()) == null || $.trim($('.password').val()).length < 6){
				$('.password').focus();
                alert("密码为空或者长度小于6");
				return false;
			}
		}
	</script>
</body>
</html>