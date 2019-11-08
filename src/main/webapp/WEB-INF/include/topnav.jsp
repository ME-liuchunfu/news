<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<nav class="nav navbar-default navbar-fixed-top">
    <div class="container">
        <!--小屏幕导航按钮-->
        <div class="navbar-header">
            <button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.html"><h1>新闻发布及管理系统</h1></a>
        </div>
        <!--小屏幕导航按钮-->
        <!--导航菜单-->
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="index.html"><span>首页</span></a></li>
                <li><a href="#"><span>笔记</span></a></li>
                <li><a href="#"><span>案例特效</span></a></li>
                <li><a href="#"><span>关于我</span></a></li>
                <li><a href="#"><span>前端相关</span></a></li>
                <li><a href="#"><span>软件分享</span></a></li>
                <li><a href="#"><span>生活随笔</span></a></li>
                <c:choose>
                    <c:when test="${ not empty sessionScope.SESSION_USER_KEY }">
                        <li class="dropdown">
                            <a href="javascript:;" id="dLabel" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="glyphicon glyphicon-user"></span>${sessionScope.SESSION_USER_KEY.username}
                                <span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="dLabel">
                                <li><a href="#"><span class="glyphicon glyphicon-edit"></span>个人信息</a></li>
                                <c:if test="${sessionScope.SESSION_USER_KEY.status eq 0}">
                                    <li><a href="${pageContext.request.contextPath}/manage"><span class="glyphicon glyphicon-heart-empty"></span>后台管理</a></li>
                                </c:if>
                                <li><a href="${pageContext.request.contextPath}/logout"><sapn class="glyphicon glyphicon-off"></sapn>退出</a></li>
                            </ul>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="${pageContext.request.contextPath}/register"><span>注册</span></a></li>
                        <li><a href="${pageContext.request.contextPath}/login"><span>登录</span></a></li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
        <!--导航菜单-->
    </div>
</nav>

