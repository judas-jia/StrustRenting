<%@page import="net.sf.json.JSONObject"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="com.mysql.jdbc.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.strustrenting.util.BaseConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�ޱ����ĵ�</title>

<link href="css/register.css" rel="stylesheet" type="text/css"/>

</head>
 
<body>
<%
	//ArrayList <String> list = new ArrayList <String> ();
	
	JSONArray jsonArray = new JSONArray ();
	
	try {
		Connection conn = BaseConnection.getConnection();
		String sql = "select username from User";
		PreparedStatement statement = conn.prepareStatement(sql);
		statement.execute();
		ResultSet result = (ResultSet)statement.executeQuery();
		while (result.next()) {
			JSONObject obj = new JSONObject ();
			obj.accumulate("username", result.getString ("username"));
			
			jsonArray.put (obj);
		
		}
	
		System.out.println (jsonArray.toString());
		} catch (Exception e) {
			
	}
	
	//	return (ResultSet) statement.executeQuery();

%>


<form action="/StrustRenting/registerAction.action" method="post">
	<div>
		<label><span>�û���:</span><input type="text"class="text" name = "username"/></label><p class="msg"><i class="ati"></i>5-25���ַ���һ������Ϊ�����ַ���</p>
	</div>
	<div><label><span></span><b id="count">0���ַ�</b></label></div>
	<div>
		<label><span>����:</span><input type="password"class="text" name = "password"/></label><p class="msg"><i class="err"></i>6-25���ַ���һ������Ϊ�����ַ���</p>
	</div>
	<div style="margin:10px 0 10px 0"><label><span></span></label></div>
	<div style=" margin-bottom:20px;"><label><span>ȷ������:</span><input type="password" class="text" disabled=""></label><p class="msg"><i class="ati"></i>��������һ��</p>
	</div>
	<div >
		<label><span>�Ա�:</span><input type="radio" value="1"  name="sex" checked="checked" />��
    					   <input type="radio" value="2"  name="sex" />Ů</label><p class="msg"><i class="ati"></i></p>
	</div>
	<div style=" margin-bottom:20px;">
	  <label><span>�ֻ�����:</span><input type="text" class="text" name = "mobile"/>
		</label><p class="msg"><i class="ati"></i>11λ��Ч�ֻ�����</p>
	</div>
	<div style=" margin-bottom:20px;">
		<label><span>���֤��:</span><input type="text" class="text" name = "id_card"/></label><p class="msg"><i class="ati"></i></p>
	</div>
	
	<div>
		<label><br/><input type="radio" value=""  name="read" checked="checked" /><a href="#" style=" text-decoration:none; font-size:13px;">���Ķ���ͬ��<a>
    					</label><p class="msg"><i class="ati"></i></p>
	</div>
	
	<div><input class="submitBtn" type="submit" value="ȷ��ע��"/></div>
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
 function inputname(username,str)
 {
	 
	 for(var i=0; i<username.length; i++)
		 {
		 
		 	if(username[i].username==str){
		 		
		 		return 1;}
		 }
	 return 0;
	 
 }
 
 
