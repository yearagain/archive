<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>1</title>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<link rel="stylesheet" type="text/css" href="../css/gen.css" />
<link rel="stylesheet" type="text/css" href="../css/zx.css" />
</head>

<body>
<!--头部-->
<div class="header">
<div class="logo">
<img src="../img/logo.gif" alt="LOGO"/>
</div>
<!--导航条-->
<div class="top-nav">
<ul>
<li><a href="../index.jsp">首页</a></li>
<li><a href="../zx.jsp">自序</a></li>
<li><a href="../paper.jsp">论文</a></li>
<li><a href="../apps.jsp">Apps</a></li>
<li><a href="../mods.jsp">Mods</a></li>
<li><a href="../lyq.jsp">留言墙</a></li>
</ul>
</div>
<!--导航条结束-->
</div>
<!--头部结束-->
<div class="mbody">
<div class="leftbody">
<h1>11</h1>
栏目:Apps 发布时间：2019年3月5日 23:54:31
<hr />
<div class="zhengwen">
1111<br />
1111<br />
<img src="../img/app2p.jpg"/></br>
下载地址：<a href="https://pan.baidu.com/s/1X-kQK-mkPuYVKfw85Iof7Q">百度网盘</a>&nbsp提取码：1qvq
</div>
<a href="../apps.jsp">返回上层</a>
</div>
</div>

<div class="rightbody">
<div style="background-color:#5b5b5b;height:50px;font-size:26px; padding-left:10px;line-height:50px;">友情链接</div>
<ul>
    <li><a href="http://yearagain.com/" target="_blank">1</a></li><br>
    <li><a href="http:/yearagain.com/" target="_blank">2222222222</a></li><br>
    <li><a target="_blank" href="yearagain.com" >33333333333</a></li><br>
    <li><a href="yearagain.com" target="_blank">4</a></li>
</ul>
</div>
</div>
<div style="clear:both"></div><!--清除浮动-->
<div class="footer">
<%
java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

java.util.Date currentTime = new java.util.Date();

String nowdate = formatter.format(currentTime); //将日期时间格式化

    Integer hitsCount = 
      (Integer)application.getAttribute("hitCounter");
	if(session.isNew()){
		if( hitsCount ==null || hitsCount == 0 ){
		       
		       hitsCount = 1;
		    }else{
		       
		       hitsCount += 1;
		    }
	}
    
    application.setAttribute("hitCounter", hitsCount);
%>
<ul>
    <li><a href="../index.jsp">首页</a></li>|
	<li><a href="../zx.jsp">自序</a></li>|
	<li><a href="../paper.jsp">论文</a></li>|
	<li><a href="../apps.jsp">Apps</a></li>|
	<li><a href="../mods.jsp">Mods</a></li>|
	<li><a href="../lyq.jsp">留言墙</a></li>
</ul>
<p class="zzq">Copyright © 2019 GTR All rights reserved.郭天任</p>
<p class="dianji" id="dianji">现在是:<%=nowdate%>,您是第 <%=hitsCount%> 位访问者</p>
</div>

</body>

</html>