<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

	 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="/hr_ssm/table.css" rel="stylesheet"/>
<title>Better伯乐HR系统用户注册</title>
<style type="text/css">
<!--
.style1 {
	font-size: 18px;
	font-weight: bold;
	color: #660000;
}
-->
</style>
<script type="text/javascript" src="javascript/jquery-1.7.2.js"></script>
<script type="text/javascript">
function prochk()
{
	if (document.forms[0].elements["u_name"].value == "")
	{	
		alert ("请填写用户名");
		document.forms[0].elements["u_name"].focus();
	}
	else{
			
			var name = document.forms[0].elements["u_name"].value;
			//window.open("users.do?operate=isExist&profix=" + document.register.profix.value+"&uname=" + document.forms[0].elements["item.UName"].value);
			window.location.href="checkUname?uName=name";
	}
}
function namechk()
{
	var name = document.forms[0].elements["u_name"];
	var tname = document.forms[0].elements["u_true_name"];
	if(name.value == "")
	{
		alert ("请填写用户名");
		name.focus();
		return false;
	}
	else if(tname.value == "")
	{
		alert ("请填写真实姓名");
		tname.focus();
		return false;
	}
	else
		return true;
}
function pwdchk()
{
	var pwd = document.forms[0].elements["u_password"];
	var spwd = document.register.surPwd;
	if (pwd.value == "")
	{	
		alert("请填写密码");
		pwd.focus();
		return false;
	}
	else if(spwd.value == "")
	{
		alert("请填写确认密码");
		spwd.focus();
		return false;
	}
	else if(pwd.value != spwd.value)
	{
		alert ("密码和确认密码不相同");
		pwd.value = "";
		spwd.value = "";	
		return false;
	}
	else
		return true;
}
function doAdd()
{
	if(namechk()&&pwdchk())
	{
		document.forms[0].submit();
	}
}
function mycheck(){
var a = $("#exit").val().toString();
	if(a=="failed"){
		alert("用户名已存在");
	}
}

	function validUname()
	{	
		var u_name = $("#uname").val();
		$.ajax({
			url:"user/validUname.do",
			type : "get",
			data : {'u_name':u_name},
			success : function(data)
			{
				console.log(data);
				if(data)
				{
					document.getElementById("uname").focus();
					$("#UserNameTip").text("用户名不可用");
				}else{
					$("#UserNameTip").text("用户名可用");
				}
			}
		});
	}
</script>
</head>

<body bgcolor="#E9F8F3" onload="mycheck()">
<form method="post" action="user/registerUser.do" name="register">
<table width="100%">
  <tr>
    <td height="169" colspan="3" align="center">
      <p >&nbsp;</p>
      <p >&nbsp;</p>
      <p >&nbsp;</p>
      <p class="style1">Better伯乐HR系统用户注册</p></td>
  </tr>
  <tr>
  <td width="18%" height="166">&nbsp;</td>
  <td width="62%">
  <input type="text" style="display:none" id="exit" value="${sessionScope.exit }" readonly="readonly" class="INPUT_STYLE1">
  <table width="95%" border="1" cellpadding=0 cellspacing=1 bordercolorlight=#848284 bordercolordark=#eeeeee class="TABLE_STYLE1">
  <tr>
    <td width="20%" class="TD_STYLE1">使用单位简称</td>
    <td width="80%" class="TD_STYLE2"><input name="profix" type="text" class="INPUT_STYLE1" value="better" readonly="readonly"></td>
  </tr>
  <tr>
    <td width="20%" class="TD_STYLE1">用户名</td>
    <td width="80%" class="TD_STYLE2"><input type="text" id="uname" name="u_name" value="" class="INPUT_STYLE1" onblur="validUname()">&nbsp;
    <span id="UserNameTip"></span>
  </tr>
  <tr>
    <td class="TD_STYLE1">真实姓名</td>
    <td class="TD_STYLE2"><input type="text" name="u_true_name" value="" class="INPUT_STYLE1"></td>
  </tr>
  <tr>
    <td class="TD_STYLE1">密码</td>
    <td class="TD_STYLE2"><input type="password" name="u_password" value="" style="background-color: #DEEBF7" class="INPUT_STYLE1"></td>
  </tr>
  <tr>
    <td class="TD_STYLE1">确认密码</td>
    <td class="TD_STYLE2"><input name="surPwd" type="password" class="INPUT_STYLE1" style="background-color: #DEEBF7"></td>
  </tr>
  </table>
  </td>
  <td width="20%" >&nbsp;</td>
  </tr>
  <tr>
    <td></td>
    <td align="center"><input type="button" value="注册" class="BUTTON_STYLE1" onclick="javascript:doAdd();"> &nbsp;
      <input type="button" value="返回" onclick="history.back();" class="BUTTON_STYLE1"></td>
	  <td></td>
  </tr>
</table>
</form>      
</body>
</html>
