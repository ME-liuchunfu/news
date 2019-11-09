<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/include/tag.jsp"/>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>新闻发布及管理系统-管理后台</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <jsp:include page="/WEB-INF/include/head.jsp"/>
    <link href="${pageContext.request.contextPath}/jsAndCss/manage/font-awesome.4.6.0.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/jsAndCss/manage/style.css" media="screen" type="text/css">
</head>
<body>
    <!--导航栏-->
    <jsp:include page="/WEB-INF/include/topnav.jsp"/>
    <!--导航栏-->
    <div class="m-box">
        <ul id="accordion" class="accordion">
            <li>
                <div class="link"><i class="fa fa-paint-brush"></i>系统管理<i class="fa fa-chevron-down"></i>
                </div>
                <ul class="submenu">
                    <li><a href="${pageContext.request.contextPath}/user/list" target="iframe">用户信息管理</a></li>
                    <li><a href="${pageContext.request.contextPath}/news/list" target="iframe">新闻信息管理</a></li>
                    <li><a href="${pageContext.request.contextPath}/comments/list" target="iframe">评论信息管理</a></li>
                    <li><a href="#">Maquetacion web</a></li>
                </ul>
            </li>
        </ul>
        <div class="iframe">
            <iframe name="iframe" width="100%" height="100%" src="" frameborder="0"></iframe>
        </div>
    </div>
    <script src="${pageContext.request.contextPath}/jsAndCss/js/jquery2.1.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/jsAndCss/manage/index.js"></script>
    <script src="${pageContext.request.contextPath}/jsAndCss/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/jsAndCss/js/jquery.singlePageNav.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/jsAndCss/js/wow.min.js" ></script>
    <script>
        //console.log(window)
        $(function(){
            $(".iframe").css({"height": window.innerHeight - 50 + 'px'});
            $(window).on('resize',function(e){
                $(".iframe").css({"height": e.currentTarget.innerHeight - 50 + 'px'});
               // console.log(e)
            });
        });
    </script>
</body>
</html>