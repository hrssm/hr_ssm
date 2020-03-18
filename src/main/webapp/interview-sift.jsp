<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>My JSP 'interview-sift.jsp' starting page</title>
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
		
	 
<script type="text/javascript">
 

	function toPhoto(data){
		var a = data.substring(data.indexOf(".")+1)
		if(a!="jpg" && a!="gif" && a!="bmp"){
			alert("您上传的不是图片路径");
		}
	}
	
	function toPhotofile(da){
		var a = da.substring(da.indexOf(".")+1)
		if(a!="doc"){
			alert("您上传的不是文件路径");
		}
	}

		var validateMsg = "";
	function checkNotEmpty(ctlName,label)
	{
		var oCtl = document.forms[0].elements[ctlName];
		if (oCtl.value=="")
		{
			if (label)
			{
				validateMsg += label;
			}
			validateMsg += "不能为空！\n";
			oCtl.focus();
		}
	}
	
	function checkValidateMsg()
	{
		if (validateMsg!="")
		{
			alert(validateMsg);
			return false;
		}
		return true;
	}
			
		function tosubmit(){
			validateMsg = "";
			checkNotEmpty("ei.checker","筛选人");
			checkNotEmpty("ei.checkComment","录用申请审核意见");
			if (!checkValidateMsg())
			{
				return;
			}
			document.forms[0].elements["operate"].value = "doAdopt"; 
			document.forms[0].submit();
		}
		
		
		function tozwfenlei(id){
			$("er.humanMajorKindName").value=$("er.humanMajorKindId").options[$("er.humanMajorKindId").selectedIndex].outerText;
			engageResume.SelectConfig_major(id,callbackkind)
		}
		
		function callbackkind(data){
			$("er.humanMajorId").options.length=0;
			var o = new Option("--请选择--",0);
			$("er.humanMajorId").add(o);
			DWRUtil.addOptions("er.humanMajorId",data,"majorId","majorName");
		}
		function zwmingchen(){
			$("er.humanMajorName").value=$("er.humanMajorId").options[$("er.humanMajorId").selectedIndex].outerText;
		}
		
		
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
			
		  	document.getElementById("nowTime").value = now.getFullYear()+"-"+(now.getMonth()+1)+"-"+now.getDate()+" "+timeString;
			window.setTimeout("tick();", 100);
		}
		
		//load事件
		function check(){
			//获得系统当前时间的方法
		  	tick();					
		}
		
		function mians(){
			document.getElementById("passCheckcomment").value="建议面试";
			
		}
		function bis(){
			document.getElementById("passCheckcomment").value="建议笔试";
		}
		function luy(){
			document.getElementById("passCheckcomment").value="建议录用";
			
		}
		function del(){
			document.getElementById("passCheckcomment").value="删除简历";
			
		}
		
 		</script>
 		<script type="text/javascript">
 		function search(id){   
 		if(document.getElementById("passCheckcomment").value=="删除简历"){
		//	window.location.href="/HR_Fist/recruit/recruitAction!deleteResumeById?id="+id;
		 document.fm.submit();
		}else if(document.getElementById("passCheckcomment").value=="建议录用"){
				document.getElementById("ly").value = true;
			 document.fm.submit();
		}else if(document.getElementById("passCheckcomment").value=="建议面试"){
				document.getElementById("mianshi").value = false;
			 document.fm.submit();
		} 
		}
 		</script>
	</head>

	<body onload="check(),luy()">
		<form id="recruitAction!returnSiftList" name="fm" action="updateSift" method="post" enctype="multipart/form-data">
		
			<table width="100%">
				<tr>
					<td>
						<font color="black">您正在做的业务是：人力资源--招聘管理--面试管理--面试筛选  </font>
					</td>
				</tr>
				<tr>
					<td align="right">
						<input type="radio" name="result"  value="建议面试" onclick="mians()">建议面试
						<input type="radio" name="result"   value="建议笔试" onclick="bis()">建议笔试
						<input type="radio" name="result"   value="建议录用"  checked="checked" onclick="luy()">建议录用
						<input type="radio" name="result"  value="删除简历" onclick="del()">删除简历
						<input type="submit" value="确认" class="BUTTON_STYLE1"
							onclick="search('542')">
						<input type="button" value="返回" class="BUTTON_STYLE1" 
							onclick="history.back();">
					</td>
				</tr>
			</table>
			<input type="hidden" name="einid" value="${vi.einid }">
			<table width="100%" border="1" cellpadding=0 cellspacing=1
				bordercolorlight=#848284 bordercolordark=#eeeeee
				class="TABLE_STYLE1">
				<tr>
					<td class="TD_STYLE1" width="11%">
						职位分类
					</td>
					<td width="14%" class="TD_STYLE2"> 
						<input type="hidden" name="humanMajorKindId" value="02"/>
					   <input type="text" name="humanmajorkindname"
						   value="${vi.resumeid.humanmajorkindname }" readonly="readonly" class="INPUT_STYLE2">
					
					</td>
					<td width="11%" class="TD_STYLE1">
						职位名称
					</td>
					<td width="14%" class="TD_STYLE2">
					<input type="hidden" name="humanMajorId" value=""/>
					 <input type="text" name="humanmajorname" value="${vi.resumeid.humanmajorname }" readonly="readonly" class="INPUT_STYLE2">
				    </td>
					<td width="11%" class="TD_STYLE1">
						招聘类型
					</td>
					<td class="TD_STYLE2" >
						<input type="text" name="engagetype" value="${vi.resumeid.engagetype }" readonly="readonly" class="INPUT_STYLE2">
					
					</td>
					
					<td width="10%" rowspan="6" colspan="2"  align="center">
						 
					</td>
					
				</tr>
				<tr>
				<td class="TD_STYLE1">
						姓名
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="humanname" value="${vi.resumeid.humanname }" readonly="readonly" class="INPUT_STYLE2">
						
					</td>
					<td class="TD_STYLE1">
						性别
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="humansex" value="${vi.resumeid.humansex }" readonly="readonly" class="INPUT_STYLE2">
					</td>
					<td class="TD_STYLE1">
						EMAIL
					</td>
					<td   class="TD_STYLE2">
						<input type="text" name="humanemail" value="${vi.resumeid.humanemail }"  readonly="readonly" class="INPUT_STYLE2">
					</td>
				</tr>

				<tr>
					<td class="TD_STYLE1">
						电话号码
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="humantelephone" value="${vi.resumeid.humantelephone }" readonly="readonly" class="INPUT_STYLE2">
					</td>
					<td class="TD_STYLE1">
						家庭电话
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="humanhomephone" value="${vi.resumeid.humanhomephone }" readonly="readonly" class="INPUT_STYLE2">
					</td>
					<td class="TD_STYLE1" >
						手机
					</td>
					<td  class="TD_STYLE2" >
						<input type="text" name="humanmobilephone" value="${vi.resumeid.humanmobilephone }" readonly="readonly" class="INPUT_STYLE2">
					</td>
					
				</tr>
				<tr>
					<td class="TD_STYLE1">
						住址
					</td>
					<td colspan="3" class="TD_STYLE2">
						<input type="text" name="humanaddress" value="${vi.resumeid.humanaddress }" readonly="readonly" class="INPUT_STYLE2">
					</td>
					<td class="TD_STYLE1">
						邮编
					</td>
					<td   class="TD_STYLE2">
						<input type="text" name="humanpostcode" value="${vi.resumeid.humanpostcode }" readonly="readonly" class="INPUT_STYLE2">
					</td>
				</tr>

				<tr>
					<td class="TD_STYLE1">
						国籍
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="humannationality" value="${vi.resumeid.humannationality }" readonly="readonly" class="INPUT_STYLE2">
					</td>
					<td class="TD_STYLE1">
						出生地
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="humanbirthplace" value="${vi.resumeid.humanbirthplace }"  readonly="readonly" class="INPUT_STYLE2">
					</td>
					<td class="TD_STYLE1">
						生日
					</td>
					<td class="TD_STYLE2"  > 
						<input type="text" name="humanbirthday" value="${vi.resumeid.humanbirthday }" readonly="readonly" class="INPUT_STYLE2">
					</td>
				</tr>
				
				<tr>
					<td width="11%" class="TD_STYLE1">
						民族
					</td>
					<td class="TD_STYLE2" width="14%">
						<input type="text" name="humanrace" value="${vi.resumeid.humanrace }" readonly="readonly" class="INPUT_STYLE2">
					</td>
					<td class="TD_STYLE1">
						宗教信仰
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="humanreligion" value="${vi.resumeid.humanreligion }" readonly="readonly" class="INPUT_STYLE2">
					</td>
					<td class="TD_STYLE1">
						政治面貌
					</td>
					<td class="TD_STYLE2" >
						<input type="text" name="humanparty" value="${vi.resumeid.humanparty }" readonly="readonly" class="INPUT_STYLE2">
					</td>
				</tr>
				<tr>

					<td class="TD_STYLE1">
						身份证号码
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="humanidcard" value="${vi.resumeid.humanidcard }" readonly="readonly" class="INPUT_STYLE2">
					</td>
					<td class="TD_STYLE1">
						年龄
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="humanage" value="${vi.resumeid.humanage }" readonly="readonly" class="INPUT_STYLE2">
					</td>
					<td class="TD_STYLE1">
						毕业学校
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="humancollege" value="${vi.resumeid.humancollege }" readonly="readonly" class="INPUT_STYLE2">
					</td>
					<td class="TD_STYLE1" width="10%">
						学历
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="humaneducateddegree" value="${vi.resumeid.humaneducateddegree }" readonly="readonly" class="INPUT_STYLE2">
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						教育年限
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="humaneducatedyears"  value="${vi.resumeid.humaneducatedyears }" readonly="readonly" class="INPUT_STYLE2">
					</td>
					<td class="TD_STYLE1">
						学历专业
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="humaneducatedmajor" value="${vi.resumeid.humaneducatedmajor }" readonly="readonly" class="INPUT_STYLE2">
					</td>
					<td class="TD_STYLE1">
						薪酬要求
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="demandsalarystandard" value="${vi.resumeid.demandsalarystandard }" readonly="readonly" class="INPUT_STYLE2">
					</td>
					<td class="TD_STYLE1">
						注册时间
					</td>
					<td class="TD_STYLE2"> 
						<input type="text" name="registtime" value="${vi.resumeid.registtime }" readonly="readonly" class="INPUT_STYLE2">
						
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						特长
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="humanspecility" value="${vi.resumeid.humanspecility }" readonly="readonly" class="INPUT_STYLE2">
					</td>
					<td class="TD_STYLE1">
						爱好
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="humanhobby" value="${vi.resumeid.humanhobby }" readonly="readonly" class="INPUT_STYLE2">
					</td>
					<td class="TD_STYLE1"><span style="font-size: 10.5pt; font-family: 宋体;"></span> 
						推荐人
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="checker" value="${vi.resumeid.checker }" readonly="readonly" class="INPUT_STYLE2">
					</td>
					<td class="TD_STYLE1"><span style="font-size: 10.5pt; font-family: 宋体;"></span> 
						推荐时间
					</td>
					<td class="TD_STYLE2"> 
						<input type="text" name="checktime" value="${vi.resumeid.checktime }" readonly="readonly" class="INPUT_STYLE2">	 
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						档案附件
					</td>
					<td colspan="7" class="TD_STYLE2">
						<input type="text" name="checker" readonly="readonly" class="INPUT_STYLE2">
					</td>
				</tr>
			<tr>
					<td class="TD_STYLE1">
						个人履历
					</td>
					<td colspan="7" class="TD_STYLE2">
						<textarea name="humanhistoryrecords" rows="4"  
						class="TEXTAREA_STYLE1" readonly="readonly"> ${vi.resumeid.humanhistoryrecords }
						</textarea>
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						备注
					</td>
					<td colspan="7" class="TD_STYLE2">
						<textarea name="remark" rows="4"   class="TEXTAREA_STYLE1"  readonly="readonly"> ${vi.resumeid.remark }
						</textarea>
					</td>
				</tr>
				
				<tr>
					<td class="TD_STYLE1">
						筛选推荐意见
					</td>
					<td class="TD_STYLE2" colspan="7">
						<textarea name="recomandation" rows="4"   class="TEXTAREA_STYLE1" readonly="readonly">${vi.resumeid.recomandation }</textarea>
					</td>
				</tr>
				
				
				
				<tr>
					<td class="TD_STYLE1">
						面试次数
					</td>
					<td class="TD_STYLE2">
					 	<input type="text"   name="interviewamount" value="${vi.interviewamount }" class="INPUT_STYLE2" readonly="readonly"/>
					</td>
					<td class="TD_STYLE1">
						形象评价
					</td>
					<td class="TD_STYLE2">
						 
				 <input type="text"  name="imagedegree" value="${vi.imagedegree }" class="INPUT_STYLE2" readonly="readonly"/>
				
					</td>
					<td class="TD_STYLE1">
						口才评价
					</td>
					<td class="TD_STYLE2">
					 
						 <input type="text"  name="nativelanguagedegree" value="${vi.nativelanguagedegree }" class="INPUT_STYLE2" readonly="readonly"/>
				
					</td>
					<td class="TD_STYLE1">
						外语口语能力
					</td>
					<td class="TD_STYLE1">
					 
						 <input type="text"  name="foreignlanguagedegree" value="${vi.foreignlanguagedegree }" class="INPUT_STYLE2" readonly="readonly"/>
				
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						应变能力
					</td>
					<td class="TD_STYLE2">
					 
						<input type="text"  name="responsespeeddegree" value="${vi.responsespeeddegree }" class="INPUT_STYLE2" readonly="readonly"/>
				
					</td>
					<td class="TD_STYLE1">
						EQ
					</td>
					<td class="TD_STYLE2"> 
						<input type="text"  name="EQdegree" value="${vi.EQdegree }" class="INPUT_STYLE2" readonly="readonly"/>
				
					</td>
					<td class="TD_STYLE1">
						IQ
					</td>
					<td class="TD_STYLE2"> 
						 <input type="text"  name="IQdegree" value="${vi.IQdegree }" class="INPUT_STYLE2" readonly="readonly"/>
				
					</td>
					<td class="TD_STYLE1">
						综合素质
					</td>
					<td class="TD_STYLE1">
					 <input type="text"  name="multiqualitydegree" value="${vi.multiqualitydegree }" class="INPUT_STYLE2" readonly="readonly"/>
				
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						面试人
					</td>
					<td class="TD_STYLE2">
						<input type="text" name="register" value="${vi.register }" class="INPUT_STYLE2"/>
					</td>
					<td class="TD_STYLE1">
						面试时间
					</td>
					<td class="TD_STYLE2"> 
					<input type="text" name="registetime" value="${vi.registetime }" class="INPUT_STYLE2"/>
						  
					</td>
					<td class="TD_STYLE1">
						筛选人
					</td>
					<td class="TD_STYLE2">
					 <input type="text" name="checker" value="${userlogin.user_true_name }" class="INPUT_STYLE2"/>
				 
					</td>
					<td class="TD_STYLE1">
						筛选时间
					</td>
					<td class="TD_STYLE2"> 
				  	<input type="text" name="checktime"
							  id="nowTime" readonly="readonly"
							class="INPUT_STYLE2">
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						录用申请审核意见
					</td>
					<td class="TD_STYLE2" colspan="7">
						<textarea name="checkcomment" class="TEXTAREA_STYLE1"
							rows="4" readonly="readonly" id="passCheckcomment">建议录用</textarea>
					</td>
				</tr>
			</table>
		</form>




	</body>
 
</html>
