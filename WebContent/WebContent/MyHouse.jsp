<%@page import="java.util.Iterator"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="com.strustrenting.table.House"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Struts短租-房屋管理</title>
<link href="css/style.css" rel="stylesheet"type="text/css"/>
<style type="text/css">
.a1load{ text-decoration:none; color:#FF3300; font-family:微软雅黑; font-size:16px; }
.a1load:hover{color:#CC0066;}
.datahead{ width:100%; height:50px; background-image:url(images/datahead.jpg); margin:auto}
#leftline{ width:200px; height:500px; border:0; position:absolute; top:125px; left:150px}
.lefthead{ position:absolute; top:0px; border:0; width:100%;height:45px; background-color:#FF9900}
.lefttitle1{ position:absolute; top:50px; border:1px solid #ffffff;width:100%;height:45px; background-color:#CCCCCC}
.lefttext1{ position:absolute; top:95px; border:1px solid #cccccc;  width:99%;height:50px; background-color:#FFFFFF; left:1px}
.lefttitle2{ position:absolute; top:147px; border:1px solid #ffffff; width:100%;height:45px; background-color:#CCCCCC}
.lefttext2{ position:absolute; top:192px; border:1px solid #cccccc; width:99%;height:50px; background-color:#FFFFFF;left:1px}
.lefttitle3{ position:absolute; top:244px; border:1px solid #ffffff; width:100%;height:45px; background-color:#CCCCCC}
.lefttext3{ position:absolute; top:289px; border:1px solid #cccccc; width:99%;height:50px; background-color:#FFFFFF;left:1px}
.lefttitle4{ position:absolute; top:341px; border:1px solid #ffffff; width:100%;height:45px; background-color:#CCCCCC}
.lefttext4{ position:absolute; top:386px; border:1px solid #cccccc; width:99%;height:45px; background-color:#FFFFFF;left:1px;border-bottom:1px solid #ffffff}
.lefttext5{ position:absolute; top:431px; border:1px solid #cccccc; width:99%;height:45px; background-color:#FFFFFF;left:1px;border-bottom:1px solid #ffffff;border-top:1px solid #ffffff}
.lefttext6{ position:absolute; top:476px; border:1px solid #cccccc; width:99%;height:45px; background-color:#FFFFFF;left:1px;border-top:1px solid #ffffff}
#midhead{ position:absolute; top:125px; left:370px; width:800px; height:43px;  background-color:#FFCC66;}
#midtext{ position:absolute; top:175px; left:370px; width:800px; height:auto; border:1px solid #ccc}

</style>
</head>

<body>





<%
	String usersHouseInformation = (String)request.getSession().getAttribute("usersHouseInformation");
	JSONObject jsonObject = new JSONObject (usersHouseInformation);
	JSONArray jsonArray = jsonObject.getJSONArray("data");
	ArrayList<House> list = new ArrayList<House> ();
	for (int i = 0; i < jsonArray.length(); i ++) {
		JSONObject obj = new JSONObject ();
		obj = jsonArray.getJSONObject(i); 
		House house = new House ();
		house.setHouse_describle(obj.getString("house_describle") );
		house.setHouse_name(obj.getString("house_name"));
		house.setState(obj.getString("state"));
		house.setHouse_price(obj.getDouble("house_price"));
		house.setId(obj.getLong("id"));
		list.add(house);
	}  %>


<header>
 <div>
	<img class="logo" src="images/logo.jpg" title="Struts短租网致力于为您提供更加便捷优质的租房服务" style="position:absolute;top:10px; left:30px"> 
	
	<div style=" position:absolute; top:20px; left:1130px"><a  class="a1load" href="loadedindex.jsp" style="text-decoration:none;">返回首页</a>
	
</div>
	
</div>
</header>
		<img class="logo" src="images/datahead.jpg" title="Struts短租网致力于为您提供更加便捷优质的租房服务" style="position:absolute;top:55px; left:0px; margin:0; width:100%; height:65px;"> 
	<div id="leftline">
		<div class="lefthead">
		<p style="text-align:center; color:#FFFFFF; line-height:40px">房屋管理中心</p>
		</div>
		<div class="lefttitle1">
		<p style="text-align:center; color:#FFFFFF; line-height:40px;">房客中心</p>
		</div>
		<div class="lefttext1">
		<p style="text-align:center; line-height:45px;"><a href="Orders.jsp" style="text-decoration:none; font-size:14px; color:#00CCFF ">入住订单<a></p>
		</div>
		<div class="lefttitle2">
		<p style="text-align:center; color:#FFFFFF; line-height:40px;">房东中心</p>
		</div>
		<div class="lefttext2">
		<p style="text-align:center; line-height:45px;"><a href="HireOrders.jsp" style="text-decoration:none; font-size:14px;color:#00CCFF">出租订单<a></p>
		</div>
		<div class="lefttitle3">
		<p style="text-align:center; color:#FFFFFF; line-height:40px;">我的资料</p>
		</div>
		<div class="lefttext3">
		<p style="text-align:center; line-height:45px;"><a href="personalData.jsp" style="text-decoration:none; font-size:14px;color:#00CCFF">个人资料<a></p>
		</div>
		<div class="lefttitle4">
		<p style="text-align:center; color:#FFFFFF; line-height:40px;">我的设置</p>
		</div>
		<div class="lefttext4">
		<p style="text-align:center; color:#000000; line-height:45px;">我的账户</p>
		</div>
		<div class="lefttext5">
		<p style="text-align:center; line-height:45px;"><a href="PassChange.jsp" style="text-decoration:none; font-size:14px;color:#00CCFF">密码设置<a></p>
		</div>
		<div class="lefttext6">
		<p style="text-align:center; line-height:45px;"><a href="#" style="text-decoration:none; font-size:14px;color:#00CCFF">我的钱包<a></p>
		</div>
	</div>
	<div id="midhead">
		<span style=" font-size:16px; line-height:43px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;我的短租<b> > </b>我的房屋</span>
		<a href="PostMessage.jsp" style="position:absolute; right:10px; bottom:10px;text-decoration:none; border:2px solid #fff;">免费发布信息</a>
	</div>
	<div id="midtext">
	<span style="font-size:18px; color:#ccc">房屋管理</span>

	<%
	 Iterator<House> it=list.iterator();
	while(it.hasNext())
	{
		House h=(House) it.next(); %>
		<div style="width:100%; height:120px; border-bottom:1px solid #ccc;  border-top:1px solid #ccc; position:relative;">
			<img src="images/housepic.jpg" style="height:90%; width:20%; position:absolute;left:0px;top:5%;border:1px solid #ccc ">
			<div style="width:79%; height:90%; position:absolute; top:5%; left:21%; ">
			<span style="color:#66cccc; font-family:微软雅黑"> <%= h.getHouse_name() %> </span>
			<span style="color:#ff0000; font-family:微软雅黑">&nbsp;&nbsp;&nbsp;( <%=h.getState() %> )</span>
			<br/><br/>
			<div style="width:80%; height:70%; position:absolute; bottom:5%;">
				<span style="font-size:15px"><%=h.getHouse_describle() %></span>
				
				<div style=" width:20%; height:100%;position:absolute; bottom:0px;right:0px;">
				<span style="font-size:16px; position:absolute; bottom:0px;left:0px;">¥ <%=h.getHouse_price() %></span>
				</div>
				
			</div>
			<form style="position:absolute; right:0;width:15%; height:100%; top:0" action = "/StrustRenting/myHouse.action?house_id=<%=h.getId() %>" method = "post">
				
					<input type="submit" value="删除" name = "manage" style="background-color:#FFF;color:#6699FF;border:0; position:absolute; left:10px">
					<br/><br/>
					<input type="submit" value="修改" name = "manage" style="background-color:#FFF;color:#6699FF;border:0; position:absolute; left:10px">
					<br/><br/>
					<input type="submit" value="查看详情" name = "manage" style="  background-color:#FFF;color:#6699FF;border:0;">
				</form>
			
			</div>
	
		
		</div>
		<br/>
			
<% 	} %>
	
	</div>
	

<script type="text/javascript"> 

function savesucces(){
	var save=document.getElementById("save");
	save.style.display="block";

}
</script> 
</body>
</html>
