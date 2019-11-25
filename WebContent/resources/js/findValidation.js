function checkform(){
	var form = document.findId;
	
	var name = document.getElementById("name");
	var birth = document.getElementById("birth");
	var phone = document.getElementById("phone");
	
	var regPhone = /^01(?:0|1|[6-9])(?:\d{3}|\d{4})\d{4}$/;
	
	if(!name.value){
		alert("이름을 입력해 주세요.");
		return false;
	}else if(!birth.value){
		alert("생년월일을 입력해 주세요.");
		return false;
	}else if(!phone.value){
		alert("연락처를 입력해주세요.");
		return false;
	}
	
	
	
	if(birth.value.length != 8 ){
		alert("생년월일을 제대로 입력해주세요.");
		return false;
	}
	
	
	if(!check(regPhone,phone)){ // 연락처를 하이픈(-) 넣고 입력했을때
		alert("연락처를 제대로 입력해 주세요.")
		return false;
	}
	
	
	
	function check(regExp, e) {

		if (regExp.test(e.value)) {
			return true;
		}

		return false;
	}
	
	form.submit();
}

function checkpw(){
	var form = document.findPW;
	
	var id = document.getElementById("id");
	var name = document.getElementById("name");
	var birth = document.getElementById("birth");
	
	if(!id.value){
		alert("아이디를 입력해 주세요.");
		return false;
	}
	else if(!name.value){
		alert("이름을 입력해 주세요.");
		return false;
	}else if(!birth.value){
		alert("생년월일을 입력해 주세요.");
		return false;
	}
	if(birth.value.length != 8 ){
		alert("생년월일을 제대로 입력해주세요.");
		return false;
	}
	
	form.submit();
}