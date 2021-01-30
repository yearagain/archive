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
<link rel="stylesheet" href="../css/userdata.css">
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
	window.location='userdata.jsp';
}
</script>
</head>
<body>
<%
	//非法跳转
	Object obj=session.getAttribute("username");
	if(obj==null){
		 response.sendRedirect("login.jsp");
	}
	//头像路径
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<div class="tx"><img alt="头像" src="<%=basePath %>${sessionScope.txsrc}" /></div>
<div class="right">用户名：<br />${sessionScope.username}<br />

<a href="<%=request.getContextPath() %>/ClearSessionServlet">注销</a>

</div>
<form action="<%=request.getContextPath() %>/UploadServlet" method="post" enctype="multipart/form-data">
<div class="ctx"><h3>修改头像</h3><input type="file" name="myFile"><input type="submit" value="上传"></div>
</form>
<form action="<%=request.getContextPath() %>/UpTailServlet" method="post" >
<div class="gtail" ><h3>修改小尾巴</h3><input name="tailva" type="text" value="${sessionScope.tail}">
<input type="submit" value="修改">
</div>

</form>
</body>
</html>