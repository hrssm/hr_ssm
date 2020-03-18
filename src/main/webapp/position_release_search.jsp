<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>My JSP 'position_release_search.jsp' starting page</title>
     <link rel="stylesheet"
			href="/hr_ssm/table.css" type="text/css">
		<link rel="/hr_ssm/stylesheet"
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
		</head>
	<body>
		<form method="post" action="/HR_Fist/recruit/recruitAction!searchPosition" name="fm">
		<input type="hidden" name="utilBean.currPage" id="page"/>
			<table width="100%">
				<tr>
					<td>
						<font color="black">您正在做的业务是：人力资源--招聘管理--职位发布管理--职位发布查询 
						</font>
					</td>
				</tr>
			 
			</table>
			当前可变更是职位发布总数：2例
			<table width="100%" border="1" cellpadding=0 cellspacing=1
				bordercolorlight=#848284 bordercolordark=#eeeeee
				class="TABLE_STYLE1">
				<tr>
					<td width="20%" class="TD_STYLE1">
						职位名称
					</td>
					<td width="10%" class="TD_STYLE1">
						机构名称
					</td>
					<td width="10%" class="TD_STYLE1">
						招聘人数
					</td>
					<td width="20%" class="TD_STYLE1">
						发布时间
					</td>
					<td width="15%" class="TD_STYLE1">
						截止时间
					</td>
					<td width="10%" class="TD_STYLE1">
						申请职位
					</td>
					 
				</tr>
				<c:forEach items="${mrlist}" var="mr">			
				<tr>
						<td class="TD_STYLE2">
							${mr.major_name }
						</td>
						<td class="TD_STYLE2">
							${mr.second_kind_name }
						</td>
						<td class="TD_STYLE2">
							${mr.human_amount }
						</td>
						<td class="TD_STYLE2">
							${mr.regist_time } 
						</td>
						<td class="TD_STYLE2">
							${mr.deadline }  
						</td>
						<td class="TD_STYLE2">
							<a href="showDetail.do?mre_id=${mr.mre_id }">申请该职位</a>
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