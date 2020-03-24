<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
	<head>
		<base href="<%=basePath%>">
		<link rel="stylesheet" href="table.css" type="text/css" />
		<title>无标题文档</title>
		<style type="text/css">
		<!--
			.style3 {
				color: #0000CC
			}
		-->
		</style>
	</head>

<body>
	<form method="post" action="salarystandard.do">
		<table width="100%">
			<tr>
				<td><font color="#0000CC">您正在做的业务是:人力资源管理--薪酬标准管理--薪酬标准登记查询</font>
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>符合条件的薪酬标准总数: ${max }例</td>
			</tr>
		</table>
		<table width="100%" border="1" cellpadding=0 cellspacing=1
			bordercolorlight=#848284 bordercolordark=#eeeeee class="TABLE_STYLE1">
			<tr class="TR_STYLE1">
				<td width="15%" class="TD_STYLE1"><span>薪酬标准编号</span></td>
				<td width="15%" class="TD_STYLE1"><span>薪酬标准名称</span></td>
				<td width="15%" class="TD_STYLE1"><span>制定人</span></td>
				<td width="30%" class="TD_STYLE1"><span>登记时间</span></td>
				<td class="TD_STYLE1" width="15%">薪酬总额</td>
				<td class="TD_STYLE1" width="10%">变更</td>
			</tr>

			<c:forEach items="${salaryList }" var="item" varStatus="i">
				<tr class="TD_STYLE2">
					<td>
						${item.standard_id }
					</td>
					<td>${item.standard_name }</td>
					<td>${item.designer }</td>
					<td>${item.regist_time }</td>
					<td>${item.salary_sum }</td>
					<td><a href="salary_standard/queryOne.do?ssd_id=${item.ssd_id }&caozuo=query">变更</a></td>
				</tr>
			</c:forEach>

		</table>
		<p>
			&nbsp;&nbsp;总数：${max }例 &nbsp;&nbsp;&nbsp;当前第 1 页 &nbsp;&nbsp;&nbsp;共 1 页
			&nbsp;&nbsp;&nbsp;跳到第 <input name=page type=text class=input1 size=1>
			页&nbsp;&nbsp;<input type=image src="images/go.bmp" width=18 height=18
				border=0>
	</form>
</body>
</html>