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
			src="/hr_ssm/javascript/jquery-1.7.2.js">
		</script>
		<script type="text/javascript"
			src="/hr_ssm/javascript/locate.js">
		</script>
	 <script type="text/javascript"
			src="/hr_ssm/javascript/select.js">
		</script>
		
		<script type="text/javascript">
		function doDelete(mid){
		if(window.confirm("确认删除该项纪录？")){
		$.ajax({
			url:'deleteMajorRelease?mid='+mid,
			type:'get',
			success:function(data){
					if(data == 'ok'){
						$("#"+mid).remove();
					}
				}
			});
		}
		
		}
		</script>
		
		</head>

	<body>
		<form method="post" action="/HR_Fist/recruit/recruitAction!findMajor" name="fm">
		<input type="hidden" name="utilBean.currPage" id="page"/>
			<table width="100%">
				<tr>
					<td>
						<font color="black">您正在做的业务是：人力资源--招聘管理--职位发布管理--职位发布变更 
						</font>
					</td>
				</tr>
			 
			</table>
			当前可变更是职位发布总数：${count }例
			<table width="100%" border="1" cellpadding=0 cellspacing=1
				bordercolorlight=#848284 bordercolordark=#eeeeee
				class="TABLE_STYLE1">
				<tr>
					<td width="15%" class="TD_STYLE1">
						职位名称
					</td>
					<td width="20%" class="TD_STYLE1">
						公司名称
					</td>
					<td width="10%" class="TD_STYLE1">
						招聘人数
					</td>
					<td width="20%" class="TD_STYLE1">
						发布时间
					</td>
					<td width="20%" class="TD_STYLE1">
						截止时间
					</td>
					<td width="8%" class="TD_STYLE1">
						修改
					</td>
					<td width="8%" class="TD_STYLE1">
						删除
					</td>
				</tr>
				
				<c:forEach items="${mrlist}" var="mr">
				<tr id="${mr.mre_id }">
					<td width="15%" class="TD_STYLE1">
						${mr.major_name }
					</td>
					<td width="20%" class="TD_STYLE1">
						${mr.second_kind_name }
					</td>
					<td width="10%" class="TD_STYLE1">
						${mr.human_amount }
					</td>
					<td width="20%" class="TD_STYLE1">
						${mr.regist_time }
					</td>
					<td width="20%" class="TD_STYLE1">
						${mr.deadline }
					</td>
					<td class="TD_STYLE1">
						<a href="Edit.do?mre_id=${mr.mre_id}">修改</a>
					</td>
					<td class="TD_STYLE1">
						<a href="javascript:doDelete(${mr.mre_id })">删除</a>
					</td>
				</tr>
				</c:forEach>
			</table>
		</form>
		<script type="text/javascript">
		function up(currPage){  
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