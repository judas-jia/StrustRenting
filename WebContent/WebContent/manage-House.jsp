<%@page import="com.strustrenting.table.House"%>
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
<div style=" position:absolute; left:0px; top:0px;width:100%; height:80px; border:1px solid #ccc; padding:0px; background-color:#006699"> 
<div style="position:absolute; left:10%; top:15px">
	<span style="color:#fff; font-size:40px; ">Struts</span>
	<span style=" color:#FFFFFF; font-size:25px;" >短租管理</span>
	<span style=" color:#FFFFFF; font-size:15px;" >--您的旅游小助手</span>
</div>
 <div style="position:absolute; right:15px; width:300px; height:25px; bottom:5px;">
 <span style=" font-size:17px;"><b>房屋管理</b></span>&nbsp;&nbsp;
  <a href="manage-User.jsp" target="_self" >用户管理 </a>&nbsp;&nbsp;
   <a  href="index.jsp" target="_self">退出 </a>
 
 </div>


</div>
<div style=" width:90%; border:1px solid #ccc; height:auto; position:absolute; top:200px; left:5%">
	<table width="100%"; cellspacing="0"; border="1">
	<tr>
	<th width="7%">房屋编号</th>
	<th width="7%">房屋类型</th>
	<th width="8%">出租人身份</th>
	<th width="7%">城市</th>
	<th width="10%">小区</th>
	<th width="10%">房屋名称</th>
	<th width="5%">租金</th>
	<th width="7%">联系人</th>
	<th width="10%">电话</th>
	<th width="23%">操作</th>
	</tr>
<%
	String houseinformation = (String)request.getSession().getAttribute("allHouseinformation");
	JSONObject json = new JSONObject (houseinformation);
	JSONArray jsonArray = json.getJSONArray("data");
	JSONObject obj;
	for (int i = 0; i < jsonArray.length(); i ++) {
		House house = new House ();
		 obj = jsonArray.getJSONObject(i);
		System.out.println (obj);
		%>
		 <tr>
		<td align="center"><%=obj.getLong("id") %></td>
		<td align="center"><%=obj.getString("house_type") %></td>
		<td align="center"><%= obj.getString("people") %></td>
		<td align="center"><%= obj.getString("city") %></td>
		<td align="center"><%= obj.getString("house_address") %></td>
		<td align="center"><%= obj.getString("house_name") %></td>
		<td align="center"><%= obj.getString("house_price") %>元/月</td>
		
		<td align="center"><%= obj.getString("contact") %></td>
		<td align="center"><%= obj.getString("mobile") %></td>
		<td align="center">
			<form action = "/StrustRenting/manageHouseAction.action?id=<%=obj.getLong("id") %>"  method = "post" >
				<input type="submit" value="查看详情" name="manage">
				<input type="submit" value="拒绝" name = "manage">
				<input type="submit" value="发布" name = "manage">
			</form>
	
		</td>
	
	</tr> 
<% 	}

%>

</table>
</div>

</body>
</html>
