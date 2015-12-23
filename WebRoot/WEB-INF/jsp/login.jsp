<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TV管理系统后台</title>
<link type="text/css" rel="stylesheet" href="css/login.css"/>
<script type="text/javascript" src="js/jquery-1.5.1.min.js"></script>

<script type="text/javascript">
	var errInfo = "${errInfo}";
	$(document).ready(function(){
		changeCode();
		$("#codeImg").bind("click",changeCode);
		if(errInfo!=""){
			if(errInfo.indexOf("验证码")>-1){
				$("#codeerr").show();
				$("#codeerr").html(errInfo);
				$("#code").focus();
			}else{
				$("#nameerr").show();
				$("#nameerr").html(errInfo);
			}
		}
		$("#loginname").focus();
		
		//在被嵌套时就刷新上级窗口
		if(window.parent != window){
			window.parent.location.reload(true);
		}
		//alert(window.parent);
		//alert(window.parent=window); 
	});

	function genTimestamp(){
		var time = new Date();
		return time.getTime();
	}

	function changeCode(){
		$("#codeImg").attr("src","code.html?t="+genTimestamp());
	}
	
	function resetErr(){
		$("#nameerr").hide();
		$("#nameerr").html("");
		$("#pwderr").hide();
		$("#pwderr").html("");
		$("#codeerr").hide();
		$("#codeerr").html("");
	}
	
	function check(){
		resetErr();
		if($("#loginname").val()==""){
			$("#nameerr").show();
			$("#nameerr").html("用户名不得为空！");
			$("#loginname").focus();
			return false;
		}
		if($("#password").val()==""){
			$("#pwderr").show();
			$("#pwderr").html("密码不得为空！");
			$("#password").focus();
			return false;
		}
		if($("#code").val()==""){
			$("#codeerr").show();
			$("#codeerr").html("验证码不得为空！");
			$("#code").focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
<div style="width:100%;height:645px;position: absolute;top:48%;left:50%;margin-top:-300px;margin-left:-50%;">
	<div id="mainBody">
        <div id="cloud1" class="cloud"></div>
        <div id="cloud2" class="cloud"></div>
    </div>
    <div class="loginbody">
	<div class="center">
		<div class="login_left">
			<div style="width:100%;height:auto;margin-top:180px;">
				<div class="logo"></div>
				<div class="left_txt"></div>
			</div>
		</div>
		<div class="login_right">
			<div style="width:100%;height:auto;margin-top:220px;">
			<form action="login.html" method="post" name="loginForm" onsubmit="return check();">
				<div class="login_title"></div>
				<div class="login_info">
					<label>用户名：</label><input type="text" name="loginname" id="loginname" class="login_input" value="${loginname }"/>
					&nbsp;<span id="nameerr" class="errInfo"></span>
				</div>
				<div class="login_info">
					<label>密　码：</label><input type="password" name="password" id="password" class="login_input" value="${password }"/>
					&nbsp;<span id="pwderr" class="errInfo"></span>
				</div>
				<div class="login_info">
					<label>验证码：</label><input type="text" name="code" id="code" class="login_code"/>&nbsp;&nbsp;
					<img id="codeImg" alt="点击更换" title="点击更换" src=""/>
					&nbsp;<span id="codeerr" class="errInfo"></span>
				</div><br/>
				<div class="login_info">
					<input type="submit" name="loginBtn" value="登录" class="btn"/>
					<input type="reset" name="cancelBtn" value="取消" class="btn"/>
				</div>
			</form>
			</div>
		</div>
		<div class="clear"></div>
	</div>
	</div>
	<div class="bottom">
		Copyright &copy; 2014-2015  版权所有：浙江工业大学
	</div>
</div>
</body>
</html>