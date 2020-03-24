<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<link rel="stylesheet" href="table.css" type="text/css">
	</head>

	<body>
	<form action="humanfile.do" method="post">
		<table width="100%">
			<tr>
				<td>
					<font color="#0000CC">您正在做的业务是：人力资源--人力资源档案管理--薪酬发放登记</font>
				</td>
			</tr>
			<tr>
				<td>
					薪酬单编号：${salaryGrant.salary_grant_id }
				</td>
			</tr>
			<tr>
				<td width="65%">
					薪酬次数：${salaryGrant.sgr_id }，总人数：${num }，基本薪酬总额：${total }，实发总额：
				</td>
				<td width="35%">上次发薪时间:${lastTime }</td>
			</tr>
		</table>
		<table width="100%" border="1" cellpadding=0 cellspacing=1
			bordercolorlight=#848284 bordercolordark=#eeeeee class="TABLE_STYLE1">
			<tr class="TR_STYLE1">
				<td width="10%" class="TD_STYLE1">
					序号
				</td>
				<td width="20%" class="TD_STYLE1">
					I级机构
				</td>
				<td width="20%" class="TD_STYLE1">
					II级机构
				</td>
				<td width="20%" class="TD_STYLE1">
					人数
				</td>
				<td width="20%" class="TD_STYLE1">
					基本薪酬总额(元)
				</td>
				<td width="10%" class="TD_STYLE1">
					登记
				</td>
			</tr>
			<c:forEach items="${list }" var="salaryGrant" varStatus="i">
					<tr>
						<td class="TD_STYLE2">
							${i.count }
						</td>
						<td class="TD_STYLE2">
							${salaryGrant.first_kind_name }
						</td>
						<td class="TD_STYLE2">
							${salaryGrant.second_kind_name }
						</td>
						<td class="TD_STYLE2">
							${salaryGrant.human_amount }
						</td>
						<td class="TD_STYLE2">
							${salaryGrant.salary_standard_sum }
						</td>
						<td class="TD_STYLE2">
							<c:if test="${salaryGrant.human_amount != 0 }">
								<a href="">登记</a>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			
		</table>
		<p>&nbsp;&nbsp;总数：${max }例 &nbsp;&nbsp;&nbsp;当前第 1 页  &nbsp;&nbsp;&nbsp;共 1 页  &nbsp;&nbsp;&nbsp;跳到第 <input name=page type=text class=input1 size=1> 页&nbsp;&nbsp;<input type=image src="images/go.bmp" width=18 height=18 border=0>
	</form>
	</body>
</html>