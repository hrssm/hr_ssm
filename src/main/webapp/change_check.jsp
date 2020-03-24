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

	<form name="humanfileForm" method="post" action="queryLocateController/modify.do" enctype="multipart/form-data">
		<table width="100%">
			<tr>
				<td><font color="#0000CC">您正在做的业务是：人力资源--人力资源档案管理--人力资源档案变更
				</font></td>
			</tr>
			<tr>
				<td align="right"><input type="submit" value="提交"
					class="BUTTON_STYLE1"> <input
					type="reset" value="清除" class="BUTTON_STYLE1"> <input
					type="button" value="返回" class="BUTTON_STYLE1"
					onclick="history.back()"></td>
			</tr>
		</table>
		<table width="100%" border="1" cellpadding=0 cellspacing=1
			bordercolorlight=#848284 bordercolordark=#eeeeee class="TABLE_STYLE1">
			<input type="hidden" name="human_id" value="${human.human_id }"/>
			<tr>
				<input type="hidden" name="huf_id" value="${human.huf_id }">
				<input type="hidden" name="hfd_id" value="${human.huf_id }">
				<td class="TD_STYLE1" width="10%">档案编号</td>
				<td colspan="6" class="TD_STYLE2">${human.human_id }</td>
				<td rowspan="6" width="13%">
					<img src="${human.human_picture }" width="100%" height="120" id="picture">
					<input type="file" name="humanpicture" id="human_picture" 
						onchange="FileElem()" style="display: none;"/>
				</td>
			</tr>
			<tr>
				<td class="TD_STYLE1" width="10%">I级机构</td>
				<td width="13%" class="TD_STYLE2">${human.first_kind_name }</td>
				<input type="hidden" name="first_kind_name" value="${human.first_kind_name }"/>
				<input type="hidden" name="first_kind_id" value="${human.first_kind_id }"/>
				<td width="10%" class="TD_STYLE1">II级机构</td>
				<td width="13%" class="TD_STYLE2">${human.second_kind_name }</td>
				<input type="hidden" name="second_kind_name" value="${human.second_kind_name }"/>
				<input type="hidden" name="second_kind_id" value="${human.second_kind_id }"/>
				<td width="10%" class="TD_STYLE1">III级机构</td>
				<td class="TD_STYLE2" colspan="2" width="2%">${human.third_kind_name }</td>
				<input type="hidden" name="third_kind_name" value="${human.third_kind_name }"/>
				<input type="hidden" name="third_kind_id" value="${human.third_kind_id }"/>
			</tr>
			<tr>
				<td class="TD_STYLE1">职位分类</td>
				<td class="TD_STYLE2">${human.human_major_kind_name }</td>
				<input type="hidden" name="human_major_kind_name" value="${human.human_major_kind_name }"/>
				<input type="hidden" name="human_major_kind_id" value="${human.human_major_kind_id }"/>
				<td class="TD_STYLE1">职位名称</td>
				<td class="TD_STYLE2">${human.hunma_major_name }</td>
				<input type="hidden" name="hunma_major_name" value="${human.hunma_major_name }"/>
				<input type="hidden" name="hunma_major_id" value="${human.human_major_id }"/>
				<td class="TD_STYLE1">职称</td>
				<td colspan="2" class="TD_STYLE2">
					<select name="human_pro_designation" class="SELECT_STYLE1" id="human_pro_designation">
							<c:forEach items="${publicList }" var="publicChar" varStatus="i">
								<c:if test="${publicChar.attribute_kind eq '职称'}">
									<option value="${publicChar.attribute_name }">${publicChar.attribute_name }</option>
								</c:if>
							</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td class="TD_STYLE1">姓名</td>
				<td class="TD_STYLE2"><input type="text" name="human_name"
					value="${human.human_name }" class="INPUT_STYLE2"></td>
				<td class="TD_STYLE1">性别</td>
				<td class="TD_STYLE2">
					<select name="human_sex" class="SELECT_STYLE1" id="human_sex">
						<option value="男">男</option>
						<option value="女">女</option>
					</select>
				</td>
				<td class="TD_STYLE1">EMAIL</td>
				<td colspan="2" class="TD_STYLE2"><input type="text"
					name="human_email" value="${human.human_email }" class="INPUT_STYLE2">
				</td>
			</tr>
			<tr>
				<td class="TD_STYLE1">电话</td>
				<td class="TD_STYLE2"><input type="text"
					name="human_telephone" value="${human.human_telephone }" class="INPUT_STYLE2"></td>
				<td class="TD_STYLE1">QQ</td>
				<td class="TD_STYLE2"><input type="text" name="human_qq"
					value="${human.human_qq }" class="INPUT_STYLE2"></td>
				<td class="TD_STYLE1">手机</td>
				<td colspan="2" class="TD_STYLE2"><input type="text"
					name="human_mobilephone" value="${human.human_mobilephone }"
					class="INPUT_STYLE2"></td>
			</tr>
			<tr>
				<td class="TD_STYLE1">住址</td>
				<td colspan="3" class="TD_STYLE2"><input type="text"
					name="human_address" value="${human.human_address }" class="INPUT_STYLE2">
				</td>
				<td class="TD_STYLE1">邮编</td>
				<td colspan="2" class="TD_STYLE2"><input type="text"
					name="human_postcode" value="${human.human_postcode }" class="INPUT_STYLE2">
				</td>
			</tr>
			<tr>
				<td class="TD_STYLE1">国籍</td>
				<td class="TD_STYLE2"><select name="human_nationality" id="human_nationality"
					class="SELECT_STYLE1">
						<c:forEach items="${publicList }" var="publicChar" varStatus="i">
							<c:if test="${publicChar.attribute_kind eq '国籍'}">
								<option value="${publicChar.attribute_name }">${publicChar.attribute_name }</option>
							</c:if>
						</c:forEach>
				</select></td>
				<td class="TD_STYLE1">出生地</td>
				<td class="TD_STYLE2"><input type="text"
					name="human_birthplace" value="${human.human_birthplace }" class="INPUT_STYLE2">
				</td>
				<td class="TD_STYLE1">生日</td>
				<td width="13%" class="TD_STYLE2"><input type="text"
					name="human_birthday" value="${human.human_birthday }"
					class="INPUT_STYLE2" id="date_start"></td>
				<td width="10%" class="TD_STYLE1">民族</td>
				<td class="TD_STYLE2"><select name="human_race" id="human_race"
					class="SELECT_STYLE1">
						<c:forEach items="${publicList }" var="publicChar" varStatus="i">
							<c:if test="${publicChar.attribute_kind eq '民族'}">
								<option value="${publicChar.attribute_name }">${publicChar.attribute_name }</option>
							</c:if>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td class="TD_STYLE1">宗教信仰</td>
				<td class="TD_STYLE2"><select name="human_religion" id="human_religion"
					class="SELECT_STYLE1">
						<c:forEach items="${publicList }" var="publicChar" varStatus="i">
							<c:if test="${publicChar.attribute_kind eq '宗教信仰'}">
								<option value="${publicChar.attribute_name }">${publicChar.attribute_name }</option>
							</c:if>
						</c:forEach>
				</select></td>
				<td class="TD_STYLE1">政治面貌</td>
				<td class="TD_STYLE2"><select name="human_party" id="human_party"
					class="SELECT_STYLE1">
						<c:forEach items="${publicList }" var="publicChar" varStatus="i">
							<c:if test="${publicChar.attribute_kind eq '政治面貌'}">
								<option value="${publicChar.attribute_name }">${publicChar.attribute_name }</option>
							</c:if>
						</c:forEach>
				</select></td>
				<td class="TD_STYLE1">身份证号码</td>
				<td class="TD_STYLE2"><input type="text"
					name="human_id_card" value="${human.human_id_card }"
					class="INPUT_STYLE2"></td>
				<td class="TD_STYLE1">社会保障号码</td>
				<td class="TD_STYLE2"><input type="text"
					name="human_society_security_id" value="${human.human_society_security_id }" class="INPUT_STYLE2">
				</td>
			</tr>
			<tr>
				<td class="TD_STYLE1">年龄</td>
				<td class="TD_STYLE2"><input type="text" name="human_age"
					value="${human.human_age }" class="INPUT_STYLE2"></td>
				<td class="TD_STYLE1">学历</td>
				<td class="TD_STYLE2"><select name="human_educated_degree" id="human_educated_degree"
					class="SELECT_STYLE1">
						<c:forEach items="${publicList }" var="publicChar" varStatus="i">
							<c:if test="${publicChar.attribute_kind eq '学历'}">
								<option value="${publicChar.attribute_name }">${publicChar.attribute_name }</option>
							</c:if>
						</c:forEach>
				</select></td>
				<td class="TD_STYLE1">教育年限</td>
				<td class="TD_STYLE2"><select name="human_educated_years" id="human_educated_years"
					class="SELECT_STYLE1">
						<c:forEach items="${publicList }" var="publicChar" varStatus="i">
							<c:if test="${publicChar.attribute_kind eq '教育年限'}">
								<option value="${publicChar.attribute_name }">${publicChar.attribute_name }</option>
							</c:if>
						</c:forEach>
				</select></td>
				<td class="TD_STYLE1">学历专业</td>
				<td class="TD_STYLE2"><select name="human_educated_major" id="human_educated_major"
					class="SELECT_STYLE1">
						<c:forEach items="${publicList }" var="publicChar" varStatus="i">
							<c:if test="${publicChar.attribute_kind eq '专业'}">
								<option value="${publicChar.attribute_name }">${publicChar.attribute_name }</option>
							</c:if>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td class="TD_STYLE1">薪酬标准</td>
				<td class="TD_STYLE2"><select name="salary_standard_id" id="salary_standard_id"
					class="SELECT_STYLE1">
						<c:forEach items="${salaryList }" var="salary" varStatus="i">
							<c:if test="${salary.standard_id != null }">
								<option value="${salary.standard_id }">${salary.standard_name }/${salary.salary_sum }</option>
							</c:if>
						</c:forEach>
						<input type="hidden" value="" name="salary_standard_name" id="salary_standard_name"/>
						<input type="hidden" value="" name="salary_sum" id="salary_sum"/>
					</select>
				</td>
				<td class="TD_STYLE1">开户行</td>
				<td class="TD_STYLE2"><input type="text" name="human_bank"
					value="${human.human_bank }" class="INPUT_STYLE2"></td>
				<td class="TD_STYLE1">帐号</td>
				<td class="TD_STYLE2"><input type="text"
					name="human_account" value="${human.human_account }"
					class="INPUT_STYLE2"></td>
				<td class="TD_STYLE1">修改人</td>
				<td class="TD_STYLE2"><input type="text" name="changer"
					value="better_wanghao" readonly="readonly" class="INPUT_STYLE2">
				</td>
				<input type="hidden" value="${human.register }" name="register"/>
				<input type="hidden" value="${human.checker }" name="checker"/>
			</tr>
			<tr>
				<input type="hidden" value="${human.regist_time }" name="regist_time"/>
				<input type="hidden" value="${human.check_time }" name="check_time"/>
				<input type="hidden" value="${human.lastly_change_time }" name="lastly_change_time"/>
				<td class="TD_STYLE1">修改时间</td>
				<td class="TD_STYLE2"><input type="text"
					name="change_time" value="${change_time }"
					readonly="readonly" class="INPUT_STYLE2"></td>
				<td class="TD_STYLE1">特长</td>
				<td class="TD_STYLE2"><select name="human_speciality" id="human_speciality"
					class="SELECT_STYLE1">
						<c:forEach items="${publicList }" var="publicChar" varStatus="i">
							<c:if test="${publicChar.attribute_kind eq '特长'}">
								<option value="${publicChar.attribute_name }">${publicChar.attribute_name }</option>
							</c:if>
						</c:forEach>
				</select></td>
				<td class="TD_STYLE1">爱好</td>
				<td class="TD_STYLE2"><select name="human_hobby" id="human_hobby"
					class="SELECT_STYLE1">
						<c:forEach items="${publicList }" var="publicChar" varStatus="i">
							<c:if test="${publicChar.attribute_kind eq '爱好'}">
								<option value="${publicChar.attribute_name }">${publicChar.attribute_name }</option>
							</c:if>
						</c:forEach>
				</select></td>
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
<script type="text/javascript">
	window.onload = init();
	function init(){
		$.ajax({
			url:"queryLocateController/checkSelect.do",
 			type:'get',
 			dataType : 'json',
 			success:function(data){
 				var human = JSON.stringify(data);
 				human = JSON.parse(human);
 				if(human != null){
 					$("#human_pro_designation").find("option").each(function (i){
 						if($(this).val() == human.human_pro_designation){
 							$(this).attr("selected",true);
 						}
 					});
 					$("#human_sex").find("option").each(function (i){
 						if($(this).val() == human.human_sex){
 							$(this).attr("selected",true);
 						}
 					});
 					$("#human_nationality").find("option").each(function (i){
 						if($(this).val() == human.human_nationality){
 							$(this).attr("selected",true);
 						}
 					});
 					$("#human_race").find("option").each(function (i){
 						if($(this).val() == human.human_race){
 							$(this).attr("selected",true);
 						}
 					});
 					$("#human_religion").find("option").each(function (i){
 						if($(this).val() == human.human_religion){
 							$(this).attr("selected",true);
 						}
 					});
 					$("#human_party").find("option").each(function (i){
 						if($(this).val() == human.human_religion){
 							$(this).attr("selected",true);
 						}
 					});
 					$("#human_educated_degree").find("option").each(function (i){
 						if($(this).val() == human.human_educated_degree){
 							$(this).attr("selected",true);
 						}
 					});
 					$("#human_educated_years").find("option").each(function (i){
 						if($(this).val() == human.human_educated_years){
 							$(this).attr("selected",true);
 						}
 					});
 					$("#human_educated_major").find("option").each(function (i){
 						if($(this).val() == human.human_educated_major){
 							$(this).attr("selected",true);
 						}
 					});
 					$("#salary_standard_name").find("option").each(function (i){
 						if($(this).val() == human.salary_standard_name){
 							$(this).attr("selected",true);
 						}
 					});
 					$("#human_speciality").find("option").each(function (i){
 						if($(this).val() == human.human_speciality){
 							$(this).attr("selected",true);
 						}
 					});
 					$("#human_hobby").find("option").each(function (i){
 						if($(this).val() == human.human_hobby){
 							$(this).attr("selected",true);
 						}
 					});
 					$("#salary_standard_id").find("option").each(function (i){
 						if($(this).val() == human.salary_standard_id){
 							$(this).attr("selected",true);
 							var test = Trim($(this).test());
 							var list = test.split("/");
							$("#salary_standard_name").val(list[0]);
							$("#salary_sum").val(list[1]);
 						}
 					});
 				}
 			}
		});
	};
	function Trim(str){
        return str.replace("/(^\s*)|(\s*$)|(\s)/g", "");
	}
	
	$("#picture").click(function (){
		document.getElementById("human_picture").click();
	});
	function FileElem(){
		var reads = new FileReader();
		var file = document.getElementById("human_picture").files[0];
		if(file != null){
			reads.readAsDataURL(file);
			reads.onload = function(e){
				var content = e.target.result;
			    document.getElementById("picture").src = content;
			}
		}
	}
	
	$("#salary_standard_id").change(function (){
		var Id = $(this).val();
		var test = Trim($(this).find("option:selected").text());
		var list = test.split("/");
		$("#salary_standard_name").val(list[0]);
		$("#salary_sum").val(list[1]);
	});
</script>
<script type="text/javascript">
	Calendar.setup({
		inputField : "date_start",
		ifFormat : "%Y-%m-%d",
		showsTime : false,
		button : "date_start",
		singleClick : true,
		step : 1
	});
	Calendar.setup({
		inputField : "date_end",
		ifFormat : "%Y-%m-%d",
		showsTime : false,
		button : "date_end",
		singleClick : true,
		step : 1
	});
</script>
</html>