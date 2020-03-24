<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="table.css" type="text/css">
<script type="text/javascript" src="javascript/comm/comm.js"></script>
</head>
<body>
<form method="post" action="humanfile.do" enctype="multipart/form-data">
<table width="100%" >
  <tr>
    <td colspan="2"> 
    <font color="#0000CC">您正在做的业务是：人力资源--人力资源档案管理--人力资源档案登记</font></td>
  </tr>
  <tr>
    <td width="59%">提交成功
      <input type="button" value="返回" class="BUTTON_STYLE1" onclick="window.location.href='humanFile/register.do'"></td>
  </tr>
  </table>

</form>
</body>
</html>