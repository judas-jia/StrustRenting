
<%@page import="java.sql.Date"%>
<%@page import="net.sf.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Struts短租-个人资料中心</title>
 <script type="text/javascript" src="js/date.js"></script>
<script type="text/javascript" src="js/jock-citypicker-2.0.min.js"></script>
<script type="text/javascript"> 

window.onload = function(){

	var a = document.getElementById("test1");
	a.onclick = function(){
		citypicker.show({left: 280, top : 250}, function(data){
			a.value = data;
		});
	}
	};
//<!--浏览上传图片-->	
var loadImageFile = (function () { 
	if (window.FileReader) { 
	var oPreviewImg = null, oFReader = new window.FileReader(), 
	rFilter = /^(?:image\/bmp|image\/cis\-cod|image\/gif|image\/ief|image\/jpeg|image\/jpeg|image\/jpeg|image\/pipeg|image\/png|image\/svg\+xml|image\/tiff|image\/x\-cmu\-raster|image\/x\-cmx|image\/x\-icon|image\/x\-portable\-anymap|image\/x\-portable\-bitmap|image\/x\-portable\-graymap|image\/x\-portable\-pixmap|image\/x\-rgb|image\/x\-xbitmap|image\/x\-xpixmap|image\/x\-xwindowdump)$/i; 

	oFReader.onload = function (oFREvent) { 
	if (!oPreviewImg) { 
	var newPreview = document.getElementById("imagePreview"); 
	oPreviewImg = new Image(); 
	oPreviewImg.style.width = (newPreview.offsetWidth).toString() + "px"; 
	oPreviewImg.style.height = (newPreview.offsetHeight).toString() + "px"; 
	newPreview.appendChild(oPreviewImg); 
	} 
	oPreviewImg.src = oFREvent.target.result; 
	}; 

	return function () { 
	var aFiles = document.getElementById("imageInput").files; 
	if (aFiles.length === 0) { return; } 
	if (!rFilter.test(aFiles[0].type)) { alert("You must select a valid image file!"); return; } 
	oFReader.readAsDataURL(aFiles[0]); 
	} 

	} 
	if (navigator.appName === "Microsoft Internet Explorer") { 
	return function () { 
	alert(document.getElementById("imageInput").value); 
	document.getElementById("imagePreview").filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = document.getElementById("imageInput").value; 

	} 
	} 
	})(); 
	

</script> 

<link href="css/style.css" rel="stylesheet"type="text/css"/>
<link rel="stylesheet" rev="stylesheet" href="css/jock-citypicker-2.0.min.css" type="text/css" />


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
#midtext{ position:absolute; top:175px; left:370px; width:800px; height:500px;}
#righttext{ position:absolute; top:0px; right:0px;  width:248px; height:500px;}
#imagePreview { 
width:85%; height:200px; position:absolute; top:80px; right:0px;
filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);
margin:3px ;
border:1px solid #ccc;
}
</style>
</head>

<body>
<%
	Object obj = request.getSession().getAttribute("user");
	JSONObject json = new JSONObject (obj.toString());
	String username = json.getString("username");
	String mobile = json.getString("mobile");
	double money = json.getDouble("money");
	String id_card = json.getString("id_card");
	String realname = json.getString("realname");
	String birthday = json.getString("birthday");
	String city = json.getString("city");
	String picture = json.getString("picture");
	System.out.println (birthday);
	System.out.println (picture);
	//System.out.println (city);
	
%>
<header>
 <div>
	<img class="logo" src="images/logo.jpg" title="Struts短租网致力于为您提供更加便捷优质的租房服务" style="position:absolute;top:10px; left:30px"> 
	
	<div style=" position:absolute; top:20px; left:1130px"><a  class="a1load" href="loadedindex.jsp" style="text-decoration:none;"> <%=username %> </a>
	
</div>
	
