<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.yearagain.sql.SqlHelper" %>
<%@ page import="java.sql.ResultSet" %>
<!doctype html>
<html lang="ch">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="左右结构项目，属于大人员的社交工具">
        <meta name="keywords" content="左右结构项目 社交 占座 ">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <meta name="format-detection" content="telephone=no">
        <title>yearagain.com后台</title>
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script>
            $(function() {
                $(".meun-item").click(function() {
                    $(".meun-item").removeClass("meun-item-active");
                    $(this).addClass("meun-item-active");
                    var itmeObj = $(".meun-item").find("img");
                    itmeObj.each(function() {
                        var items = $(this).attr("src");
                        items = items.replace("_grey.png", ".png");
                        items = items.replace(".png", "_grey.png")
                        $(this).attr("src", items);
                    });
                    var attrObj = $(this).find("img").attr("src");
                    ;
                    attrObj = attrObj.replace("_grey.png", ".png");
                    $(this).find("img").attr("src", attrObj);
                });
                $("#topAD").click(function() {
                    $("#topA").toggleClass(" glyphicon-triangle-right");
                    $("#topA").toggleClass(" glyphicon-triangle-bottom");
                });
                $("#topBD").click(function() {
                    $("#topB").toggleClass(" glyphicon-triangle-right");
                    $("#topB").toggleClass(" glyphicon-triangle-bottom");
                });
                $("#topCD").click(function() {
                    $("#topC").toggleClass(" glyphicon-triangle-right");
                    $("#topC").toggleClass(" glyphicon-triangle-bottom");
                });
                $(".toggle-btn").click(function() {
                    $("#leftMeun").toggleClass("show");
                    $("#rightContent").toggleClass("pd0px");
                })
            })
        </script>
        <!--[if lt IE 9]>
  <script src="js/html5shiv.min.js"></script>
  <script src="js/respond.min.js"></script>
<![endif]-->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/common.css" />
        <link rel="stylesheet" type="text/css" href="css/slide.css" />
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="css/flat-ui.min.css" />
        <link rel="stylesheet" type="text/css" href="css/jquery.nouislider.css">
    </head>

    <body>
    
    <%
    	try{
    		if(!request.getParameter("password").equals("qsbglscl")){
        		response.sendRedirect("login.jsp");
        	}else{
        		session.setAttribute("admin","true" );
        	}
    	}catch(Exception e1){
    		e1.printStackTrace();
    	}
  	//非法跳转
  	try{
  	  	Object obj=session.getAttribute("admin");
  	  	if(obj==null){
  	  		 response.sendRedirect("login.jsp");
  	  	}
  	    
    	}catch(Exception e1){
    		e1.printStackTrace();
    	}
  	
    
    %>
        <div id="wrap">
            <!-- 左侧菜单栏目块 -->
            <div class="leftMeun" id="leftMeun">
                <div id="logoDiv">
                    <p id="logoP"><img id="logo" alt="个人主页后台" src="images/logo.png"><span>个人主页后台</span></p>
                </div>
                <div id="personInfor">
                    <p id="userName">郭天任</p>
                    <p><span>yayagain@163.com</span><br /> More Templates <a href="http://yearagain.com/" target="_blank" title="个人主页">我的主页</a> </p>
                    <p>
                        <a href="login.jsp?clearlog=true">退出登录</a>
                    </p>
                </div>
                <div class="meun-title">内容管理</div>
                
                <div class="meun-item" href="#char" aria-controls="char" role="tab" data-toggle="tab"><img src="images/icon_chara_grey.png">留言管理</div>
                
            </div>
            <div id="rightContent">
            <div role="tabpanel" class="tab-pane" id="char">

                        <div class="check-div">
                           
                        </div>
                        <div class="data-div">
                            <div class="row tableHeader">
                                <div class="col-xs-1 ">
               序号
                                </div>
                                <div class="col-xs-4">
                                    用户名
                                </div>
                                <div class="col-xs-5">
                                    描述
                                </div>
                                <div class="col-xs-2">
                                    操作
                                </div>
                            </div>
                            <div id="list" class="tablebody">
                            	<!--  
                                <div class="row">
                                <div class="col-xs-1 ">ID</div>
                                <div class="col-xs-4">用户名</div>
                            	<div class="col-xs-5">内容</div>
                            	<div class="col-xs-2">
                            	<form style="float:left;" action="<%=request.getContextPath() %>/MessageServlet" method="post" ><input type="hidden" name="id" value="1"><input class="btn btn-success btn-xs" type="submit" value="pass" /></form>
                            	<form style="margin-left:10px;float:left;" action="<%=request.getContextPath() %>/MessageServlet" method="post" ><input type="hidden" name="id" value="1"><input class="btn btn-danger btn-xs" type="submit" value="删除" /></form>
                            	</div>-->
                            	
                        		</div>
                        

                    </div>

                </div>
               
				</div>	
		</div>
