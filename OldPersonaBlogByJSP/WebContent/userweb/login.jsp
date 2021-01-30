<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="../css/login.css">
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link href="../bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" />
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="../js/jquery.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="../bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script language="javascript">

function getQueryString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    var reg_rewrite = new RegExp("(^|/)" + name + "/([^/]*)(/|$)", "i");
    var r = window.location.search.substr(1).match(reg);
    var q = window.location.pathname.substr(1).match(reg_rewrite);
    if(r != null){
        return unescape(r[2]);
    }else if(q != null){
        return unescape(q[2]);
    }else{
        return null;
    }
}
if(getQueryString('sx')=='sx'){
	parent.location.reload();
	window.location='login.jsp';
}
</script>
</head>
<body >
<%
	//非法跳转
	Object obj=session.getAttribute("username");
	if(obj!=null){
		 response.sendRedirect("userdata.jsp");
	}
	
%>
<h1>登录</h1>
<form action="<%=request.getContextPath() %>/LoginServlet" method="post" name="loginfrom">
<ul>
	<li><div class="wenzi">用户名：</div><input name="uname" class="kuang" type="text" /></li>
	<li><div class="wenzi">密码：</div><input name="upwd" class="kuang" type="password"/></li>

</ul>
<a href="login.jsp"><input style="margin-top:10px;margin-left:25%;"  type="submit" value="登录"/></a>
<a href="register.jsp"><input style="margin-top:10px;margin-right:25%; float:right;"  type="button" value="注册"/></a>
</form>
</body>
</html>