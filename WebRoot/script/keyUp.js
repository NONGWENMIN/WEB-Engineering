function keyUp(e){
		   var isIE=navigator.appName=="Microsoft Internet Explorer";
		   if (isIE)
		   {
		       var ieKey=event.keyCode; var nKey=0;
		   }
		   else
		   {
		        var nKey=e.which; 
		        var ieKey=0;
		   }
		   if(ieKey==13||nKey==13)
		   {
		       document.all.button.click();
		   }
		}