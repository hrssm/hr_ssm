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
	$(window).load(flushPage()); 
	
	function flushPage(){
				var str = ``;
				$.ajax({
					type:"POST",
					url:"engageSubjectsController/getFirstAndSecondMap.do",
					dataType:"json",
					success:function(result){
						var firstOptions="<option value='' disabled selected hidden>请选择</option>";
						$.each(result.listFirstMap,function(i,item){
							firstOptions +="<option id=first_"+item.first_kind_id+
													"value="+item.first_kind_id+">"+
													item.first_kind_id+"</option>";
						});
						$("#firstKindId").empty();
						$("#firstKindId").append(firstOptions);
						
						$("#firstKindId").change(function(){
							var fid = $(this).val();
							var secondOptions="<option value='' disabled selected hidden>请选择</option>";
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
	};
/*  "second_kind_id":$(".second_kind_id").val(),
				 "derivation":$("#derivation").val(),
				 "register":$("#register").val(),
				 "changer":$("#changer").val() */
	function query(){
		$.ajax({
			type:"POST",
			url:"engageSubjectsController/query.do",
			data:{
				 first_kind_id:encodeURI($(".first_kind_id").val()), 
				 second_kind_id:encodeURI($(".second_kind_id").val()),
				 derivation:encodeURI($("#derivation").val()),
				 register:encodeURI($("#register").val()),
				 changer:encodeURI($("#changer").val()),
				 startTime:encodeURI($("#startTime").val()),
				 endTime:encodeURI($("#endTime").val())
			},
			success:function(result){
				var str = ``;
				if(result.length>0){
				str+=`<tr>
					<td class="TD_STYLE1">
						题目编号
					</td>
					<td  class="TD_STYLE1">
						I级种类编号
					</td>
					<td   class="TD_STYLE1">
						I级种类名称
					</td>
					<td  class="TD_STYLE1">
						II级种类编号
					</td>
					<td  class="TD_STYLE1">
						II级种类名称
					</td>
					<td class="TD_STYLE1">
						题目内容
					</td>
					<td  class="TD_STYLE1">
						题目选项
					</td>
					<td  class="TD_STYLE1">
						正确答案
					</td>
					<td class="TD_STYLE1">
						题目来源
					</td>
					<td class="TD_STYLE1">
						登记人
					</td>
					<td class="TD_STYLE1">
						登记时间
					</td>
					<td class="TD_STYLE1">
						修改人
					</td>
					<td class="TD_STYLE1">
						修改时间
					</td>
				</tr>`;
				
				for(var i=0;i<result.length;i++){
					str+=`<tr>
					<td class="TD_STYLE2">
						`+result[i].sub_id +`
					</td>
					<td  class="TD_STYLE2">
						`+result[i].first_kind_id+`
					</td>
					<td   class="TD_STYLE2">
						`+result[i].first_kind_name+`
					</td>
					<td  class="TD_STYLE2">
						`+result[i].second_kind_id+`
					</td>
					<td  class="TD_STYLE2">
						`+result[i].second_kind_name+`
					</td>
					<td class="TD_STYLE2">
						`+result[i].content+`
					</td>
					<td  class="TD_STYLE2">
						`+result[i].key_a+" "+result[i].key_b+" "+
						result[i].key_c+" "+result[i].key_d+" "+result[i].key_e+`
					</td>
					<td  class="TD_STYLE2">
						`+result[i].correct_key+`
					</td>
					<td class="TD_STYLE2">
						`+result[i].derivation+`
					</td>
					<td class="TD_STYLE2">
						`+result[i].register+`
					</td>
					<td class="TD_STYLE2">
						`+result[i].regist_time+`
					</td>
					<td class="TD_STYLE2">
						`+result[i].changer+`
					</td>
					<td class="TD_STYLE2">
						`+result[i].change_time+`
					</td>
				</tr>`;
				}
				 $("#warning").empty();
				 $("#queryResult").empty();
				 $("#queryResult").append(str); 
			  }else{
			   $("#queryResult").empty();
			   $("#warning").html("抱歉，还没有任何数据哦！"); 
			  }
			}
		});
		$("#firstKindId").append("<option value='' disabled selected hidden>请选择</option>");
		$("#secondKindId").append("<option value='' disabled selected hidden>请选择</option>");
		$("#firstKindName").html('');
		$("#secondKindName").html('');
	}
	function back(){
		location.href="question_second_kind.jsp";
	}

</script>
</head>
<body>
	<div name="configfilefirstkindForm">
		<table width="100%">
			<tr>
				<td><font color="#0000CC">您正在做的业务是：人力资源--客户化设置--题库管理设置--试题二级分类设置
				</font></td>
			</tr>
			<tr>
				<td align="right">
					<input type="date" name="startTime" id="startTime"/>--
					<input type="date" name="endTime" id="endTime"/>
				</td>
				<td align="right"><input type="button" value="       查询         "
					class="BUTTON_STYLE1" onclick="query()"></td>
			</tr>
		</table>
				
		<table width="100%" border="1" cellpadding=0 cellspacing=1
				bordercolorlight=#848284 bordercolordark=#eeeeee
				class="TABLE_STYLE1" id="tab">
				<tr>
					<td width="10%" class="TD_STYLE1">
						试题I级分类编号
					</td>
					<td width="10%" class="TD_STYLE1">
						试题I级分类名称
					</td>
					<td width="10%" class="TD_STYLE1">
						试题II级分类编号
					</td>
					<td width="10%" class="TD_STYLE1">
						试题II级分类名称
					</td>
					<td width="10%" class="TD_STYLE1">
						题目来源
					</td>
					<td width="5%" class="TD_STYLE1">
						登记人
					</td>
					<td width="5%" class="TD_STYLE1">
						修改人
					</td>
				</tr>
					
				<tr>
					<td width="10%" class="TD_STYLE1">
					 <select id="firstKindId" name="first_kind_id" class="first_kind_id">
					 	<option value="" disabled selected hidden>请选择</option>
					</select> 
					</td>
					<td width="10%" class="TD_STYLE1"  id="firstKindName">
						<input type="hidden" name="first_kind_name" id="first_kind_name"/>	
					</td>
					
					<td width="10%" class="TD_STYLE1">
						 <select id="secondKindId" name="second_kind_id" class="second_kind_id">
							 <option value="" disabled selected hidden>请选择</option>
						</select> 
					</td>
					<td width="10%" class="TD_STYLE1" id="secondKindName">
						<input type="hidden" id="second_kind_name" name="second_kind_name" />
					</td>
					<td width="10%" class="TD_STYLE1">
						<input type="text" name="derivation" id="derivation">
					</td>
					<td width="5%" class="TD_STYLE1">
						<input type="text" name="register" id="register">
					</td>
					<td width="5%" class="TD_STYLE1">
						<input type="text" name="changer" id="changer">
					</td>
				</tr>
			</table>
	</form>
	<br/>
	<h1 id="warning" style="color:red;text-align:center"></h1>
	<div id="result">
		<table width="100%" border="1" cellpadding=0 cellspacing=1
				bordercolorlight=#848284 bordercolordark=#eeeeee
				class="TABLE_STYLE1" id="queryResult">
		</table>
	</div>
</body>


</html>