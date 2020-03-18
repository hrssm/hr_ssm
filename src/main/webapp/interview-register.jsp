<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>My JSP 'interview-register.jsp' starting page</title>
	 	<link rel="stylesheet"
			href="css/table.css" type="text/css">
		<link rel="stylesheet"
			href="css/cwcalendar.css"
			type="text/css">
		<script type="text/javascript"
			src="javascript/comm/comm.js">
	
</script>
		<script type="text/javascript"
			src="javascript/comm/list.js">
	
</script>
		<script type="text/javascript"
			src="javascript/calendar-ch.js">
	
</script>
		<script type="text/javascript"
			src="javascript/jquery-1.7.2.js">
	
</script>
		<script type="text/javascript"
			src="javascript/locate.js">
	
</script>
		<script type="text/javascript"
			src="javascript/select.js">
	
</script>
			<script type="text/javascript"
			src="javascript/comm/time.js">
			</script>

 		 
 	<script type="text/javascript">
 	function search(){ 
 	if(document.getElementById("date").value==""){
 	alert("请选择面试时间");
 	}else{
 	document.interviewForm.submit();
 	}}
 	</script>
	</head>

	<body >
		<form id="recruitAction!toList" name="interviewForm" action="addInterviewOne" method="post">
		<input type="hidden" name="operate" value="doAdopt">
	<!--	<input type="hidden" name="engageInterview.checkStatus" value=""/>
		<input type="hidden" name="engageInterview.checkComment" value=""/>
		  -->
		  <input type="hidden" name="engageInterview.einId" value=""/>
		<input type="hidden" name="engageInterview.result" value="完成"/>
		<input type="hidden" name="engageInterview.resumeId" value="542"/>
	    <input type="hidden" name="resumeid.resid" value="${re.resid }"/>
		<input type="hidden" name="interviewstatus" value="${re.interviewstatus }"/>
		<input type="hidden" id="majorKindName" name="humanmajorkindid" value="${re.humanmajorkindid }">
			<input type="hidden" id="majorName" name="humanmajorid" value="${re.humanmajorid }">
			<table width="100%">
				<tr>
					<td>
						
						<font color="black">您正在做的业务是：人力资源--招聘管理--面试管理--面试结果登记  </font>
					</td>
				</tr>
				<tr>
					<td align="right">
						<input type="submit" value="面试登记" class="BUTTON_STYLE1"
							onclick="search();">
						<input type="button" value="返回" class="BUTTON_STYLE1" 
							onclick="history.back();">
							
					</td>
				</tr>
			</table>
			<table width="100%" border="1" cellpadding=0 cellspacing=1
				bordercolorlight=#848284 bordercolordark=#eeeeee
				class="TABLE_STYLE1">
				<tr>
					<td class="TD_STYLE1" width="10%">
						职位分类
					</td>
					<td width="10%" class="TD_STYLE2">
					<input type="text" name="humanmajorkindname" value="${re.humanmajorkindname }" readonly="readonly" class="INPUT_STYLE2">
					</td>
					<td width="10%" class="TD_STYLE1">
						职位名称
					</td>
					<td width="15%" class="TD_STYLE2">
						<input type="text" name="humanmajorname" value="${re.humanmajorname }" readonly="readonly" class="INPUT_STYLE2">
					</td>
					<td width="10%" class="TD_STYLE1">
						招聘类型
					</td>
					<td width="20%" class="TD_STYLE2" colspan="2">
						<input type="text" name="engagetype" value="${re.engagetype }" readonly="readonly" class="INPUT_STYLE2">
					</td>
					
					<td width="10%" rowspan="6" align="center">
						 
					</td>
					
				</tr>
				
				<tr>
					<td class="TD_STYLE1">
						姓名
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="humanname" value="${re.humanname }" readonly="readonly" class="INPUT_STYLE2">
						
					</td>
					<td class="TD_STYLE1">
						性别
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="humansex" value="${re.humansex }" readonly="readonly" class="INPUT_STYLE2">
					</td>
					<td class="TD_STYLE1">
						EMAIL
					</td>
					<td colspan="2" class="TD_STYLE2">
						<input type="text" name="humanemail" value="${re.humanemail }"  readonly="readonly" class="INPUT_STYLE2">
					</td>
				</tr>

				<tr>
					<td class="TD_STYLE1">
						电话号码
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="humantelephone" value="${re.humantelephone }" readonly="readonly" class="INPUT_STYLE2">
					</td>
					<td class="TD_STYLE1">
						家庭电话
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="humanhomephone" value="${re.humanhomephone }" readonly="readonly" class="INPUT_STYLE2">
					</td>
					<td class="TD_STYLE1">
						手机
					</td>
					<td colspan="2" class="TD_STYLE2">
						<input type="text" name="humanmobilephone" value="${re.humanmobilephone }" readonly="readonly" class="INPUT_STYLE2">
					</td>
				</tr>

				<tr>
					<td class="TD_STYLE1">
						住址
					</td>
					<td colspan="3" class="TD_STYLE2">
						<input type="text" name="humanaddress" value="${re.humanaddress }" readonly="readonly" class="INPUT_STYLE2">
					</td>
					<td class="TD_STYLE1">
						邮编
					</td>
					<td colspan="2" class="TD_STYLE2">
						<input type="text" name="humanpostcode" value="${re.humanpostcode }" readonly="readonly" class="INPUT_STYLE2">
					</td>
				</tr>

				<tr>
					<td class="TD_STYLE1">
						国籍
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="humannationality" value="${re.humannationality }" readonly="readonly" class="INPUT_STYLE2">
					</td>
					<td class="TD_STYLE1">
						出生地
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="humanbirthplace" value="${re.humanbirthplace }"  readonly="readonly" class="INPUT_STYLE2">
					</td>
					<td class="TD_STYLE1">
						生日
					</td>
					<td class="TD_STYLE2" colspan="2"> 
						<input type="text" name="humanbirthday" value="${re.humanbirthday }" readonly="readonly" class="INPUT_STYLE2">
					</td>
				</tr>
				
				<tr>
					<td width="11%" class="TD_STYLE1">
						民族
					</td>
					<td class="TD_STYLE2" width="14%">
						<input type="text" name="humanrace" value="${re.humanrace }" readonly="readonly" class="INPUT_STYLE2">
					</td>
					<td class="TD_STYLE1">
						宗教信仰
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="humanreligion" value="${re.humanreligion }" readonly="readonly" class="INPUT_STYLE2">
					</td>
					<td class="TD_STYLE1">
						政治面貌
					</td>
					<td class="TD_STYLE2" colspan="2">
						<input type="text" name="humanparty" value="${re.humanparty }" readonly="readonly" class="INPUT_STYLE2">
					</td>
				</tr>
				<tr>

					<td class="TD_STYLE1">
						身份证号码
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="humanidcard" value="${re.humanidcard }" readonly="readonly" class="INPUT_STYLE2">
					</td>
					<td class="TD_STYLE1">
						年龄
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="humanage" value="${re.humanage }" readonly="readonly" class="INPUT_STYLE2">
					</td>
					<td class="TD_STYLE1">
						毕业学校
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="humancollege" value="${re.humancollege }" readonly="readonly" class="INPUT_STYLE2">
					</td>
					<td class="TD_STYLE1" width="10%">
						学历
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="humaneducateddegree" value="${re.humaneducateddegree }" readonly="readonly" class="INPUT_STYLE2">
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						教育年限
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="humaneducatedyears"  value="${re.humaneducatedyears }" readonly="readonly" class="INPUT_STYLE2">
					</td>
					<td class="TD_STYLE1">
						学历专业
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="humaneducatedmajor" value="${re.humaneducatedmajor }" readonly="readonly" class="INPUT_STYLE2">
					</td>
					<td class="TD_STYLE1">
						薪酬要求
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="demandsalarystandard" value="${re.demandsalarystandard }" readonly="readonly" class="INPUT_STYLE2">
					</td>
					<td class="TD_STYLE1">
						注册时间
					</td>
					<td class="TD_STYLE2"> 
						<input type="text" name="registtime" value="${re.registtime }" readonly="readonly" class="INPUT_STYLE2">
					
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						特长
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="humanspecility" value="${re.humanspecility }" readonly="readonly" class="INPUT_STYLE2">
					</td>
					<td class="TD_STYLE1">
						爱好
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="humanhobby" value="${re.humanhobby }" readonly="readonly" class="INPUT_STYLE2">
					</td>
					<td class="TD_STYLE1"><span style="font-size: 10.5pt; font-family: 宋体;"></span> 
						推荐人
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="checker" value="${re.checker }" readonly="readonly" class="INPUT_STYLE2">
					</td>
					<td class="TD_STYLE1"><span style="font-size: 10.5pt; font-family: 宋体;"></span> 
						推荐时间
					</td>
					<td class="TD_STYLE2"> 
						<input type="text" name="checktime" value="${re.checktime }" readonly="readonly" class="INPUT_STYLE2">
						 
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						个人履历
					</td>
					<td colspan="7" class="TD_STYLE2">
						<textarea name="humanhistoryrecords" rows="4"  
						class="TEXTAREA_STYLE1" readonly="readonly"> ${re.humanhistoryrecords }
						</textarea>
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						备注
					</td>
					<td colspan="7" class="TD_STYLE2">
						<textarea name="remark" rows="4"   class="TEXTAREA_STYLE1"  readonly="readonly"> ${re.remark }
						</textarea>
					</td>
				</tr>
				
				<tr>
					<td class="TD_STYLE1">
						推荐意见
					</td>
					<td class="TD_STYLE2" colspan="7">
						<textarea name="recomandation" rows="4"   class="TEXTAREA_STYLE1" readonly="readonly">${re.recomandation }						</textarea>
					</td>
				</tr>
				
				
				<tr>
					<td class="TD_STYLE1">
						面试次数
					</td>
					<td class="TD_STYLE2">
					<input type="hidden" value="1" name="interviewamount"/>
						<input type="text"   value="第1次面试" class="INPUT_STYLE2" readonly="readonly"/>
					</td>
					<td class="TD_STYLE1">
						形象评价
					</td>
					<td class="TD_STYLE2">
						<select name="imagedegree" class="SELECT_STYLE1">
							<option value="A">A</option>
							<option value="B">B</option>
							<option value="C">C</option>
						</select>
					</td>
					<td class="TD_STYLE1">
						口才评价
					</td>
					<td class="TD_STYLE2">
						<select name="nativelanguagedegree" class="SELECT_STYLE1">
							<option value="A">A</option>
							<option value="B">B</option>
							<option value="C">C</option>
						</select>
					</td>
					<td class="TD_STYLE1">
						外语口语能力
					</td>
					<td class="TD_STYLE1">
						<select name="foreignlanguagedegree" class="SELECT_STYLE1">
							<option value="A">A</option>
							<option value="B">B</option>
							<option value="C">C</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						应变能力
					</td>
					<td class="TD_STYLE2">
						<select name="responsespeeddegree" class="SELECT_STYLE1">
							<option value="A">A</option>
							<option value="B">B</option>
							<option value="C">C</option>
						</select>
					</td>
					<td class="TD_STYLE1">
						EQ
					</td>
					<td class="TD_STYLE2">
						<select name="EQdegree" class="SELECT_STYLE1">
							<option value="A">A</option>
							<option value="B">B</option>
							<option value="C">C</option>
						</select>
					</td>
					<td class="TD_STYLE1">
						IQ
					</td>
					<td class="TD_STYLE2">
						<select name="IQdegree" class="SELECT_STYLE1">
							<option value="A">A</option>
							<option value="B">B</option>
							<option value="C">C</option>
						</select>
					</td>
					<td class="TD_STYLE1">
						综合素质
					</td>
					<td class="TD_STYLE1">
						<select name="multiqualitydegree" class="SELECT_STYLE1">
							<option value="A">A</option>
							<option value="B">B</option>
							<option value="C">C</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						面试人
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="register" value="${userlogin.user_true_name }" class="INPUT_STYLE2"/>
					</td>
					<td class="TD_STYLE1">
						面试时间
					</td>
					<td class="TD_STYLE2"> 
						<input type="text" name="registetime"  onclick="aa('registetime')"
							  class="INPUT_STYLE2"  id="date" >
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
						面试评价
					</td>
					<td class="TD_STYLE2" colspan="7">
						<textarea
							name="interviewcomment" class="TEXTAREA_STYLE1"
							rows="4"></textarea>
					</td>
				</tr>
			</table>
		</form>




	</body>
 
</html>
