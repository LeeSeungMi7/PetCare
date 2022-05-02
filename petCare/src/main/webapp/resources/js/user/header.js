function fn_loginCheck() {
	var check_id = $("input[name='m_id']").val();
	var check_pw = $("input[name='m_pw']").val();

	if (check_id == "") {
		swal('E_mail 입력', 'E_mail을 입력해주세요', 'info');
		return;
	}
	if (check_pw == "") {
		swal('비밀번호 입력', '비밀번호를 입력해주세요', 'info');
		return;
	}
	if (check_id != "" && check_pw != "") {
		$.ajax({
			type: "POST",
			data: {
				"userId": check_id,
				"userPw": check_pw
			},
			url: "/user_login.do",
			dataType: "json",
			success: function(result) {
				if (result.msg == "status") {
					
					swal({
						title: "서류심사중입니다",
						icon : "info",
						closeOnClickOutside: false
					}, function(){
						modalclose();
					});
				} else if (result.msg == "idFail") {
					swal('로그인 실패', 'E_mail이 없습니다', 'error');
				} else if (result.msg == "hos_success") {
					swal('로그인 성공', '로그인되었습니다', 'success');
					modalclose();
				} else if (result.msg == "pwFail") {
					swal('로그인 실패', '비밀번호를 확인해주세요', 'error');
					modalclose();
				} else {
					swal('로그인 성공', '로그인되었습니다', 'success');
					modalclose();
				}

			},
			error: function(error) {
				alert("error : " + error);
			}
		});

	}
}

function modalclose(){
	console.log('모달 닫기');
	
}


