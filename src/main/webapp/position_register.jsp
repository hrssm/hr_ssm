<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>My JSP 'index.jsp' starting page</title>
	 
		 <link rel="stylesheet"
			href="/hr_ssm/table.css" type="text/css">
		<link rel="stylesheet"
			href="/hr_ssm/css/cwcalendar.css" type="text/css">
		<script type="text/javascript"
			src="/hr_ssm/javascript/comm/comm.js">
		</script>
		<script type="text/javascript"
			src="/hr_ssm/javascript/comm/list.js">
		</script>
		<script type="text/javascript"
			src="/hr_ssm/javascript/comm/time.js">
		</script>
		<script type="text/javascript"
			src="/hr_ssm/javascript/calendar-ch.js">
		</script>
		<script type="text/javascript"
			src="/hr_ssm/javascript/jquery-1.6.1.min.js">
		</script>
		<script type="text/javascript"
			src="/hr_ssm/javascript/locate.js">
		</script>
		<script type="text/javascript" src="/hr_ssm/jquery-1.6.1.min.js"></script>
 		<script type="text/javascript">
 			window.onload=check;
		function tick() {
			var now = new Date();
			var hours, minutes, seconds, noon;
			var intHours, intMinutes, intSeconds;
			intHours = now.getHours();
			intMinutes = now.getMinutes();
			intSeconds = now.getSeconds();
			if (intHours < 24) {
				hours = intHours+":";
				noon = "A.M.";
			} else {
				intHours = intHours - 24;
				hours = intHours + ":";
				noon = "P.M.";
			}
			if (intMinutes < 10) {
				minutes = "0"+intMinutes+":";
			} else {
				minutes = intMinutes+":";
			}
			if (intSeconds < 10) {
				seconds = "0"+intSeconds+" ";
			} else {
				seconds = intSeconds+" ";
			}
			timeString = hours+minutes+seconds;
			var now = new Date();
		  	document.getElementById("nowTime").value=now.getFullYear()+"-"+(now.getMonth()+1)+"-"+now.getDate()+" "+timeString;
			window.setTimeout("tick();", 1000);
		}
		
		//load事件
		function check(){
			//获得系统当前时间的方法
			$.ajax({
 					url:"engagemajorrelease/initAdd.do",
 					type:'get',
 					dataType : 'json',
 					success:function(data){
 					//存在一级机构
 						if(data.f_total != 0)
 						{
 							var firstOptions = ``;
 							$.each(data.configFileFirstKinds,function(i,item)
 							{
 								firstOptions +="<option id=first_"+item.first_kind_id+" value="+item.first_kind_id+">"+item.first_kind_name+"</option>";
 							});
 							$("#firstKindId").append(firstOptions);
 						}
 						
 						//联动二级机构
 						$("#firstKindId").change(function()
 						{
 							var fid = $(this).val();
 							if(fid){
	 							$("#fisrtKindName").val($("#firstKindId option:selected").text());
	 							if(data.s_total != 0)
	 							{
		 							var secondOptions = ``;
		 							$.each(data.configFileSecondKinds,function(i,item)
		 							{
		 								if(fid == item.first_kind_id)
		 								{
		 									secondOptions +="<option id=second_"+item.second_kind_id+" value="+item.second_kind_id+">"+item.second_kind_name+"</option>";
		 								}
		 							});
		 							$("#secondKindId").append(secondOptions);
	 							}
 							}
 							
 						});
						 						
 						//联动三级机构
 						$("#secondKindId").change(function()
 						{
 							var sid = $(this).val();
 							if(sid){
 								$("#secondKindName").val($("#secondKindId option:selected").text());
 							
	 							if(data.t_total != 0)
	 							{
		 							var thirdOptions = ``;
		 							$.each(data.configFileThirdKinds,function(i,item)
		 							{
		 								if(sid == item.third_kind_id)
		 								{
		 									thirdOptions +="<option id=third_"+item.third_kind_id+" value="+item.third_kind_id+">"+item.third_kind_name+"</option>";
		 								}
		 							});
		 							$("#thirdKindId").append(thirdOptions);
	 							}
 							}
 							
 						});
 						$("#thirdKindId").change(function(){
 							var tid = $(this).val();
 							if(tid)
 							{
 								$("#thirdKindName").val($("#thirdKindId option:selected").text());
 							}
 						});
 						
 						//职位分类初始化
 						if(data.cmk_total != 0)
 						{
 							var cmkOptions = ``;
 							$.each(data.configMajorKinds,function(i,item)
 							{
 								cmkOptions += "<option value="+ item.major_kind_id +" id=majorkind_" + item.major_kind_id +">"+item.major_kind_name+"</option>";
 							});
 							$("#majorKindId").append(cmkOptions);
 						}
 						
 						//联动职位名称
 						$("#majorKindId").change(function()
 						{
 							var cmkid = $(this).val();
 							if(cmkid)
 							{
 								$("#majorKindName").val($("#majorKindId option:selected").text());
 								
	 							if(data.t_total != 0)
	 							{
		 							var cmOptions = ``;
		 							$.each(data.configMajors,function(i,item)
		 							{
		 								if(cmkid == item.major_kind_id)
		 								{
		 									cmOptions +="<option value="+ item.mak_id +" id=major_" + item.mak_id +">"+item.major_name+"</option>";
		 								}
		 							});
		 							$("#majorId").append(cmOptions);
	 							}
 							}
 							
 							$("#majorId").change(function(){
 								var mid = $(this).val();
	 							if(mid)
	 							{
	 								$("#majorName").val($("#majorId option:selected").text());
	 							}
 							});
 							
 						});
 					}
 				});
		  	tick();					
		}
 		</script>
 	<script type="text/javascript">
 	   function mysubmit(){  
 	    //if(document.getElementById("firstKindId").value==""){
 	    	//alert("消息提示:请选择一级机构");
 	       //$.messager.show("消息提示","请选择一级机构",2000);
 	       //return ;
 	       //}
 	   	//检查和装配信息
 	   	  
 	  	alert("检查完毕");
 	  	//$("#humanfileForm").action = ;
 	  	document.humanfileForm.action = "engagemajorrelease/add.do";
		document.humanfileForm.submit();
	}
