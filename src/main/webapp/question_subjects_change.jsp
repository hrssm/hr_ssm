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
								$("#secondKindName").html(result.listSecondMap[i].second_kind_name);
							}
							}
						});
						
						
						$("#update_first_kind_id").change(function(){
							var fid = $(this).val();
							var index = $(this).parents(".tr").children("#fid").val();
							var secondUpdateOptions=`<option value="" disabled selected hidden>请选择</option>	`;
							$.each(result.listFirstMap,function(i,item){
							
							if(fid == item.first_kind_id){
								$("#first_kind_name"+index).html(item.first_kind_name);
							
							var arr = item.second_kind_id.split(",");
							 for(var i =0;i<arr.length;i++){
								secondUpdateOptions += "<option value="+arr[i]+">"+
														arr[i]+"</option>";
							}
							/* secondUpdateOptions += `</select>`; */
							$("#second_kind_id"+index).children("#update_second_kind_id").empty();
							$("#second_kind_id"+index).children("#update_second_kind_id").append(secondUpdateOptions);  
							}
						});
						});		
								
						$("#update_second_kind_id").change(function(){
							var fid = $(this).val();
							var index = $(this).parents(".tr").children("#fid").val();
							$.each(result.listSecondMap,function(i,item){
							
							if(fid == item.second_kind_id){
								$("#second_kind_name"+index).html(item.second_kind_name);
							}
						});
						});				
					} 
				});
	};
	function updateData(index){
		$("#updateLink"+index).hide();
		$("#updateDatabase"+index).show();
		var derivation = `<input type="text" name="derivation" id="update_derivation`+index+`" size="6" value="`+$("#derivation"+index).html().trim()+`">`;
		$("#derivation"+index).html(derivation);
		var content = `<input type="text" name="content" id="update_content`+index+`" size="6" value="`+$("#content"+index).html().trim()+`">`;
		$("#content"+index).html(content);
		var keys = $("#keys"+index).html().trim();
		var keyarr = keys.split(" ");
		var boxs = `a<input type="checkbox" name="key_a" value="a" class="key_a"> 
					b<input type="checkbox" name="key_b" value="b" class="key_b"> 
					c<input type="checkbox" name="key_c" value="c" class="key_c"> 
					d<input type="checkbox" name="key_d" value="d" class="key_d"> 
					e<input type="checkbox" name="key_e" value="e" class="key_e">`;
		$("#keys"+index).empty();
		$("#keys"+index).append(boxs);			
		for(var i=0; i<keyarr.length; i++) {
			$(".key_"+keyarr[i]).attr("checked",true);
		}
		
		var correct_key = $("#correct_key"+index).html().trim();
		var answer = `<select name="correct_key" id="update_correct_key`+index+`">
						<option value="a" id="option_a_`+index+`">a</option>
						<option value="b" id="option_b_`+index+`">b</option>
						<option value="c" id="option_c_`+index+`">c</option>
						<option value="d" id="option_d_`+index+`">d</option>
						<option value="e" id="option_e_`+index+`">e</option>
					</select>`;
		$("#correct_key"+index).empty();
		$("#correct_key"+index).html(answer);
		var op = "#option_"+correct_key+"_"+index;
		$(op).prop("selected", true);
		
		var selectFirstId = `<select name="update_first_kind_id" id="update_first_kind_id">`;
		
		var firstId = $("#first_kind_id"+index).html().trim();
		$("#firstKindId option").each(function(){
			if($(this).val() != null && $(this).val() != ""){
			selectFirstId += `<option value="`+$(this).val().trim()+`" id="firstId_`+$(this).val().trim()+`">`+$(this).val().trim()+`</option>`;
			}
		});
		selectFirstId+="</select>";
		$("#first_kind_id"+index).html(selectFirstId);
		$("#firstId_"+firstId).prop("selected",true);
	
	
		 var secondVal = $("#second_kind_id"+index).html().trim();
		var selectSecondId = `<select name="update_second_kind_id" id="update_second_kind_id">`;
		
		selectSecondId += `<option value="`+secondVal+`" id="secondId_`+secondVal+`">`+secondVal+`</option>`;
			
		selectFirstId+="</select>";
		$("#second_kind_id"+index).html(selectSecondId);
		//$("#secondId_"+secondtId).prop("selected",true); 
		
		flushPage();
	}
	//-----------------------------------------------------------------------------------
	function updateDatabase(index){
		var id = $("#sub_id"+index).html().trim();
		$.ajax({
			type:"POST",
			url:"engageSubjectsController/change.do",
			data:{
				subject_id:id,
				"first_kind_id":$("#first_kind_id"+index).children("#update_first_kind_id").val(),
				"second_kind_id":$("#second_kind_id"+index).children("#update_second_kind_id").val(),
				"first_kind_name":$("#first_kind_name"+index).html().trim(),
				"second_kind_name":$("#second_kind_name"+index).html().trim(),
				"content":$("#update_content"+index).val(),
				"derivation":$("#update_derivation"+index).val(),
				"correct_key":$("#update_correct_key"+index).val(),
				"key_a":$("#keys"+index).children(".key_a:checked").val(),
				"key_b":$("#keys"+index).children(".key_b:checked").val(),
				"key_c":$("#keys"+index).children(".key_c:checked").val(),
				"key_d":$("#keys"+index).children(".key_d:checked").val(),
				"key_e":$("#keys"+index).children(".key_e:checked").val()
			},
			success:function(result){
				query();
			}
		});
	}
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
					<td class="TD_STYLE1">
						操作
					</td>
				</tr>`;
				
				for(var i=0;i<result.length;i++){
					str+=`
					<tr class="tr">
					<input type="hidden" id="fid" value="`+i+`">
					<td class="TD_STYLE2 id=" id="sub_id`+i+`" value="`+result[i].sub_id+`">
						`+result[i].sub_id +`
					</td>
					<td  class="TD_STYLE2" id="first_kind_id`+i+`" value="`+result[i].first_kind_id+`">
						`+result[i].first_kind_id+`
					</td>
					<td   class="TD_STYLE2" id="first_kind_name`+i+`" value="`+result[i].first_kind_name+`">
						`+result[i].first_kind_name+`
					</td>
					<td  class="TD_STYLE2" id="second_kind_id`+i+`" value="`+result[i].second_kind_id+`">
						`+result[i].second_kind_id+`
					</td>
					<td  class="TD_STYLE2" id="second_kind_name`+i+`" value="`+result[i].second_kind_name+`">
						`+result[i].second_kind_name+`
					</td>
					<td class="TD_STYLE2" id="content`+i+`" value="`+result[i].content+`">
						`+result[i].content+`
					</td>
					<td  class="TD_STYLE2" id="keys`+i+`" value="`+result[i].key_a+','+result[i].key_b+','+
						result[i].key_c+','+result[i].key_d+','+result[i].key_e+`">
						`+result[i].key_a+" "+result[i].key_b+" "+
						result[i].key_c+" "+result[i].key_d+" "+result[i].key_e+`
					</td>
					<td  class="TD_STYLE2" id="correct_key`+i+`" value="`+result[i].correct_key+`">
						`+result[i].correct_key+`
					</td>
					<td class="TD_STYLE2" id="derivation`+i+`" value="`+result[i].derivation+`">
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
					<td class="TD_STYLE2">
						<button id="updateLink`+i+`" onclick="updateData(`+i+`)">编辑</button>
						<button id="updateDatabase`+i+`" onclick="updateDatabase(`+i+`)"  style="color:white;background:green;display:none">修改</button>
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