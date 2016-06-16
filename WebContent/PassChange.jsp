<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Struts短租-密码修改</title>
<link href="css/register.css" rel="stylesheet" type="text/css"/>
</head>

<body style="height:auto">
<%
	String oldPassword = (String) request.getSession().getAttribute("password");
	String name =  (String)request.getSession().getAttribute("username");
	

%>
<a href="personalData.jsp" style="text-decoration:none; font-size:18px; color:#6666CC;">返回资料中心 </a>

<form style="width:840px; height:900px; margin:50px auto; position:absolute; left:40%;top:100px" action = "/StrustRenting/changePasswordAction.action?username=<%=name%>" method = "post">
	<div >
		<label><span>旧密码:</span><input type="password"class="text"/></label><p class="msg"><i class="ati"></i>6-25个字符，一个汉字为两个字符串</p>
	</div>
	<br/>
	<div>
		<label><span>新密码:</span><input type="password"class="text"/></label><p class="msg"><i class="err"></i>6-25个字符，一个汉字为两个字符串</p>
	</div>
	<div style="margin:10px 0 10px 0"><label><span></span></label></div>
	<div style=" margin-bottom:20px;"><label><span>确认密码:</span><input type="password" class="text" disabled=""name = "password"></label><p class="msg" ><i class="ati"></i>请再输入一次</p> 
	</div>

	
	<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input  type="submit" value="确认修改" style=" width:110px; height:30px; color:#FFFFFF; background-color:#6666CC; border:0; margin:20px 0 0 80px;"/></div>
</form>
<script type="text/javascript">

function getLength(str)
{
	return str.replace(/[^\x00-xff]/g, "xx").length;	
}
 function findStr(str,n)
{
	var tmp=0;
	for(var i=0; i<str.length;i++){
		if(str.charAt(i)==n){
					  tmp++;
					  }
		}
		return tmp;
}
 function inputpwd(oldpwd,str)
 {
	 if(oldpwd==str)
		 return 0;
	 return 1;
	 
 }
 
window.onload=function()
{
	var aInput=document.getElementsByTagName("input");
	var oName=aInput[0];
	var pwd=aInput[1];
	var pwd2=aInput[2];
	var yes=aInput[3];
	var aP=document.getElementsByTagName("p");
	var name_msg=aP[0];
	var pwd_msg=aP[1];
	var pwd2_msg=aP[2];
	var aEm=document.getElementsByTagName("em");
	 var oldpwd="<%=(String) request.getSession().getAttribute("password")%>";
	 
	var re=/[^\w\u4e00-\u9fa5]/g;
	 oName.onfocus=function(){
		name_msg.style.display="block";
		name_msg.innerHTML='<i class="ati"></i>6-16个字符'
		}

 	 oName.onblur=function(){
	var re=/[^\w\u4e00-\u9fa5]/g;
	name_length=getLength(this.value);
	var judge=inputpwd(oldpwd,this.value);
	if(re.test(this.value)){
		name_msg.innerHTML='<i class="err"></i>含有非法字符！'
		}
	else if(judge)
		{name_msg.innerHTML='<i class="err"></i>原密码输入错误！' 
		yes.setAttribute("disabled");
		}
	
	else if(this.value==""){
		name_msg.innerHTML='<i class="err"></i>不能为空！'
		}
	else if(name_length>25){
		name_msg.innerHTML='<i class="err"></i>长度不超过25个字符！'
		}
	else if(name_length<6){
		name_msg.innerHTML='<i class="err"></i>长度少于6个字符！'
		}
	
	else{
		name_msg.innerHTML='<i class="err"></i>OK！'
	}
		
  }
	 pwd.onfocus=function(){
	  pwd_msg.style.display="block";
	  pwd_msg.innerHTML='<i class="ati"></i>6-16个字符,字母加数字或符号,不能单独同一字符'
	 
	 }
	 
  pwd.onkeyup=function(){
	  
	  if(this.value.length>5){
		  /*aEm[1].className="active";*/
		  pwd2.removeAttribute("disabled");
		  pwd2_msg.style.display="block";
		  }
	  else{
		 /* aEm[1].className="";*/
		  pwd2.setAttribute("disabled");
		   pwd2_msg.style.display="none";
		
		}
		  if(this.value.length>10){
			  aEm[2].className="active";
			  }
		  else{
			  aEm[2].className="";
			  }	  
	  }
	  pwd.onblur=function(){
		  var m=findStr(pwd.value,pwd.value[0]);
		  var re_n=/[^\d]/g;
		   var re_t=/[^a-zA-Z]/g;
		  
		  if(this.value==""){
			  pwd_msg.innerHTML='<i class="err"></i>不能为空！';
			  }
			  
		  else if(m==this.value.length){
			  pwd_msg.innerHTML='<i class="err"></i>不能用相同字符！';
			  }
		  else if(this.value.length<6||this.value.length>16){
			  pwd_msg.innerHTML='<i class="err"></i>长度应为6-16个字符！';
		 
			  }
		  else if(!re_n.test(this.value)){
			    pwd_msg.innerHTML='<i class="err"></i>不能全为数字！';
			  }
		  
		  
	  	  else if(!re_t.test(this.value)){
			    pwd_msg.innerHTML='<i class="err"></i>不能全为字母！';
			  }
		  
		  else{
			pwd_msg.innerHTML='<i class="ok"></i>OK！';
			}
		}
			
		pwd2.onblur=function(){
			if(this.value!=pwd.value){
				pwd2_msg.innerHTML='<i class="err"></i>两次输入密码不一致！';
			}
			else{
				pwd2_msg.innerHTML='<i class="ok"></i>OK！';

				}
				
			}
	
}

</script>
</body>
</html>
