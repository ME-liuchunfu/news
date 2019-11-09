<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>新闻发布及管理系统-新闻信息管理</title>
    <jsp:include page="/WEB-INF/include/head.jsp"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/jsAndCss/css/bootstrap-meblog-register.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/jsAndCss/layui/css/layui.css" />
</head>
<body>
    <table class="table table-bordered">
        <caption>
            <form class="form-inline" action="${pageContext.request.contextPath}/news/list" method="get">
                <div class="form-group">
                    <label for="name">新闻标题</label>
                    <input type="text" class="form-control" name="key" id="name" placeholder="请输入新闻标题">
                </div>
                <input type="submit" class="btn btn-default" value="搜索"/>
                &nbsp;&nbsp;&nbsp;${not empty list ? "检索到数据：<span id='totle'>".concat(list.size()).concat("</span>条") : ""}
                <button type="button" class="btn btn-info" onclick="template.openOrClose(true, '发布新闻信息');">发布新闻</button>
            </form>
        </caption>
        <thead>
            <tr>
                <th>编号</th>
                <th>效果图</th>
                <th>标题</th>
                <th>发布时间</th>
                <th>阅读量</th>
                <th>类型</th>
                <th>来源</th>
                <th>新闻内容</th>
                <th>笔者信息</th>
                <th>是否置顶</th>
                <th>操作</th>
            </tr>
        </thead>
        <tbody>
        <c:choose>
            <c:when test="${not empty list}">
                <c:forEach items="${list}" var="news" varStatus="status">
                    <tr>
                        <td>${status.count}</td>
                        <td>${not empty news.picUrl ? '<img width="60px;" height="30px;" src="'.concat( news.picUrl).concat('"/>'): '暂无图片'}</td>
                        <td>${news.title}</td>
                        <td><fmt:formatDate value="${news.publishTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                        <td>${news.readingNu}</td>
                        <td>${news.types}</td>
                        <td>${news.sourceFrom}</td>
                        <td><div style="width: 300px;height: 40px;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;">${news.content}</div></td>
                        <td>${news.author}</td>
                        <td>${news.toTop eq 0 ?  '<button type="button" onclick="template.top2('.concat(news.id).concat(",'").concat(news.title).concat("'").concat(',true)" class="btn btn-info btn-sm">不置顶</button>') : '<button type="button" onclick="template.top2('.concat(news.id).concat(",'").concat(news.title).concat("'").concat(',false)" class="btn btn-success btn-sm">置顶</button>')}</td>
                        <td>
                            <button type="button" class="btn btn-danger" onclick="template.del(this, ${news.id}, '${news.title}');">删除</button>
                            <button type="button" class="btn btn-success" onclick="template.openOrCloseEdit(${news.id}, '${news.title}', true);">编辑</button>
                        </td>
                    </tr>
                </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr><td colspan="11" style="text-align: center;">暂无数据</td></tr>
                </c:otherwise>
            </c:choose>
        </tbody>
    </table>
    <!-- 模态框 -->
    <div id="modle" style="position: absolute;top:0;left:0;width: 100%;height: 100%;background-color: rgba(0,0,0,.5);z-index:999;display: none;">
        <div class="container" style="margin-top: 50px;background-color: #fff; border-radius: 10px;box-shadow: 0 0 31px 0px #78c7bc;padding: 30px 0;">
            <div id="modle-title" class="col-md-12 text-center" style="font-size: 20px;">新增管理员用户</div>
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <form onsubmit="return false;">
                        <div class="input-group" id="upload">
                            <span class="input-group-addon me-form-icon" id="sizing-addon2"><span class="glyphicon glyphicon-lock"></span></span>
                            <input type="text" class="form-control password" style="cursor: pointer;" name="picUrl" placeholder="点击上传预览图" readonly aria-describedby="sizing-addon2">
                        </div>
                        <div id="xiaoguotu" style="display: none;max-height: 100px;">
                            <img width="100px;" height="100px;" src="" />
                        </div>
                    </form>
                    <form onsubmit="return false;">
                        <div class="input-group">
                            <span class="input-group-addon me-form-icon" id="sizing-addon1"><span class="glyphicon glyphicon-user"></span></span>
                            <input type="text" class="form-control username" name="title" placeholder="新闻标题" aria-describedby="sizing-addon1">
                        </div>
                        <div class="input-group" style="min-height: 80px;">
                            <span class="input-group-addon me-form-icon" ><span class="glyphicon glyphicon-copyright-mark">新闻类型</span></span>
                            <div id="types" class="form-control" style="height: 100%;min-height: 80px;"></div>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon me-form-icon" id="sizing-addon6"><span class="glyphicon glyphicon-copyright-mark"></span></span>
                            <input type="text" class="form-control" placeholder="新闻来源" name="sourceFrom" aria-describedby="sizing-addon6">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon me-form-icon" id="sizing-addon7"><span class="glyphicon glyphicon-copyright-mark"></span></span>
                            <input type="text" class="form-control" placeholder="笔者信息" name="author" aria-describedby="sizing-addon7">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon me-form-icon" id="sizing-addon8"><span class="glyphicon glyphicon-copyright-mark"></span></span>
                            <textarea rows="4" class="form-control" placeholder="主题内容" name="content" aria-describedby="sizing-addon8"></textarea>
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
        <div class="container" style="margin-top: 50px;background-color: #fff; border-radius: 10px;box-shadow: 0 0 31px 0px #78c7bc;padding: 30px 0;">
            <div id="modle-titleEdit" class="col-md-12 text-center" style="font-size: 20px;">新增管理员用户</div>
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <form onsubmit="return false;">
                        <div class="input-group" id="uploadEdit">
                            <span class="input-group-addon me-form-icon" id="sizing-addon2Edit"><span class="glyphicon glyphicon-lock"></span></span>
                            <input type="text" class="form-control password" style="cursor: pointer;" name="picUrlEdit" placeholder="点击上传预览图" readonly aria-describedby="sizing-addon2Edit">
                        </div>
                        <div id="xiaoguotuEdit" style="display: none;max-height: 100px;">
                            <img width="100px;" height="100px;" src="" />
                        </div>
                    </form>
                    <form onsubmit="return false;">
                        <input type="hidden" name="idEdit">
                        <input type="hidden" name="toTopEdit">
                        <div class="input-group">
                            <span class="input-group-addon me-form-icon" id="sizing-addon1Edit"><span class="glyphicon glyphicon-user"></span></span>
                            <input type="text" class="form-control username" name="titleEdit" placeholder="新闻标题" aria-describedby="sizing-addon1Edit">
                        </div>
                        <div class="input-group" style="min-height: 80px;">
                            <span class="input-group-addon me-form-icon" ><span class="glyphicon glyphicon-copyright-mark">新闻类型</span></span>
                            <div id="typesEdit" class="form-control" style="height: 100%;min-height: 80px;"></div>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon me-form-icon" id="sizing-addon6Edit"><span class="glyphicon glyphicon-copyright-mark"></span></span>
                            <input type="text" class="form-control" placeholder="新闻来源" name="sourceFromEdit" aria-describedby="sizing-addon6Edit">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon me-form-icon" id="sizing-addon7Edit"><span class="glyphicon glyphicon-copyright-mark"></span></span>
                            <input type="text" class="form-control" placeholder="笔者信息" name="authorEdit" aria-describedby="sizing-addon7Edit">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon me-form-icon" id="sizing-addon8Edit"><span class="glyphicon glyphicon-copyright-mark"></span></span>
                            <textarea rows="4" class="form-control" placeholder="主题内容" name="contentEdit" aria-describedby="sizing-addon8Edit"></textarea>
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
    <script type="text/javascript" src="${pageContext.request.contextPath}/jsAndCss/layui/layui.js" ></script>
    <script type="text/javascript">
        layui.use('upload', function() {
            var upload = layui.upload;
            //拖拽上传
            upload.render({
                elem: '#upload'
                ,url: 'http://47.103.144.95:8888/files-system/sys/upload/upload'
                ,done: function(res){
                    console.log(res)
                    $("#xiaoguotu").css({"display":"block"});
                    var src = "http://47.103.144.95:89" + res.data.url;
                    $("#xiaoguotu img").attr({"src": src});
                    $("input[name='picUrl']").val(src);
                }
            });

            //拖拽上传
            upload.render({
                elem: '#uploadEdit'
                ,url: 'http://47.103.144.95:8888/files-system/sys/upload/upload'
                ,done: function(res){
                    console.log(res)
                    $("#xiaoguotuEdit").css({"display":"block"});
                    var src = "http://47.103.144.95:89" + res.data.url;
                    $("#xiaoguotuEdit img").attr({"src": src});
                    $("input[name='picUrlEdit']").val(src);
                }
            });
        });
        var template = {
            log: true,
            baseUrl : '${pageContext.request.contextPath}/news/',
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
            loadTypes : function(callback){
                this.ajax({url: '${pageContext.request.contextPath}/config/' + "list", m: "get", data: {}}, function(data){
                    if(data.code == 500){
                        this.tip('类型加载出错', 'd');
                    }else{
                        callback && callback.call(this, data.data);
                    }
                });
            },
            top2 : function(id, title, flag){
                if(confirm("确定要置顶新闻：" + title + " 吗？")){
                    this.ajax({url: this.baseUrl + "updateTop", m: "POST", data: {"id": id, 'toTop': flag ? '1':'0'}}, function(data){
                        if(data.code == 200){
                            this.tip('置顶成功。', 's');
                            setTimeout(function () {
                                window.location.reload();
                            }, 1500);
                        }else{
                            this.tip('置顶失败。', 'd');
                        }
                    });
                }else{
                    this.tip('已为您取消操作。');
                }
            },
            add : function(){
                var types = '';
                $("#types input[name='types']").each(function (index, item) {
                    //console.log($(this), index, item, $(this).is(":checked"), $(item).is(":checked"))
                    if($(this).is(":checked") || $(item).is(":checked")){
                        types += '<span class="label label-info">'+$(item).val()+'</span>';
                    }
                });
                //console.log(types)
                var data = {
                    picUrl: $.trim($("input[name='picUrl']").val()),
                    title: $.trim($("input[name='title']").val()),
                    types: types,
                    sourceFrom: $.trim($("input[name='sourceFrom']").val()),
                    content: $.trim($("textarea[name='content']").val()),
                    author: $.trim($("input[name='author']").val())
                };
                if(data.picUrl == null || data.picUrl.length <= 0){
                    this.tip("请上传图片", 'w');
                    return false;
                }
                if(data.title == null || data.title.length <= 0){
                    this.tip("请输入新闻标题", 'w');
                    return false;
                }
                if(data.types == null || data.types.length <= 0){
                    this.tip("请选择新闻类型", 'w');
                    return false;
                }
                if(data.sourceFrom == null || data.sourceFrom.length <= 0){
                    this.tip("请输入新闻来源。", 'w');
                    return false;
                }
                if(data.content == null || data.content.length <= 0){
                    this.tip("请输入新闻内容。", 'w');
                    return false;
                }
                if(data.author == null || data.author.length <= 0){
                    this.tip("请输入笔者信息。", 'w');
                    return false;
                }
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
            },
            openOrClose : function(flag, titile){
                flag ? $("#modle").show() : $("#modle").hide();
                $("#modle-title").text(titile);
                if(flag){
                    this.loadTypes(function(data){
                        $("#types").empty();
                        var templabel = '';
                        data && data.forEach(function(item, index, arr){
                            templabel += '<label class="checkbox-inline"><input type="checkbox" name="types" value="'+item.name+'">'+ item.name+ '</label>';
                        });
                        $("#types").html(templabel);
                    })
                }
            },
            openOrCloseEdit : function(id, titile, flag){
                flag ? $("#modle-edit").show() : $("#modle-edit").hide();
                if(flag){
                    this.ajax({url: this.baseUrl + "info", m: "POST", data: {"id": id}}, function(data){
                        if(data.code == 200){
                            $("input[name='toTopEdit']").val(data.data.toTop);
                            $("input[name='idEdit']").val(data.data.id);
                            $("input[name='picUrlEdit']").val(data.data.picUrl);
                            $("#xiaoguotuEdit").css({"display":"block"});
                            $("#xiaoguotuEdit img").attr({"src": data.data.picUrl});
                            $("input[name='titleEdit']").val(data.data.title);
                            $("#typesEdit").html(data.data.types);
                            $("input[name='sourceFromEdit']").val(data.data.sourceFrom);
                            $("textarea[name='contentEdit']").val(data.data.content);
                            $("input[name='authorEdit']").val(data.data.author);
                        }else{
                            this.tip('加载数据失败。', 'd');
                        }
                    });
                }
            },
            edit : function(){
                var data = {
                    toTop: $.trim($("input[name='toTopEdit']").val()),
                    id: $.trim($("input[name='idEdit']").val()),
                    picUrl: $.trim($("input[name='picUrlEdit']").val()),
                    title: $.trim($("input[name='titleEdit']").val()),
                    sourceFrom: $.trim($("input[name='sourceFromEdit']").val()),
                    content: $.trim($("textarea[name='contentEdit']").val()),
                    author: $.trim($("input[name='authorEdit']").val())
                };
                if(data.picUrl == null || data.picUrl.length <= 0){
                    this.tip("请上传图片", 'w');
                    return false;
                }
                if(data.title == null || data.title.length <= 0){
                    this.tip("请输入新闻标题", 'w');
                    return false;
                }
                if(data.sourceFrom == null || data.sourceFrom.length <= 0){
                    this.tip("请输入新闻来源。", 'w');
                    return false;
                }
                if(data.content == null || data.content.length <= 0){
                    this.tip("请输入新闻内容。", 'w');
                    return false;
                }
                if(data.author == null || data.author.length <= 0){
                    this.tip("请输入笔者信息。", 'w');
                    return false;
                }
                if(confirm("确定提交数据吗？")){
                    var timer = null;
                    this.ajax({url: this.baseUrl + "update", m: "POST", data: data}, function(data){
                        if(data.code == 200){
                            this.tip('更新成功。', 's');
                            this.openOrClose(false,'');
                            timer = setTimeout(function () {
                                window.location.reload();
                            }, 1500);
                        }else{
                            this.tip('更新失败。', 'd');
                        }
                    });
                }else{
                    this.tip('已为您取消操作。');
                }
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
            ajax : function(data, callback) {
                var that = this;
                $.ajax({
                    type: data.m ? data.m : "get",
                    dataType: "json",
                    url: data.url,
                    data: data.data,
                    success: function (result) {
                        if (that.log) console.log(result);
                        callback && callback.call(that, result);
                    },
                    error: function (e) {
                        alert("操作失败");
                    }
                });
            }
        };
    </script>

</body>
</html>