<%@page import="java.util.Iterator"%>
<%@page import="com.strustrenting.table.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>Struts短租-管理员界面</title>
<style type="text/css">
a{ text-decoration:none; font-size:24px; color:#990000}
a:hover{ color:#6699FF}
</style>
<script type="text/javascript">

	
	
</script>>
</head>

<body>
<div style=" position:absolute; left:0px; top:0px;width:100%; height:80px; border:1px solid #ccc; padding:0px; background-color:#006699"> 
<div style="position:absolute; left:10%; top:15px">
	<span style="color:#fff; font-size:40px; ">Struts</span>
	<span style=" color:#FFFFFF; font-size:25px;" >短租管理</span>
	<span style=" color:#FFFFFF; font-size:15px;" >--您的旅游小助手</span>
</div>
</div>
<div style="width:270px; height:100px; position:absolute; top:300px; left:330px;">
<img src="images/user.jpg" style="height:100%; width:40%; position:absolute;left:0px;">
<a href="manage-User.jsp"  style=" font-size:24px; position:absolute; right:50px; bottom:20px;">用户管理 </a>
</div>
<div style="width:270px; height:100px; position:absolute; top:300px; left:800px">
<img src="images/house.jpg" style="height:100%; width:40%; position:absolute;left:0px;">
<a href="manage-House.jsp" style=" font-size:24px; position:absolute; right:50px; bottom:20px;">房屋管理 </a>

</div>

</body>
</html>
