<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="java.sql.Date"%>
<%@page import="net.sf.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Struts短租-出租订单</title>

 

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
#midtext{ position:absolute; top:175px; left:370px; width:800px; height:auto;border:1px solid #ccc;}

</style>
</head>

<body>

		

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
		<p style="text-align:center; color:#FFFFFF; line-height:40px">评论管理中心</p>
		</div>
		<div class="lefttitle1">
		<p style="text-align:center; color:#FFFFFF; line-height:40px;">房客中心</p>
		</div>
		<div class="lefttext1">
		<p style="text-align:center; line-height:45px;"><a href="Orders.jsp" style="text-decoration:none; font-size:14px; color:#00CCFF ">入住订单<a></p>
		</div>
		<div class="lefttitle2">
		<p style="text-align:center; color:#FFFFFF; line-height:40px;">我的资料</p>
		</div>
		<div class="lefttext2">
		<p style="text-align:center; line-height:45px;"><a href="personalData.jsp" style="text-decoration:none; font-size:14px;color:#00CCFF">个人资料<a></p>
		</div>
		<div class="lefttitle3">
		<p style="text-align:center; color:#FFFFFF; line-height:40px;">我是房东</p>
		</div>
		<div class="lefttext3">
		<p style="text-align:center; line-height:45px;"><a href="MyHouse.jsp" style="text-decoration:none; font-size:14px;color:#00CCFF">我的房屋<a></p>
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
		<span style=" font-size:16px; line-height:43px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;我的短租<b> > </b>出租订单管理</span>
	</div>
	<div id="midtext">
	<span style="font-size:18px; color:#ccc">出租订单管理</span>
		<%
		String houseinformation = (String)request.getSession().getAttribute("landlordOrdersInformation");
		JSONObject json = new JSONObject (houseinformation);
		JSONArray jsonArray = json.getJSONArray("data");
		for (int i = 0; i < jsonArray.length(); i ++) {
			JSONObject obj = jsonArray.getJSONObject(i);
			String sdate = (String)obj.get("checkindate");
			String bdate = (String)obj.get("checkoutdate");
	        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");  
	        Calendar cal = Calendar.getInstance();    
	        cal.setTime(sdf.parse(sdate));    
	        long time1 = cal.getTimeInMillis();                 
	        cal.setTime(sdf.parse(bdate));    
	        long time2 = cal.getTimeInMillis();         
	        long between_days=(time2-time1)/(1000*3600*24);
			
			%>
			<div style="width:100%; height:120px; border-top:1px solid #ccc; border-bottom:1px solid #ccc;  position:relative;">
				<img src="images/order2.jpg" style="height:90%; width:20%; position:absolute;left:0px;top:5%;border:1px solid #ccc ">
				<div style="width:79%; height:90%; position:absolute; top:5%; left:21%; ">
					<span style="color:#66cccc; font-family:微软雅黑"> <%=obj.getString("house_name") %> </span>
					<span style="color:#ff0000; font-family:微软雅黑">&nbsp;&nbsp;&nbsp;( <%=obj.getString("order_state") %> )</span>
				
				<br/><br/>
			<div style="width:80%; height:70%; position:absolute; bottom:5%;">
				<span style="font-size:15px">地址：<%=obj.getString("house_address") %></span><br/>
				<span style="font-size:15px">预定时间：<%=obj.get("checkindate") %> 至  <%=obj.get("checkoutdate") %></span>
				
				<div style=" width:20%; height:100%;position:absolute; bottom:0px;right:0px;">
				<span style="font-size:16px; position:absolute; bottom:0px;left:0px;">¥ <%=(Integer.parseInt(String.valueOf(between_days)))*obj.getDouble("house_price") %></span>
				</div>
				
			</div>
		
				
			</div>
		
			
			<form style="position:absolute; right:0;width:15%; height:100%; top:0;" action = "/StrustRenting/manageOrdersAction.action?id=<%=obj.getLong("order_id")%>" method = "post">
						<br/>
					<input type="submit" value="确认订单" name = "manage" style="background-color:#FFF;color:#6699FF;border:0; position:absolute; left:10px">
					<br/><br/>
					<input type="submit" value="拒绝订单" name = "manage" style="background-color:#FFF;color:#6699FF;border:0; position:absolute; left:10px">
					<br/>
				</form>
			</div>
			
			
			
			
			<br/>
			
			
			
	<%	}
	//	System.out.println ("hireOrders" + json);
		%>
		
		
	</div>
	



</body>
</html>
