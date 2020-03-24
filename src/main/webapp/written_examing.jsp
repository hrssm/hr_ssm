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
	var mnameOptions=`<option value="" disabled selected hidden>请选择</option>`; 
	var mknameOptions = `<option value="" disabled selected hidden>请选择</option>`;
	var mnameArr = "";
	var midArr = "";
	var index = -1;
	$.ajax({
		type:"post",
		url:"engagemajorrelease/getMajorRelease.do",
		success:function(result){
			$.each(result.major_release,function(i,item){
				mknameOptions += `<option value="`+item.major_kind_name+`">`+item.major_kind_name+`</option>`;
			});
		$("#positionKindName").empty();
		$("#positionKindName").append(mknameOptions);
		
		$("#positionKindName").change(function(){
			mnameOptions=`<option value="" disabled selected hidden>请选择</option>`;
		 	 var mkname = $(this).val();
		 	 $.each(result.major_release,function(i,item){
		 	 	if(mkname == item.major_kind_name){
			 	    mnameArr = item.major_name.split(",");
					for(var i=0;i<mnameArr.length;i++){
						mnameOptions += `<option value="`+mnameArr[i]+`">`+mnameArr[i]+`</option>`;
					}
		 	 	}
			});
				$("#positionName").empty();
				$("#positionName").append(mnameOptions);
		});
		}
	});
	});
	
	function toExam(){
		var name = $("#name").val();
		var IdCard = $("#IdCard").val();
		$.ajax({
			type:"POST",
			url:"engageSubjectsController/getExamPaper.do",
			data:{
					"position_kind_name":$("#positionKindName option:selected").val(),
					"position_name":$("#positionName option:selected").val(),
					"name":$("#name").val(),
					"IdCard":$("#IdCard").val()
				},
			success:function(result){
				var exam = ``; 
				for(var key in result){
					exam += `
						<table width="100%">
							<tr>
								<td><font color="#0000CC">您正在做的业务是：人力资源--招聘管理--招聘考试管理--考试答题
								</font></td>
							</tr>
							<tr>
								<td align="right">答题限定时间：<span id="limitTime">`+key+`</span></td>
							</tr>
							<tr>
								<td align="right">剩下时间：<span></span></td>
							</tr>
							<tr>
								<td align="right">
									<input type="radio" value="hand" name="check">我要交卷 <input type="radio" value="notHand" name="check">再检查一遍
									<input type="button" value="确认" onclick="handInTestPaper()">     
								</td>
							</tr>
						</table>`;
						
					var paperMap = result[key];
					for(var k in paperMap){
						exam += `
						<table width="100%" border="1" cellpadding=0 cellspacing=1
							bordercolorlight=#848284 bordercolordark=#eeeeee
							class="TABLE_STYLE1" id="baseInfo">
							<tr>
								<td class="TD_STYLE1">试卷编号</td>
								<td class="TD_STYLE2" id="paperNumber">`+k+`</td>
								<td class="TD_STYLE1">题目数量</td>
								<td class="TD_STYLE2" id="questionCount">`+paperMap[k].length+`</td>
							</tr>
							<tr>
								<td class="TD_STYLE1">姓名</td>
								<td class="TD_STYLE2" id="myname">`+name+`</td>
								<td class="TD_STYLE1">身份证号</td>
								<td class="TD_STYLE2" id="myIdCard">`+IdCard+`</td>
							</tr>
						</table><br>
						<table width="100%" border="1" cellpadding=0 cellspacing=1
										bordercolorlight=#848284 bordercolordark=#eeeeee
										class="TABLE_STYLE1" id="testPaperInfo">`;
						$.each(paperMap[k],function(i,item){
							exam += `
									<tr><td class="TD_STYLE1" id="content">`+item.content+`</td></tr>
										<tr class="answer">
											<td class="TD_STYLE2">`;
											if(item.key_a != null && item.key_a !=""){
												exam += `<input type="radio" value="a" name="radio`+i+`">`+item.key_a+`<br>`;
											}
											if(item.key_b != null && item.key_b !=""){
												exam += `<input type="radio" value="b" name="radio`+i+`">`+item.key_b+`<br>`;
											}
											if(item.key_c != null && item.key_c !=""){
												exam += `<input type="radio" value="c" name="radio`+i+`">`+item.key_c+`<br>`;
											}
											if(item.key_d != null && item.key_d !=""){
												exam += `<input type="radio" value="d" name="radio`+i+`">`+item.key_d+`<br>`;
											}
											if(item.key_e != null && item.key_e !=""){
												exam += `<input type="radio" value="e" name="radio`+i+`">`+item.key_e+`<br>`;
											}
										exam +=	`</td>
										</tr>`;
						})
						exam += `</table>`;
					} 
				}
				$("#frm").empty();
				$("#frm").append(exam);
			}
		});
	}
	
	function handInTestPaper(){
		var flag = $("input:radio:checked").val()
		var answer = "";
		if(flag == "hand"){
			//获取所有答案（遍历table 下的 tr td input:checked）
			$("#testPaperInfo .answer").each(function(i,item){
				answer += $(this).find("td input:checked").val()+",";
			});
			$.ajax({
				type:"POST",
				url:"engageSubjectsController/handInTestPaper.do",
				data:{
					"IdCard":$("#myIdCard").text().trim(),
					"answer":answer,
					"useTime":"60"
				},
				success:function(){
				  var suc = `
						<table width="100%">
							<tr>
								<td><font color="#0000CC">您正在做的业务是：人力资源--招聘管理--招聘考试管理--考试答题
								</font></td>
							</tr>
							<tr>
								<td align="center"><h3>试卷提交成功，请等待结果！</h3></td>
							</tr>
						</table>`;
					$("#frm").empty();
					$("#frm").append(suc);
				}
			});
		}
	}
</script>
</head>
<body>
	<form id="frm">
		<table width="100%" id="initInfo">
			<tr>
				<td><font color="#0000CC">您正在做的业务是：人力资源--招聘管理--招聘考试管理--考试答题
				</font></td>
			</tr>
			<tr>
				<td align="right"><input type="button" value=" 提交   "
					class="BUTTON_STYLE1" onclick="toExam()"></td>
				<td align="left"><input type="reset" value=" 清除   "
					class="BUTTON_STYLE1"></td>
					
			</tr>
		</table>
				
		<table width="100%" border="1" cellpadding=0 cellspacing=1
				bordercolorlight=#848284 bordercolordark=#eeeeee
				class="TABLE_STYLE1" id="tab">
				<tr>
					<td width="10%" class="TD_STYLE1">
						姓名
					</td>
					<td width="10%" class="TD_STYLE2">
						<input type="text" name="name" id="name">
					</td>
					<td width="10%" class="TD_STYLE1">
						身份证号码
					</td>
					<td width="10%" class="TD_STYLE2">
						<input type="text" name="IdCard" id="IdCard">
					</td>
				</tr>
				<tr>
					<td width="10%" class="TD_STYLE1">
						职位分类名称
					</td>
					<td width="10%" class="TD_STYLE2">
						<select id="positionKindName" name="position_kind_name" >
					 		<option value="" disabled selected hidden>请选择</option>
						</select>
					</td>
					<td width="10%" class="TD_STYLE1">
						职位名称
					</td>
					<td width="10%" class="TD_STYLE2">
						<select id="positionName" name="position_Name" class="position_Name">
							 <option disabled selected hidden>请选择</option>
						</select> 
					</td>
				</tr>
			</table>
	</form>
</body>

</html>