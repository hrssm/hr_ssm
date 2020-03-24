<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<script type="text/javascript" src="javascript/comm/comm.js"></script>
	</head>

	<body>
		<form name="salarystandardForm" method="post" action="salary_standard/modify.do">
			<table width="100%">
				<tr>
					<td>
						<font color="#0000CC">您正在做的业务是：人力资源--薪酬标准管理--薪酬标准登记复核
						</font>
					</td>
				</tr>
				<tr>
					<td align="right">
						<input type="submit" value="提交" id="register" class="BUTTON_STYLE1">
						<input type="reset" value="清除" class="BUTTON_STYLE1" >
					</td>
				</tr>
			</table>
			<input type="hidden" value="${salaryStandard.ssd_id }" name="ssd_id"/>
			<table width="100%" border="1" cellpadding=0 cellspacing=1
				bordercolorlight=#848284 bordercolordark=#eeeeee
				class="TABLE_STYLE1">
				<tr>
					<td width="74" class="TD_STYLE1">
						薪酬标准编号
					</td>
					<td width="168" class="TD_STYLE2">
						<input id="standard_id" type="text" name="standard_id" value="${salaryStandard.standard_id }" readonly="readonly" class="INPUT_STYLE2">
					</td>
					<td width="83" class="TD_STYLE1">
						薪酬标准名称
					</td>
					<td width="171" class="TD_STYLE2">
						<input  id="standard_name" type="text" name="standard_name" 
							value="${salaryStandard.standard_name }" class="INPUT_STYLE2">
					</td>
					<td width="170" class="TD_STYLE1">
						薪酬总额
					</td>
					<td width="138" class="TD_STYLE2">
						<label>${salaryStandard.salary_sum }</label>
					</td>
					<td width="103" class="TD_STYLE1">
						&nbsp;
					</td>
					<td width="95" height="26" class="TD_STYLE2">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						制定人
					</td>
					<td class="TD_STYLE2">
						<input  id="designer" type="text" name="designer" 
							value="${salaryStandard.designer }" class="INPUT_STYLE2">
					</td>
					<input type="hidden" name="register" value="${salaryStandard.register }"/>
					<input type="hidden" name="checker" value="${salaryStandard.checker }"/>
					<td class="TD_STYLE1">
						审核人
					</td>
					<td class="TD_STYLE2">
						<input id="checker" type="text" name="checker" 
							value="better_wanghao" readonly="readonly" class="INPUT_STYLE2">
					</td>
					<td class="TD_STYLE1">
						复核时间
					</td>
					<input type="hidden" name="regist_time" value="${salaryStandard.regist_time }"/>
					<input type="hidden" name="change_time" value="${salaryStandard.change_time }"/>
					<td class="TD_STYLE2">
						<input id="check_time" type="text" name="check_time" value="${time}" readonly="readonly" class="INPUT_STYLE2">
					</td>
					<td class="TD_STYLE1">
						&nbsp;
					</td>
					<td class="TD_STYLE2">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						审核备注
					</td>
					<td colspan="7" class="TD_STYLE2">
						<textarea id="check_comment" name="check_comment" rows="4" class="TEXTAREA_STYLE1"></textarea>
					</td>
				</tr>
				
				
				<tr class="TD_STYLE1">
					<td align="center">
						项目编号
					</td>
					<td colspan="3">
						薪酬项目名称
					</td>
					<td>
						金额
					</td>
					<td colspan="3">
						&nbsp;
					</td>
				</tr>
				
			<c:forEach items="${detailList}" var="item" varStatus="i">
				<tr class="TD_STYLE2">
					<td align="center">
						${item.item_id}
						<input type="hidden" name="list[${i.index }].item_id" value="${item.item_id}">
					</td>
					<td colspan="3">
						${item.item_name }
						<input type="hidden" name="list[${i.index }].item_name" value="${item.item_name }">
					</td>
					<td>
						<input type="text" name="list[${i.index }].salary" value="${item.salary }" class="INPUT_STYLE2">
					</td>
					<td colspan="3">
						&nbsp;
					</td>
				</tr>
				
			</c:forEach>
			
			</table>
			<p>
				&nbsp;
			</p>
		</form>
	</body>
</html>
<script type="text/javascript" src="js/jquery-1.6.1.min.js"></script>
<script type="text/javascript">
	
</script>