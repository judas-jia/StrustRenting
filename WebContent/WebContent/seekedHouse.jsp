<%@page import="com.strustrenting.table.House"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.strustrenting.table.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Struts短租-房屋查询结果</title>
<link href="css/style.css" rel="stylesheet"type="text/css"/>
</head>
<body >


<header>
 <div>
	<img class="logo" src="images/logo.jpg" title="Struts短租网致力于为您提供更加便捷优质的租房服务" style="position:absolute;top:10px; left:50px"> 
	<div style=" position:absolute; top:20px; right:0"><a  class="a1load" href="loadedindex.jsp" style="text-decoration:none;">返回</a>
	
</div>
	
</div>
</header>
	<img class="logo" src="images/datahead.jpg" title="Struts短租网致力于为您提供更加便捷优质的租房服务" style="position:absolute;top:55px; left:0px; margin:0; width:100%; height:65px;"> 
	<div style="position:absolute;top:130px; width:100%;height:20px">
		<h2 style="text-align:center;color:#66CCCC;">搜索结果</h2>
	</div>
	<div style="position:absolute; top:180px; width:90%; height:auto; left:5%;border-top:1px solid #ccc">
	
		
		<%
		String houseinformation = (String)request.getSession().getAttribute("seekHouseInformation");
		JSONObject json = new JSONObject (houseinformation);
		JSONArray jsonArray = json.getJSONArray("data");
		for (int i = 0; i < jsonArray.length(); i ++) {
		JSONObject obj = jsonArray.getJSONObject(i);
		%>
		<div style="position:relative; width:47.5%; margin:20px 11px; padding:0; height:400px;float:left; border:1px solid #ccc">
		<div style="position:absolute; width:100%; height:80%; top:0px; ">
	<!--	<img src=<%=obj.getString("picture2") %> style="width:100%; height:100%"/>   -->
		<form action = "/StrustRenting/seekHouseDetailsAction.action?house_id=<%=obj.getLong("id") %>" method = "post">
			<input type="image" src=<%=obj.getString("picture2") %> alt="submit" style="position:absolute;width:100%; height:100%"/>
		</form>
		<!-- <img src="images/1.jpg" style="width:100%; height:100%; z-index:0;"/>-->
		<div style="width:90px; height:45px;background-color:RGBA(0,0,0,.5);position:absolute;bottom:10px;left:0; z-index:1;">
		<h2 style=" color:#fff">¥<%=obj.getString("house_price") %></h2>
		</div>
		</div>
		<div style="position:absolute; width:80%; height:10%; left:10%; bottom:10%; border-bottom:1px solid #ccc" >
		<span style="position:absolute;bottom:0" ><%=obj.getString("house_name") %></span>
		</div>
		<div style="position:absolute; width:100%; height:10%; bottom:0;" >
		<span style="position:absolute;bottom:0;left:10%"><%=obj.getString("house_address") %></span>
		</div>
		</div>
<%}
%>

	
	</div>


</body>
</html>