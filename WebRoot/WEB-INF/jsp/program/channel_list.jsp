 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>电视台管理</title>
<link type="text/css" rel="stylesheet" href="../css/main.css"/>
<script type="text/javascript" src="../js/jquery-1.5.1.min.js"></script>
<script type="text/javascript" src="../js/datePicker/WdatePicker.js"></script>
<script type="text/javascript" src="../js/lhgdialog/lhgdialog.min.js?t=self&s=areo_blue"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$(".main_info:even").addClass("main_table_even");
		
		//回调数据
		$.getJSON("${pageContext.request.contextPath}/channel/getProvinceName.html",function (data) {
            console.info(data);
			$(data).each(function (n) {
           		$(".provinceName").append($("<option/>").text(data[n]).attr("value",data[n])); 
           });
       });
		
	});
	
	//检索
	function search(){
		$("#channelForm").submit();
	}
	//新增
	function addChannel(){
		//$(".shadow").show();
		var dg = new $.dialog({
			title:'新增电视频道',
			id:'channel_new',
			width:330,
			height:250,
			iconTitle:false,
			cover:true,
			maxBtn:false,
			xButton:true,
			resize:false,
			page:'add.html'
			});
   		dg.ShowDialog();
	}
	
	//修改
	function editChannel(id){
		var dg = new $.dialog({
			title:'修改电视频道',
			id:'channel_edit',
			width:330,
			height:250,
			iconTitle:false,
			cover:true,
			maxBtn:false,
			resize:false,
			page:'edit.html?id='+id
			});
   		dg.ShowDialog();
	}
	
	//删除
	/* function delChannel(channel_id){
		confirm("确定要删除该记录?", function(result) {
			if(result) {
				var url = "channel/delete.html?channel_id="+channel_id+"&tm="+new Date().getTime();
				alert(url);
				$.get(url,function(data){
					if(data=="success"){
						nextPage(${page.currentPage});
					}
				});
			}
		});
	}  */
	
	//删除
	 function delChannel(id){
		var flag= false;
		if(confirm("确定要删除该记录？")){
			flag=true;
		}
		if(flag){
			var url = "delete.html?id="+id;
			$.get(url,function(data){
				console.info(data);
				document.location.reload();
			});
		}
	} 
	
</script>
</head>
<body>
  <form action="list.html" method="post" name="channelForm" id="channelForm"> 
	<div class="search_div">
		&nbsp;&nbsp;&nbsp;&nbsp;
	     省份：<select name="provinceName" class="provinceName" style="vertical-align:middle;text-align: center;">
			<!-- <option value="" >请选择</option> -->
			<option value="${pd.provinceName}">
				 <c:choose>
                	<c:when test="${pd.provinceName!=null}">${pd.provinceName}</c:when>
                	<c:otherwise>请选择</c:otherwise>
               	 </c:choose> 
           	 </option>
       	</select>
		&nbsp;&nbsp;&nbsp;&nbsp;
		电视台：<input type="text" name="channelName" value="${pd.channelName }" placeholder="这里输入电视台名称"/>
		<a href="javascript:search();" class="myBtn"><em>查询</em></a>
	</div> 
	
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="main_table">
		<tr class="main_head">
			<th width="10%">序号</th>
			<th>省份名称</th>
			<th>省份编码</th>
			<th width="30%">电视台名称</th>
			<th>电视台编码</th>
			<th>操作</th>
		</tr>
		<c:choose>
			<c:when test="${not empty varList }">
				<c:forEach items="${varList}" var="channel" varStatus="vs">
					<tr class="main_info">
						<td>${vs.index+1+(page.currentPage-1)*(page.showCount)}</td>
						<td>${channel.province_name }</td>
						<td>${channel.province_id }</td>
						<td>${channel.channel_name }</td>
						<td>${channel.channel_id }</td>
						<td><a href="javascript:editChannel(${channel.id });">修改</a> | <a href="javascript:delChannel(${channel.id });">删除</a>
						</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr class="main_info">
					<td colspan="4">没有相关数据</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
	<div class="page_and_btn">
		<div>
			<a href="javascript:addChannel();" class="myBtn"><em>新增</em></a>
		</div>
		${page.pageStr}
	</div>
  </form>	
</body>
</html>