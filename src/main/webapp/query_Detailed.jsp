<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="stylesheet" type="text/css" media="all"
	href="javascript/calendar/calendar-win2k-cold-1.css">
<script type="text/javascript" src="javascript/calendar/cal.js"></script>
<script type="text/javascript" src="javascript/comm/comm.js"></script>
<script language="javascript" src="javascript/winopen/winopenm.js"></script>
<script type="text/javascript" src="javascript/jquery-1.6.1.min.js"></script>
</head>

<body>

	<form name="humanfileForm" method="post" action="humanFile/modify.do">
		<table width="100%">
			<tr>
				<td><font color="#0000CC">您正在做的业务是：人力资源--人力资源档案管理--人力资源档案详细查询
				</font></td>
			</tr>
			<tr>
				<td align="right"><input type="button" value="返回" class="BUTTON_STYLE1"
					onclick="history.back()"></td>
			</tr>
		</table>
		<table width="100%" border="1" cellpadding=0 cellspacing=1
			bordercolorlight=#848284 bordercolordark=#eeeeee class="TABLE_STYLE1">
			<tr>
				<td class="TD_STYLE1" width="10%">档案编号</td>
				<td colspan="6" class="TD_STYLE2">${human.human_id }</td>
				<td rowspan="6" width="13%"><img src="${human.human_picture }" width="216" height="120"></td>
			</tr>
			<tr>
				<td class="TD_STYLE1" width="10%">I级机构</td>
				<td width="13%" class="TD_STYLE2">${human.first_kind_name }</td>
				<td width="10%" class="TD_STYLE1">II级机构</td>
				<td width="13%" class="TD_STYLE2">${human.second_kind_name }</td>
				<td width="10%" class="TD_STYLE1">III级机构</td>
				<td class="TD_STYLE2" colspan="2" width="2%">${human.third_kind_name }</td>
			</tr>
			<tr>
				<td class="TD_STYLE1">职位分类</td>
				<td class="TD_STYLE2">${human.human_major_kind_name }</td>
				<td class="TD_STYLE1">职位名称</td>
				<td class="TD_STYLE2">${human.hunma_major_name }</td>
				<td class="TD_STYLE1">职称</td>
				<td colspan="2" class="TD_STYLE2">${human.human_pro_designation }</td>
			</tr>
			<tr>
				<td class="TD_STYLE1">姓名</td>
				<td class="TD_STYLE2">${human.human_name }</td>
				<td class="TD_STYLE1">性别</td>
				<td class="TD_STYLE2">${human.human_sex } </td>
				<td class="TD_STYLE1">EMAIL</td>
				<td colspan="2" class="TD_STYLE2">${human.human_email }</td>
			</tr>
			<tr>
				<td class="TD_STYLE1">电话</td>
				<td class="TD_STYLE2">${human.human_telephone }</td>
				<td class="TD_STYLE1">QQ</td>
				<td class="TD_STYLE2">${human.human_qq }</td>
				<td class="TD_STYLE1">手机</td>
				<td colspan="2" class="TD_STYLE2">${human.human_mobilephone }</td>
			</tr>
			<tr>
				<td class="TD_STYLE1">住址</td>
				<td colspan="3" class="TD_STYLE2">${human.human_address }</td>
				<td class="TD_STYLE1">邮编</td>
				<td colspan="2" class="TD_STYLE2">${human.human_postcode }</td>
			</tr>
			<tr>
				<td class="TD_STYLE1">国籍</td>
				<td class="TD_STYLE2">${human.human_nationality }</td>
				<td class="TD_STYLE1">出生地</td>
				<td class="TD_STYLE2">${human.human_birthplace }</td>
				<td class="TD_STYLE1">生日</td>
				<td width="13%" class="TD_STYLE2">${human.human_birthday }</td>
				<td width="10%" class="TD_STYLE1">民族</td>
				<td class="TD_STYLE2">${human.human_race }</td>
			</tr>
			<tr>
				<td class="TD_STYLE1">宗教信仰</td>
				<td class="TD_STYLE2">${human.human_religion }</td>
				<td class="TD_STYLE1">政治面貌</td>
				<td class="TD_STYLE2">${human.human_party }</td>
				<td class="TD_STYLE1">身份证号码</td>
				<td class="TD_STYLE2">${human.human_id_card }</td>
				<td class="TD_STYLE1">社会保障号码</td>
				<td class="TD_STYLE2">${human.human_society_security_id }</td>
			</tr>
			<tr>
				<td class="TD_STYLE1">年龄</td>
				<td class="TD_STYLE2">${human.human_age }</td>
				<td class="TD_STYLE1">学历</td>
				<td class="TD_STYLE2">${human.human_educated_degree }</td>
				<td class="TD_STYLE1">教育年限</td>
				<td class="TD_STYLE2">${human.human_educated_years }</td>
				<td class="TD_STYLE1">学历专业</td>
				<td class="TD_STYLE2">${human.human_educated_major }</td>
			</tr>
			<tr>
				<td class="TD_STYLE1">薪酬标准</td>
				<td class="TD_STYLE2">${human.salary_standard_name }</td>
				<td class="TD_STYLE1">开户行</td>
				<td class="TD_STYLE2">${human.human_bank }</td>
				<td class="TD_STYLE1">帐号</td>
				<td class="TD_STYLE2">${human.human_account }</td>
				<td class="TD_STYLE1">复核人</td>
				<td class="TD_STYLE2">${human.checker }</td>
			</tr>
			<tr>
				<td class="TD_STYLE1">复核时间</td>
				<td class="TD_STYLE2">${human.check_time }</td>
				<td class="TD_STYLE1">特长</td>
				<td class="TD_STYLE2">${human.human_speciality }</td>
				<td class="TD_STYLE1">爱好</td>
				<td class="TD_STYLE2">${human.human_hobby }</td>
				<td class="TD_STYLE1">&nbsp;</td>
				<td class="TD_STYLE2">&nbsp;</td>
			</tr>
			<tr>
				<td class="TD_STYLE1">档案附件</td>
				<td colspan="7" class="TD_STYLE2"><a
					href="${human.attachment_name }"></a></td>
			</tr>
			<tr>
				<td class="TD_STYLE1">个人履历</td>
				<td colspan="7" class="TD_STYLE2"><textarea
						name="human_histroy_records" rows="4" class="TEXTAREA_STYLE1">${human.human_histroy_records }</textarea>
				</td>
			</tr>
			<tr>
				<td class="TD_STYLE1">家庭关系信息</td>
				<td colspan="7" class="TD_STYLE2"><textarea
						name="human_family_membership" rows="4" class="TEXTAREA_STYLE1">${human.human_family_membership }</textarea>
				</td>
			</tr>
			<tr>
				<td class="TD_STYLE1">备注</td>
				<td colspan="7" class="TD_STYLE2"><textarea name="remark"
						rows="4" class="TEXTAREA_STYLE1">${human.remark }</textarea></td>
			</tr>
		</table>
	</form>
</body>
</html>