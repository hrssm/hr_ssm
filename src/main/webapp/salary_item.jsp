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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<head>
		<base href="<%=basePath%>">
		<link rel="stylesheet" href="table.css" type="text/css">
		<script type="text/javascript" src="javascript/comm/comm.js"></script>
	</head>

	<body>
		<form method="post" action="configfilefirstkind.do">
			<table width="100%">
				<tr>
					<td>
						<font color="#0000CC">您正在做的业务是：人力资源--客户化设置--薪酬管理设置--薪酬项目设置
						</font>
					</td>
				</tr>
				<tr>
					<td align="right">
						<input type="button" value="添加项目" class="BUTTON_STYLE1"
							onclick="window.location.href='salary_item_register.jsp'" />
					</td>
				</tr>
			</table>
			<table width="100%" border="1" cellpadding=0 cellspacing=1
				bordercolorlight=#848284 bordercolordark=#eeeeee
				class="TABLE_STYLE1">
				<tr>
					<td width="35%" class="TD_STYLE1">
						项目编号
					</td>
					<td width="35%" class="TD_STYLE1">
						项目名称
					</td>
					<td width="15%" class="TD_STYLE1">
						变更
					</td>
					<td width="15%" class="TD_STYLE1">
						删除
					</td>
				</tr>
				
				<c:forEach items="${list}" var="item" varStatus="i">
					<tr>
						<td class="TD_STYLE2">
							${item.item_number}
						</td>
						<td class="TD_STYLE2">
							${item.item_name }
						</td>
						<td class="TD_STYLE2">
							<a href="salary_item/change.do?item_id=${item.item_id}">变更</a>
						</td>
						<td class="TD_STYLE2">
							<a href="javascript:deleteSalary_item('${item.item_id}')">删除</a>
							<!-- 
							<a href="salary_item/remove.do?item_id=${item.item_id}">删除</a>
							 -->
						</td>
					</tr>
				</c:forEach>
				
			</table>
			<p>&nbsp;&nbsp;总数：${max }例 &nbsp;&nbsp;&nbsp;当前第 1 页  &nbsp;&nbsp;&nbsp;共 1 页  &nbsp;&nbsp;&nbsp;跳到第 <input name=page type=text class=input1 size=1> 页&nbsp;&nbsp;<input type=image src="images/go.bmp" width=18 height=18 border=0>
		</form>
	</body>
</html>

<script type="text/javascript">
	function deleteSalary_item(item_id){
		var flag  = window.confirm("您确定要删除吗？");
		if(flag){
			window.location.href="salary_item/remove.do?item_id="+item_id;
		}
	}

</script>