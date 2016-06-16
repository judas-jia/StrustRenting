<%@page import="net.sf.json.JSONArray"%>
<%@page import="java.sql.Date"%>
<%@page import="net.sf.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Struts短租-房屋信息发布</title>
<style type="text/css">
#imagePreview { 
width:200px; height:200px; position:absolute; left:0px; top:0px ;
filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);
margin:3px ;
border:1px solid #ccc;
}
#imagePreview1 { 
width:200px; height:200px; position:absolute; left:0px; top:0px ;
filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);
margin:3px ;
border:1px solid #ccc;
}
#imagePreview2 { 
width:200px; height:200px; position:absolute; left:0px; top:0px ;
filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);
margin:3px ;
border:1px solid #ccc;
}
*{ margin:0; padding:0;}
#box{ margin:50px auto; width:540px; min-height:400px; background:#FF9}
#demo{ margin:10px 0px; width:540px; min-height:400px; background:#CF9}
</style>
<link href="css/register.css" rel="stylesheet" type="text/css"/>

<script src="js/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="diyUpload/css/webuploader.css">
<link rel="stylesheet" type="text/css" href="diyUpload/css/diyUpload.css">
<script type="text/javascript" src="diyUpload/js/webuploader.html5only.min.js"></script>
<script type="text/javascript" src="diyUpload/js/diyUpload.js"></script>

<link rel="stylesheet" rev="stylesheet" href="css/jock-citypicker-2.0.min.css" type="text/css" />

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
	
	
	
	
var loadImageFile1 = (function () { 
	if (window.FileReader) { 
	var oPreviewImg = null, oFReader = new window.FileReader(), 
	rFilter = /^(?:image\/bmp|image\/cis\-cod|image\/gif|image\/ief|image\/jpeg|image\/jpeg|image\/jpeg|image\/pipeg|image\/png|image\/svg\+xml|image\/tiff|image\/x\-cmu\-raster|image\/x\-cmx|image\/x\-icon|image\/x\-portable\-anymap|image\/x\-portable\-bitmap|image\/x\-portable\-graymap|image\/x\-portable\-pixmap|image\/x\-rgb|image\/x\-xbitmap|image\/x\-xpixmap|image\/x\-xwindowdump)$/i; 

	oFReader.onload = function (oFREvent) { 
	if (!oPreviewImg) { 
	var newPreview = document.getElementById("imagePreview1"); 
	oPreviewImg = new Image(); 
	oPreviewImg.style.width = (newPreview.offsetWidth).toString() + "px"; 
	oPreviewImg.style.height = (newPreview.offsetHeight).toString() + "px"; 
	newPreview.appendChild(oPreviewImg); 
	} 
	oPreviewImg.src = oFREvent.target.result; 
	}; 

	return function () { 
	var aFiles = document.getElementById("imageInput1").files; 
	if (aFiles.length === 0) { return; } 
	if (!rFilter.test(aFiles[0].type)) { alert("You must select a valid image file!"); return; } 
	oFReader.readAsDataURL(aFiles[0]); 
	} 

	} 
	if (navigator.appName === "Microsoft Internet Explorer") { 
	return function () { 
	alert(document.getElementById("imageInput1").value); 
	document.getElementById("imagePreview1").filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = document.getElementById("imageInput1").value; 

	} 
	} 
	})(); 
	
	
	
var loadImageFile2 = (function () { 
	if (window.FileReader) { 
	var oPreviewImg = null, oFReader = new window.FileReader(), 
	rFilter = /^(?:image\/bmp|image\/cis\-cod|image\/gif|image\/ief|image\/jpeg|image\/jpeg|image\/jpeg|image\/pipeg|image\/png|image\/svg\+xml|image\/tiff|image\/x\-cmu\-raster|image\/x\-cmx|image\/x\-icon|image\/x\-portable\-anymap|image\/x\-portable\-bitmap|image\/x\-portable\-graymap|image\/x\-portable\-pixmap|image\/x\-rgb|image\/x\-xbitmap|image\/x\-xpixmap|image\/x\-xwindowdump)$/i; 

	oFReader.onload = function (oFREvent) { 
	if (!oPreviewImg) { 
	var newPreview = document.getElementById("imagePreview2"); 
	oPreviewImg = new Image(); 
	oPreviewImg.style.width = (newPreview.offsetWidth).toString() + "px"; 
	oPreviewImg.style.height = (newPreview.offsetHeight).toString() + "px"; 
	newPreview.appendChild(oPreviewImg); 
	} 
	oPreviewImg.src = oFREvent.target.result; 
	}; 

	return function () { 
	var aFiles = document.getElementById("imageInput2").files; 
	if (aFiles.length === 0) { return; } 
	if (!rFilter.test(aFiles[0].type)) { alert("You must select a valid image file!"); return; } 
	oFReader.readAsDataURL(aFiles[0]); 
	} 

	} 
	if (navigator.appName === "Microsoft Internet Explorer") { 
	return function () { 
	alert(document.getElementById("imageInput2").value); 
	document.getElementById("imagePreview2").filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = document.getElementById("imageInput2").value; 

	} 
	} 
	})(); 
	
	

</script> 

</head>
 
<body>
<%
	String houseinformation = (String)request.getSession().getAttribute("usersHouseInformation");
	String house_id = (String)request.getSession().getAttribute("house_id");
	Object login_user_id =  request.getSession().getAttribute("user_id");
	JSONObject json = new JSONObject (houseinformation);
	JSONArray jsonArray = json.getJSONArray("data");
	

	JSONObject object = new JSONObject ();
	for (int i = 0; i < jsonArray.length(); i ++) {
		
		JSONObject obj = jsonArray.getJSONObject(i);
		if ((obj.getLong("id") + "").equals(house_id)) {
			object = obj;
			System.out.println (object);
		}
		
		
	}
	%>
	
			
