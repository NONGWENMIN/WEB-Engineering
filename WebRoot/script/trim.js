String.prototype.trim=function()
{
  return this.replace(/(^\s*)|(\s*$)/g,"");
}
function reloadImage(){/*重新加载验证码图片*/
  	document.all.pic.src='yzm.jsp?'+Math.random();
}