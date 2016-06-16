<%@page import="java.sql.Date"%>
<%@page import="net.sf.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Struts短租-点评中心</title>

 

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
#midtext{ position:absolute; top:175px; left:370px; width:550px; height:500px;}
#righttext{ position:absolute; top:175px; left:920px;  width:248px; height:500px;}
</style>
</head>

<body>
<header>
 <div>
	<img class="logo" src="images/logo.jpg" title="Struts短租网致力于为您提供更加便捷优质的租房服务" style="position:absolute;top:10px; left:30px"> 
	
	<div style=" position:absolute; top:20px; left:1050px"><a  class="a1load" href="loadedindex.jsp" style="text-decoration:none;">返回首页</a>
	
</div>
	
</div>
</header>
		<img class="logo" src="images/datahead.jpg" title="Struts短租网致力于为您提供更加便捷优质的租房服务" style="position:absolute;top:55px; left:0px; margin:0; width:100%; height:65px;"> 
	<div id="leftline">
		<div class="lefthead">
		<p style="text-align:center; color:#FFFFFF; line-height:40px">评论管理中心</p>
		</div>
		<div class="lefttitle1">
		<p style="text-align:center; color:#FFFFFF; line-height:40px;">我的订单</p>
		</div>
		<div class="lefttext1">
		<p style="text-align:center; line-height:45px;"><a href="Orders.jsp" style="text-decoration:none; font-size:14px; color:#00CCFF ">订单管理<a></p>
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
		<p style="text-align:center; line-height:45px;"><a href="#" style="text-decoration:none; font-size:14px;color:#00CCFF">密码设置<a></p>
		</div>
		<div class="lefttext6">
		<p style="text-align:center; line-height:45px;"><a href="#" style="text-decoration:none; font-size:14px;color:#00CCFF">我的钱包<a></p>
		</div>
	</div>
	<div id="midhead">
		<span style=" font-size:16px; line-height:43px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;我的短租<b> > </b>我的点评</span>
	</div>
	<div id="midtext">
		
	</div>
	

	<div id="righttext">
	
	
		
	</div>

</body>
</html>
