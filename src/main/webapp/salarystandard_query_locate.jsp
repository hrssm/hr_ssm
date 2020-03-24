<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<link rel="stylesheet" href="table.css" type="text/css" />
		<link rel="stylesheet" type="text/css" media="all"
			href="javascript/calendar/calendar-win2k-cold-1.css">
		<script type="text/javascript" src="javascript/calendar/cal.js"></script>
		<title>无标题文档</title>
	</head>

	<body>
		<form method="post" action="salary_standard/queryList.do">
			<table width="100%">
				<tr>
					<td>
						<font color="#0000CC">您正在做的业务是:人力资源管理--薪酬标准管理--薪酬标准查询</font>
					</td>
				</tr>
				<tr>
					<td>
						<div align="right">
							<input type="submit" value="查询" class="BUTTON_STYLE1">
						</div>
					</td>
				</tr>
			</table>
			<input type="hidden" name="query" value="query"/>
			<table width="100%" border="1" cellpadding=0 cellspacing=1
				bordercolorlight=#848284 bordercolordark=#eeeeee
				class="TABLE_STYLE1">
				<tr>
					<td width="20%" class="TD_STYLE1">
						请输入薪酬标准编号
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="standardId" value="" class="INPUT_STYLE1">
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						请输入关键字
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="primarykey" value="" class="INPUT_STYLE1">
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						请输入登记时间
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="startTime" value="" class="INPUT_STYLE1" id="date_start">
						至
						<input type="text" name="endTime" value="" class="INPUT_STYLE1" id="date_end">
						(YYYY-MM-DD)
					</td>
				</tr>
			</table>
		</form>
	</body>
	<script type="text/javascript">
	Calendar.setup ({inputField : "date_start", ifFormat : "%Y-%m-%d", showsTime : false, button : "date_start", singleClick : true, step : 1});
	Calendar.setup ({inputField : "date_end", ifFormat : "%Y-%m-%d", showsTime : false, button : "date_end", singleClick : true, step : 1});
	</script>
</html>