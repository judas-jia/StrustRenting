window.onload=function(){
	var container=document.getElementById('container');
	var list=document.getElementById('list');
	var buttons=document.getElementById('buttons').getElementsByTagName('span');
	var prev=document.getElementById('prev');
	var next=document.getElementById('next');
	var index=1;
	var animated=false;
	var timer;
	function showButton(){
		for(var i=0;i<buttons.length;i++){
			if(buttons[i].className=='on'){
				buttons[i].className='';
				break;
			}
		}
		buttons[index-1].className='on';
	
	}
		function animate(offset){
		animated=true;
		var newLeft=parseInt(list.style.left)+offset;
		var time=300;
		var interval=10;
		var speed=offset/(time/interval);
		//动画效果
		function go(){
			if((speed<0 && parseInt(list.style.left)>newLeft) || ( speed>0 && parseInt(list.style.left)<newLeft)){
				list.style.left=parseInt(list.style.left)+speed+'px';
				setTimeout(go,interval);
			}
			else{
				animated=false;
				list.style.left=newLeft+'px';
				if(newLeft>-1349){
					list.style.left=-6745+'px';}
				if(newLeft<-6745){
					list.style.left=-1349+'px';}
			}
		}
		go();
	}
	//自动播放
	function play(){
		timer=setInterval(function(){
			next.onclick();
		},3000);
	}
	//落下鼠标停止播放
	function stop(){
		clearInterval(timer);
	}
	next.onclick=function(){
		if(index==5) index=1;
		else index+=1;
		showButton();
		if(animated==false)
			 animate(-1349);}
	prev.onclick=function(){
		if(index==1) index=5;
		else index-=1;
	showButton();
	if(animated==false)
		animate(1349);
	}
	for(var i=0;i<buttons.length;i++){
		buttons[i].onclick=function(){
			if(this.className=='on')
				return;
			var myIndex=parseInt(this.getAttribute('index'));
			var offset=-1349*(myIndex-index);
			if(animated==false)
				animate(offset);
			index=myIndex;
			showButton();
		}
	
	}	
	container.onmouseout=play;
	container.onmouseover=stop;
	play();
	
}
