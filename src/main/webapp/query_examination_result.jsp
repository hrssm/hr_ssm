<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
	<meta content="text/html;charset=utf-8" />
<link rel="stylesheet" href="table.css" type="text/css">
 <script type="text/javascript" src="javascript/comm/comm.js"></script> 
<script type="text/javascript" src="jquery-1.6.1.min.js"></script>
<script type="text/javascript">
$(window).load(function(){
	var url=window.location.search;
	var result = "";
	if(url.indexOf("?")!=-1){
		result = url.substr(url.indexOf("=")+1);
	}
/* 	alert(result); */
	if(result == "%27back%27"){
		/* alert("从resume返回"); */
		<%
			String IdCard = (String) session.getAttribute("IdCard");
			String key = (String) session.getAttribute("key");
			String startTime = (String) session.getAttribute("startTime");
			String endTime = (String) session.getAttribute("endTime");
		%>
	
			$("#IdCard").val("<%=IdCard%>");
			$("#startTime").val("<%=startTime%>");
			$("#endTime").val("<%=endTime%>");
		/* $("#back").show();
		$("#suggestion").show();
		$("#select").hide(); */
		$("#back").hide();
		$("#suggestion").hide();
		
		toSelect();
		
	}else{
		$("#back").hide();
		$("#suggestion").hide();
		
	}
});

function toSelect(){
	$.ajax({
		type:"POST",
		url:"engageSubjectsController/toSelect.do",
		data:{
			"IdCard":$("#IdCard").val(),
			"key":"123",
			"startTime":$("#startTime").val(),
			"endTime":$("#endTime").val()
		},
		success:function(result){
			var info = ``;
			for(var key in result){
				info += `
					<br>
					<div align="right"><input type="button" value="考试建议 "
					class="BUTTON_STYLE1" onclick="registSuggestion('`+result[key].IdCard+`','`+result[key].testPaperNumber+`')" ></div>
				<table width="100%" border="1" cellpadding=0 cellspacing=1
				bordercolorlight=#848284 bordercolordark=#eeeeee
				class="TABLE_STYLE1">
				<tr>
					<td class="TD_STYLE1">姓名</td>
					<td class="TD_STYLE2">`+result[key].name+`</td>
					<td class="TD_STYLE1">身份证号码</td>
					<td class="TD_STYLE2">`+result[key].IdCard+`</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">试卷编号</td>
					<td class="TD_STYLE2">`+result[key].testPaperNumber+`</td>
					<td class="TD_STYLE1">答题用时</td>
					<td class="TD_STYLE2">`+result[key].useTime+`</td>
				</tr>
			</table>
			<table width="100%" border="1" cellpadding=0 cellspacing=1
				bordercolorlight=#848284 bordercolordark=#eeeeee
				class="TABLE_STYLE1">`;
				/* alert(result[key].IdCard); */
			var subjectList = result[key].subjectList;
			var answer = result[key].answer.split(",");
			for(var i=0;i<subjectList.length;i++){
				var item = subjectList[i];
				info += `
					<tr>
						<td class="TD_STYLE2">
						`+i+`.`+item.content+`<br>
						选项：`+item.key_a+" "+item.key_b+" "+item.key_c+" "+item.key_d+" "+item.key_e+` 正确答案：`+item.correct_key+`
						<span style="font-size:18px">应试者答案:</span>`;
						if(answer[i] == "undefined" || answer[i] == ""){
							info += `<span style="color:red;font-size:18px"> 没有选择！</span>`;
						}else if(answer[i] == item.correct_key){
							info += `<span style="font-size:18px">`+answer[i]+`</span>`;
							info += `<span style="color:green;font-size:18px"> ✔回答正确</span>`;
						}else{
							info += `<span style="font-size:18px">`+answer[i]+`</span>`;
							info += `<span style="color:red;font-size:18px"> ✘回答错误</span>`;
						}
				info +=`</td>
					</tr>`;
			};
			
			info += `</table>`;
			}
			$("#tab").hide();
			$("#back").show();
			$("#suggestion").show();
			$("#select").hide();
			$("#frm").empty();
			$("#frm").append(info);
		}
	});
}
function back(){
		$("#tab").show();
		$("#back").hide();
		$("#suggestion").hide();
		$("#select").show();
		$("#frm").empty();
}
function registSuggestion(IdCard,testPaperNumber){
alert(IdCard);
alert(testPaperNumber);
	window.location.href="engageresume/initResume.do?IdCard="+IdCard+"&testPaperNumber="+testPaperNumber;
}
</script>
</head>
<body>
 
		<table width="100%" id="initInfo">
			<tr>
				<td><font color="#0000CC">您正在做的业务是：人力资源--招聘管理--招聘考试管理--成绩查询筛选
				</font></td>
			</tr>
			<tr>
				<td align="right"><input type="button" value=" 查询   "
					class="BUTTON_STYLE1" onclick="toSelect()" id="select"></td>
				<td align="left"><input type="button" value=" 返回   "
					class="BUTTON_STYLE1" onclick="back()" id="back"></td>
				<!-- <td align="left"><input type="button" value="考试建议 "
					class="BUTTON_STYLE1" onclick="registSuggestion()" id="suggestion"></td> -->
			</tr>
		</table>
				
		<table width="100%" border="1" cellpadding=0 cellspacing=1
				bordercolorlight=#848284 bordercolordark=#eeeeee
				class="TABLE_STYLE1" id="tab">
				<tr>
					<td width="10%" class="TD_STYLE1">
						请输入应试人身份证号码
					</td>
					<td width="10%" class="TD_STYLE2">
						<input type="text" name="IdCard" value="" id="IdCard">
					</td>
				</tr>
				<!-- <tr>
					<td width="10%" class="TD_STYLE1">
						请输入关键字
					</td>
					<td width="10%" class="TD_STYLE2">
						<input type="text" name="key_word" id="keyWord" value="">
					</td>
				</tr> -->
				<tr>
					<td width="10%" class="TD_STYLE1" value="">
						请输入应试时间
					</td>
					<td width="10%" class="TD_STYLE2">
						<input type="date" value="" id="startTime">至<input type="date" value="" id="endTime">
					</td>
				</tr>
			</table>
	
	<form id="frm">
			
	</form>
</body>

</html>