<form action="/StrustRenting/changHouseInformationAction.action?id=<%=object.getLong("id")%>&user_id=<%=login_user_id %>" method="post" enctype="multipart/form-data">
	<div style=" margin-bottom:20px;">
		<label><span>出租方式：</span><input type="radio" value=<%=object.getString("house_type") %>  name="house_type" checked="checked" />整租
    					   <input type="radio" value=<%=object.getString("house_type") %>  name="house_type" />合租</label><p class="msg"><i class="ati"></i></p>
	</div>
	<div >
		<label><span>您的身份：</span><input type="radio" value=<%=object.getString("people") %>  name="people" checked="checked" />个人
    					   <input type="radio" value=<%=object.getString("people") %>  name="people" />经纪人</label><p class="msg"><i class="ati"></i></p>
	</div>
	<div style=" margin:20px 0px;">
		<label><span>所在城市：</span><input id="test1" type="text" class="text" name="city" value=<%=object.getString("city") %> readOnly="readOnly" style="width:60px"/></label><p class="msg"><i class="ati"></i></p>
	</div>
	<div style=" margin-bottom:20px;">
		<label><span>房屋名称：</span><input type="text"class="text" name = "house_name" value = <%=object.getString("house_name") %>></label><p class="msg"><i class="ati"></i>2-20个字符，不能填写特殊符号</p>
	</div>
	<div>
		<label><span>小区：</span><input type="text"class="text" name = "house_address" value = <%=object.getString("house_address") %>></label><p class="msg"><i class="ati"></i>2-20个字符，不能填写特殊符号</p>
	</div>
	<div><label><span></span><b id="count">0个字符</b></label></div>
	
	<div style=" margin-bottom:20px;">
	
		<label><span>租金：</span><input type="text"class="text" style="width:40px" name = "house_price" value = <%=object.getString("house_price") %>>元/天</label><p class="msg"><i class="err"></i>数字不得包括字母特殊符号</p>
	</div>
	<div style=" margin-bottom:20px;">
		<label><span>面积：</span><input type="text"class="text" style="width:40px" name = "area" value = <%=object.getString("area") %>>㎡</label><p class="msg"><i class="err"></i>数字不得包括字母特殊符号</p>
	</div>
	
	<div style=" margin-bottom:20px;"><label><span>描述：</span><textarea name="house_describle"   cols="40" rows="5" placeholder="房屋详细信息，小区情况，周边配套，交通情况，对租客的要求，入住时间等"> <%=object.getString("house_describle") %></textarea></label><p class="msg"><i class="ati"></i></p>
	</div>
	
	
	<div style=" margin-bottom:20px;">
		<label><span>联系人：</span><input type="text" class="text" style="width:70px" name = "contact" value = <%=object.getString("contact") %>></label><p class="msg"><i class="ati"></i></p>
	</div>
	<div style=" margin-bottom:20px;">
		<label><span>联系电话：</span><input type="text" class="text" style=" width:80px" name = "mobile" value = <%=object.getString("mobile") %>></label><p class="msg"><i class="ati"></i></p>
	</div>
	
	
	<span>房屋图片：</span>
	<div style="width:200px; height:240px; position:absolute; left:0px; ">
		
		<div id="imagePreview" style="background-image:url( <%=object.getString("picture1") %>);background-size:200px 240px;">
	</div>
	<input id="imageInput" type="text" value =<%=object.getString("picture1") %> name="house_picture1" onChange="loadImageFile();"  style="width:62px; height:30px;  border:0;position:absolute; bottom:10px; left:39%; bottom:0px"/><br/>
	</div>
	<div style="width:200px; height:240px; position:absolute; left:220px;">
		
		<div id="imagePreview1" style="background-image:url( <%=object.getString("picture2") %>);background-size:200px 240px;">
		</div>
	<input id="imageInput1" type="text" value =<%=object.getString("picture2") %> name="house_picture2" onChange="loadImageFile1();"  style="width:62px; height:30px;  border:0;position:absolute; bottom:10px; left:39%; bottom:0px"/><br/>
	</div>
	<div style="width:200px; height:240px; position:absolute; left:440px; ">
		
		<div id="imagePreview2" style="background-image:url(<%=object.getString("picture3") %>);background-size:200px 240px;">
	</div>
	<input id="imageInput2" type="text" value =<%=object.getString("picture3") %>  name="house_picture3" onChange="loadImageFile2();"  style="width:62px; height:30px;  border:0;position:absolute; bottom:10px; left:39%; bottom:0px"/><br/>
	</div>
	<div style="bottom:0px; position:absolute"><input class="submitBtn" type="submit" value="确认发布"/></div>
</form>
<script type="text/javascript">



$('#test').diyUpload({
	url:'server/fileupload.php',
	success:function( data ) {
		console.info( data );
	},
	error:function( err ) {
		console.info( err );	
	}
});

$('#as').diyUpload({
	url:'server/fileupload.php',
	success:function( data ) {
		console.info( data );
	},
	error:function( err ) {
		console.info( err );	
	},
	buttonText : '选择文件',
	chunked:true,
	// 分片大小
	chunkSize:512 * 1024,
	//最大上传的文件数量, 总文件大小,单个文件大小(单位字节);
	fileNumLimit:50,
	fileSizeLimit:500000 * 1024,
	fileSingleSizeLimit:50000 * 1024,

	accept: {}
});
</script>

</body>
</html>
