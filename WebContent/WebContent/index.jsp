<%@page import="java.util.Iterator"%>
<%@page import="com.strustrenting.table.House"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.strustrenting.dao.Dao"%>
<%@page import="net.sf.json.JSONObject"%><%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml"> 

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/loading.css" rel="stylesheet"type="text/css"/>
<link href="css/style.css" rel="stylesheet"type="text/css"/>
<link href="css/pictureturn.css" rel="stylesheet"type="text/css"/>

<link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="./css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">

<title>Struts短租-您的短租助手</title>

<style type="text/css">


#login{
position: relative;
display: none;
top: 20px;
left: 30px;
width: 280px;
height: 330px;
background-color:#FFFFFF;
text-align: center;
border: solid 1px #CCCCCC;
padding: 10px;
z-index: 1;
margin:auto;
}
#close{ padding:0px; text-decoration:none; font-size:20px;position:absolute;top:0px;right:0px; height:22px; width:28px; z-index:2; background-color:#CCCCCC; color:#FFFFFF; text-align:center;}
#panel{
position:absolute;
background-color:#CCFFFF;
padding: 0;
margin:0;
height:275px;
width:100%;
top:40px;
left:0px;
}
a{ text-decoration:none;}
.a1load{ text-decoration:none; color:#666666; font-family:微软雅黑; font-size:20px;}
.a1load:hover{color:#CC0033;}
.search-warp{
		    float:left;
			background-color:RGBA(0,0,0,.0);
			width:1000px;
			padding:5px;
			margin:auto;
		}
			.search-box{
			position:absolute;
			top:20%;
			left:15%;
		}

</style>

</head>

<body>

<%
	Dao dao = new Dao ();
	ArrayList<House> list = new ArrayList<House> ();
	try {
		list = dao.getList(new House ());
	}catch (Exception e) {
		e.printStackTrace();
	}
	//System.out.println ("nnnnnnnnnn" + list);
%>



<header>
 <div>
	<img class="logo" src="images/logo.jpg" title="Struts短租网致力于为您提供更加便捷优质的租房服务"> 
	
	<div style=" position:absolute; top:0px; left:1100px"><a  class="a1load" href="javascript:showLogin();showForbid();void(0);" style="text-decoration:none;">登录</a>
	<a  style=" color:#666666; font-size:20px"> | </a><a class="a1load" href="register.jsp" style="text-decoration:none";>注册</a>

</div>

</header>

<div class="banner">

<div id="container">
	<div id="list" style="left:-1349px;">
		<img src="images/5.jpg" alt=""/>
		<img src="images/1.jpg" alt=""/>
		<img src="images/2.jpg" alt=""/>
		<img src="images/3.jpg" alt=""/>
		<img src="images/4.jpg" alt=""/>
		<img src="images/5.jpg" alt=""/>
		<img src="images/1.jpg" alt=""/>
	</div>
	<div id="buttons">
		<span index="1" class="on"></span>
		<span index="2"></span>
		<span index="3"></span>
		<span index="4"></span>
		<span index="5"></span>
	</div>
    <a href="javascript:;" class="arrow" id="prev" style="text-decoration:none;">&lt;</a>
	<a href="javascript:;" class="arrow" id="next" style="text-decoration:none;">&gt;</a>
	<div class="searchbox">	
		<div class="search-box">
	
	    <form  class="search-warp">
	
				<input type="text" placeholder="城市" value="" style="color:#666666;position:absolute;top:5px; left:1px; height:25px; width:184px" name="city">
			<div  style="width:80px;" class="controls input-append date form_datetime" data-date="1979-09-16T05:25:07Z" data-date-format="dd MM yyyy - HH:ii p" data-link-field="dtp_input1">
				<input type="text"placeholder="入住日期" value="" style="color:#666666;position:absolute;top:5px; left:200px; height:25px; width:200px" name="n">
							 <span  class="add-on" style="position:absolute; top:5px; left:414px;width:40px; height:25px"><i class="icon-remove"></i></span>
					<span  style="position:absolute; top:5px; left:466px;width:40px; height:25px" class="add-on"><i class="icon-th"></i></span>
                
		</div>
		
		<div class="controls input-append date form_datetime" data-date="1979-09-16T05:25:07Z" data-date-format="dd MM yyyy - HH:ii p"data-link-field="dtp_input1">
				<input placeholder="退房日期"value="" style="color:#666666;position:absolute;top:5px; left:518px;height:25px; width:200px" type="text" name="q">
				
				 <span style="position:absolute; top:5px; left:732px; width:40px; height:25px" class="add-on"><i class="icon-remove"></i></span>
				 <span style="position:absolute; top:5px; left:784px;width:40px; height:25px" class="add-on"><i class="icon-th"></i></span>		
		</div>
				<input   type="submit" value="搜索短租->" style="color:#fff;font-size:18px;border:0;cursor:pointer;				                                                         background-color:#FF6666; width:100px; height:35px;position:absolute;top:5px;left:838px" />
		</form>
		
		
	</div>
	
	
	</div>
	
<div id="login">
	<span>登录</span>
	<a id="close" href="javascript:login.style.display = 'none';forbid.style.visibility = 'hidden'; void(0);"><b style="size:20px">×</b></a>
	<div id="panel">
		<br/><br/><br/>
		<form action="/StrustRenting/loginAction.action" method="post" onsubmit="return logincheck()">
		<input type="text" size="20"  placeholder="请输入您的用户名" name = "username" id = "uname" /><br /><br />
		<input type="password" size="20"  placeholder="请输入密码" name = "password" id = "psw"><br /><br />
    	<input type="radio" value="1"  name="typeuser" checked="checked" />普通
    	<input type="radio" value="2"  name="typeuser" />管理员
		<br/><br/>
		<input type="submit" value="登录" style="width:150px" />
		</form>
		
	</div>
	<br />
	<br />
	
</div>

</div>




<!--<img class="turn" src="images/lunbo1.jpg" title="">-->
<div id="title"><h1 id=HotRenting>热门短租</h1></div>

</div>

<div style="width:100%; position:absolute; top:710px;left:0;  height:800px; ">
<%Iterator<House> it = list.iterator();
	  int i=0;
	  while(it.hasNext())
	  {
		  
		  House h =(House) it.next();
		  if(i>5)
			  break;
		  else if(i<=3){%>
		  <div style="position:relative; width:23%; margin:20px 12px; padding:0; height:300px;float:left; border:1px solid #ccc">
		 <!--  <img src=<%=h.getHouse_picture1() %> style="width:100%; height:100%" />-->
		 <form >
			<input type="image" src=<%=h.getHouse_picture1() %> alt="submit" style="position:absolute;width:100%; height:100%"/>
		</form>
		  <div style="position:absolute; top:75%; left:0; width:100%;height:30px; ">
		  		<p style="text-align:center; font-family:微软雅黑;  color:#fff; font-size:20px;"> <%=h.getHouse_name() %> - <%=h.getCity() %> </p>
		  </div>
		  <div style="position:absolute; bottom:0;left:40%; width:70px; height:40px; background-color:RGBA(0,0,0,.5);">
		  <h4 style=" color:#fff;  text-align:center">¥<%=h.getHouse_price() %></h4>
		  </div>
		  </div><%} 
		  else if(i>3&&i<=5){%>
			  <div style="position:relative; width:48%; margin:20px 11px; padding:0; height:400px;float:left; border:1px solid #ccc">
			  	<!--  <img src=<%=h.getHouse_picture1() %> style="width:100%; height:100%" />  -->
		  <form >
			   <input type="image" src=<%=h.getHouse_picture1() %> alt="submit" style="position:absolute;width:100%; height:100%"/>
		  </form>
		  <div style="position:absolute; top:80%; left:0; width:100%;height:30px; ">
		  		<p style="text-align:center; font-family:微软雅黑;  color:#fff; font-size:20px;"> <%=h.getHouse_name() %>  - <%=h.getCity() %> </p>
		  </div>
		  <div style="position:absolute; bottom:0;left:45%; width:70px; height:40px; background-color:RGBA(0,0,0,.5);">
		  <h4 style=" color:#fff;  text-align:center">¥<%=h.getHouse_price() %></h4>
		  </div>
		  </div>
		<%}%>
		  
		 <%i++; %> 
	<% }%>
	
	<div style="width:100%; height:auto; position:absolute; top:800px;">
		<div style="width:100%; height:130px;  position:absolute; top:5px;">
			<h1 class="p1">下一站，住我家</h1>
			<p class="p2">有朋自远方来，不亦乐乎</p>
		</div>
		<div style="width:50%; height:400px;  position:absolute;top:135px; left:0;">
			<img src="images/frend.jpg" style="width:100%; height:100%" />
		</div>
		<div style="width:50%; height:400px;  position:absolute;top:135px; right:0;">
			<img src="images/frend.jpg" style="width:100%; height:100%" />
		</div>
		<div style="width:100%; height:100px;  position:absolute;top:535px; right:0;">
			<img src="images/ads.jpg" style="width:100%; height:100%; "/> 
		</div>
		<div style="width:100%; height:70px;  position:absolute;top:635px; right:0;">
			 <img src="images/phone.jpg" style="position:absolute; width:35px; height:35px; left:50px; top:10px"/>
			 <span style="position:absolute; left:90px; top:17px;color:#999;  font-size:17px;font-family:"微软雅黑";">客服热线：400-800-8888<span>
		</div>
	</div>


</div>


<script src="js/loading.js"></script>
<script src="js/pictureturn.js"></script>


<script type="text/javascript" src="./jquery/jquery-1.8.3.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="./bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="./js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="./js/locales/bootstrap-datetimepicker.fr.js" charset="UTF-8"></script>
<script type="text/javascript">
    $('.form_datetime').datetimepicker({
        //language:  'fr',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		forceParse: 0,
        showMeridian: 1
    });
	$('.form_date').datetimepicker({
        language:  'fr',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		forceParse: 0
    });
	$('.form_time').datetimepicker({
        language:  'fr',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 1,
		minView: 0,
		maxView: 1,
		forceParse: 0
    });
	function logincheck(){
		
		var namevalue=window.document.getElementById("uname").value;
		var pswvalue=window.document.getElementById("psw").value;
		if(namevalue==""||pswvalue=="")
		{
			window.alert("用户名或密码不可为空！");
			return false;
		}
		return true;

	}
</script>


</body>
</html>