</div>

<script src="js/jquery.nouislider.js"></script>

<!-- this page specific inline scripts -->
<script>
                                                //min/max slider
                                                function huadong(my, unit, def, max) {
                                                    $(my).noUiSlider({
                                                        range: [0, max],
                                                        start: [def],
                                                        handles: 1,
                                                        connect: 'upper',
                                                        slide: function() {
                                                            var val = Math.floor($(this).val());
                                                            $(this).find(".noUi-handle").text(
                                                                    val + unit
                                                                    );
                                                            console.log($(this).find(".noUi-handle").parent().parent().html());
                                                        },
                                                        set: function() {
                                                            var val = Math.floor($(this).val());
                                                            $(this).find(".noUi-handle").text(
                                                                    val + unit
                                                                    );
                                                        }
                                                    });
                                                    $(my).val(def, true);
                                                }
                                                huadong('.slider-minmax1', "分钟", "5", 30);
                                                huadong('.slider-minmax2', "分钟", "6", 15);
                                                huadong('.slider-minmax3', "分钟", "10", 60);
                                                huadong('.slider-minmax4', "次", "2", 10);
                                                huadong('.slider-minmax5', "天", "3", 7);
                                                huadong('.slider-minmax6', "天", "8", 10);
</script>
</body>




<%
ResultSet rs=SqlHelper.getResultSet("SELECT * FROM message");
String cp=request.getContextPath();
while(rs.next()) {
	try{
		//int id=rs.getInt("messageid");
		
	}catch(Exception err){
		System.out.println(err);
		//out.println("<script language='javascript'>alert('"+err+"');</script>");
	}
	int id=rs.getInt("messageid");
	String age=rs.getString("mesage");
	String username=rs.getString("username");
	String strid=String.valueOf(id);
	//System.out.println(id+age+username);
	if(!rs.getBoolean("mesagesh")){
		out.println("<script language='javascript'>(function(window, undefined){$('#list').append(\"<div class='row'><div class='col-xs-1 '>"+strid+"</div><div class='col-xs-4'>"+username+"</div><div class='col-xs-5'>"+age+"</div><div class='col-xs-2'><form style='float:left;' action='"+cp+"/MessageServlet' method='post'><input type='hidden' name='id' value='"+strid+"'><input class='btn btn-success btn-xs' type='submit' value='pass' /></form><form style='margin-left:10px;float:left;' action='"+cp+"/DelMessageServlet' method='post' ><input type='hidden' name='id' value='"+strid+"'><input class='btn btn-danger btn-xs' type='submit' value='删除' /></form></div>\");})(window)</script>");
		//out.println("<script language='javascript'>(function(window, undefined){$('#list').append(\"<div class='row'><div class='col-xs-1 '>ID</div><div class='col-xs-4'>用户名</div><div class='col-xs-5'>内容</div><div class='col-xs-2'><form style='float:left;' action='"+cp+"/MessageServlet' method='post'><input type='hidden' name='id' value='1'><input class='btn btn-success btn-xs' type='submit' value='pass' /></form> </div>\");})(window)</script>");
		//out.println("<script language='javascript'>$(document).ready(function(){$('body').append('随便加文本');});</script>");


	}


}
%>
</html>