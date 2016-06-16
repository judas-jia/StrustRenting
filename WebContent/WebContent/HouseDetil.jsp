<%@page import="net.sf.json.JSONArray"%>
<%@page import="java.sql.Date"%>
<%@page import="net.sf.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>纯CSS带预览功能</title>

<style type="text/css">

#gallery {
	width:80%;
	height:500px;
	margin:0 auto;
	position:relative;
	font-family:verdana, arial, sans-serif;
	background:#fff;
	
	border-bottom:1px solid #ddd;
}
#gallery #fullsize {
	position:absolute;
	left:10%;
	top:0;
	height:500px;
	width:80%;
	overflow:hidden;
	text-align:center;
}
#gallery #fullsize div {width:850px; height:700px; padding-top:20px; position:relative;}
#gallery #fullsize div img {clear:both; display:block; margin:0 auto; border:10px solid #fff; width:580px; height:360px; position:relative; z-index:500;}
#gallery #fullsize div h3 {padding:10px 0 0 0; margin:0; font-size:18px;}
#gallery #fullsize div p {padding:5px 0; margin:0; font-size:12px; line-height:18px;}

#gallery #fullsize a.previous {display:block; height:120px; width:180px; position:absolute; left:10px; top:200px; z-index:10; border:10px solid #fff;}
#gallery #fullsize a.next {display:block; height:120px; width:180px; position:absolute; right:10px; top:200px; z-index:10; border:10px solid #fff;}

#gallery #fullsize a.previous img,
#gallery #fullsize a.next img {width:180px; height:120px; border:0; display:block; filter: alpha(opacity=40); opacity:0.4;}

#gallery #fullsize a:hover {direction:ltr; z-index:600;}
#gallery #fullsize a:hover img {filter: alpha(opacity=80); opacity:0.8;}



</style>
</head>
<body style="height:auto;">
<%
	String usersHouseInformation = (String)request.getSession().getAttribute("usersHouseInformation");
	String house_id = (String) request.getSession().getAttribute("house_id");
	JSONObject jsonObject = new JSONObject (usersHouseInformation);
	JSONArray jsonArray = jsonObject.getJSONArray("data");
	JSONObject object = new JSONObject ();
	String picture1, picture2, picture3;
	for (int i = 0; i < jsonArray.length(); i ++) {
		JSONObject obj = new JSONObject ();
		obj = jsonArray.getJSONObject(i); 
		if ((obj.getLong("id") + "").equals(house_id + "")) {
			object = obj;
		}

	} 
	%>

	<div style="width:100px; height:30px; position:absolute; top:10px; right:40px">
		<a href="MyHouse.jsp" style="text-decoration:none; color:#FF00F"> 返回房屋管理</a>
	</div>
<div id="gallery">
	<div id="fullsize">
		<div id="pic1">
			<img src=<%=object.getString("picture1") %> alt="Winter branches" />
			<a class="previous" href="#pic3"><img src=<%=object.getString("picture3") %> alt="Trees in the mist" /></a><a class="next" href="#pic2"><img src=<%=object.getString("picture2") %> alt="Wading birds" /></a>
			<h3>First</h3>
			<p> Struts短租，您的贴心助手.</p>
		</div>
		<div id="pic2">
			<img src=<%=object.getString("picture2") %> alt="Wading birds" />
			<a class="previous" href="#pic1"><img src=<%=object.getString("picture1") %> alt="Winter branches" /></a><a class="next" href="#pic3"><img src=<%=object.getString("picture3") %> alt="Bird on a post" /></a>
			<h3>Second</h3>
			<p>Struts短租，您的贴心助手.</p>
		</div>
		<div id="pic3">
			<img src=<%=object.getString("picture3") %> alt="Bird on a post" />
			<a class="previous" href="#pic2"><img src=<%=object.getString("picture2") %>  alt="Wading birds" /></a><a class="next" href="#pic1"><img src=<%=object.getString("picture1") %> alt="Early bloomers" /></a>
			<h3>Last</h3>
			<p>Struts短租，您的贴心助手.</p>
		</div>
	</div>
</div>


<div style=" width:35%; left:35%; height:auto; position:absolute; top:560px;">
	<h2 style="text-align:left; color:#66CCCC">房屋基本资料：</h2>
	<span style="text-align:left;display:block">城市：<%=object.getString("city") %></span><br/>
	<span style="text-align:left;display:block">房屋名称：<%=object.getString("house_name") %></span><br/>
	<span style="text-align:left;display:block">房屋出租类型：<%=object.getString("house_type") %></span><br/>
	<span style="text-align:left;display:block">房屋面积：<%=object.getString("area") %>㎡</span><br/>
	<span style="text-align:left;display:block">房屋地址：<%=object.getString("house_address") %></span><br/>
	<span style="text-align:left;display:block">发布人身份：<%=object.getString("people") %></span><br/>
	<span style="text-align:left;display:block">租金：<%=object.getString("house_price") %>元/天</span><br/>
	<span style="text-align:left;display:block">联系人：<%=object.getString("contact") %></span><br/>
	<span style="text-align:left;display:block">联系方式：<%=object.getString("mobile") %></span><br/>
	<span style="text-align:left;display:block">审批状态：<%=object.getString("state") %></span><br/>
	<span style="text-align:left;display:block">是否已出租：<%=object.getString("rentstate") %></span><br/>
	<span style="text-align:left;display:block">详细描述：<%=object.getString("house_describle") %></span><br/>

</div>


</body>
</html>
