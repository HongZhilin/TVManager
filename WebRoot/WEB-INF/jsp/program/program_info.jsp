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
<script language="javascript" type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	var dg;
	$(document).ready(function(){
		dg = frameElement.lhgDG;
		dg.addBtn('ok','保存',function(){
			$("#programlForm").submit();
		});
		
		/* $("#during").focus(function(){
	        var during=$("#endtime").val()-$("#starttime").val();;
			$("#during").val()=during;
	    }); */
		
	});
	
	//校验
	function checkInfo(){
		if($("#province").val()==""){
			alert("请输入省份名称!");
			$("#provinceName").focus();
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
		 if($("#program").val()==""){
			alert("请输入电视节目名称!");
			$("#program").focus();
			return false;
		}
		 if($("#starttime").val()==""){
			alert("请输入开始时间!");
			$("#starttime").focus();
			return false;
		}
		 if($("#endtime").val()==""){
			alert("请输入结束时间!");
			$("#endtime").focus();
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
		alert("新增失败，该电视节目已存在！");
		$("#channelName").select();
		$("#channelName").focus();
	}
</script>
</head>
<body>
	<form action="${msg }.html" name="programlForm" id="programlForm" target="result" method="post" onsubmit="return checkInfo();">
		<input type="hidden" name="id" id="id" value="${pd.id}"/>
	<table border="0" cellpadding="0" cellspacing="0">
		<%-- <tr class="info">
		<!-- g_id,province,channel_name,channel_id,program,starttime,endtime,during -->
			<th>省份名称:</th>
			<td><input type="text" name="gid" id="gid" class="input_txt" value="${pd.gid }"/></td>
		</tr> --%>
		<tr class="info">
			<th>省份名称:</th>
			<td><input type="text" name="province" id="province" class="input_txt" value="${pd.province }"/></td>
		</tr>
		<tr class="info">
			<th>电视台名称:</th>
			<td><input type="text" name="channelName" id="channelName" class="input_txt" value="${pd.channel_name }"/></td>
		</tr>
		<tr class="info">
            <th>电视台编号:</th>
            <td><input type="text" name="channelId" id="channelId" class="input_txt" value="${pd.channel_id}"/></td>
        </tr>
		<tr class="info">
			<th>节目名称:</th>
			<td><input type="text" name="program" id="program" class="input_txt" value="${pd.program }"/></td>
		</tr>
		
		<tr class="info">
			<th>开始时间:</th>
			<td><input type="text" name="starttime" id="starttime" class="input_txt" class="input_txt" onClick="WdatePicker({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUseStartDate:true})" value="${pd.starttime }"/></td>
		</tr>
		<tr class="info">
			<th>结束时间:</th>
			<td><input type="text" name="endtime" id="endtime"  class="input_txt" onClick="WdatePicker({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUseStartDate:true})" value="${pd.endtime }"/></td>
		</tr>

		<tr class="info">
			<th>持续时间:</th>
			<td><input type="text" name="during" id="during" class="input_txt" value="${pd.during }"/></td>
		<!-- </tr>
		      <tr class="info">
            <th>结束时间:</th>
            <td><input type="text" name="endtime" id="endtime" class="easyui-datetimebox" data-options="showSeconds:true" style="width:150px;"/></td>
        </tr> -->
	</table>
	</form>
	<iframe name="result" id="result" src="about:blank" frameborder="0" width="0" height="0"></iframe>
</body>
</html>