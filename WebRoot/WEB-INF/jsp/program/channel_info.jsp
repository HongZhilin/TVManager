<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增电视频道页面</title>
<link type="text/css" rel="stylesheet" href="../css/main.css"/>
<style type="text/css">
body{width:100%;height:100%;background-color: #FFFFFF;text-align: center;}
.input_txt{width:200px;height:20px;line-height:20px;}
.info{height:40px;line-height:40px;}
.info th{text-align: right;width:75px;color: #4f4f4f;padding-right:5px;font-size: 13px;}
.info td{text-align:left;}
</style>

<script type="text/javascript" src="../js/jquery-1.5.1.min.js"></script>
<script type="text/javascript">
	var dg;
	$(document).ready(function(){
		dg = frameElement.lhgDG;
		dg.addBtn('ok','保存',function(){
			$("#channelForm").submit();
		});
		
		if($("#provinceId").val()!=""){
			$("#provinceName").attr("readonly","readonly");
			$("#provinceName").css("color","gray");
			
			var provinceName = "${pd.province_name}";
			if(provinceName!=""){
				$("#provinceName").val(provinceName);
			}
		}
	});
	
	//校验
	function checkInfo(){
		if($("#provinceName").val()==""){
			alert("请输入省份!");
			$("#provinceName").focus();
			return false;
		}
		
		if($("#provinceId").val()==""){
			alert("请输入省份编码!");
			$("#provinceId").focus();
			return false;
		}
		
		if($("#channelName").val()==""){
			alert("请输入电视台名称!");
			$("#channelName").focus();
			return false;
		}
		 if($("#channelId").val()==""){
			alert("请输入电视台编码!");
			$("#channelId").focus();
			return false;
		}
		
		return true;
	}
	//保存成功
	function success(){
		if(dg.curWin.document.forms[0]){
			dg.curWin.document.forms[0].action = dg.curWin.location+"";
			dg.curWin.document.forms[0].submit();
		}else{
			dg.curWin.location.reload();
		}
		dg.cancel();
	}
	
	function failed(){
		alert("新增失败，该电视台已存在！");
		$("#channelName").select();
		$("#channelName").focus();
	}
</script>
</head>
<body>
	<form action="${msg }.html" name="channelForm" id="channelForm" target="result" method="post" onsubmit="return checkInfo();">
		<input type="hidden" name="id" id="id" value="${pd.id}"/>
	<table border="0" cellpadding="0" cellspacing="0">
		<tr class="info">
			<th>省份名称:</th>
			<td><input type="text" name="provinceName" id="provinceName" class="input_txt" value="${pd.province_name }"/></td>
		</tr>
		<tr class="info">
			<th>省份编码:</th>
			<td><input type="text" name="provinceId" id="provinceId" class="input_txt" value="${pd.province_id }"/></td>
		</tr>
		<tr class="info">
			<th>电视台名称:</th>
			<td><input type="text" name="channelName" id="channelName" class="input_txt" value="${pd.channel_name }"/></td>
		</tr>
		<tr class="info">
			<th>电视台编码:</th>
			<td><input type="text" name="channelId" id="channelId" class="input_txt" value="${pd.channel_id }"/></td>
		</tr>
	</table>
	</form>
	<iframe name="result" id="result" src="about:blank" frameborder="0" width="0" height="0"></iframe>
</body>
</html>