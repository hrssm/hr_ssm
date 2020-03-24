<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>


<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="table.css" type="text/css">
</head>

<body>
<form id="myfrom" action="" method="post">
<table width="100%" >
  <tr>
    <td> 
    <font color="#0000CC">您正在做的业务是：人力资源--客户化设置--薪酬管理设置--薪酬发放方式设置</font></td>
  </tr>
</table>
  <table width="100%" border="0">
  <tr class="TR_STYLE1">
    <td width="18%"> 请选择薪酬发放方式</td>
    <td width="69%">
      	Ⅰ级发放方式：<input type="radio" name="mode" value="Ⅰ级发放方式" />
      	Ⅱ级发放方式：<input type="radio" name="mode" value="Ⅱ级发放方式" />
    </td>
	<td width="13%">
	<input type="submit" value="确定" class="BUTTON_STYLE1" />
	</td>
  </tr>
</table>
</form>
</body>
</html>
<!-- 
<script type="text/javascript">
	function doSubmitForm(){
		var frm = document.getElementById("myform");
		frm.method="post";
		frm.action="salary_standard/mode.do";
		frm.submit();
	}

</script> -->
