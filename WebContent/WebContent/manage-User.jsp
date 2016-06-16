<%@page import="java.util.Iterator"%>
<%@page import="com.strustrenting.table.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Struts短租-管理员界面</title>
<style type="text/css">
a{color:#FFFFFF; border:2px solid #FFFFFF; text-decoration:none}
</style>
<script type="text/javascript">

	
	
</script>>
</head>

<body>
<%
	String userinformation = (String)request.getSession().getAttribute("allUserInformation");
	JSONObject json = new JSONObject (userinformation);
	JSONArray jsonArray = json.getJSONArray("data");
	ArrayList<User> list = new ArrayList<User> ();
	for (int i = 0; i < jsonArray.length(); i ++) {
		User user = new User ();
		JSONObject obj = jsonArray.getJSONObject(i);
		System.out.println (obj);
		user.setUsername(obj.getString("username"));
		user.setSex(obj.getString("sex"));
		user.setMoney(obj.getDouble("money"));
		user.setRealname(obj.getString("realname"));
		list.add(user);
	}
	
%>

<div style=" position:absolute; left:0px; top:0px;width:100%; height:80px; border:1px solid #ccc; padding:0px; background-color:#006699"> 
<div style="position:absolute; left:10%; top:15px">
	<span style="color:#fff; font-size:40px; ">Struts</span>
	<span style=" color:#FFFFFF; font-size:25px;" >短租管理</span>
	<span style=" color:#FFFFFF; font-size:15px;" >--您的旅游小助手</span>
</div>
 <div style="position:absolute; right:15px; width:300px; height:25px; bottom:5px;">
 <span style=" font-size:17px;"><b>用户管理</b></span>&nbsp;&nbsp;
  <a href="manage-House.jsp" target="_self" >房屋管理 </a>&nbsp;&nbsp;
  <a  href="index.jsp" target="_self">退出 </a>
  </div>

<!-- <%=list %>   -->

<div style=" width:70%; border:1px solid #ccc; height:auto; position:absolute; top:200px; left:15%">
	<table width="100%"; cellspacing="0"; border="1">
	<tr>
	<th width="20%">用户名</th>
	<th width="20%">真实姓名</th>
	<th width="10%">性别</th>
	<th width="10%">钱包余额</th>
	<th width="40%">操作</th>
	</tr>
<% 
	Iterator<User> it = list.iterator();
	int i=0;
	while(it.hasNext())
	{
		User u=(User) it.next();
		%>
		<tr>

		<td align="center"><%= u.getUsername() %></td>
		<td align="center"><%= u.getRealname() %></td>
		<td align="center"><%= u.getSex() %></td>
		<td align="center"><%= u.getMoney() %></td>
		<td align="center">
			<form action = "/StrustRenting/deleteUserAction.action"  method = "post" >
			删除：<input type= "text" value = "<%=u.getUsername() %>" name = "username" disable = "disable">
				<input type="submit" value="确认删除">
			</form>
		</td>
	
	</tr>
	
	<% }
%>
	
	</table>
</div>
</body>
</html>
