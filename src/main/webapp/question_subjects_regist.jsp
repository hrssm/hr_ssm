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
				var str = ``;
				$.ajax({
					type:"POST",
					url:"engageSubjectsController/getFirstAndSecondMap.do",
					dataType:"json",
					success:function(result){
						var firstOptions="<option value='' disabled selected hidden>请选择I级种类编号</option>";
						$.each(result.listFirstMap,function(i,item){
							firstOptions +="<option id=first_"+item.first_kind_id+
													"value="+item.first_kind_id+">"+
													item.first_kind_id+"</option>";
						});
						$("#firstKindId").empty();
						$("#firstKindId").append(firstOptions);
						
						$("#firstKindId").change(function(){
							var fid = $(this).val();
							var secondOptions="<option value='' disabled selected hidden>请选择II级种类编号</option>";
							$.each(result.listFirstMap,function(i,item){
							
							if(fid == item.first_kind_id){
								$("#firstKindName").val(item.first_kind_name);
								$("#first_kind_name").val(item.first_kind_name);
								$("#firstKindName").html(item.first_kind_name);
							
							var arr = item.second_kind_id.split(",");
							 for(var i =0;i<arr.length;i++){
								secondOptions += "<option id=second_"+arr[i]+
														"value="+arr[i]+">"+
														arr[i]+"</option>";
							}
							$("#secondKindId").empty();
							$("#secondKindId").append(secondOptions); 
							}
						});
					});
						
						$("#secondKindId").change(function(){
							var sid = $(this).val();
							for(var i=0;i<result.listSecondMap.length;i++){
								if(sid == result.listSecondMap[i].second_kind_id){
								$("#secondKindName").val(result.listSecondMap[i].second_kind_name);
								$("#second_kind_name").val(result.listSecondMap[i].second_kind_name);
								//alert($("#second_kind_name").val())
								$("#secondKindName").html(result.listSecondMap[i].second_kind_name);
							}
							}
						});
						
						
					} 
				});
	}); 

	function back(){
		location.href="question_second_kind.jsp";
	}

</script>
</head>
<body>
	<form name="configfilefirstkindForm" method="post"
		action="engageSubjectsController/save.do">
		<table width="100%">
			<tr>
				<td><font color="#0000CC">您正在做的业务是：人力资源--客户化设置--题库管理设置--试题二级分类设置
				</font></td>
			</tr>
			<tr>
				<td align="right"><input type="submit" value="提交"
					class="BUTTON_STYLE1"></td>
			</tr>
		</table>

		<table width="100%" border="1" cellpadding=0 cellspacing=1
			bordercolorlight=#848284 bordercolordark=#eeeeee class="TABLE_STYLE1">
			<tr>
				<td width="19%" class="TD_STYLE1">I级种类试题编号</td>
				<input type="hidden"  name="first_kind_id" id="first_kind_id"/>
				<td width="81%" class="TD_STYLE2"> <!-- <input type="hidden"
					name="first_kind_id" class="INPUT_STYLE1">  -->
					 <select id="firstKindId" name="first_kind_id">
					 	<option value="" disabled selected hidden>请选择I级种类编号</option>
					</select> 
					</td>
			</tr>
			<tr>
				<td class="TD_STYLE1">I级种类试题名称</td>
				<input type="hidden" name="first_kind_name" id="first_kind_name"/>
				<td class="TD_STYLE2" id="firstKindName">	
				</td>
				
				<!-- <select >
					<input type="text"
						name="first_kind_name" class="INPUT_STYLE1"></td>
				</select> -->
			</tr>
			<tr>
				<td width="19%" class="TD_STYLE1">II级种类试题编号</td>
				<input type="hidden"
						name="first_kind_name" class="INPUT_STYLE1" id="first_kind_name">
				<td width="81%" class="TD_STYLE2">
				 <select id="secondKindId" name="second_kind_id">
					 <option value="" disabled selected hidden>请选择II级种类编号</option>
				</select> 
				</td>
				
			</tr>
			<tr>
				<td class="TD_STYLE1">II级种类试题名称</td>
				<input type="hidden" id="second_kind_name" name="second_kind_name" />
				<td class="TD_STYLE2" id="secondKindName">
			
			</td>
			</tr>
			
			<tr>
				<td class="TD_STYLE1">题目内容</td>
				<td class="TD_STYLE2"><input type="text"
					name="content" class="INPUT_STYLE1"></td>
			</tr>
			<tr>
				<td class="TD_STYLE1">选项</td>
				<td class="TD_STYLE2">
				a<input type="checkbox" name="key_a" value="a">
				b<input type="checkbox" name="key_b" value="b">
				c<input type="checkbox" name="key_c" value="c">
				d<input type="checkbox" name="key_d" value="d">
				e<input type="checkbox" name="key_e" value="e">
				</td>
			</tr>
			
			<tr>
				<td class="TD_STYLE1">正确答案</td>
				<td class="TD_STYLE2">
					<select name="correct_key">
						<option value="" disabled selected hidden>请选择正确答案</option>
						<option value="a">a</option>
						<option value="b">b</option>
						<option value="c">c</option>
						<option value="d">d</option>
						<option value="e">e</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<td class="TD_STYLE1">题目来源</td>
				<td class="TD_STYLE2"><input type="text"
					name="derivation" class="INPUT_STYLE1"></td>
			</tr>
			
			<!-- <tr>
				<td class="TD_STYLE1">登记人</td>
				<td class="TD_STYLE2"><input type="text"
					name="register" class="INPUT_STYLE1"></td>
			</tr> -->
			
		</table>
	</form>
</body>


</html>