<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>My JSP 'resume-choose.jsp' starting page</title>

		 <link rel="stylesheet"
			href="/hr_ssm/css/table.css" type="text/css">
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
			src="/hr_ssm/javascript/jquery-1.7.2.js">
		</script>
		<script type="text/javascript"
			src="/hr_ssm/javascript/locate.js">
		</script>
		<script type="text/javascript"
			src="/hr_ssm/javascript/select.js">
		</script>
	   <script type="text/javascript"
			src="/hr_ssm/javascript/comm/time.js">
			</script>
		<script type="text/javascript">
		function getBoby(){
			var mid = $("#emailTitle").val();
			$.ajax({
				url:'byIdQueryEmail?mid='+mid,
				type:'get',
				success:function(data){
					var mboby = data.mboby;
					// 将${humanname}替换成名字
					var ename = $("#humanname").val();
					mboby = mboby.replace("humanname",ename);

					var ename = $("#humanmajorkindname").val();
					mboby = mboby.replace("humanmajorkindname",ename);

					var ename = $("#humanmajorname").val();
					mboby = mboby.replace("humanmajorname",ename);
					$("#emailBoby").val(mboby);
				}
			});
		}
		</script>
	</head>
	<body>
		<form method="post" action="sendEmail">
		<table width="100%">
				<tr>
					<td>
						<font color="black">您正在做的业务是：人力资源--招聘管理--简历管理--有效简历查询--发送邮件 </font>
					 
					</td>
				</tr>
				<tr>
					<td align="right">
					 
						<input type="submit" value="发送" class="BUTTON_STYLE1">
						<input type="reset" value="清除" class="BUTTON_STYLE1">
					</td>
				</tr>
			</table>
			<input type="hidden" name="resid" value="${resid }">
			<table width="100%" border="1" cellpadding=0 cellspacing=1 bordercolorlight=#848284 bordercolordark=#eeeeee class="TABLE_STYLE1">
				<tr>
					<td class="TD_STYLE1" width="10%">
						发件人
					</td>
					<td width="84%">
						<input type="text" name="sender" class="INPUT_STYLE2" value="2685334273@qq.com"/>
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1" width="10%">
						收件人
					</td>
					<td width="84%">
						<input type="text" name="Email" class="INPUT_STYLE2" value="${email }"/>
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1" width="10%">
						邮件标题
					</td>
					<td width="84%">
						<select name="mtitle" id="emailTitle" class="INPUT_STYLE2" onchange="getBoby()">
							<option>-------请选择邮件标题-------</option>
							<c:forEach items="${mblist}" var="mb">
								<option value="${mb.mid }">${mb.mtitle }</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td class="TD_STYLE1">
						邮件正文
					</td>
					<td colspan="7" class="TD_STYLE2">
						<textarea name="mboby" rows="4" class="TEXTAREA_STYLE1" id="emailBoby"></textarea>
					</td>
				</tr>
			</table>

			<p>
				 
		</form>
		<input type="hidden" value="${humanmajorname }" id="humanmajorname"/>
		<input type="hidden" value="${humanmajorkindname }" id="humanmajorkindname"/>
		<input type="hidden" value="${humanname }" id="humanname"/>
	</body>
</html>