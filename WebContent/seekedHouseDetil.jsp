<%@page import="java.util.Iterator"%>
<%@page import="com.strustrenting.table.Message"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.strustrenting.dao.Dao"%>
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
<script type="text/javascript" src="js/date.js"></script>

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
<body style="height:auto; background-color:#FFFFff">
<%
	Dao dao = new Dao ();
	ArrayList<Message> list = new ArrayList<Message> ();
	try {
		list = dao.getList(new Message ());
		System.out.println ("aaa" + list);
	} catch (Exception e) {
		e.printStackTrace();
	}
	String houseinformation = (String)request.getSession().getAttribute("seekHouseInformation");
	String seeked_house_id = (String)request.getSession().getAttribute("seeked_house_id");
	String username = (String) request.getSession().getAttribute("username");
	Object login_user_id =  request.getSession().getAttribute("user_id");
	JSONObject json = new JSONObject (houseinformation);
	JSONArray jsonArray = json.getJSONArray("data");
	JSONObject object = new JSONObject ();
	for (int i = 0; i < jsonArray.length(); i ++) {
		
		JSONObject obj = jsonArray.getJSONObject(i);
		if ((obj.getLong("id") + "").equals(seeked_house_id)) {
			object = obj;
		}
		
		
	}
	%>

	<div style="width:100px; height:30px; position:absolute; top:10px; right:40px">
		<a href="seekedHouse.jsp" style="text-decoration:none; color:#FF00F"> 返回</a>
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
<div style="width:280px; height:300px;  position:absolute;right:280px; top:650px;background:#f8f8f8; z-index:3">
	<h1 style="position:absolute; left:5px;top:20px; color:#FF9933">¥<%=object.getString("house_price") %></h1>
	<form action="/StrustRenting/placeOrderAction.action?unitprice=<%=object.getString("house_price")%>&house_id=<%=object.getLong("id")%>&user_id=<%=login_user_id %>&landlord_id=<%=object.getLong("user_id") %>" method = "post">
	<input id="endtime" type="text" placeholder="入住日期" onfocus="setday(this)" readonly="readonly" style="position:absolute; top:100px;left:50px; height:25px;" name = "checkindate"/>
	<input id="endtime" type="text" placeholder="退房日期" onfocus="setday(this)" readonly="readonly" style="position:absolute; top:150px;left:50px; height:25px;" name = "checkoutdate"/>
	<input type="submit" value="立即预定" style="width:100px; height:33px; color:#FFFFFF;background-color:#FF6633; border:0; margin:20px 0 0 80px;position:absolute; top:200px;left:0"/>
</form>
</div>


<div style=" width:35%; left:21%; height:auto; position:absolute; top:560px;">
	<h2 style="text-align:left; color:#66CCCC">房屋基本资料：</h2>
	<span style="text-align:left;display:block">城市：<%=object.getString("city") %></span><br/>
	<span style="text-align:left;display:block">房屋名称：<%=object.getString("house_name") %></span><br/>
	<span style="text-align:left;display:block">房屋出租类型：<%=object.getString("house_type") %></span><br/>
	<span style="text-align:left;display:block">房屋面积：<%=object.getString("area") %>㎡</span><br/>

	<span style="text-align:left;display:block">发布人身份：<%=object.getString("people") %></span><br/>
	<span style="text-align:left;display:block">租金：¥<%=object.getString("house_price") %>/天</span><br/>
	<span style="text-align:left;display:block">联系人：<%=object.getString("contact") %></span><br/>
	<span style="text-align:left;display:block">联系方式：<%=object.getString("mobile") %></span><br/>
	<span style="text-align:left;display:block">审批状态：<%=object.getString("state") %></span><br/>
	<span style="text-align:left;display:block">是否已出租：<%=object.getString("rentstate") %></span><br/>
	<span style="text-align:left;display:block">房屋地址：<%=object.getString("house_address") %></span><br/>
	<span style="text-align:left;display:block">详细描述：<%=object.getString("house_describle") %></span><br/>

</div>
<div style="width:60% ;left:20%; height:auto; position:absolute; top:1250px;border:1px solid #ccc  ">
	<div style="width:100%; position:absolute; left:0; top:0; height:43px; background-color:#FFcc66; "> 
		<span style="text-align:center;display:block;line-height:43px; color:#fff"><b>房屋详情 > 房客点评</b></span>
	</div>
		<span style="font-size:18px; color:#ccc;position:absolute;top:50px;left:5px">我要点评</span>
		<form style="width:100%; position:absolute; height:150px;top:80px " action = "/StrustRenting/messageAction.action?house_id=<%=object.getLong("id")%>&user_name=<%=username %>" method = "post">
			<div style=" margin-bottom:10px; position:absolute; left:5px"><textarea cols="95" rows="3" placeholder="您对房屋的看法" name = "message"> </textarea>
			</div>
			<div style="bottom:0px; position:absolute; right:8px; top:95px; "><input type="submit" value="现在点评" style=" width:90px; height:35px; background-color:#FF6633;color:#FFFFFF;border:0;"/></div>
		</form>
		
	<div style="width:100%; position:absolute; top:230px; left:0; height:auto; border:1px solid #ccc;">
		<span style="font-size:18px; color:#ccc">房客点评管理</span>
	<%	Iterator<Message> it=list.iterator();
		int i=0;
		while(it.hasNext())
		{
			Message m = (Message)it.next();
			if (m.getHouse_id() == object.getLong("id")) {
				if(username.equals(m.getUser_name()))
				{
					System.out.println ("cc" + m.getId());
		
			%>
			
			<div style="width:100%;height:80px; border-bottom:1px solid #ccc;  border-top:1px solid #ccc;border-bottom:1px solid #ccc; position:relative">
			<div style="width:10%; height:90%; position:absolute; top:5%; left:2px;border:1px solid #ccc">
				<img src="images/userpic.jpg" style="height:100%; width:100%" />
			</div>
			<div style="width:75%; height:90%; position:absolute; top:5%; right:10%;">
				<span style="text-align:left;line-height:80px"><%=m.getUser_name() %>: </span>&nbsp;&nbsp;&nbsp;&nbsp;<span><%=m.getMessage() %></span>
			</div>
			
			<form style="width:10%; height:90%; position:absolute; top:5%;right:0; " action = "/StrustRenting/deleteMessageAction.action?id=<%=m.getId()%>" method = "post">
				<br/>
				<input type="submit"  value="删除评论" name = "delect" style="background-color:#FFF;color:#6699FF;border:0; position:absolute; left:0px"></input>
				
			</form>
			</div>
			<br/>
			<%}
			else {%>
		   	<div style="width:100%;height:80px; border-bottom:1px solid #ccc;  border-top:1px solid #ccc;border-bottom:1px solid #ccc; position:relative">
			<div style="width:10%; height:90%; position:absolute; top:5%; left:2px;border:1px solid #ccc">
				<img src="images/userpic.jpg" style="height:100%; width:100%" />
			</div>
			<div style="width:75%; height:90%; position:absolute; top:5%; right:10%;">
				<span style="text-align:left;line-height:80px"><%=m.getUser_name() %>: </span>&nbsp;&nbsp;&nbsp;&nbsp;<span><%=m.getMessage() %></span>
			</div>
			
			<form style="width:10%; height:90%; position:absolute; top:5%;right:0; ">
				<br/>
				<input type="button" disabled value="删除评论" name = "delect" style="background-color:#FFF;color:#6699FF;border:0; position:absolute; left:0px"></input>
				
			</form>
			</div>
			<br/>	   				
			<%}
			}
		}%>
		
	</div>
	
	
</div>





</body>
</html>
