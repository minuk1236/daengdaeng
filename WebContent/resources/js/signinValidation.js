function check(){
	
	var form = document.signin;
	
	var id = document.getElementById("id");
	var password = document.getElementById("password");
	
	if(!id.value){
		alert("아이디를 제대로 입력해주세요.");
		return false;
	}else if(!password.value){
		alert("비밀번호를 제대로 입력해주세요.");
		return false;
	}
	
	form.submit();
}