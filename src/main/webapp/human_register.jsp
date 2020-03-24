<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script type="text/javascript" src="javascript/comm/select.js"></script>
<script type="text/javascript" src="javascript/jquery-1.6.1.min.js"></script>
</head>

<body>
	<form name="humanfileForm" method="post" action="humanFile/add.do">
		<table width="100%">
			<tr>
				<td><font color="#0000CC">您正在做的业务是：人力资源--人力资源档案管理--人力资源档案登记
				</font></td>
			</tr>
			<tr>
				<td align="right"><input type="submit" value="提交"
					class="BUTTON_STYLE1"> <input type="reset" value="清除"
					class="BUTTON_STYLE1"></td>
			</tr>
		</table>
		<input type="hidden" name="human_id" value="${hufid }">
		<input type="hidden" name="huf_id" value="${count }">
		<input type="hidden" name="hfd_id" value="${count }">
		<table width="100%" border="1" cellpadding=0 cellspacing=1
			bordercolorlight=#848284 bordercolordark=#eeeeee class="TABLE_STYLE1">
			<tr>
				<td class="TD_STYLE1" width="11%">I级机构</td>
				<td width="14%" class="TD_STYLE2">
					<select name="first_kind_id" class="SELECT_STYLE1" id="selectFirst">
							<option value="">&nbsp;</option>
					</select>
					<input type="hidden" name="first_kind_name" value="" id="first_kind_name">
				</td>
				<td width="11%" class="TD_STYLE1">II级机构</td>
				<td width="14%" class="TD_STYLE2">
					<select name="second_kind_id" class="SELECT_STYLE1" id="selectSecond">
							<option value="">&nbsp;</option>
					</select> 
					<input type="hidden" name="second_kind_name" value=""
						id="second_kind_name">
				</td>
				<td width="11%" class="TD_STYLE1">III级机构</td>
				<td class="TD_STYLE2" colspan="2">
					<select name="third_kind_id" class="SELECT_STYLE1" id="selectThird">
							<option value="">&nbsp;</option>
					</select>
					<input type="hidden" name="third_kind_name" value="" id="third_kind_name">
				</td>
				<td rowspan="5">&nbsp;</td>
			</tr>
			<tr>
				<td class="TD_STYLE1">部门分类</td>
				<td class="TD_STYLE2"><select name="human_major_kind_id"
					class="SELECT_STYLE1" id="selectMajorkind">
						<option value="">&nbsp;</option>
					</select>
					<input type="hidden" name="human_major_kind_name" value="" id="human_major_kind_name" />
				</td>
				<td class="TD_STYLE1">职位名称</td>
				<td class="TD_STYLE2">
					<select name="human_major_id" class="SELECT_STYLE1" id="selectMajor">
						<option value="">&nbsp;</option>
					</select>
					<input type="hidden" name="hunma_major_name" value="" id="human_major_name" />
				</td>
				<td class="TD_STYLE1">职称</td>
				<td colspan="2" class="TD_STYLE2">
					<select name="human_pro_designation" class="SELECT_STYLE1" id="publicChar">
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
					value="" class="INPUT_STYLE2"></td>
				<td class="TD_STYLE1">性别</td>
				<td class="TD_STYLE2"><select name="human_sex"
					class="SELECT_STYLE1"><option value="男">男</option>
						<option value="女">女</option></select></td>
				<td class="TD_STYLE1">EMAIL</td>
				<td colspan="2" class="TD_STYLE2"><input type="text"
					name="human_email" value="" class="INPUT_STYLE2"></td>
			</tr>
			<tr>
				<td class="TD_STYLE1">电话</td>
				<td class="TD_STYLE2"><input type="text" name="human_telephone"
					value="" class="INPUT_STYLE2"></td>
				<td class="TD_STYLE1">QQ</td>
				<td class="TD_STYLE2"><input type="text" name="human_qq"
					value="" class="INPUT_STYLE2"></td>
				<td class="TD_STYLE1">手机</td>
				<td colspan="2" class="TD_STYLE2"><input type="text"
					name="human_mobilephone" value="" class="INPUT_STYLE2"></td>
			</tr>
			<tr>
				<td class="TD_STYLE1">住址</td>
				<td colspan="3" class="TD_STYLE2"><input type="text"
					name="human_address" value="" class="INPUT_STYLE2"></td>
				<td class="TD_STYLE1">邮编</td>
				<td colspan="2" class="TD_STYLE2"><input type="text"
					name="human_postcode" value="" class="INPUT_STYLE2"></td>
			</tr>
			<tr>
				<td class="TD_STYLE1">国籍</td>
				<td class="TD_STYLE2"><select name="human_nationality"
					class="SELECT_STYLE1">
						<c:forEach items="${publicList }" var="publicChar" varStatus="i">
							<c:if test="${publicChar.attribute_kind eq '国籍'}">
								<option value="${publicChar.attribute_name }">${publicChar.attribute_name }</option>
							</c:if>
						</c:forEach>
				</select></td>
				<td class="TD_STYLE1">出生地</td>
				<td class="TD_STYLE2"><input type="text"
					name="human_birthplace" value="" class="INPUT_STYLE2"></td>
				<td class="TD_STYLE1">生日</td>
				<td width="13%" class="TD_STYLE2"><input type="text"
					name="human_birthday" value="" class="INPUT_STYLE2" id="date_start">
				</td>
				<td width="11%" class="TD_STYLE1">民族</td>
				<td class="TD_STYLE2" width="14%"><select name="human_race"
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
				<td class="TD_STYLE2"><select name="human_religion"
					class="SELECT_STYLE1">
						<c:forEach items="${publicList }" var="publicChar" varStatus="i">
							<c:if test="${publicChar.attribute_kind eq '宗教信仰'}">
								<option value="${publicChar.attribute_name }">${publicChar.attribute_name }</option>
							</c:if>
						</c:forEach>
				</select></td>
				<td class="TD_STYLE1">政治面貌</td>
				<td class="TD_STYLE2"><select name="human_party"
					class="SELECT_STYLE1">
						<c:forEach items="${publicList }" var="publicChar" varStatus="i">
							<c:if test="${publicChar.attribute_kind eq '政治面貌'}">
								<option value="${publicChar.attribute_name }">${publicChar.attribute_name }</option>
							</c:if>
						</c:forEach>
				</select></td>
				<td class="TD_STYLE1">身份证号码</td>
				<td class="TD_STYLE2"><input type="text" name="human_id_card"
					value="" class="INPUT_STYLE2"></td>
				<td class="TD_STYLE1">社会保障号码</td>
				<td class="TD_STYLE2"><input type="text"
					name="human_society_security_id" value="" class="INPUT_STYLE2">
				</td>
			</tr>
			<tr>
				<td class="TD_STYLE1">年龄</td>
				<td class="TD_STYLE2"><input type="text" name="human_age"
					value="" class="INPUT_STYLE2"></td>
				<td class="TD_STYLE1">学历</td>
				<td class="TD_STYLE2"><select name="human_educated_degree"
					class="SELECT_STYLE1">
						<c:forEach items="${publicList }" var="publicChar" varStatus="i">
							<c:if test="${publicChar.attribute_kind eq '学历'}">
								<option value="${publicChar.attribute_name }">${publicChar.attribute_name }</option>
							</c:if>
						</c:forEach>
				</select></td>
				<td class="TD_STYLE1">教育年限</td>
				<td class="TD_STYLE2"><select name="human_educated_years"
					class="SELECT_STYLE1">
						<c:forEach items="${publicList }" var="publicChar" varStatus="i">
							<c:if test="${publicChar.attribute_kind eq '教育年限'}">
								<option value="${publicChar.attribute_name }">${publicChar.attribute_name }</option>
							</c:if>
						</c:forEach>
				</select></td>
				<td class="TD_STYLE1">专业</td>
				<td class="TD_STYLE2"><select name="human_educated_major"
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
					value="" class="INPUT_STYLE2"></td>
				<td class="TD_STYLE1">帐号</td>
				<td class="TD_STYLE2"><input type="text" name="human_account"
					value="" class="INPUT_STYLE2"></td>
				<td class="TD_STYLE1">登记人</td>
				<td class="TD_STYLE2"><input type="text" name="register"
					value="better_wanghao" readonly="readonly" class="INPUT_STYLE2">
				</td>
			</tr>
			<tr>
				<td class="TD_STYLE1">建档时间</td>
				<td class="TD_STYLE2"><input type="text" name="regist_time"
					value="${time }" readonly="readonly"
					class="INPUT_STYLE2"></td>
				<td class="TD_STYLE1">特长</td>
				<td class="TD_STYLE2"><select name="human_speciality"
					class="SELECT_STYLE1">
						<c:forEach items="${publicList }" var="publicChar" varStatus="i">
							<c:if test="${publicChar.attribute_kind eq '特长'}">
								<option value="${publicChar.attribute_name }">${publicChar.attribute_name }</option>
							</c:if>
						</c:forEach>
				</select></td>
				<td class="TD_STYLE1">爱好</td>
				<td class="TD_STYLE2"><select name="human_hobby"
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
				<td class="TD_STYLE1">个人履历</td>
				<td colspan="7" class="TD_STYLE2"><textarea
						name="human_histroy_records" rows="4" class="TEXTAREA_STYLE1"></textarea>
				</td>
			</tr>
			<tr>
				<td class="TD_STYLE1">家庭关系信息</td>
				<td colspan="7" class="TD_STYLE2"><textarea
						name="human_family_membership" rows="4" class="TEXTAREA_STYLE1"></textarea>
				</td>
			</tr>
			<tr>
				<td class="TD_STYLE1">备注</td>
				<td colspan="7" class="TD_STYLE2"><textarea name="remark"
						rows="4" class="TEXTAREA_STYLE1"></textarea></td>
			</tr>
		</table>
	</form>
