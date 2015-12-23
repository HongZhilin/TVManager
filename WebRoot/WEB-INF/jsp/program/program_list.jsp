<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Test</title>
<link type="text/css" rel="stylesheet" href="../css/main.css"/>
<script type="text/javascript" src="../js/jquery-1.5.1.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$(".main_info:even").addClass("main_table_even");
		});
	</script>
</head>
<body>
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="main_table">
		<tr class="main_head">
			<th>序号</th>
			<th width="15%">电视台名称</th>
			<th width="10%">省份</th>
			<th>电视台编码</th>
			<th width="25%">节目名称</th>
			<th>开始时间</th>
			<th>结束时间</th>
			<th>持续时间（s）</th>
		</tr>
		<c:choose>
			<c:when test="${not empty varList }">
				<c:forEach items="${varList }" var="program" varStatus="vs">
					<tr class="main_info">
						<td>${vs.index+1+(page.currentPage-1)*(page.showCount)}</td>
						<td>${program.channel_name }</td>
						<td>${program.province }</td>
						<td>${program.channel_id }</td>
						<td>${program.program }</td>
						<td>${program.starttime }</td>
						<td>${program.endtime }</td>
						<td>${program.during }</td>
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
			<a href="javascript:addUser();" class="myBtn"><em>新增</em></a>
			<a href="javascript:exportUser();" class="myBtn"><em>导出</em></a>
		</div>
		${page.pageStr}
	</div>
</body>
</html>