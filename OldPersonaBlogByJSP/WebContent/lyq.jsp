<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.yearagain.sql.SqlHelper" %>
<%@ page import="java.sql.ResultSet" %>

<html>
<head>
<title>来年-留言墙</title>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/gen.css" />
<script type='text/javascript' src='js/jquery.js'></script>
<script type='text/javascript' src='js/user.js'></script>
<style>
	*{
		margin: 0px;
		padding: 0px;
	}
	body{
		background: -webkit-linear-gradient(top, rgb(203, 235, 219) 0%, rgb(55, 148, 192) 120%);
		background: -moz-linear-gradient(top, rgb(203, 235, 219) 0%, rgb(55, 148, 192) 120%);
		font-family: '微软雅黑', sans-serif;
		font-size: 16px;
		position: relative;
		top: 0px;
		left: 0px;
		bottom: 0px;
		right: 0px;
	}
	.item {
		width: 200px;
		height: 200px;
		line-height: 30px;
		-webkit-border-bottom-left-radius: 20px 500px;
		-webkit-border-bottom-right-radius: 500px 30px;
		-webkit-border-top-right-radius: 5px 100px;
		-moz-border-bottom-left-radius: 20px 500px;
		-moz-border-bottom-right-radius: 500px 30px;
		-moz-border-top-right-radius: 5px 100px;
		box-shadow: 0 2px 10px 1px rgba(0, 0, 0, 0.2);
		-webkit-box-shadow: 0 2px 10px 1px rgba(0, 0, 0, 0.2);
		-moz-box-shadow: 0 2px 10px 1px rgba(0, 0, 0, 0.2);
	}
	#container p{
		clear:both;
		height: 100px;
		margin: 10px 10px;
		overflow: hidden;
		word-wrap: break-word;
		line-height: 1.5;
	}
	#container a{
		text-decoration: none;
		color: white;
		position: relative;
		left: 150px;
		coler: red;
		font-size: 14px;
	}
	#input{
		border: 0;
		border-radius: 5px;
		display:block;
		height: 30px;
		padding: 0 1em;
		line-height: 30px;
		width: 300px;
		margin: 20px auto;
		font-size: 20px;
	}
  </style> 
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


<form action="<%=request.getContextPath() %>/SetmageServlet" id="setm" method="post">
<input id="input" type="text" name="vlaue" placeholder="随便说说吧...按回车发布" />
</form>  
  <div id="container" style="height:520px;"> 
  </div> 
  
  <script language="javascript">
  (function ($) {
	
	var container;
	
	// 可选颜色
	var colors = ['#96C2F1', '#BBE1F1', '#E3E197', '#F8B3D0', '#FFCC00'];
	
	//创建留言页
	//var createItem = function(text,src,tail){
	$.createItem = function(text,src,tail){
		
		var color = colors[parseInt(Math.random() * 5, 10)]
		//$('<div class="item" ><img src="'+'#'+'" style="padding:5px;float:left;width:50px;height:50px",alt="游客无头像" /><p>'+ '#'+'--' +'#'+'</p><a href="#">关闭</a></div>').css({ 'background': color }).appendTo(container).drag();
		$('<div class="item" ><img src="'+src+'" style="padding:5px;float:left;width:50px;height:50px",alt="游客无头像" /><p>'+ text+'--' +tail+'</p><a href="#">关闭</a></div>').css({ 'background': color }).appendTo(container).drag();
		//alert("abb");
		//$('<div class="item" ><img src="img/me.jpg" style="padding:5px;float:left;width:50px;height:50px",alt="a啊啊啊" /><p>'+ 'aaaaaaaaaaaaaaaaaaaaaaaaaaaa' +'</p><a href="#">关闭</a></div>').css({ 'background': color }).appendTo(container).drag();
	};
	
	// 定义拖拽函数
    $.fn.drag = function () {
		
        var $this = $(this);
        var parent = $this.parent();
		
        var pw = parent.width();
        var ph = parent.height();
        var thisWidth = $this.width() + parseInt($this.css('padding-left'), 10) + parseInt($this.css('padding-right'), 10);
        var thisHeight = $this.height() + parseInt($this.css('padding-top'), 10) + parseInt($this.css('padding-bottom'), 10);

        var x, y, positionX, positionY;
        var isDown = false; 

        var randY = parseInt(Math.random() * (ph - thisHeight), 10);
        var randX = parseInt(Math.random() * (pw - thisWidth), 10);


        parent.css({
            "position": "relative",
            "overflow": "hidden"
        });
		
        $this.css({
            "cursor": "move",
            "position": "absolute"
        }).css({
            top: randY,
            left: randX
        }).mousedown(function (e) {
            parent.children().css({
                "zIndex": "0"
            });
            $this.css({
                "zIndex": "1"
            });
            isDown = true;
            x = e.pageX;
            y = e.pageY;
            positionX = $this.position().left;
            positionY = $this.position().top;
            return false;
        });
		
		
        $(document).mouseup(function (e) {
            isDown = false;
        }).mousemove(function (e) {
            var xPage = e.pageX;
            var moveX = positionX + xPage - x;

            var yPage = e.pageY;
            var moveY = positionY + yPage - y;

            if (isDown == true) {
                $this.css({
                    "left": moveX,
                    "top": moveY
                });
            } else {
                return;
            }
            if (moveX < 0) {
                $this.css({
                    "left": "0"
                });
            }
            if (moveX > (pw - thisWidth)) {
                $this.css({
                    "left": pw - thisWidth
                });
            }
            if (moveY < 0) {
                $this.css({
                    "top": "0"
                });
            }
            if (moveY > (ph - thisHeight)) {
                $this.css({
                    "top": ph - thisHeight
                });
            }
        });
    };
	
	// 初始化
	var init = function () {
		
		container = $('#container');
		
		// 绑定关闭事件
		container.on('click','a',function () {
			$(this).parent().remove();
		}).height($(window).height() -204);

		//var tests = ['道友，还处在凝气期吗？', 'I have a dream...', '路漫漫其修远兮。。。', '与自己为敌，与自己为友', '我爱A5源码', '既然选择了远方，便只顾风雨兼程！'];
		//$.each(tests, function (i,v) {
		//	$.createItem(v,"1","1");
		//});
		
		// 绑定输入框
		$('#input').keydown(function (e) {
			var $this = $(this);
			if(e.keyCode == '13') {
				//var value = $this.val();
				//if(value) {
				//	$.createItem(value,"sasa","asas");
				//	$this.val('');
				//}
				document.getElementById('setm').submit();
			}
		});
		
	};
	//$.a= function(){
	//	alert("aaa");
	//}
	//(function(window,undefined){a('aaa');})(window)
	$(function() {
		init();
	});
	
})(jQuery);
  </script> 


<%
	ResultSet rs=SqlHelper.getResultSet("SELECT * FROM showmessage");
	while(rs.next()) {
		//out.println("aaa");
		if(!rs.getBoolean("mesagesh")){
			continue;
		}
		try{
			out.println("<script language='javascript'>$(function(){$.createItem(\""+rs.getString("mesage")+"\",\""+rs.getString("tx")+"\",\""+rs.getString("tail")+"\")})</script>");
			//out.println("<script language='javascript'>$(function(){$.a();})</script>");
		}catch(Exception err){
			out.println(err);
		}
		
	}

%>






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