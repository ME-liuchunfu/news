<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>新闻发布及管理系统-用户管理</title>
    <jsp:include page="/WEB-INF/include/head.jsp"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/jsAndCss/css/bootstrap-meblog-register.css" />
</head>
<body>
    <table class="table table-bordered">
        <caption>
            <form class="form-inline" action="${pageContext.request.contextPath}/user/list" method="get">
                <div class="form-group">
                    <label for="name">用户名</label>
                    <input type="text" class="form-control" name="key" id="name" placeholder="请输入用户名">
                </div>
                <input type="submit" class="btn btn-default" value="搜索"/>
                &nbsp;&nbsp;&nbsp;${not empty list ? "检索到数据：<span id='totle'>".concat(list.size()).concat("</span>条") : ""}
                <button type="button" class="btn btn-info" onclick="template.openOrClose(true, '新增管理员用户');">添加用户</button>
            </form>
        </caption>
        <thead>
            <tr>
                <th>编号</th>
                <th>用户名</th>
                <th>邮箱</th>
                <th>手机号</th>
                <th>注册时间</th>
                <th>用户类型</th>
                <th>操作</th>
            </tr>
        </thead>
        <tbody>
        <c:choose>
            <c:when test="${not empty list}">
                <c:forEach items="${list}" var="user" varStatus="status">
                    <tr>
                        <td>${status.count}</td>
                        <td>${user.username}</td>
                        <td>${user.email}</td>
                        <td>${user.mobile}</td>
                        <td>${user.status eq 0 ?  '管理员' : '普通用户'}</td>
                        <td><fmt:formatDate value="${ user.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                        <td>
                            <button type="button" class="btn btn-danger" onclick="template.del(this, ${user.userId}, '${user.username}');">删除</button>
                            <button type="button" class="btn btn-success" onclick="template.openOrCloseEdit(${user.userId}, '${user.username}', true);">编辑</button>
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
    <!-- 模态框 -->
    <div id="modle" style="position: absolute;top:0;left:0;width: 100%;height: 100%;background-color: rgba(0,0,0,.5);z-index:999;display: none;">
        <div class="container" style="margin-top: 50px;background-color: #fff; border-radius: 10px;box-shadow: 0 0 31px 0px #78c7bc;padding: 100px 0;">
            <div id="user-title" class="col-md-12 text-center" style="font-size: 20px;">新增管理员用户</div>
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <form onsubmit="return false;">
                        <div class="input-group">
                            <span class="input-group-addon me-form-icon" id="sizing-addon1"><span class="glyphicon glyphicon-user"></span></span>
                            <input type="text" class="form-control username" name="username" placeholder="用户名" aria-describedby="sizing-addon1">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon me-form-icon" id="sizing-addon2"><span class="glyphicon glyphicon-lock"></span></span>
                            <input type="password" class="form-control password" name="password" placeholder="密码" aria-describedby="sizing-addon2">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon me-form-icon" id="sizing-addon6"><span class="glyphicon glyphicon-copyright-mark"></span></span>
                            <input type="email" class="form-control" placeholder="邮箱" name="email" aria-describedby="sizing-addon6">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon me-form-icon" id="sizing-addon7"><span class="glyphicon glyphicon-copyright-mark"></span></span>
                            <input type="text" class="form-control" placeholder="电话" name="mobile" aria-describedby="sizing-addon7">
                        </div>
                        <div class="input-group text-center me-btn-all" style="text-align: center;">
                            <input onclick="template.add();" type="button" class="form-control me-btn" value="提交"/>
                            <input type="reset" class="form-control me-btn" value="重置"/>
                            <input onclick="template.openOrClose(false,'')" type="button" class="form-control me-btn" value="关闭"/>
                        </div>
                    </form>
                </div>
                <div class="col-md-3"></div>
            </div>
        </div>
    </div>
    <!-- 模态框 -->

    <!-- 模态框 -->
    <div id="modle-edit" style="position: absolute;top:0;left:0;width: 100%;height: 100%;background-color: rgba(0,0,0,.5);z-index:999;display: none;">
        <div class="container" style="margin-top: 50px;background-color: #fff; border-radius: 10px;box-shadow: 0 0 31px 0px #78c7bc;padding: 100px 0;">
            <div id="user-title-edit" class="col-md-12 text-center" style="font-size: 20px;">编辑用户信息</div>
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <form onsubmit="return false;">
                        <input type="hidden" name="userIdEdit" />
                        <div class="input-group">
                            <span class="input-group-addon me-form-icon" id="sizing-addon1-edit"><span class="glyphicon glyphicon-user"></span></span>
                            <input type="text" class="form-control username" name="usernameEdit" placeholder="用户名" aria-describedby="sizing-addon1-edit">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon me-form-icon" id="sizing-addon2-edit"><span class="glyphicon glyphicon-lock"></span></span>
                            <input type="text" class="form-control password" name="passwordEdit" placeholder="密码" aria-describedby="sizing-addon2-edit">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon me-form-icon" id="sizing-addon6-edit"><span class="glyphicon glyphicon-copyright-mark"></span></span>
                            <input type="email" class="form-control" placeholder="邮箱" name="emailEdit" aria-describedby="sizing-addon6-edit">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon me-form-icon" id="sizing-addon7-edit"><span class="glyphicon glyphicon-copyright-mark"></span></span>
                            <input type="text" class="form-control" placeholder="电话" name="mobileEdit" aria-describedby="sizing-addon7-edit">
                        </div>
                        <div class="input-group text-center me-btn-all" style="text-align: center;">
                            <input onclick="template.edit();" type="button" class="form-control me-btn" value="保存"/>
                            <input onclick="template.openOrCloseEdit(false,'')" type="button" class="form-control me-btn" value="关闭"/>
                        </div>
                    </form>
                </div>
                <div class="col-md-3"></div>
            </div>
        </div>
    </div>
    <!-- 模态框 -->
    <script src="${pageContext.request.contextPath}/jsAndCss/js/jquery2.1.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/jsAndCss/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/jsAndCss/js/jquery.singlePageNav.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/jsAndCss/js/wow.min.js" ></script>
    <script type="text/javascript">
        var template = {
            log: true,
            editname: null,
            baseUrl : '${pageContext.request.contextPath}/user/',
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
            checkUsername : function(el, callback){
                this.ajax({url: this.baseUrl + "checkUsername", m: "POST", data: {username: $(el).val()}}, function(data){
                    if(data.code == 500){
                        this.tip(data.data, 'd');
                    }else{
                        callback && callback.call(this);
                    }
                });
            },
            add : function(){
                var data = {
                    username: $.trim($("input[name='username']").val()),
                    password: $.trim($("input[name='password']").val()),
                    email: $.trim($("input[name='email']").val()),
                    mobile: $.trim($("input[name='mobile']").val())
                };
                if(data.password == null || data.password.length < 3){
                    this.tip("密码长度过短，不能少于6个字符。", 'w');
                    return false;
                }
                if(data.email == null || data.email.length < 3){
                    this.tip("邮箱长度过短，不能少于3个字符。", 'w');
                    return false;
                }
                if(data.mobile == null || data.mobile.length < 11){
                    this.tip("电话长度过短，不能少于11个字符。", 'w');
                    return false;
                }
                if(data.username == null || data.username.length < 3){
                    this.tip("用户名长度过短，不能少于3个字符。", 'w');
                    return false;
                }else{
                    this.checkUsername($("input[name='username']"), function () {
                        if(confirm("确定提交数据吗？")){
                            var timer = null;
                            this.ajax({url: this.baseUrl + "save", m: "POST", data: data}, function(data){
                                if(data.code == 200){
                                    this.tip('新增成功。', 's');
                                    this.openOrClose(false,'');
                                    timer = setTimeout(function () {
                                        window.location.reload();
                                    }, 1500);
                                }else{
                                    this.tip('删除失败。', 'd');
                                }
                            });
                        }else{
                            this.tip('已为您取消操作。');
                        }
                    });
                }
            },
            openOrClose : function(flag, titile){
                flag ? $("#modle").show() : $("#modle").hide();
                $("#user-title").text(titile);
            },
            openOrCloseEdit : function(userId, titile, flag){
                flag ? $("#modle-edit").show() : $("#modle-edit").hide();
                if(flag){
                    this.ajax({url: this.baseUrl + "info", m: "POST", data: {"userId": userId}}, function(data){
                        if(data.code == 200){
                            this.editname = data.data.username;
                            $("input[name='userIdEdit']").val(data.data.userId);
                            $("input[name='usernameEdit']").val(data.data.username);
                            $("input[name='passwordEdit']").val(data.data.password);
                            $("input[name='emailEdit']").val(data.data.email);
                            $("input[name='mobileEdit']").val(data.data.mobile);
                        }else{
                            this.tip('加载数据失败。', 'd');
                        }
                    });
                }
            },
            edit : function(){
                var data = {
                    userId: $.trim($("input[name='userIdEdit']").val()),
                    username: $.trim($("input[name='usernameEdit']").val()),
                    password: $.trim($("input[name='passwordEdit']").val()),
                    email: $.trim($("input[name='emailEdit']").val()),
                    mobile: $.trim($("input[name='mobileEdit']").val())
                };
                if(data.password == null || data.password.length < 3){
                    this.tip("密码长度过短，不能少于6个字符。", 'w');
                    return false;
                }
                if(data.email == null || data.email.length < 3){
                    this.tip("邮箱长度过短，不能少于3个字符。", 'w');
                    return false;
                }
                if(data.mobile == null || data.mobile.length < 11){
                    this.tip("电话长度过短，不能少于11个字符。", 'w');
                    return false;
                }
                if(data.username == null || data.username.length < 3){
                    this.tip("用户名长度过短，不能少于3个字符。", 'w');
                    return false;
                }else{
                    if(this.editname == $("input[name='usernameEdit']").val()){
                        if(confirm("确定提交数据吗？")){
                            var timer = null;
                            this.ajax({url: this.baseUrl + "update", m: "POST", data: data}, function(data){
                                if(data.code == 200){
                                    this.tip('编辑成功。', 's');
                                    this.openOrClose(false,'');
                                    timer = setTimeout(function () {
                                        window.location.reload();
                                    }, 1500);
                                }else{
                                    this.tip('编辑失败。', 'd');
                                }
                            });
                        }else{
                            this.tip('已为您取消操作。');
                        }
                    }else{
                        this.checkUsername($("input[name='usernameEdit']"), function () {
                            if(confirm("确定提交数据吗？")){
                                var timer = null;
                                this.ajax({url: this.baseUrl + "update", m: "POST", data: data}, function(data){
                                    if(data.code == 200){
                                        this.tip('编辑成功。', 's');
                                        this.openOrClose(false,'');
                                        timer = setTimeout(function () {
                                            window.location.reload();
                                        }, 1500);
                                    }else{
                                        this.tip('编辑失败。', 'd');
                                    }
                                });
                            }else{
                                this.tip('已为您取消操作。');
                            }
                        });
                    }
                }
            },
            del : function(target, id, value){
                 if(confirm(value? "确定删除该数据吗？" + value : "确定删除该数据吗？")){
                     var timer = null;
                    this.ajax({url: this.baseUrl + "delete", m: "POST", data: {"userId": id}}, function(data){
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