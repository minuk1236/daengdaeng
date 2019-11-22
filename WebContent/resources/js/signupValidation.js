function checkSignup() { // 회원가입 입력 폼 검사
	var form = document.signform;

	var id = document.getElementById("id");
	var password = document.getElementById("password");
	var passwordCheck = document.getElementById("passwordCheck");
	var name = document.getElementById("name");
	var birth = document.getElementById("birth");
	var gender = document.getElementsByName("gender");
	var email = document.getElementById("email");
	var phone = document.getElementById("phone");

	var regPW = /^[A-Za-z0-9]{6,12}$/; // 비밀번호 정규식
	var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; //이메일 정규식
	var regPhone = /^01(?:0|1|[6-9])(?:\d{3}|\d{4})\d{4}$/; // 연락처 정규식

	if (!id.value) {
		alert("아이디 항목을 채워주세요.");
		id.focus();
		return false;
	} else if (!password.value) {
		alert("비밀번호 항목을 채워주세요.");
		password.focus();
		return false;
	} else if (!passwordCheck.value) {
		alert("비미번호 확인 항목을 채워주세요.");
		passwordCheck.focus();
		return false;
	} else if (!name.value) {
		alert("이름 항목을 채워주세요.");
		name.focus();
		return false;
	} else if (!birth.value) {
		alert("생년월일 항목을 채워주세요.");
		birth.focus();
		return false;
	} else if (!gender[0].checked && !gender[1].checked) {
		alert("성별을 선택해주세요.");
		gender.focus();
		return false;
	} else if (!email.value) {
		alert("이메일 항목을 채워주세요.");
		email.focus();
		return false;
	} else if (!phone.value) {
		alert("연락처 항목을 채워주세요.");
		phone.focus();
		return false;
	}

	// 비밀번호 유효성 체크
	if (check(regPW, password)) {
		if (password.value != passwordCheck.value) {
			alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
			passwordCheck.select();
			passwordCheck.focus();
			return false;
		}
	} else {
		alert("대 소문자 및 숫자를 포함한 6자리 이상 12자리 이하로 작성해주세요.");
		return false;
	}

	// 생년월일 유효성 체크
	if (birth.value.length == 8) {
		var tmp1 = parseInt(birth.value.toString().substring(4, 6)) // 월에 해당 (1월
																	// ~ 12월)
		var tmp2 = parseInt(birth.value.toString().substring(6, 8)) // 일에 해당 (1일
																	// ~ 31일)

		if (tmp1 < 1 || tmp1 > 12) { // 월이 틀린 경우
			alert("생년월일를 잘못 입력하셨습니다.");
			birth.select();
			birth.focus();
			return false;
		} else { // 월은 맞지만 일이 틀린경우
			switch (tmp1) {
			case 1:
			case 3:
			case 5:
			case 7:
			case 8:
			case 10:
			case 12:
				if (tmp2 < 1 || tmp2 > 31) {
					alert("생년월일를 잘못 입력하셨습니다.");
					birth.select();
					birth.focus();
					return false;
				}
				break;
			case 4:
			case 6:
			case 9:
			case 11:
				if (tmp2 < 1 || tmp2 > 30) {
					alert("생년월일를 잘못 입력하셨습니다.");
					birth.select();
					birth.focus();
					return false;
				}
				break;
			case 2:
				if (tmp2 < 1 || tmp2 > 28) {
					alert("생년월일를 잘못 입력하셨습니다.");
					birth.select();
					birth.focus();
					return false;
				}
				break;
			}
		}
	} else {
		alert("생년월일를 잘못 입력하셨습니다.");
		birth.select();
		birth.focus();
		return false;
	}
	
	if(!check(regEmail, email)){
		alert("이메일을 제대로 작성해주세요.");
		email.select();
		email.focus();
		return false;
	}
	
	

	if(!check(regPhone, phone)){
		alert("연락처를 제대로 작성해주세요.");
		phone.select();
		phone.focus();
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
function checkId() { // 아이디 중복 체크

	var id = document.getElementById("id");
	var regId = /^[a-zA-Z0-9]*$/; // 아이디 정규식 영어 숫자 만 가능

	if (!id.value) {
		alert("아이디를 입력하지 않았습니다.");
		id.focus();
		return false;
	}
	
	if(!check(regId,id)){
		alert("아이디는 영어와 숫자만 입력 가능합니다.");
		id.select();
		id.focus();
		return false;
	}else{		
		var user_id = id.value;
		var url = "/DaengDaeng/account/checkid.jsp?id=" + user_id;
		open(url,"ID_CHECK", "toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300,height=200");
			
	}
	
	function check(regExp, e) {

		if (regExp.test(e.value)) {
			return true;
		}

		return false;
	}

}

