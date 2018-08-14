function change(num){
	var s = document.getElementById("a"+num);
	s.className="menuon";
	for(var i=1;i<10;i++){
		if(i!=num){
			var a = document.getElementById("a"+i);
			a.className="";
		}
	}
}