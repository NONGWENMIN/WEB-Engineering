 var zdcount=0;//遮挡物隐藏计数器
 	function getElementPos(elementId) 
  {
	var ua = navigator.userAgent.toLowerCase();     
	var isOpera = (ua.indexOf('opera') != -1);     
	var isIE = (ua.indexOf('msie') != -1 && !isOpera); 
	// not opera spoof      
	var el = document.getElementById(elementId);      
	if(el.parentNode == null || el.style.display == 'none')     
 	{	 	         
 	         return false;     
 	}     
 	var parent = null;     
	var pos = [];     
	var box;
 	if(el.getBoundingClientRect)    
	{ //IE     
        box = el.getBoundingClientRect(); 
        var scrollTop = Math.max(document.documentElement.scrollTop, document.body.scrollTop); 
        var scrollLeft = Math.max(document.documentElement.scrollLeft, document.body.scrollLeft); 
        return {x:box.left+ scrollLeft, y:box.top + scrollTop,w:box.right-box.left,h:box.bottom-box.top};    
        
	}     
	else if(document.getBoxObjectFor)         
	{ // FireFox
        box = document.getBoxObjectFor(el);                                  
        var borderLeft = (el.style.borderLeftWidth)?parseInt(el.style.borderLeftWidth):0;
        var borderTop = (el.style.borderTopWidth)?parseInt(el.style.borderTopWidth):0;
        pos = [box.x - borderLeft, box.y - borderTop,box.width,box.height];     
	}     
	else     
	{ 
   		// safari & opera
    	pos = [el.offsetLeft,el.offsetTop,el.offsetWidth,el.offsetHeight];
    	parent = el.offsetParent;
    	if (parent != el) 
    	{             
        	while (parent) 
        	{                 
           		pos[0] += parent.offsetLeft;
           		pos[1] += parent.offsetTop;
           		parent = parent.offsetParent;             
        	}         
		}         
		if (ua.indexOf('opera')!=-1||( ua.indexOf('safari')!=-1 && el.style.position == 'absolute' ))
		{                 
			pos[0] -= document.body.offsetLeft;                 
			pos[1] -= document.body.offsetTop;         
		}  
		return {x:pos[0]+2,y:pos[1]+2,w:pos[2],h:pos[3]};      
	}              
	if (el.parentNode) 
	{ 
		parent = el.parentNode; 
	}
	else { parent = null; } 
	while (parent && parent.tagName != 'BODY' && parent.tagName != 'HTML')
	{ // account for any scrolled ancestors         
		pos[0] -= parent.scrollLeft;         
		pos[1] -= parent.scrollTop;		       
		if (parent.parentNode) 
		{ 
			parent = parent.parentNode; 
		}          
		else 
		{ 
			parent = null; 
		}     
	}
	return {x:pos[0],y:pos[1],w:pos[2],h:pos[3]}; 
  }
  
    //显示错误信息气球的方法
  function showMsg(msg,id)//msg为错误消息文本===id为错误输入控件id
  {
     //获取错误输入控件的位置、尺寸
     tfpos=getElementPos(id);
     xby=tfpos.y+tfpos.h-1;
     xbx=tfpos.x+tfpos.w/2;
     
     //显示错误信息表格
     document.all.myerr.style.left=xbx-70;
     document.all.myerr.style.top=xby+18;
     document.all.myerrs.innerHTML=msg; 
     document.all.myerr.style.visibility="visible"; 
     
     //显示表格上的尖角图片
     document.all.myup.style.left=xbx-40;
     document.all.myup.style.top=xby-2;  
     document.all.myup.style.visibility="visible";
     
     //获取错误信息表格位置、尺寸
     bgpos=getElementPos("myerr");
     
     //显示遮挡span
     document.all.errzd.style.left=xbx-70;
     document.all.errzd.style.top=xby+18;
     document.all.errzd.style.width=bgpos.w;
     document.all.errzd.style.height=bgpos.h;
     document.all.errzd.style.visibility="visible";
     
     //启动遮挡隐藏
     zdcount=5;
     span=bgpos.h/zdcount;
     setTimeout("xyzd("+span+","+(xby+18)+")",0);
  }
        
	//逐渐隐藏遮挡物
	function xyzd(span,top)
	{           
	   if(zdcount==0)
	   {
	      document.all.errzd.style.visibility="hidden";
	   }
	   else
	   {
	     document.all.errzd.style.height=span*zdcount; 
	     document.all.errzd.style.top=top+span*(5-zdcount); 
	     zdcount--;           
	     setTimeout("xyzd("+span+","+top+")",50);
	   }           
	}
        
    //隐藏错误信息气球		   
  function hideErr()
  {
      document.all.myerr.style.visibility="hidden"; 
      document.all.myup.style.visibility="hidden";
      document.all.errzd.style.visibility="hidden";
  } 
  function showMenu(id){  	
  	var recTemp=getElementPos("my");
  	var aa = document.getElementById(id);
		aa.style.top=recTemp.y+recTemp.h-4;
		aa.style.left=recTemp.x+recTemp.w/2-110;
		aa.style.visibility="visible";
  }
  function hideMenu(id){
  	var aa = document.getElementById(id);
  	aa.style.visibility="hidden";
  }