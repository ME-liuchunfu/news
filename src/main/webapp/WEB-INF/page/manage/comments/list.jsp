<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>新闻发布及管理系统-评论管理</title>
    <jsp:include page="/WEB-INF/include/head.jsp"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/jsAndCss/css/bootstrap-meblog-register.css" />
</head>
<body>
    <table class="table table-bordered">
        <caption>
            <form class="form-inline" action="${pageContext.request.contextPath}/comments/list" method="get">
                <div class="form-group">
                    <label for="name">内容</label>
                    <input type="text" class="form-control" name="key" id="name" placeholder="请输入用户名">
                </div>
                <input type="submit" class="btn btn-default" value="搜索"/>
                &nbsp;&nbsp;&nbsp;${not empty list ? "检索到数据：<span id='totle'>".concat(list.size()).concat("</span>条") : ""}
            </form>
        </caption>
        <thead>
            <tr>
                <th>编号</th>
                <th>新闻标题</th>
                <th>用户名称</th>
                <th>评论内容</th>
                <th>评论时间</th>
                <th>操作</th>
            </tr>
        </thead>
        <tbody>
        <c:choose>
            <c:when test="${not empty list}">
                <c:forEach items="${list}" var="modle" varStatus="status">
                    <tr>
                        <td>${status.count}</td>
                        <td>${not empty modle.sysNews ? modle.sysNews.title : '***'}</td>
                        <td>${not empty modle.sysUser ? modle.sysUser.username : '***'}</td>
                        <td>${modle.content}</td>
                        <td><fmt:formatDate value="${ modle.time}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                        <td>
                            <button type="button" class="btn btn-danger" onclick="template.del(this, ${modle.id}, '${modle.content}');">删除</button>
                        </td>
                    </tr>
                </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr><td colspan="6" style="text-align: center;">暂无数据</td></tr>
                </c:otherwise>
            </c:choose>
        </tbody>
    </table>
    <script src="${pageContext.request.contextPath}/jsAndCss/js/jquery2.1.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/jsAndCss/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/jsAndCss/js/jquery.singlePageNav.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/jsAndCss/js/wow.min.js" ></script>
    <script type="text/javascript">
        var template = {
            log: true,
            editname: null,
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
                var html = '<div id="msg-tip" class="alert '+ type + '" style="position: absolute;top:0;left:0;width:100%;z-index:9999;"><a href="javascript:;" class="close" data-dismiss="alert">&times;</a><strong>提示！</strong>'+tip+'</div>';
                $(".table").before(html);
                timer = setTimeout(function () {
                    if($("#msg-tip"))$("#msg-tip").remove();
                    if(timer)clearTimeout(timer);
                }, 3000);
            },
            del : function(target, id, value){
                 if(confirm(value? "确定删除该数据吗？" + value : "确定删除该数据吗？")){
                     var timer = null;
                    this.ajax({url: this.baseUrl + "delete", m: "POST", data: {"id": id}}, function(data){
                        if(data.code == 200){
                            this.tip('删除成功。', 's');
                            $(target).parents("tr").remove();
                            $("#totle").text($.trim($("#totle").text())/1 -1);
                        }else{
                            this.tip('删除失败。', 'd');
                        }
                    });
                 }else{
                    this.tip('已为您取消操作。');
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