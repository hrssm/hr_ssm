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
<link rel="stylesheet" href="/hr_ssm/table.css" type="text/css">
<script type="text/javascript" src="/hr_ssm/javascript/comm/comm.js"></script>
</head>
<body>
	<form method="post" action="configMajorController/remove.do?mak_id=${ConfigMajor.mak_id }">
		<table width="100%">
			<tr>
				<td colspan="2"><font color="#0000CC">您正在做的业务是：人力资源--客户化设置--人力资源档案管理设置--职称设置</font></td>
			</tr>
			<tr>
				<td width="49%">您确认删除 ${ConfigMajor.major_kind_name }/ ${ConfigMajor.major_name } 这条记录吗?</td>
				<td width="51%" align="right"><input type="submit" value="删除"
					class="BUTTON_STYLE1"> <input
					type="button" value="返回" class="BUTTON_STYLE1"
					onclick="window.location.href='configMajorController/query.do'"></td>
			</tr>
		</table>

	</form>
</body>
</html>