<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<link rel="stylesheet" href="table.css" type="text/css">
	</head>

<body>
	<form action="deleteLocateContorller/queryList.do" method="post">
		<table width="100%">
			<tr>
				<td><font color="#0000CC">您正在做的业务是：人力资源--人力资源档案管理--人力资源档案查询</font></td>
			</tr>
			<tr>
				<td align="right"><input type="submit" value="开始"
					class="BUTTON_STYLE1"> <input
					type="button" value="返回" class="BUTTON_STYLE1"
					onclick="history.back();"></td>
			</tr>
		</table>
		<input type="hidden" value="delete" name="query"/>
		<table width="100%" border="1" cellpadding=0 cellspacing=1
			bordercolorlight=#848284 bordercolordark=#eeeeee class="TABLE_STYLE1">
			<tr class="TR_STYLE1">
				<td width="16%" class="TD_STYLE1">请输入关键字</td>
				<td width="84%" class="TD_STYLE2"><input type="text"
					name="primarykey" value="" class="INPUT_STYLE1"></td>
			</tr>
		</table>
	</form>
</body>
</html>