</script> 
 	</head>
	<body>
	
		<%
			String first = null;
			String second = null;
			String third = null;
		 %>
		<form name="humanfileForm" method="post">
			<input type="hidden" id="fisrtKindName" name="first_kind_name"/>
			<input type="hidden" id="secondKindName" name="second_kind_name">
			<input type="hidden" id="thirdKindName" name="third_kind_name">
			<input type="hidden" id="majorKindName" name="major_kind_name">
			<input type="hidden" id="majorName" name="major_name">
			
			<table width="100%">
				<tr>
					<td>
						<font color="black">您正在做的业务是：人力资源--招聘管理--职位发布管理--职位发布登记 </font>
					</td>
				</tr>
				<tr>
					<td align="right">
						<input type="button" value="提交" class="BUTTON_STYLE1" 
						  onclick="mysubmit()">
						<input type="reset" value="清除" class="BUTTON_STYLE1">
					</td>
				</tr>
			</table>
			<table width="100%" border="1" cellpadding=0 cellspacing=1
				bordercolorlight=#848284 bordercolordark=#eeeeee
				class="TABLE_STYLE1">
				<tr>
					<td class="TD_STYLE1" width="11%">
						I级机构
					</td>
					<td width="14%" class="TD_STYLE2">
						
						<select name="first_kind_id" id="firstKindId"  class="SELECT_STYLE1" onchange="querysecondByFid()"> 
						<option value="">--请选择--</option>
					 </select>
					</td>
					<td width="11%" class="TD_STYLE1">
						II级机构
					</td>
					<td width="14%" class="TD_STYLE2">
						<select name="second_kind_id" id="secondKindId" class="SELECT_STYLE1" onchange="queryThirdyBySid()"> 
						<option value="">--请选择--</option>
						</select>
					</td>
					<td width="11%" class="TD_STYLE1">
						III级机构
					</td>
					<td class="TD_STYLE2"  >
						<select name="third_kind_id" id="thirdKindId" class="SELECT_STYLE1" onchange="getThirdName()">
							<option value="">--请选择--</option>
						</select>
					</td>
					<td width="11%" class="TD_STYLE1">
						招聘类型
					</td>
					<td class="TD_STYLE2" colspan="2">
					<select name="engage_type" id="engageType" class="SELECT_STYLE1"> 
							<option value="">--请选择--</option> 
							<option value="校园招聘">校园招聘</option> 
							<option value="社会招聘">社会招聘</option> 
					</select>
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						职位分类
					</td>
					<td class="TD_STYLE2">
						<select name="major_kind_id" id="majorKindId" class="SELECT_STYLE1" onchange="ByIdQueryMajor()">
							<option value="">--请选择--</option> 
						</select>
					</td>
					<td class="TD_STYLE1">
						职位名称
					</td>
					<td class="TD_STYLE2">
						<select name="major_id" id="majorId" class="SELECT_STYLE1" onchange="getMajorName()"> 
							<option value="0">--请选择--</option>
						</select>
					</td>
					<td class="TD_STYLE1">
						招聘人数
					</td>
					<td   class="TD_STYLE2">
						 <input type="text" name="human_amount" id="humanAmount"  class="INPUT_STYLE2">
					</td>
					<td class="TD_STYLE1">
						截止日期
					</td>
					<td   class="TD_STYLE2">
							  <input type="text" name="deadline" 
							  class="INPUT_STYLE2" id="date_start" onclick="aa('deadline')">
					</td>
				</tr>
				<tr>
				<td class="TD_STYLE1">
						登记人
					</td>
					<td  class="TD_STYLE2">
						 <input type="text" name="register" value="${userlogin.user_true_name }" class="INPUT_STYLE2">
					</td>
					<td class="TD_STYLE1">
						登记时间
					</td>
					<td   class="TD_STYLE2">
					
							<input type="text" name="regist_time"
							  id="nowTime" readonly="readonly"
							class="INPUT_STYLE2">
					</td>
					
					<td>&nbsp; </td>
					<td>&nbsp; </td>
					<td>&nbsp; </td>
					<td>&nbsp; </td>
					
				</tr>
				<tr>
					<td class="TD_STYLE1">
						职位描述
					</td>
					<td class="TD_STYLE2" colspan="8">
						<textarea name="major_describe" rows="4" id="majordescribe" cols="80" class="TEXTAREA_STYLE1"></textarea>
					</td>
					 
				</tr>
					<tr>
					<td class="TD_STYLE1">
						招聘要求
					</td>
					<td class="TD_STYLE2" colspan="8">
						<textarea name="engage_required" rows="4" id="engagerequired" cols="80" class="TEXTAREA_STYLE1"></textarea>
					</td>
					 
				</tr>
			</table>
		</form>
	</body>
</html>
