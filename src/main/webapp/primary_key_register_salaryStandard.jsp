<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	
	
	
	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<link rel="stylesheet" href="table.css" type="text/css">
		<script type="text/javascript">
 	function selAll(obj)
 	{
 		var cho = document.all.choice.value;
 		if(cho == "全选")
 			document.all.choice.value = "取消";
 		else
 			document.all.choice.value = "全选";
 			
 		 for(var i=0;i<obj.elements.length;i++){
 			if(obj.elements[i].tagName.toLowerCase()=="input" && obj.elements[i].type=="checkbox"){
 				if(cho == "全选")
 					obj.elements[i].checked=true;
 				else
 					obj.elements[i].checked=false;
 			}
 		}
 	}
 	//function doRegister()
 	//{
 		//document.forms[0].action = document.forms[0].action + "?operate=doRegister";
	//	document.forms[0].action = "keyword/humanFile.do";
	//	document.forms[0].submit();
 	//}
</script>
	</head>

	<body>
		<form action="configprimarykey.do" method="post">
			<table width="100%">
				<tr>
					<td>
						<font color="#0000CC">您正在做的业务是：人力资源--客户化设置--其他设置--关键字查询设置</font>
					</td>
				</tr>
				<tr>
					<td align="right">
						<input id="register" type="button" value="提交" class="BUTTON_STYLE1" ">
						<input type="button" value="返回" class="BUTTON_STYLE1"
							onclick="history.back();">
					</td>
				</tr>
			</table>
			<table width="100%" border="1" cellpadding=0 cellspacing=1
				bordercolorlight=#848284 bordercolordark=#eeeeee
				class="TABLE_STYLE1">
				<tr class="TR_STYLE1">
					<td class="TD_STYLE1" colspan="4">
						请选择用于关键字查询的字段&nbsp;
						<input type="button" name="choice" value="全选"
							class="BUTTON_STYLE1" onclick="selAll(this.form)">
					</td>
				</tr>
				<input id="table" type="hidden" name="table" value="salaryStandard">
				
					<input type="hidden" name="list[0].prkId" value="1">
					<input type="hidden" name="primaryKey" value="standard_id">
					<input type="hidden" name="list[0].keyName" value="薪资标准id">
					<tr>
						<td class="TD_STYLE2">
							<input type="checkbox" name="bike" value="薪资标准id,standard_id" checked="checked">薪资标准id
						</td>
					
				
					<input type="hidden" name="list[1].prkId" value="2">
					<input type="hidden" name="primaryKey" value="standard_name">
					<input type="hidden" name="list[1].keyName" value="薪资标准名称">
					
						<td class="TD_STYLE2">
							<input type="checkbox" name="bike" value="薪资标准名称,standard_name" checked="checked">薪资标准名称
						</td>
					
				
					<input type="hidden" name="list[2].prkId" value="3">
					<input type="hidden" name="primaryKey" value="designer">
					<input type="hidden" name="list[2].keyName" value="设计师">
					
						<td class="TD_STYLE2">
							<input type="checkbox" name="bike" value="设计师,designer" checked="checked">设计师
						</td>
					
				
					<input type="hidden" name="list[3].prkId" value="4">
					<input type="hidden" name="primaryKey" value="register">
					<input type="hidden" name="list[3].keyName" value="登记人">
					
						<td class="TD_STYLE2">
							<input type="checkbox" name="bike" value="登记人,register" checked="checked">登记人
						</td>
					</tr>
				
					<input type="hidden" name="list[4].prkId" value="5">
					<input type="hidden" name="primaryKey" value="checker">
					<input type="hidden" name="list[4].keyName" value="审核人">
					<tr>
						<td class="TD_STYLE2">
							<input type="checkbox" name="bike" value="审核人,checker" checked="checked">审核人
						</td>
					
				
					<input type="hidden" name="list[5].prkId" value="6">
					<input type="hidden" name="primaryKey" value="changer">
					<input type="hidden" name="list[5].keyName" value="修改人">
					
						<td class="TD_STYLE2">
							<input type="checkbox" name="bike" value="修改人,changer" checked="checked">修改人
						</td>
					
				
					<input type="hidden" name="list[6].prkId" value="7">
					<input type="hidden" name="primaryKey" value="regist_time">
					<input type="hidden" name="list[6].keyName" value="登记时间">
					
						<td class="TD_STYLE2">
							<input type="checkbox" name="bike" value="登记时间,regist_time" checked="checked">登记时间
						</td>
					
				
					<input type="hidden" name="list[7].prkId" value="8">
					<input type="hidden" name="primaryKey" value="check_time">
					<input type="hidden" name="list[7].keyName" value="审核时间">
					
						<td class="TD_STYLE2">
							<input type="checkbox" name="bike" value="审核时间,check_time" checked="checked">审核时间
						</td>
					</tr>
				
					<input type="hidden" name="list[8].prkId" value="9">
					<input type="hidden" name="primaryKey" value="change_time">
					<input type="hidden" name="list[8].keyName" value="修改时间">
					<tr>
						<td class="TD_STYLE2">
							<input type="checkbox" name="bike" value="修改时间,change_time" checked="checked">修改时间
						</td>
					
				
					<input type="hidden" name="list[9].prkId" value="10">
					<input type="hidden" name="primaryKey" value="salary_sum">
					<input type="hidden" name="list[9].keyName" value="薪资总额">
					
						<td class="TD_STYLE2">
							<input type="checkbox" name="bike" value="薪资总额,salary_sum" checked="checked">薪资总额
						</td>
					
				
					<input type="hidden" name="list[10].prkId" value="11">
					<input type="hidden" name="primaryKey" value="check_status">
					<input type="hidden" name="list[10].keyName" value="审核状态">
					
						<td class="TD_STYLE2">
							<input type="checkbox" name="bike" value="审核状态,check_status" checked="checked">审核状态
						</td>
					
				
					<input type="hidden" name="list[11].prkId" value="12">
					<input type="hidden" name="primaryKey" value="change_status">
					<input type="hidden" name="list[11].keyName" value="修改状态">
					
						<td class="TD_STYLE2">
							<input type="checkbox" name="bike" value="修改状态,change_status" checked="checked">修改状态
						</td>
					</tr>
				
					<input type="hidden" name="list[12].prkId" value="13">
					<input type="hidden" name="primaryKey" value="check_comment">
					<input type="hidden" name="list[12].keyName" value="审核评论">
					<tr>
						<td class="TD_STYLE2">
							<input type="checkbox" name="bike" value="审核评论,check_comment" checked="checked">审核评论
						</td>
					
				
					<input type="hidden" name="list[13].prkId" value="14">
					<input type="hidden" name="primaryKey" value="remark">
					<input type="hidden" name="list[13].keyName" value="评论">
					
						<td class="TD_STYLE2">
							<input type="checkbox" name="bike" value="评论,remark" checked="checked">评论
						</td>
					
				
					</tr>
				
			</table>
		</form>
	</body>
</html>
<script type="text/javascript" src="js/jquery-1.6.1.min.js"></script>
<script type="text/javascript" src="js/primary_key_register.js" ></script>
