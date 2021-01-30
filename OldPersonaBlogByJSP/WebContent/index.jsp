<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>来年的个人主页</title>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<script type='text/javascript' src='js/jquery.js'></script>
<link rel="stylesheet" type="text/css" href="css/gen.css" />
<script type='text/javascript' src='js/user.js'></script>

<script type='text/javascript' src='js/carousel1.js'></script>
<link rel="stylesheet" type="text/css" href="css/datu.css" />
<link rel="stylesheet" type="text/css" href="css/indexzb.css" />
</head>

<body>
<!--登录-->

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	//System.out.println(basePath+ session.getAttribute("txsrc").toString());
	Object obj=session.getAttribute("txsrc");
	if(obj==null){
		session.setAttribute("txsrc", "upload/def.jpg");
	}
%>

<div id="login" class="login"><img src="<%=basePath %>${sessionScope.txsrc}" alt="上传头像"> </div>
<iframe id="userbox" scrolling="no" src="userweb/login.jsp"></iframe>
<!--登录-->
<!--头部-->
<div class="header">
<div class="logo">
<img src="img/logo.gif" alt="LOGO"/>
</div>
<!--导航条-->
<div class="top-nav">
<ul>
<li><a href="index.jsp">首页</a></li>
<li><a href="zx.jsp">自序</a></li>
<li><a href="paper.jsp">论文</a></li>
<li><a href="apps.jsp">Apps</a></li>
<li><a href="mods.jsp">Mods</a></li>
<li><a href="lyq.jsp">留言墙</a></li>
</ul>
</div>
<!--导航条结束-->
</div>
<!--头部结束-->
<div id="carousel1" >
	<div class="car_bigp">
		<img style="display:block" src="datuimg/1.jpg"/>
		<img src="datuimg/2.jpg"/>
		<img src="datuimg/3.jpg"/>
		<img src="datuimg/4.jpg"/>
		<img src="datuimg/5.jpg"/>
		<img src="datuimg/6.jpg"/>
	</div>
	<div class="car_click">
		<div class="car_c_title">
			<p></p>
		</div>
		<div class="car_c_smallpic">
			<input class="car_c_inpt1" type="button"/>
			<img style="border:solid 2px Darkorange" src="datuimg/1.jpg"/>
			<img src="datuimg/2.jpg"/>
			<img src="datuimg/3.jpg"/>
			<img src="datuimg/4.jpg"/>
			<img src="datuimg/5.jpg"/>
			<img src="datuimg/6.jpg"/>
			<input class="car_c_inpt2" type="button"/>
		</div>
	</div>
</div>
<div class="middler">
<div class="welcome">
<div class="title">欢迎访问</div>
<p class="mexx"><br />
<br />

<br />
<br />
<br />
 <br />
 <br />
 </p>
</div>
<div class="top">
<div class="title">Top</div>
<ul>
    <li><a href="zx.jsp" >hot-title1</a></li>
    <li><a href="art/mod2.jsp" >hot-title2</a></li>
    <li><a  href="art/app1.jsp" >hot-title3</a></li>
    <li><a href="art/app2.jsp" >hot-title4</a></li>
</ul>
</div>
<div class="aboutme">
<div class="title">关于我</div>
<p>网名：来年又来年</p>
<img class="imgme" src="img/me.jpg">
<div class="mexx">
，
<br />
<br />
<br />
微博：_来年又来年</div>
</div>
<div style="clear:both"></div><!--清除浮动-->
<div class="hotmods">
<div class="title">热门模组</div>
<div class="hot">
<img style="float:left;width:100px;height:100px;padding:2px;" src="img/hotmods1.jpg"><br/>我的世界-雪老<br/><br/>
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<a href="art/mod1.jsp">下载</a>
</div>
<div class="hot">
<img style="float:left;width:100px;height:100px;padding:2px;" src="img/hotmods2.jpg"><br/>我的世界-青年<br/><br/>
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<a href="art/mod2.jsp">下载</a>
</div>
</div>
<div class="hotapps">
<div class="title">热门软件</div>
<div class="hot">
<img style="float:left;width:100px;height:100px;padding:2px;" src="img/hotapp1.jpg"><br/>来年-web颜色代码获取器<br/><br/>
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<a href="art/app1.jsp">下载</a>
</div>
<div class="hot">
<img style="float:left;width:100px;height:100px;padding:2px;" src="img/hotapp2.jpg"><br/>yearagain.com<br/><br/>
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<a href="art/app2.jsp">下载</a>
</div>
</div>
<div class="flink">
<div class="title">友情链接</div>
<ul>
    <li><a href="http://yearagain.com/" target="_blank">1</a></li>
    <li><a href="http:/yearagain.com/" target="_blank">2</a></li>
    <li><a target="_blank" href="yearagain.com" >3</a></li>
    <li><a href="yearagain.com" target="_blank">4</a></li>
</ul>
</div>
<div style="clear:both"></div><!--清除浮动-->
</div>
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
    <li><a href="index.jsp">首页</a></li>|
	<li><a href="zx.jsp">自序</a></li>|
	<li><a href="paper.jsp">论文</a></li>|
	<li><a href="apps.jsp">Apps</a></li>|
	<li><a href="mods.jsp">Mods</a></li>|
	<li><a href="lyq.jsp">留言墙</a></li>
</ul>
<p class="zzq">Copyright © 2019 GTR All rights reserved.郭天任</p>
<p class="dianji" id="dianji">现在是:<%=nowdate%>,您是第 <%=hitsCount%> 位访问者</p>
</div>

</body>

</html>