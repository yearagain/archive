$(document).ready(function () {
	$("input").blur(function () {
		var userid=document.getElementById('mytext');
		var pwd=document.getElementById('pwd');
		var repwd=document.getElementById('repwd');
		var tsuserid=document.getElementById('tsid');
		var tspwd=document.getElementById('tspwd');
		var tsrepwd=document.getElementById('tsrepwd');
		
		if(userid.value.length<4||userid.value.length>10){
			tsuserid.style.color="red";
			tsuserid.innerHTML="*用户长度4-10";
		}else{
			tsuserid.style.color="black";
			tsuserid.innerHTML="提示：长度：4-10字符";
		}
		if(repwd.value!=pwd.value){
			tsrepwd.style.color="red";
			tsrepwd.innerHTML="*两次密码不同";
			tspwd.style.color="red";
			tspwd.innerHTML="*两次密码不同";
		}else{
			if(pwd.value.length<8||pwd.value.length>12){
				tspwd.style.color="red";
				tspwd.innerHTML="*密码长度8-12";

			}else{
				tspwd.style.color="black";
				tspwd.innerHTML="提示：长度：8-12字符";
			}
			if(repwd.value.length<8||repwd.value.length>12){
				tsrepwd.style.color="red";
				tsrepwd.innerHTML="*密码长度8-12";
			}else{
				tsrepwd.style.color="black";
				tsrepwd.innerHTML="提示：长度：8-12字符";
			}
		}
		
		
		
    });
})
function checkForm(){
	var userid=document.getElementById('mytext');
	var pwd=document.getElementById('pwd');
	var repwd=document.getElementById('repwd');

	
	if(userid.value.length<4||userid.value.length>10){
		alert("用户名格式不对！");
		return false;
		
	}
	if(repwd.value!=pwd.value){
		alert("两次密码不同！");
		return false;
		
	}else{
		if(pwd.value.length<8||pwd.value.length>12){
			alert("密码格式不对！");
			return false;
			
		}
		if(repwd.value.length<8||repwd.value.length>12){
			alert("密码格式不对！");
			return false;
			
		}
	}
	return true;
	
}