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
	<!--内容中心-->
	<section id="main">
		<div class="container">
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-10">
					<div class="panel panel-default">
					    <div class="panel-heading">
					    	<h2>我的Vue-WordPress-Rest-Api主题成功上线</h2>
					    	<p><span class="glyphicon glyphicon-user"></span>admin&nbsp;&nbsp;发表于: <span class="glyphicon glyphicon-time"></span>2018-03-06 02:10:20</p>
					    </div>
					    <div class="panel-body">
							主题特色
							1.全站ajax
							2.不会设计的我只能走n个网站中借鉴，整体颜色采用白色+灰色+蓝色
							
							使用说明
							想要使用的小伙伴可以在GitHub下载源码：https://github.com/xuanmos/xm-vue-wordpress-theme
							主题使用需要注意的几点如下：
							1.wordpress需要开rest-api，通过https://www.xuanmo.xin/wp-json验证是否开启rest-api服务，把我的域名换成自己的，有内容则可以使用主题
							2.下载的源码，直接把xm-vue-theme文件夹传到主题目录即可
							3.头像设置在后台仪表盘=>用户=>我的个人资料上传即可
							4.菜单的设置，菜单名称一定要和截图名称一样，菜单的数量有两个或以上会出现下拉选择框，不然请求不到数据：
					    </div>
					</div>
				</div>
				<div class="col-md-1"></div>
			</div>
		</div>
	</section>
	<!--内容中心-->
	<!--footer-->
	<jsp:include page="/WEB-INF/include/footer.jsp"/>
	<!--footer-->
</body>
</html>