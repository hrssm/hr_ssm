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
	var midOptions=`<option value="" disabled selected hidden>请选择</option>`; 
	var mkidOptions = `<option value="" disabled selected hidden>请选择</option>`;
	var mnameArr = "";
	var midArr = "";
	var index = -1;
	$.ajax({
		type:"post",
		url:"engagemajorrelease/getMajorRelease.do",
		success:function(result){
			$.each(result.major_release,function(i,item){
				mkidOptions += "<option value="+item.major_kind_id+
												">"+item.major_kind_id+"</option>";
			});
		$("#positionKindId").empty();
		$("#positionKindId").append(mkidOptions);
		
		$("#positionKindId").change(function(){
			midOptions=`<option value="" disabled selected hidden>请选择</option>`;
		 	 var mkid = $(this).val();
		 	 $.each(result.major_release,function(i,item){
		 	 	if(mkid == item.major_kind_id){
		 	 		$("#positionKindName").html(item.major_kind_name);
			 	 	midArr = item.major_id.split(",");
			 	    mnameArr = item.major_name.split(",");
					for(var i=0;i<midArr.length;i++){
						midOptions += "<option value="+midArr[i]+">"
												+midArr[i]+"</option>";
					}
		 	 	}
			});
				$("#positionId").empty();
				$("#positionId").append(midOptions);
		});
		
		$("#positionId").change(function(){
			var mid = $(this).val();
			for(var i=0;i<midArr.length;i++){
				if(midArr[i] == mid){
					$("#positionName").html(mnameArr[i]);
				}		
			}
		});
		}
	});
	//---------------------查询可出的试题---------------------
	$.ajax({
		type:"post",
		url:"engageSubjectsController/selectSubjectGroup.do",
		success:function(result){
			var data = ``;
			var secondArr = "";
			var countArr = "";
			var index = 0;
			$.each(result.allSubject,function(i,item){
				//alert(item.first_kind_name+"=="+item.second_kind_name+"=="+item.content);
				secondArr = item.second_kind_name.split(",");
				countArr = item.content.split(",");
				var len = secondArr.length+1;
				data += `<tr><td rowspan="`+len+`" class="TD_STYLE1">`+item.first_kind_name+`</td>
					<td class="TD_STYLE2">试题II级分类</td>
					<td class="TD_STYLE2">可用试题数</td>
					<td class="TD_STYLE2">出题数量</td>
				</tr>`;
				 
				for(var i=0;i<secondArr.length;i++){
					data += `
					<form id="form`+index+`">
						<input type="hidden" id="first_question_kind_name`+index+`" value="`+item.first_kind_name+`"/>
						<input type="hidden" id="second_question_kind_name`+index+`" value="`+secondArr[i]+`"/>
					<tr>
						<td class="TD_STYLE2">`+secondArr[i]+`</td>
						<td class="TD_STYLE2">`+countArr[i]+`</td>
						<td class="TD_STYLE2">
							<input type="button" value="+" onclick="jia(`+countArr[i]+`,'question_amount`+index+`')">
							<input id="question_amount`+index+`" type="text" value="0" readonly="readonly" style="background:#D4F8D4;text-align:center" size="1">
							<input type="button" value="-" onclick="jian('question_amount`+index+`')">
						</td>
				</tr></form>`;
				index += 1;
				}
				$("#questionTab").append(data);
				data = ``;
			})
		}
	});
		
});
//定义serializeObject方法，序列化表单
/* $.prototype.serializeObject = function () {
        var a, o, h, i, e;
        var t = [];
        var length = 0;
        a = this.serializeArray();
        o = {};
        h = o.hasOwnProperty;
        for (i = 0; i < a.length; i++) {
            e = a[i];
            if (!h.call(o, e.name)) {
                o[e.name] = e.value;
            } else {
                t.push(o);
                length++;
                i--;
                o = {};
            }
        }
        t.push(o);
        return t;
    }; */