window.onload=function()
{
	var aInput=document.getElementsByTagName("input");
	var oName=aInput[0];
	var pwd=aInput[1];
	var pwd2=aInput[2];
	var phone=aInput[5];
	var id=aInput[6];
	var aP=document.getElementsByTagName("p");
	var name_msg=aP[0];
	var pwd_msg=aP[1];
	var pwd2_msg=aP[2];
	var phone_msg=aP[4];
	var id_msg=aP[5];
	var count=document.getElementById("count");
	var aEm=document.getElementsByTagName("em");
	
	var username=<%=jsonArray%>;

	var re=/[^\w\u4e00-\u9fa5]/g;
  oName.onfocus=function(){
		name_msg.style.display="block";
		name_msg.innerHTML='<i class="ati"></i>6-25���ַ���һ������Ϊ2���ַ����Ƽ�ʹ�����ġ�'
		}

  oName.onkeyup=function(){
	count.style.visibility="visible";
	name_length=getLength(this.value);
	count.innerHTML=name_length+"���ַ�";
	
	if(name_length==0){
		count.style.visibility="hidden";
	}
	}
  oName.onblur=function(){
	var re=/[^\w\u4e00-\u9fa5]/g;

 var judge=inputname(username,this.value);

	if(re.test(this.value)){
		name_msg.innerHTML='<i class="err"></i>���зǷ��ַ���'
		}
	else if(judge){

		name_msg.innerHTML='<i class="err"></i>�û����ѱ�ռ�ã�'
	}
	
	else if(this.value==""){
		name_msg.innerHTML='<i class="err"></i>����Ϊ�գ�'
		}
	else if(name_length>25){
		name_msg.innerHTML='<i class="err"></i>���Ȳ�����25���ַ���'
		}
	else if(name_length<6){
		name_msg.innerHTML='<i class="err"></i>��������6���ַ���'
		}
	else{
		name_msg.innerHTML='<i class="err"></i>OK��'
	}
		
  }

  pwd.onfocus=function(){
	  pwd_msg.style.display="block";
	  pwd_msg.innerHTML='<i class="ati"></i>6-16���ַ�,��ĸ�����ֻ����,���ܵ���ͬһ�ַ�'
	 
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
			  pwd_msg.innerHTML='<i class="err"></i>����Ϊ�գ�';
			  }
			  
		  else if(m==this.value.length){
			  pwd_msg.innerHTML='<i class="err"></i>��������ͬ�ַ���';
			  }
		  else if(this.value.length<6||this.value.length>16){
			  pwd_msg.innerHTML='<i class="err"></i>����ӦΪ6-16���ַ���';
		 
			  }
		  else if(!re_n.test(this.value)){
			    pwd_msg.innerHTML='<i class="err"></i>����ȫΪ���֣�';
			  }
		  
		  
	  	  else if(!re_t.test(this.value)){
			    pwd_msg.innerHTML='<i class="err"></i>����ȫΪ��ĸ��';
			  }
		  
		  
		  else{
			pwd_msg.innerHTML='<i class="ok"></i>OK��';
			}
		}
		
		pwd2.onblur=function(){
			if(this.value!=pwd.value){
				pwd2_msg.innerHTML='<i class="err"></i>�����������벻һ�£�';
			}
			else{
				pwd2_msg.innerHTML='<i class="ok"></i>OK��';

				}
				
			}
 
  phone.onfocus=function(){
	 phone_msg.style.display="block";
	 phone_msg.innerHTML='<i class="ati"></i>11λ��Ч�ֻ�����'
	 
	 }
	  
  phone.onblur=function(){
	  
	   var read=/[^\d]/g;
		  if(this.value==""){
			  phone_msg.innerHTML='<i class="err"></i>����Ϊ�գ�';
			  }
			  
		   else if(read.test(this.value)){
			    phone_msg.innerHTML='<i class="err"></i>�����ʽ����ȷ��';
			  }
		   else if(this.value.length!=11){
			  phone_msg.innerHTML='<i class="err"></i>������11λ��Ч���룡';
		 
			  }
		   else{
				phone_msg.innerHTML='<i class="ok"></i>OK��';

				}
		  
	}
	
	id.onfocus=function(){
	 id_msg.style.display="block";
	 id_msg.innerHTML='<i class="ati"></i>18λ��Ч֤������'
	 
	 }
	  
  id.onblur=function(){
	  
	   var read=/[^\d]/g;
		  if(this.value==""){
			  id_msg.innerHTML='<i class="err"></i>����Ϊ�գ�';
			  }
			  
		   else if(read.test(this.value)){
			    id_msg.innerHTML='<i class="err"></i>֤�������ʽ����ȷ��';
			  }
		   else if(this.value.length!=18){
			  id_msg.innerHTML='<i class="err"></i>������18λ��Ч֤���ţ�';
		 
			  }
		   else{
				id_msg.innerHTML='<i class="ok"></i>OK��';

				}  
	}
	
}

</script>

</body>
</html>
