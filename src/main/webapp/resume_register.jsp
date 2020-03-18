<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
			src="/hr_ssm/javascript/calendar-ch.js">
		</script>
		<script type="text/javascript"
			src="/hr_ssm/javascript/jquery-1.6.1.min.js">
		</script>
		<script type="text/javascript"
			src="/hr_ssm/javascript/locate.js">
		</script>
		<script type="text/javascript"
			src="/hr_ssm/javascript/select.js">
		</script>
		<script typet="text/javascript" src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script>
		<script type="text/javascript" src="/hr_ssm/javascript/jquery.messager.js"></script>
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
		  	tick();					
		}
 		</script>
 		<!--  -->
 		<script type="text/javascript">
 		function mysubmit(){  
	 	 	var reg5 = /^\w+@(qq|163)\.com$/;
	 		if(document.getElementById("name").value==""){
	 			$.messager.show("消息提示","请填写姓名",2000);
	 		return false;
	 		}
	 		if(document.getElementById("humanidcardid").value==""){
	 			$.messager.show("消息提示","请填写身份证号码",2000);
		 		return false;
	 		} 
	 		if(document.getElementById("phone").value==""){ 
	 			$.messager.show("消息提示","请填写电话",2000);
		 		return false;
	 		}
	 		if(document.getElementById("humanHomephone").value==""){
		 			$.messager.show("消息提示","家庭电话请填写数字",2000);
		 		return false;
	 		}
	 		if(document.getElementById("humanMobilephone").value==""){
		 			$.messager.show("消息提示","手机请填写数字",2000);
		 			return false;
		 		}
	 		if(document.getElementById("birthday").value!=""){
		 		var str = document.getElementById("birthday").value; 
		 		var r = str.match(/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/); 
		 		 if(r==null){
		 			$.messager.show("消息提示","请输入正确的日期格式：yyyy-MM-dd",2000);
		 		return false;
		 		}
	 		} 
	 		if(document.getElementById("email").value!=""){
		 		var email=document.getElementById("email").value;
		 		if(email.indexOf(".")<=-1 || email.indexOf("@")<=-1){
		 			$.messager.show("消息提示","Email格式不匹配，如：123@.com",2000);
		 		return false;
		 		}  
	 		}
 		$("#birthday").val($("#birthday").val() + " 00:00:00");
 		document.fm.submit();
 		}

 		function checksfz(){
			var sfz = $("#humanidcardid").val();
			if(sfz.length == 18){
				var sex = sfz.substring(16,17);
				if(sex % 2 == 0){
					$("#woman").attr("selected","selected");
				} else {
					$("#man").attr("selected","selected");
				}
				var year = sfz.substring(6,10);
				var month = sfz.substring(10,12);
				var date = sfz.substring(12,14);
				var birthday = new Date(year+"-"+month+"-"+date).getTime();
				$("#birthday").val(year+"-"+month+"-"+date);
				var now = new Date().getTime();
				var age = (now-birthday)/1000/60/60/24/365;
				var ageStr = age + "";
				var ageInt = ageStr.substring(0,ageStr.indexOf("."));
				// $("#humanage").attr("value",ageInt);
				$("#humanage").val(ageInt);
				console.log($("#humanage").val());
			} 
		}
 		</script>
 		<!-- -->
	</head>
	<body>
	<form id="recruitAction!saveEngageResume" name="fm" action="addResume.do" 
	method="post"
	enctype="multipart/form-data"
	>
			<!-- <input type="hidden" name="passcheckcomment" value="不通过"/>
			<input type="hidden" name="passpasscomment" value="不通过"/>
	 		<input type="hidden" name="passcheckstatus" value="0"/> -->
	 		<input type="hidden" name="check_status" value="0">
	 		<input type="hidden"  id="humanMajorKindId" name="human_major_kind_id" value="${mr.major_kind_id }" />
	 		<input type="hidden"  name="human_major_id" id="humanMajorName" value="${mr.major_id }"/>
	 		<input type="hidden"  name="interviews_tatus" value="1"/>
	 		<input type="hidden" value="${userlogin.user_true_name }" name="register">
			<table width="100%">
				<tr>
					<td>
						<font color="black">您正在做的业务是：人力资源--招聘管理--简历管理--简历登记 </font>
					 
					</td>
				</tr>
				<tr>
					<td align="right">
					 
						<input type="button" value="提交" class="BUTTON_STYLE1" onclick="mysubmit()">
						<input type="reset" value="清除" class="BUTTON_STYLE1">
					</td>
				</tr>
			</table>
			<table width="100%" border="1" cellpadding=0 cellspacing=1
				bordercolorlight=#848284 bordercolordark=#eeeeee
				class="TABLE_STYLE1">
				<tr>
						<td class="TD_STYLE1">
						职位分类
					</td>
					<td class="TD_STYLE2">  
					<select name="human_major_kind_name" class="SELECT_STYLE1" id="humanMajorKind">
					<option>${mr.major_kind_name }</option>
					</select>		
					</td>
					<td class="TD_STYLE1">
						职位名称
					</td>
					<td class="TD_STYLE2" width="20%"> 
					<select name="human_major_name" class="SELECT_STYLE1" id="humanMajorId">
						<option>${mr.major_name }</option>
					</select>
					</td>
					<td width="11%" class="TD_STYLE1">
						招聘类型
					</td>
					<td class="TD_STYLE2" colspan="2"> 
					<select name="engage_type" class="SELECT_STYLE1">
						<option value="${mr.engage_type }">${mr.engage_type }</option>
					</select>
					</td>
					<td rowspan="6" >
						<input type="file" name="file"/>
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						姓名
					</td>
					<td class="TD_STYLE2">
						 <input type="text"  name="human_name" id="name" class="INPUT_STYLE2"/>
					</td>
					<td class="TD_STYLE1">
						身份证号码
					</td>
					<td class="TD_STYLE1">
						<input type="text" name="human_id_card"  id="humanidcardid" class="INPUT_STYLE2" onkeyup="checksfz()">
					</td>
					<td class="TD_STYLE1">
						性别
					</td>
					<td class="TD_STYLE1"  colspan="2">
						<select name="human_sex"  class="SELECT_STYLE1">
							<option value="男" id="man">男</option>
							<option value="女" id="woman">女</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
					电话
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="human_telephone"  id="phone" class="INPUT_STYLE2">
					</td>
					<td class="TD_STYLE1">
						家庭电话
					</td>
					<td class="TD_STYLE2">
					 <input type="text" name="human_home_phone" id="humanHomephone" class="INPUT_STYLE2">
					</td>
					<td class="TD_STYLE1">
						手机
					</td>
					<td colspan="2" class="TD_STYLE2">
						<input type="text" name="human_mobilephone" id="humanMobilephone" class="INPUT_STYLE2">
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						住址
					</td>
					<td colspan="3" class="TD_STYLE2">
						<input type="text" name="human_address" class="INPUT_STYLE2">
					</td>
					 
					<td class="TD_STYLE1">
						邮编
					</td>
					<td colspan="2" class="TD_STYLE2">
						<input type="text" name="human_postcode" class="INPUT_STYLE2">
					</td>
				</tr>
				 
				<tr>
					<td class="TD_STYLE1">
						国籍
					</td>
					<td class="TD_STYLE2">
					 <select name="human_nationality"   class="SELECT_STYLE1">
							<option value="">--请选择--</option> 
							<c:forEach items="${glist}" var="g">
			                    <option>${g.attribute_name}</option>
			                 </c:forEach>
					 </select> 
					</td>
					<td class="TD_STYLE1">
						出生地
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="human_birthplace" class="INPUT_STYLE2">
					</td>
					<td class="TD_STYLE1">
						生日
					</td>
					<td width="13%" colspan="2" class="TD_STYLE2">
						<input type="text" name="human_birthday" id="birthday" class="INPUT_STYLE2" disabled="disabled">
					</td>
					
				</tr>
				<tr>
				<td width="11%" class="TD_STYLE1">
						民族
					</td>
					<td class="TD_STYLE2" width="14%">
				 	 <select name="human_race"   class="SELECT_STYLE1">
							<option value="">--请选择--</option> 
							<c:forEach items="${mlist}" var="m1">
			 				<option>${m1.attribute_name}</option>
								</c:forEach>
					 </select>  
					</td>
					<td class="TD_STYLE1">
						宗教信仰
					</td>
					<td class="TD_STYLE2">
					   <select name="human_religion"   class="SELECT_STYLE1"> 
							<c:forEach items="${zlist}" var="z1">
							<option>${z1.attribute_name}</option>
							</c:forEach>
					 </select>  
					</td>
					<td class="TD_STYLE1">
						政治面貌
					</td>
					<td class="TD_STYLE2" colspan="2">
					   <select name="human_party"   class="SELECT_STYLE1">
							<option value="">--请选择--</option> 
							<c:forEach items="${zzlist}" var="z">
							<option>${z.attribute_name}</option>
								</c:forEach>
					 </select>  	  
					</td>
					
					 
				</tr>
				<tr>
				<td class="TD_STYLE1">
						EMAIL
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="human_email" id="email" class="INPUT_STYLE2">
					</td>
					<td class="TD_STYLE1">
						年龄
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="human_age" id="humanage" class="INPUT_STYLE2" readonly="readonly">
					</td>
					<td class="TD_STYLE1">
						毕业院校
					</td>
					<td class="TD_STYLE2">
						 <input type="text" name="human_college" class="INPUT_STYLE2"/>
					</td>
					
					<td class="TD_STYLE1">
						学历
					</td>
					<td class="TD_STYLE2">
					  <select name="human_educated_degree"   class="SELECT_STYLE1">
							<option value="">--请选择--</option> 
							<c:forEach items="${xlist}" var="x">
							<option>${x.attribute_name}</option>
							</c:forEach>
					 </select> 
					</td>
					
				</tr>
				<tr>
				<td class="TD_STYLE1">
						教育年限
					</td>
					<td class="TD_STYLE2">
					   <select name="human_educated_years"   class="SELECT_STYLE1">
							<option value="">--请选择--</option> 
						<c:forEach items="${jlist}" var="j">
							<option>${j.attribute_name}</option>
							</c:forEach>
					 </select> 
					</td>
					<td class="TD_STYLE1">
						学历专业
					</td>
					<td class="TD_STYLE2">
					   <select name="human_educated_major"   class="SELECT_STYLE1">
							<option value="">--请选择--</option> 
							<c:forEach items="${xlzylist}" var="x1">
							<option>${x1.attribute_name}</option>
							</c:forEach>
					 </select>  
					</td>
					
					<td class="TD_STYLE1">
						薪酬要求
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="demand_salary_standard" id="demandSalaryStandard" class="INPUT_STYLE2" />
					</td>
					<td class="TD_STYLE1">
						注册时间
					</td>
					<td class="TD_STYLE2">
						 <input type="text" name="regist_time"
							  id="nowTime" disabled="disabled"
							class="INPUT_STYLE2">
					</td>
					
				</tr>
				<tr>
					 
					<td class="TD_STYLE1">
						特长
					</td>
					<td class="TD_STYLE2">
					   <select name="human_specility"   class="SELECT_STYLE1">
							<option value="">--请选择--</option> 
							<c:forEach items="${tlist}" var="t">
							<option>${t.attribute_name}</option>
							</c:forEach>
					 </select> 
						 
					</td>
					<td class="TD_STYLE1">
						爱好
					</td>
					<td class="TD_STYLE2">
				     <select name="human_hobby"   class="SELECT_STYLE1">
							<option value="">--请选择--</option> 
							<c:forEach items="${alist}" var="a">
							<option>${a.attribute_name}</option>
							</c:forEach>
					 </select> 
						  
					</td>
					<td class="TD_STYLE1">
						&nbsp;
					</td>
					<td class="TD_STYLE2">
						&nbsp;
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
						个人履历
					</td>
					<td colspan="7" class="TD_STYLE2">
						<textarea name="human_history_records" rows="4" class="TEXTAREA_STYLE1"></textarea>
					</td>
				</tr>
				 
				<tr>
					<td class="TD_STYLE1">
						备注
					</td>
					<td colspan="7" class="TD_STYLE2">
						<textarea name="remark" rows="4" class="TEXTAREA_STYLE1"></textarea>
					</td>
				</tr>
			</table>
		 </form>
	</body>
</html>

