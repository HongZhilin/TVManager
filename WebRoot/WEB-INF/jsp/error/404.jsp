<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>404错误</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/error.css'/>"/>
<script type="text/javascript" src="<c:url value='/js/jquery-1.5.1.min.js'/>"></script>
<script language="javascript">
$(function(){
    $('.error').css({
        'position': 'absolute',
        'left': ($(window).width()-690)/2
    });
	$(window).resize(function(){
        $('.error').css({
            'position': 'absolute',
            'left':($(window).width()-690)/2
        });
    })
});
</script>
</head>

<body>
    <div class="error">
    	<img src="${pageContext.request.contextPath}/images/error.png" alt="页面出错"/>
    	<div class="content">
	        <h2>404 错误</h2>
	        <p>非常遗憾，您访问的页面不存在！</p>
        </div>
        <div class="clear"></div>
        <div class="buttons">
            <a href="<c:url value='/index.html'/>">返回首页</a>
            <a href="javascript:void(0)" onclick="history.go(-1)">返回上一页</a>
        </div>
    </div>
</body>

</html>