//-------------------------出题----------------------------------
function getTestPaper(){

 	var postdata = {};
 	var arr=new Array();//定义数组
	
		var testPaperArr = new Array();
		var testObj = {};
		testObj.major_kind_name=$("#positionKindName").html().trim();
		testObj.major_name=$("#positionName").html().trim();
		testObj.register=$("#register").html().trim();
		testObj.testPaperCount=$("#amount").val();
		testObj.timeLimit=$("#limit_time").val();
		testPaperArr.push(testObj);
		
		$("#questionTab form").each(function(i,item){
		  var count = $("#question_amount"+i).val();
		  if(parseInt(count) > 0){
			  var obj={};
			  	obj.first_question_kind_name=$("#first_question_kind_name"+i).val();
			  	obj.second_question_kind_name=$("#second_question_kind_name"+i).val();
			  	obj.question_amount = count;
			  	
			  	arr.push(obj);
			 }
		});
		
		postdata["questionInfo"] = JSON.stringify(arr);
		postdata["testPaperInfo"] = JSON.stringify(testPaperArr);
		
		/* alert("进入出题function"); */
		$.ajax({
			type:"POST",
			url:"engageSubjectsController/setQuestion.do",
			data:JSON.stringify(postdata),//必须
			contentType : "application/json;charsetset=UTF-8",//必须
			dataType:"json",//必须
			cache: true,
			async: false,
			success:function(result){
				var testPaper = ``;
				$("#testPaperDetails").empty();
				 for(var key in result){
				 	testPaper += `
				 		<span id="testPaperNumber">套题编号：`+key+`</span>
						<table width="100%" border="1" cellpadding=0 cellspacing=1
							bordercolorlight=#848284 bordercolordark=#eeeeee class="TABLE_STYLE1">
							<tr>
								<td class="TD_STYLE1">I级种类名称</td>
								<td class="TD_STYLE1" >II级种类名称</td>
								<td class="TD_STYLE1">内容</td>
								<td class="TD_STYLE1">选项</td>
								<td class="TD_STYLE1">答案</td>
							</tr>`;
						/* alert(key); */
						var subjects = result[key];
						$.each(subjects,function(i,item){
							/* alert(item.first_kind_name+":"+
							item.second_kind_name+":"+
							item.content+":"+
							item.correct_key ) */
							var options = item.key_a+" "+item.key_b+" "+item.key_c+" "+item.key_d+" "+item.key_e;
							testPaper += `<tr>
											<td class="TD_STYLE2">`+item.first_kind_name+`</td>
											<td class="TD_STYLE2">`+item.second_kind_name+`</td>
											<td class="TD_STYLE2">`+item.content+`</td>
											<td class="TD_STYLE2">`+options+`</td>
											<td class="TD_STYLE2">`+item.correct_key+`</td>
										</tr>`;
						});
						testPaper+=`</table>`;
						$("#testPaperDetails").append(testPaper);
						testPaper = ``;
					} 
			}
	});
}
//-------------------------控制加减数量----------------------------
	function jia(max,id) {
	var question_amount = document.getElementById(id);
		if(question_amount.value < max){
		question_amount.value=parseInt(question_amount.value)+1;
		}
	}
	function jian(id) {
	var question_amount = document.getElementById(id);
	  if(question_amount.value>0){
		question_amount.value=parseInt(question_amount.value)-1;
		}
	}

</script>
</head>

<body>
	<div>
		<table width="100%">
			<tr>
				<td><font color="#0000CC">您正在做的业务是：人力资源--招聘管理--招聘考试管理--考试出题
				</font></td>
			</tr>
			<tr>
				<td align="right"><input type="button" value="         出题            "
					class="BUTTON_STYLE1" onclick="getTestPaper()"></td>
			</tr>
		</table>
				
		<table width="100%" border="1" cellpadding=0 cellspacing=1
				bordercolorlight=#848284 bordercolordark=#eeeeee
				class="TABLE_STYLE1" id="tab">
				<tr>
					<td width="10%" class="TD_STYLE1">
						职位分类编号
					</td>
					<td width="10%" class="TD_STYLE1">
						职位分类名称
					</td>
					<td width="10%" class="TD_STYLE1">
						职位编号
					</td>
					<td width="10%" class="TD_STYLE1">
						职位名称
					</td>
					<td width="10%" class="TD_STYLE1">
						套题数量
					</td>
					<td width="10%" class="TD_STYLE1">
						登记人
					</td>
					<td width="10%" class="TD_STYLE1">
						答题时限(分钟)
					</td>
				</tr>
					
				<tr>
					<td width="10%" class="TD_STYLE1">
					 <select id="positionKindId" name="position_kind_id" id="position_kind_id">
					 	
					</select> 
					</td>
					<td width="10%" class="TD_STYLE1"  id="positionKindName">
						<!-- <input type="hidden" name="position_kind_name" id="position_kind_name"/>	 -->
					</td>
					
					<td width="10%" class="TD_STYLE1">
						 <select id="positionId" name="position_id" class="position_id">
							 <option value="" disabled selected hidden>请选择</option>
						</select> 
					</td>
					<td width="10%" class="TD_STYLE1" id="positionName">
						<!-- <input type="hidden" id="position_name" name="position_name" /> -->
					</td>
					<td width="10%" class="TD_STYLE1">
						<input type="button" value="+" onclick="jia('8','amount')">
						<input id="amount" type="text" value="0" readonly="readonly" style="background:#D4F8D4;text-align:center" size="1">
						<input type="button" value="-" onclick="jian('amount')">
						<!-- <input type="text" name="amount" id="amount"> -->
					</td>
					<td width="10%" class="TD_STYLE1" id="register">
					</td>
					<td width="10%" class="TD_STYLE1">
						<input type="text" name="limit_time" id="limit_time" size="6">
					</td>
				</tr>
			</table>
			<br/>
			<table width="100%" border="1" cellpadding=0 cellspacing=1
				bordercolorlight=#848284 bordercolordark=#eeeeee
				style="border-collapse:separate;border-spacing:2px"
				class="TABLE_STYLE1" id="questionTab">
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
	
	<div id="testPaperDetails">
		<!-- <h2 id="testPaperNumber"></h2>
		<table width="100%" border="1" cellpadding=0 cellspacing=1
			bordercolorlight=#848284 bordercolordark=#eeeeee class="TABLE_STYLE1">
			<tr>
				<td class="TD_STYLE1">	
					I级种类名称
				</td>
			
				<td class="TD_STYLE1" >
					II级种类名称
				</td>
			
				<td class="TD_STYLE1">
					内容
				</td>
			
				<td class="TD_STYLE1">
					选项
				</td>
		
				<td class="TD_STYLE1">
					答案
				</td>
			
				<td class="TD_STYLE2">
					来源
				</td>
			</tr>
			
			<tr>
				<td class="TD_STYLE2"></td>
				<td class="TD_STYLE2"></td>
				<td class="TD_STYLE2"></td>
				<td class="TD_STYLE2"></td>
				<td class="TD_STYLE2"></td>
				<td class="TD_STYLE2"></td>
			</tr>
		</table> -->
	</div>
</body>

</html>