</body>
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
<script type="text/javascript">
	function Trim(str){
        return str.replace(/(^\s*)|(\s*$)|(\s)/g, "");
	}

	$("#selectFirst").change(function (){
		var firstId = $(this).val();
		var test = Trim($(this).find("option:selected").text());
		$("#first_kind_name").val(test);
	});
	$("#selectSecond").change(function (){
		var firstId = $(this).val();
		var test = Trim($(this).find("option:selected").text());
		$("#second_kind_name").val(test);
	});
	$("#selectThird").change(function (){
		var firstId = $(this).val();
		var test = Trim($(this).find("option:selected").text());
		$("#third_kind_name").val(test);
	});
	$("#selectMajorkind").change(function (){
		var firstId = $(this).val();
		var test = Trim($(this).find("option:selected").text());
		$("#human_major_kind_name").val(test);
	});
	$("#selectMajor").change(function (){
		var firstId = $(this).val();
		var test = Trim($(this).find("option:selected").text());
		$("#human_major_name").val(test);
	});
	$("#salary_standard_id").change(function (){
		var Id = $(this).val();
		var test = Trim($(this).find("option:selected").text());
		var list = test.split("/");
		$("#salary_standard_name").val(list[0]);
		$("#salary_sum").val(list[1]);
	});
	window.onload = check();
	function check(){
			//获得系统当前时间的方法
			$.ajax({
 					url:"humanFile/init.do",
 					type:'get',
 					dataType : 'json',
 					success:function(data){
 						//存在一级机构
 						if(data.first_total != 0)
 						{
 							var firstOptions = ``;
 							$.each(data.firstlist,function(i,item)
 							{
 								firstOptions +="<option id=first_"+item.first_kind_id+" value="+item.first_kind_id+">"+item.first_kind_name+"</option>";
 							});
 							$("#selectFirst").append(firstOptions);
 						}
 						
 						//联动二级机构
 						$("#selectFirst").change(function()
 						{
 							$("#selectSecond").each(function(){
 								if($(this).val() != ""){
 									$(this).empty();
 								}
 							});
 							var fid = $(this).val();
 							if(data.second_total != 0)
 							{
	 							var secondOptions = ``;
	 							$.each(data.secondlist,function(i,item)
	 							{
	 								if(fid == item.first_kind_id)
	 								{
	 									secondOptions +="<option id=second_"+item.second_kind_id+" value="+item.second_kind_id+">"+item.second_kind_name+"</option>";
	 								}
	 							});
	 							$("#selectSecond").append(secondOptions);
 							}
 						});
						 						
 						//联动三级机构
 						$("#selectSecond").change(function()
 						{
 							$("#selectThird").each(function(){
 								if($(this).val() != ""){
 									$(this).empty();
 								}
 							});
 							var sid = $(this).val();
 							if(data.third_total != 0)
 							{
	 							var thirdOptions = ``;
	 							$.each(data.thirdlist,function(i,item)
	 							{
	 								if(sid == item.second_kind_id)
	 								{
	 									thirdOptions +="<option id=third_"+item.third_kind_id+" value="+item.third_kind_id+">"+item.third_kind_name+"</option>";
	 								}
	 							});
	 							$("#selectThird").append(thirdOptions);
 							}
 						});
 						
 						//存在部门
 						if(data.majorkind_total != 0)
 						{
 							var majorkindOptions = ``;
 							$.each(data.majorkindlist,function(i,item)
 							{
 								majorkindOptions +="<option id=majorkind_"+item.major_kind_id+" value="+item.major_kind_id+">"+item.major_kind_name+"</option>";
 							});
 							$("#selectMajorkind").append(majorkindOptions);
 						}
 						
 						//联动职位
 						$("#selectMajorkind").change(function()
 						{
 							$("#selectMajor").each(function(){
 								if($(this).val() != ""){
 									$(this).empty();
 								}
 							});
 							var mid = $(this).val();
 							if(data.major_total != 0)
 							{
	 							var majorOptions = ``;
	 							$.each(data.majorlist,function(i,item)
	 							{
	 								if(mid == item.major_kind_id)
	 								{
	 									majorOptions +="<option id=major_"+item.major_id+" value="+item.major_id+">"+item.major_name+"</option>";
	 								}
	 							});
	 							$("#selectMajor").append(majorOptions);
 							}
 						});
 					}
 				});
 			}
</script>
</html>