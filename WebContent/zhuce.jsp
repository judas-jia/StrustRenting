<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml"> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" /> 
<title>用户注册</title> 
<style> 
body{ width:100%; height:500px; background-image:url(images/4.jpg); }  
body,h2{    padding:0px;    margin:0px auto;    }    
#wrapper{ position:absolute;top:30px; right:450px;width:500px;    height:450px;    padding:0px;    margin:0px auto;     border:1px #999999 solid; color:#000000; background-color:#FFFFFF;  }    

span{     color:#FF0000;    }     
#shoulder{     padding:10px 100px;    line-height:28px;    }    
#fore{     text-align:right;    padding:5px;    }    
#back{     text-align:left;    padding:5px;    }    
#button{  background-color:#00FFFF;    padding:0px;    color:#FFFFFF;    }    
#bt{     padding-left:200px;     margin-top:30px; }  
</style> 
</head>  
<body>  
<div id="wrapper">      
	<div id="head">       
		<h2 style=" text-align:center;background-color:#CCCCCC;color:#FFFFFF; padding:10px 100px;"> 注册：开通您的短租网账户</h2>   
	</div>    <div id="shoulder">                   
	<table width="400" border="0" cellspacing="0" cellpadding="0">     
	     <tr>   <td id="fore">电子邮箱：<span>*</span> </td>    
		 		<td id="back"><input name="email" type="text" /></td>     
		 </tr>     
		 <tr>	<td id="fore">设置密码：<span>*</span> </td>    
		 		<td id="back"><input name="password" type="text" /></td>     
		 </tr>    
		 <tr>   <td id="fore">确认密码：<span>*</span> </td>    
		 		<td id="back"><input name="rpassword" type="text" /></td>     
		 </tr>    
		 <tr>   <td id="fore">用户名：<span>*</span> </td>    
		 		<td id="back"><input name="name" type="text" /></td>     
		 </tr>    
		 <tr>   <td id="fore">性别：<span></span> </td>    
				<td id="back"><input name="sex" type="radio" value="男" />   男      <input name="sex" type="radio" value="女" />       女</td>     		         </tr>    
		 <tr>   <td id="fore">出生日期：<span></span> </td>   
		 		<td id="back"><select name="year">                 <option>2001</option>             <option>2000</option> 
       <option>1999</option>        <option>1998</option>        <option>1997</option>        <option>1996</option>        <option>1995</option>        <option>1994</option>        <option>1993</option>        <option>1992</option>        <option>1991</option>        <option>1990</option>        <option>1989</option>        <option>1988</option>        <option>1987</option>        <option>1986</option>        <option>1985</option>        <option>1984</option>        <option>1983</option>        <option>1982</option>           <option>1981</option>                  </select>   年      <select name="month">       <option>01</option> 
    <option>02</option>     <option>03</option>     <option>04</option>     <option>05</option>     <option>06</option>     <option>07</option>     <option>08</option>     <option>09</option>     <option>10</option>     <option>11</option>     <option>12</option>     </select>     月      <select name="day">     <option>01</option>     <option>02</option>     <option>03</option>     <option>04</option>     <option>05</option>     <option>06</option>     <option>07</option>     <option>08</option>       <option>09</option> 
    <option>10</option>     <option>11</option>     <option>12</option>     <option>13</option>     <option>14</option>     <option>15</option>     <option>16</option>     <option>17</option>     <option>18</option>     <option>19</option>     <option>20</option>     <option>21</option>     <option>22</option>     <option>23</option>     <option>24</option>     <option>25</option>     <option>26</option>     <option>27</option>     <option>28</option>     <option>29</option>     <option>30</option>     <option>31</option>       </select> 
    日</td>     </tr>   
	
	<tr>   <td id="fore">验证码：<span>*</span> </td>     <td id="back"><input name="yzm" type="text" /></td>     </tr>   
	<tr>     <td colspan="2"  id="bt"><input name="bt" type="submit" value="立即注册" id="button" /></td>    </tr>   
	</table>    
</div>  
</div> 
</body> 
</html>