<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="../css/register.css" rel="stylesheet" />
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link href="../bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="../js/jquery.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="../bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="../js/register.js"></script>

</head>
<body >
<h1>注册</h1>
<form action="<%=request.getContextPath() %>/RegisterServlet" method="post" name="registerfrom" onsubmit="return checkForm()">
<ul>
	<li><span class="wenzi">用户名：</span><input name="uname" class="kuang" value="允许中文" id="mytext" onclick="clearContent();" onMouseOut="Content()" type="text" /></li>
	<li><span id="tsid" class="tishi">提示：长度：4-10字符</span></li>
	<li><span class="wenzi">密码：</span><input name="upwd" id="pwd" onMouseOut="toBlur()" class="kuang" type="password" /></li>
	<li><span id="tspwd" class="tishi">提示：长度：8-12字符</span></li>
	<li><span class="wenzi">重复密码：</span><input id="repwd" onMouseOut="toBlur()" class="kuang"  type="password"" /></li>
	<li><span id="tsrepwd" class="tishi">提示：长度：8-12字符</span></li>
</ul>
<!-- 提示信息效果 -->
<script>
function clearContent(){
	   var input = document.getElementById('mytext');
	   if(input.value == '允许中文'){
	       input.value = '';
	   }
	}
function Content(){
	var input = document.getElementById('mytext');
	   if(input.value == ''){
	       input.value = '允许中文';
	       input.blur();
	       
	   }
}
function toBlur(){
	
	document.getElementById('pwd').blur();
	document.getElementById('repwd').blur();
	
}
</script>
<!-- 提示信息效果结束 -->
<div class="button">
<input type="submit" value="确认注册"/>
<a href="login.jsp"><input type="button" value="返回登录"/></a>
</div>

</form>
</body>
</html>