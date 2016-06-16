<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>计时器</title>
<style type="text/css">
#count{ background-color:#000; width:100px; height:100px; text-align:center; color:#FFFFFF;border:#000; font-size:60px; position:absolute; top:200px; left:500px; margin:auto}

</style>
</head>
<script type="text/javascript">
  var num=3;
  function startCount() {
    document.getElementById('count').value=num;
    num=num-1;
    if(num>0)
    setTimeout("startCount()",1000);
    else {
		num=0;
		window.open('index.jsp','_self','width=600,height=400,top=200,left=0,menubar=no,toolbar=no,status=no,scrollbars=yes');
		}
  }
  setTimeout("startCount()",1000);
</script>
</head>
<body style="background-color:#000000">
<p style="color:#FFFFFF; position:absolute; top:120px; left:400px; font-size:20px;">注册成功！</p>
<form>
<input type="text" id="count"/>
</form>
<p style="color:#FFFFFF; position:absolute; top:280px; left:600px; font-size:20px;">秒后返回首页！</p>
</body>
</html>