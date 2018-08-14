	function checkChangeInFo(){
	  	var reg2 = /^([0-9a-zA-Z]+[_.0-9a-zA-Z]+)@([a-zA-Z0-9]+[.])+([a-zA-Z]{2,3})$/;
		var email = document.all.email.value.trim();
		if(email==""){
			document.all.emailMsg.innerHTML="<img src='images/check_error.gif'/>"+
														"邮箱不得为空，请重新填写。";
			return false;
		}
		if(!reg2.test(email)){
			document.all.emailMsg.innerHTML="<img src='images/check_error.gif'/>"+
														"邮箱地址无效，请重新填写。";
			return false;
		}
		if(!checkPath()){							//验证文件格式是否正确
			return false;
		}
		return true;
	}
	function checkPath(){
		var path = document.all.pic.value.trim();
		var length = path.length;					//得到上传文件名字符串长度
		var begin = path.lastIndexOf(".");			//得到文件后缀中.的起始下标
		type = path.substring(begin,length);		//生成自己的文件名
		type = type.toUpperCase();
		var reg = /^.GIF|.BMP|.PNG|.JPG|.JPEG$/;//允许上传的文件格式
		if(path==""){
			return true;
		}
		if(!reg.test(type)){
			document.all.picMsg.innerHTML="<img src='images/check_error.gif'/>"+
														"文件格式应为[jpg,jpeg,gif,png,bmp]中的一种";
			return false;
		}
		document.all.picMsg.innerHTML="";
		return true;															
	}