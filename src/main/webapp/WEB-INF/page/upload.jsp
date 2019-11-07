<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>spring mvc 文件上传</title>
</head>
<body>
	<form action="${pageContext.request.contextPath }/file/upload" method="post" enctype="multipart/form-data"
		onsubmit="return check();">
		上传者：<input id="a" type="text" name="username" value="spring"/>	
		请选择文件：<input id="b" type="file" name="uploadfile" multiple="multiple"/>
		<input type="submit" value="上传">
	</form>
	<script type="text/javascript">
		function check(){
			var name = document.getElementById("a").value;
			var file = document.getElementById("b").value;
			if(name==""){
				alert("请填写上传人");
				return false;
			}
			if(file.length == 0 || file == ""){
				alert("请选择上传文件");
				return false;
			}
			return true;
		}
	</script>
</body>
</html>