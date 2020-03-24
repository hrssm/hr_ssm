<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
	<meta content="text/html;charset=utf-8" />
<link rel="stylesheet" href="table.css" type="text/css">
 <script type="text/javascript" src="javascript/comm/comm.js"></script> 
<script type="text/javascript" src="jquery-1.6.1.min.js"></script>
<script type="text/javascript">
	function toMarkPaper(){
		$.ajax({
			type:"POST",
			url:"engageSubjectsController/toMarkPaper.do",
			success:function(){
				$("#toMark").html("评阅成功!");
			}
		});
	}
</script>
</head>
<body>
	<form id="frm">
		<table width="100%" id="initInfo">
			<tr>
				<td><font color="#0000CC">您正在做的业务是：人力资源--招聘管理--招聘考试管理--考试阅卷
				</font></td>
			</tr>
			<tr>
				<td align="center" id="toMark"><input type="button" value="点击自动评阅  "
					class="BUTTON_STYLE1" onclick="toMarkPaper()"></td>
			</tr>
		</table>
	</form>
</body>

</html>