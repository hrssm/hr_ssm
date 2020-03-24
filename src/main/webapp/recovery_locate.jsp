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
<link rel="stylesheet" type="text/css" media="all"
	href="javascript/calendar/calendar-win2k-cold-1.css">
<script type="text/javascript" src="javascript/calendar/cal.js"></script>
<script type="text/javascript" src="javascript/comm/comm.js"></script>
<script type="text/javascript" src="javascript/comm/list.js"></script>
<script type="text/javascript">
	function search() {
		document.forms[0].action = "recovery_query_keywords.jsp";
		document.forms[0].submit();
	}
</script>
</head>

<body>
	<form name="humanfileForm" method="post" action="deleteLocateContorller/queryList.do">
		<table width="100%">
			<tr>
				<td><font color="#0000CC">您正在做的业务是：人力资源--人力资源档案管理--人力资源档案恢复</font>
				</td>
			</tr>
			<tr>
				<td align="right"><input type="submit" value="开始"
					class="BUTTON_STYLE1"> <input
					type="button" value="搜索" class="BUTTON_STYLE1" onclick="search();">
				</td>
			</tr>
		</table>
		<input type="hidden" value="modify" name="query"/>
		<table width="100%" border="1" cellpadding=0 cellspacing=1
				bordercolorlight=#848284 bordercolordark=#eeeeee
				class="TABLE_STYLE1">
				<tr class="TR_STYLE1">
					<td width="16%" class="TD_STYLE1">
						请选择员工所在I级机构
					</td>
					<td width="84%" class="TD_STYLE2">
						<select name="first_kind_id" size="5" id="SelectFirst" class="SELECT_STYLE2">
						</select>
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						请选择员工所在II级机构
					</td>
					<td width="84%" class="TD_STYLE2">
						<select name="second_kind_id" size="5" id="SelectSecond" class="SELECT_STYLE2"></select>
					</td>
				</tr>
				<tr class="TR_STYLE1">
					<td width="16%" class="TD_STYLE1">
						请选择员工所在III级机构
					</td>
					<td width="84%" class="TD_STYLE2">
						<select name="third_kind_id" size="5" id="SelectThird" class="SELECT_STYLE2"></select>
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						请选择职位分类
					</td>
					<td width="84%" class="TD_STYLE2">
						<select name="human_major_kind_id" size="5" id="SelectMajorkind" class="SELECT_STYLE2"></select>
					</td>
				</tr>
				<tr class="TR_STYLE1">
					<td width="16%" class="TD_STYLE1">
						请选择职位名称
					</td>
					<td width="84%" class="TD_STYLE2">
						<select name="hunma_major_id" size="5" id="SelectMajor" class="SELECT_STYLE2"></select>
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						请输入建档时间
					</td>
					<td width="84%" class="TD_STYLE2">
						<input type="text" name="regist_time" value="" style="width:14% " class="INPUT_STYLE2" id="date_start">至
						<input type="text" name="lastly_change_time" value="" style="width:14% " class="INPUT_STYLE2" id="date_end">
						（YYYY-MM-DD）
					</td>
				</tr>
			</table>
		</form>
	</body>
	<script type="text/javascript">
	Calendar.setup ({inputField : "date_start", ifFormat : "%Y-%m-%d", showsTime : false, button : "date_start", singleClick : true, step : 1});
	Calendar.setup ({inputField : "date_end", ifFormat : "%Y-%m-%d", showsTime : false, button : "date_end", singleClick : true, step : 1});
	</script>
	<script type="text/javascript">
		window.onload = init();
		function init(){
			$.ajax({
 					url:"deleteLocateContorller/init.do",
 					type:'get',
 					dataType : 'json',
 					success:function(data){
 						//初始化
 						if(data.first_total != 0)
 						{
 							var firstOptions = ``;
 							$.each(data.firstlist,function(i,item)
 							{
 								firstOptions +="<option id=first_"+item.first_kind_id+" value="+item.first_kind_id+">"+item.first_kind_name+"</option>";
 							});
 							$("#SelectFirst").append(firstOptions);
 						}
 						if(data.second_total != 0)
 						{
 							var SecondOptions = ``;
 							$.each(data.secondlist,function(i,item)
 							{
 								SecondOptions +="<option id=second_"+item.second_kind_id+" value="+item.second_kind_id+">"+item.second_kind_name+"</option>";
 							});
 							$("#SelectSecond").append(SecondOptions);
 						}
 						if(data.third_total != 0)
 						{
 							var thirdOptions = ``;
 							$.each(data.thirdlist,function(i,item)
 							{
 								thirdOptions +="<option id=third_"+item.third_kind_id+" value="+item.third_kind_id+">"+item.third_kind_name+"</option>";
 							});
 							$("#SelectThird").append(thirdOptions);
 						}
 						if(data.majorkind_total != 0)
 						{
 							var majorkindOptions = ``;
 							$.each(data.majorkindlist,function(i,item)
 							{
 								majorkindOptions +="<option id=majorkind_"+item.major_kind_id+" value="+item.major_kind_id+">"+item.major_kind_name+"</option>";
 							});
 							$("#SelectMajorkind").append(majorkindOptions);
 						}
 						if(data.major_total != 0)
 						{
 							var majorOptions = ``;
 							$.each(data.majorlist,function(i,item)
 							{
 								majorOptions +="<option id=major_"+item.major_id+" value="+item.major_id+">"+item.major_name+"</option>";
 							});
 							$("#SelectMajor").append(majorOptions);
 						}
 						//二级联动
 						$("#SelectFirst").change(function (){
 							$("#SelectSecond").each(function(){
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
	 							$("#SelectSecond").append(secondOptions);
 							}
 						});
 						//三级联动
 						$("#SelectSecond").change(function()
 						{
 							$("#SelectThird").each(function(){
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
	 							$("#SelectThird").append(thirdOptions);
 							}
 						});
 						$("#SelectMajorkind").change(function()
 						{
 							$("#SelectMajor").each(function(){
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
	 							$("#SelectMajor").append(majorOptions);
 							}
 						});
 					}
 			});
		};
	</script>
</html>