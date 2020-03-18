<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>My JSP 'position-release_details.jsp' starting page</title>
    
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
		
		<script type="text/javascript">
			function apply(id)
			{
				var p = "http://"+window.location.host +"/hr_ssm/engageresume/apply.do?mre_id=" + id;
				document.frm.action = p;
				document.frm.submit();
			}
		
		</script>	
 	</head>
	<body>
		<form id="frm" name="frm" method="post" 
		enctype="multipart/form-data">
			<input type="hidden" id="merId" name="mer_id" value="${mr.mre_id }"/>
			<input type="hidden" id="fisrtKindName" name="firstkindid" value="${mr.first_kind_id }"/>
			<input type="hidden" id="secondKindName" name="secondkindid" value="${mr.second_kind_id }">
			<input type="hidden" id="thirdKindName" name="thirdkindid" value="${mr.third_kind_id }">
			<input type="hidden" id="majorKindName" name="majorkindid" value="${mr.major_kind_id }">
			<input type="hidden" id="majorName" name="majorid" value="${mr.major_id }">
			<input type="hidden" name ="mreid" value="${mr.mre_id }"/>
			<table width="100%"> 
				<tr>
					<td>
						<font color="black">您正在做的业务是：人力资源--招聘管理--职位发布管理--职位发布查询--详细  </font>
					</td>
				</tr>
				<tr>
					<td align="right">
						<input type="submit" value="确认申请" onclick="apply(${mr.mre_id })" class="BUTTON_STYLE1" />
						<input type="button" value="返回" class="BUTTON_STYLE1" onclick="history.back();">
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
						
						<select name="firstkindname" id="firstKindId"  class="SELECT_STYLE1"> 
						<option>${mr.first_kind_name }</option>
						
					 </select>
					</td>
					<td width="11%" class="TD_STYLE1">
						II级机构
					</td>
					<td width="14%" class="TD_STYLE2">
						<select name="secondkindname" id="secondKindId" class="SELECT_STYLE1" onchange="queryThirdyBySid()"> 
						<option>${mr.second_kind_name }</option>
						</select>
					</td>
					<td width="11%" class="TD_STYLE1">
						III级机构
					</td>
					<td class="TD_STYLE2"  >
						<select name="thirdkindname" id="thirdKindId" class="SELECT_STYLE1" onchange="getThirdName()">
							<option>${mr.third_kind_name }</option>
						</select>
					</td>
					<td width="11%" class="TD_STYLE1">
						招聘类型
					</td>
					<td class="TD_STYLE2" colspan="2">
					<select name="engagetype" id="engageType" class="SELECT_STYLE1"> 
							<option value="${mr.engage_type }">${mr.engage_type }</option> 
					</select>
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						职位分类
					</td>
					<td class="TD_STYLE2">
						<select name="majorkindname" id="majorKindId" class="SELECT_STYLE1" onchange="ByIdQueryMajor()">
							<option>${mr.major_kind_name }</option> 
								 </select>
					</td>
					<td class="TD_STYLE1">
						职位名称
					</td>
					<td class="TD_STYLE2">
						<select name="majorname" id="majorId" class="SELECT_STYLE1" onchange="getMajorName()"> 
							<option>${mr.major_name }</option>
						</select>
					</td>
					<td class="TD_STYLE1">
						招聘人数
					</td>
					<td   class="TD_STYLE2">
						 <input type="text" name="humanamount" id="humanAmount"  class="INPUT_STYLE2" value="${mr.human_amount }"  readonly="readonly">
					</td>
					<td class="TD_STYLE1">
						截止日期
					</td>
					<td   class="TD_STYLE2">
							  <input type="text" name="deadline" 
							  class="INPUT_STYLE2" id="date_start" onclick="aa('deadline')" value="${mr.deadline }"  readonly="readonly">
					</td>
				</tr>
				<tr>
				<td class="TD_STYLE1">
						登记人
					</td>
					<td  class="TD_STYLE2">
						 <input type="text" name="register" value="${mr.register }" class="INPUT_STYLE2"  readonly="readonly">
					</td>
					<td class="TD_STYLE1">
						登记时间
					</td>
					<td   class="TD_STYLE2">
					
							<input type="text" name="registtime"
							  id="nowTime" readonly="readonly" value="${mr.regist_time }"
							class="INPUT_STYLE2" >
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
						<textarea name="majordescribe" rows="4" cols="80" class="TEXTAREA_STYLE1"  readonly="readonly">${mr.major_describe }</textarea>
					</td>
					 
				</tr>
					<tr>
					<td class="TD_STYLE1">
						招聘要求
					</td>
					<td class="TD_STYLE2" colspan="8">
						<textarea name="engagerequired" rows="4"  cols="80" class="TEXTAREA_STYLE1"  readonly="readonly">${mr.engage_required }</textarea>
					</td>					 
				</tr>
			</table>
		</form>
	</body>
 
</html>