</div>
</header>
		<img class="logo" src="images/datahead.jpg" title="Struts短租网致力于为您提供更加便捷优质的租房服务" style="position:absolute;top:55px; left:0px; margin:0; width:100%; height:65px;"> 
	<div id="leftline">
		<div class="lefthead">
		<p style="text-align:center; color:#FFFFFF; line-height:40px">个人资料中心</p>
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
		<p style="text-align:center; line-height:45px;"><a href="HireOrders.jsp" style="text-decoration:none; font-size:14px;color:#00CCFF">出租订单</a><a></p>
		</div>
		<div class="lefttitle3">
		<p style="text-align:center; color:#FFFFFF; line-height:40px;">我是房东</p>
		</div>
		<div class="lefttext3">
		<p style="text-align:center; line-height:45px;"><a href="MyHouse.jsp" style="text-decoration:none; font-size:14px;color:#00CCFF">房屋管理<a></p>
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
		<span style=" font-size:16px; line-height:43px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;我的短租<b> > </b>个人资料</span>
	</div>
	<div id="midtext">
		<div style="position:absolute; top:0px; left:0px; width:551px; height:45px; border-bottom:1px solid #ccc">
			<br/><span style="font-size:15px; line-height:20px; ">&nbsp;&nbsp;&nbsp;<b>账户信息</b></span>
		</div>
		<form id="accountMes" action = "/StrustRenting/changeInformationAction.action" method = "post" enctype="multipart/form-data">
			<div  style="position:absolute;top:55px; width:97%; height:100px; left:11px; ">	
				<br/><span style="font-size:13px"><b>用户名：</b></span><input type="text" size="25" style="height:20px" name = "username" value = <%=username %>>
				<br/><br/><span style="font-size:13px"><b>手机：</b></span><input type="text" size="15" style="height:20px" name = "mobile" value = <%=mobile %>>				
			</div>
			
			<div style="position:absolute; top:150px; left:0px; width:551px; height:45px; border-bottom:1px solid #ccc;">
				<br/><span style="font-size:15px; line-height:20px; ">&nbsp;&nbsp;&nbsp;<b>个人信息</b></span>
			</div>
			
			<div  style="position:absolute;top:195px; width:97%; height:180px; left:11px; ">	
				<br/><span style="font-size:13px"><b>真实姓名：</b></span><input type="text" size="25" style="height:20px" name = "realname" value = <%=realname %>>
				<br/><br/><span style="font-size:13px"><b>身份证号：</b></span><input type="text" size="30" style="height:20px" name = "id_card" value = <%=id_card %>>	
				<br/><br/><span style="font-size:13px"><b>性别：</b></span><input type="radio" value="1"  name="sex" />男<input type="radio" value="2"  name="sex" >女	
				<br/><br/><span style="font-size:13px"><b>出生日期：</b></span><input id="endtime" type="text" size="15" onfocus="setday(this)" readonly="readonly" style="height:20px" name = "birthday" value = <%=birthday %>>	
				<br/><br/><span style="font-size:13px"><b>城市：</b></span><input id="test1" type="text" size="10"  readOnly="readOnly" style="height:20px;" name = "city" value = <%=city %>>
			</div>
			
			<div style="position:absolute;top:415px; width:97%; height:120px; left:11px; ">
		

			  <div><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			  <input class="submitBtn" type="submit" value="保存设置"  onclick="savesucces()" style=" width:150px; height:35px; background-color:#FF6633;border:0;" />
			  <div id="save" style="position:absolute;right:350px; bottom:60px; width:140px; height:40px; display:none;">
					<img src= "images/check.jpg" style="width:30%; height:100%">
					<span style=" position:absolute; bottom:5px; line-height:20px;">保存成功</span>
						
					</div>
			  </div>
			</div>
			<div id="righttext">
	
				<!-- <div id="imagePreview" style="background-image:url(images/touxiang.jpg)">
				<img src= <%=picture %> style="width:100%; height:100%"/> 
		
				</div>  -->
			   <div id="imagePreview" style="background-image:url(<%=picture %>);background-size:210px 200px;">
		
				</div>

				<input id="imageInput" type="file" name="upload" onChange="loadImageFile();"  style="width:62px; height:30px;  border:0;position:absolute; top:300px; left:100px"/><br/>


				</div>
			</form>
			
	</div>
	
<script type="text/javascript"> 

function savesucces(){
	var save=document.getElementById("save");
	save.style.display="block";

}
</script> 
</body>
</html>
