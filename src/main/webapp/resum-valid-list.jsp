<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>My JSP 'valid-list.jsp' starting page</title>
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
			src="javascript/jquery-1.7.2.js">
		</script>
		<script type="text/javascript"
			src="/hr_ssm/javascript/locate.js">
		</script>
		<script type="text/javascript"
			src="/hr_ssm/javascript/select.js">
		</script>
     </head>

	<body>
		<form method="post" action="/HR_Fist/recruit/recruitAction!toResumeList?a=valid" name="fm">
		<input type="hidden" name="utilBean.currPage" id="page"/>
			<table width="100%">
				<tr>
					<td>
						<font color="black">您正在做的业务是：人力资源--招聘管理--简历管理--有效简历列表 
						</font>
					</td>
				</tr>
			 <tr>
					<td align="right"> 
						<input type="button" value="返回" class="BUTTON_STYLE1" onclick="history.back();">
					</td>
				</tr>
			</table> 
			<table width="100%" border="1" cellpadding=0 cellspacing=1
				bordercolorlight=#848284 bordercolordark=#eeeeee
				class="TABLE_STYLE1">
				<tr>
					<td width="13%" class="TD_STYLE1">
						档案编号
					</td>
					<td width="12%" class="TD_STYLE1">
						姓名
			     	</td>
					<td width="14%" class="TD_STYLE1">
						性别
					</td>
					<td width="14%" class="TD_STYLE1">
						职位分类
					</td>
					<td width="9%" class="TD_STYLE1">
						职位名称
					</td>
					<td width="9%" class="TD_STYLE1">
						电话号码
					</td>
					<td width="9%" class="TD_STYLE1">
						复核状态
					</td>
					<td width="9%" class="TD_STYLE1">
						面试状态
					</td>
					<td width="11%" class="TD_STYLE1">
						邮箱通知
					</td>
				</tr>
							<c:forEach items="${resultList}" var="re">
					<tr>
						<td class="TD_STYLE2">
							<a href="validResumeById.do?resid=${re.res_id}">
								${re.res_id}</a>
						</td>
						<td class="TD_STYLE2">
							${re.human_name}
						</td>
						<td class="TD_STYLE2">
							${re.human_sex}
						</td>
						<td class="TD_STYLE2">
						${re.human_major_kind_name}
						</td>
						<td class="TD_STYLE2">
						${re.human_major_name}
						</td>
						<td class="TD_STYLE2">
						${re.human_mobilephone}
						</td>
						<td class="TD_STYLE2">
						<c:if test="${re.check_status == 0}">未通过</c:if>
						<c:if test="${re.check_status == 1}">通过</c:if>
						</td>
						<td class="TD_STYLE2">
						<c:if test="${re.interview_status == 1}">待面试</c:if>
						<c:if test="${re.interview_status == 2}">不可面试</c:if>
						</td>
						<td class="TD_STYLE2">
						<a href="toSendmail?resid=${re.res_id}">邮件通知</a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</form>
		<script type="text/javascript">
		function up(currPage,row){  
		if(currPage<=0){
		document.getElementById("page").value = row;
		}else{
		document.getElementById("page").value =currPage; 
		}
		 document.fm.submit();
		}
		function down(currPage,row){ 
		if(currPage>=row){
		document.getElementById("page").value = row;
		}else{
		document.getElementById("page").value =currPage; 
		}
		 document.fm.submit();
		}
		function tj(row){
	     document.getElementById("page").value = document.getElementById("currPage").value;
	     if(document.getElementById("currPage").value>row){
	     alert("最大页数为"+row+",当前为第"+row+"页 ");
	     return false;
	     }
	     document.fm.submit();
	 	}
		</script>
	</body>
</html>