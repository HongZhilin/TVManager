<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Test</title>
<link type="text/css" rel="stylesheet" href="../css/main.css"/>
<script type="text/javascript" src="../js/jquery-1.5.1.min.js"></script>
<script type="text/javascript" src="../js/datePicker/WdatePicker.js"></script>
<script type="text/javascript" src="../js/lhgdialog/lhgdialog.min.js?t=self&s=areo_blue"></script>
	<script type="text/javascript">
    var dg;
		$(document).ready(function(){
			$(".main_info:even").addClass("main_table_even");
			$.getJSON("${pageContext.request.contextPath}/channel/getProvinceName.html",function (data) {
                
                $(data).each(function (n) {
                    $(".provinceName").append($("<option/>").text(data[n]).attr("value",data[n])); 
               });
           });
           
            $(".provinceName").change(function () {
                //清除二级下拉列表
                $(".channelName").empty();
                $(".channelName").append($("<option/>").text("--请选择--").attr("value",""));
                
                $.post("${pageContext.request.contextPath}/channel/findByProvinceName.html",{"province":$(this).attr("value")},function (data) {
                    //对请求返回的JSON格式进行分解加载
                    $(data).each(function (n){
                        $(".channelName").append($("<option/>").text(data[n]).attr("value",data[n]));
                    });
                });

               }); 
		});
		function search(){
            var provinceName=$(".provinceName").val();
            var channelName=$(".channelName").val();
            var progreamName=$(".progreamName").val();
            $("#programForm").submit();
        }
		
		//新增
	    function addProgram(){
	        //$(".shadow").show();
	        var dg = new $.dialog({
	            title:'新增电视节目',
	            id:'program_new',
	            width:330,
	            height:375,
	            iconTitle:false,
	            cover:true,
	            maxBtn:false,
	            xButton:true,
	            resize:false,
	            page:"${pageContext.request.contextPath}/program/toAddView.html"
	            });
	        dg.ShowDialog();
	    }
	    
	    //修改
	    function editProgram(id){
	        var dg = new $.dialog({
	            title:'修改电视节目信息',
	            id:'program_edit',
	            width:330,
	            height:375,
	            iconTitle:false,
	            cover:true,
	            maxBtn:false,
	            resize:false,
	            page:'toEditView.html?id='+id
	            });
	        dg.ShowDialog();
	    }
	    
	    
	    //删除
	     function delProgram(id){
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
	    /* 批量删除 */
	     function deletePrograms(){
	        var flag= false;
	        if(confirm("确定要批量删除这些记录吗？")){
	            flag=true;
	        }
	        if(flag){
	            document.programForm.action="${pageContext.request.contextPath }/program/deletePrograms.html";
	            document.programForm.submit();     
	        }
	        //document.location.reload();
	    } 
	</script>
</head>
<body>
    <form action="${pageContext.request.contextPath}/program/list.html" method="post" name="programForm" id="programForm">
    <div class="search_div">   
         &nbsp;&nbsp;&nbsp;&nbsp;
          所在省份：
          <select name="province" class="provinceName" style="vertical-align: middle;text-align: center;">
               <option value="${pd.province}"><c:choose><c:when test="${pd.province!=null}">${pd.province}</c:when><c:otherwise>请选择</c:otherwise></c:choose></option>
          </select>    
           电视台名称:
          <select name="channelName" class="channelName" style="vertical-align: middle;width:110px;text-align: center;">
               <option value="${pd.channelName}"><c:choose><c:when test="${pd.channelName!=null}">${pd.channelName}</c:when><c:otherwise>请选择</c:otherwise></c:choose></option>
          </select>    
           节目名称:
          <input type="text" name="program" value="${pd.program}" class="progreamName"/>     
        <a href="javascript:search();" class="myBtn"><em>查询</em></a>
    </div>
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="main_table">
		<tr class="main_head">
		    <th>选择</th>
			<th>序号</th>
			<th width="12%">电视台名称</th>
			<th width="10%">省份</th>
			<th>电视台编码</th>
			<th width="20%">节目名称</th>
			<th width="15%">开始时间</th>
			<th width="15%">结束时间</th>
			<th>持续时间（s）</th>
			<th width="10%">操作</th>
		</tr>
		<c:choose>
			<c:when test="${not empty varList }">
				<c:forEach items="${varList }" var="program" varStatus="vs">
					<tr class="main_info">
					    <td><input type="checkbox" name="id" value="${program.id}"/></td>
						<td>${vs.index+1+(page.currentPage-1)*(page.showCount)}</td>
						<td>${program.channel_name }</td>
						<td>${program.province }</td>
						<td>${program.channel_id }</td>
						<td>${program.program }</td>
						<td>${program.starttime }</td>
						<td>${program.endtime }</td>
						<%-- <td><fmt:formatDate value="${program.starttime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                        <td><fmt:formatDate value="${program.program }" pattern="yyyy-MM-dd HH:mm:ss"/></td> --%>
						<td>${program.during }</td>
						<td><a href="javascript:editProgram(${program.id });">修改</a> | <a href="javascript:delProgram(${program.id });">删除</a></td>
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
			<a href="javascript:deletePrograms();" class="myBtn"><em>批量删除</em></a>
			<a href="javascript:addProgram();" class="myBtn"><em>新增</em></a>
			<a href="javascript:exportProgram();" class="myBtn"><em>从excel导入</em></a>
			<a href="javascript:exportProgram();" class="myBtn"><em>导出到excel</em></a>
		</div>
		${page.pageStr}
	</div>
	</form>
</body>
</html>