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
<script type="text/javascript" src="javascript/comm/comm.js"></script>
<script type="text/javascript" src="js/jquery-1.6.1.min.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
	<form name="configfilethirdkindForm" method="post"
		action="configfilethirdkind/update.do">
		<input type="hidden" value="${cftk.ftk_id }" name="ftk_id">
		<table width="100%">
			<tr>
				<td><font color="#0000CC">您正在做的业务是：人力资源--客户化设置--人力资源档案管理设置--Ⅲ级机构设置
				</font></td>
			</tr>
			<tr>
				<td align="right"><input type="submit" value="提交"
					class="BUTTON_STYLE1">
					<input type="button" value="返回" class="BUTTON_STYLE1"
					onclick="window.location.href='configfilethirdkind/query.do'"></td>
			</tr>
		</table>

		<table width="100%" border="1" cellpadding=0 cellspacing=1
			bordercolorlight=#848284 bordercolordark=#eeeeee class="TABLE_STYLE1">
			<tr>
				<td width="19%" class="TD_STYLE1">I级机构编号</td>
				<td width="81%" class="TD_STYLE2"><input type="text"
					name="first_kind_id" value="${cftk.first_kind_id }" readonly="readonly"
					class="INPUT_STYLE1"></td>
			</tr>
			<tr>
				<td class="TD_STYLE1">I级机构名称</td>
				<td class="TD_STYLE2"><input type="text"
					name="first_kind_name" value="${cftk.first_kind_name }" readonly="readonly"
					class="INPUT_STYLE1"></td>
			</tr>
			<tr>
				<td width="19%" class="TD_STYLE1">Ⅱ级机构编号</td>
				<td width="81%" class="TD_STYLE2"><input type="text"
					name="second_kind_id" value="${cftk.second_kind_id }" readonly="readonly"
					class="INPUT_STYLE1"></td>
			</tr>
			<tr>
				<td class="TD_STYLE1">Ⅱ级机构名称</td>
				<td class="TD_STYLE2"><input type="text"
					name="second_kind_name" value="${cftk.second_kind_name }" readonly="readonly"
					class="INPUT_STYLE1"></td>
			</tr>
			<tr>
				<td width="19%" class="TD_STYLE1">Ⅲ级机构编号</td>
				<td width="81%" class="TD_STYLE2"><input type="text"
					name="third_kind_id" value="${cftk.third_kind_id }" readonly="readonly"
					class="INPUT_STYLE1"></td>
			</tr>
			<tr>
				<td class="TD_STYLE1">Ⅲ级机构名称</td>
				<td class="TD_STYLE2"><input type="text"
					name="third_kind_name" value="${cftk.third_kind_name }" readonly="readonly"
					class="INPUT_STYLE1"></td>
			</tr>
			<tr>
				<td class="TD_STYLE1">销售量编号（多个编号之间请用"半角逗号"加"一个空格"隔开，如", "）</td>
				<td class="TD_STYLE2"><textarea name="third_kind_sale_id"
						rows="4" class="TEXTAREA_STYLE1">${cftk.third_kind_sale_id }</textarea></td>
			</tr>
			<tr>
				<td class="TD_STYLE1">零售（多个编号之间请用"半角逗号"加"一个空格"隔开，如", "）</td>
				<td class="TD_STYLE2"><textarea name="third_kind_is_retail"
						rows="4" class="TEXTAREA_STYLE1">${cftk.third_kind_is_retail }</textarea></td>
			</tr>
		</table>
	</form>
</body>
</html>