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
					title: "로그인 불가.",
					text: "서류심사가 완료되지 않았습니다.",
					icon : "info",
				}, function(){
					location.reload();
				});
            } else if (result.msg == "idFail") {
               swal({
					title: "로그인 실패.",
					text: "E_mail이 없습니다. E_mail을 확인해 주세요.",
					icon : "error",
				}, function(){
					location.reload();
				});
            } else if (result.msg == "hos_success") {
            sessionStorage.setItem('m_sido', result.m_sido);
                swal({
					title: "로그인 성공.",
					icon : "success",
					text: "환영합니다. 제휴병원에서 로그인 되었습니다.",
				}, function(){			
					window.location.href ="/home.do";
					$("#login_Div").hide();
				});
               
            } else if (result.msg == "pwFail") {
               swal({
					title: "로그인 실패.",
					icon : "error",
					text: "비밀번호가 일치하지 않습니다. 비밀번호를 확인하세요."
				}, function(){
					location.reload();
				});
            } else if(result.msg == "deleteMember"){
            	swal({
					title: "로그인 실패.",
					icon : "error",
					text: "탈퇴 된 E_mail입니다.\n 6개월 후 사용가능하며, 다른 E_mail로 가입해주세요 \n 회원가입으로 이동합니다."
				}, function(){
					window.location.href ="/signinForm.do";
				});
            } else {
            sessionStorage.setItem('m_sido', result.m_sido);
                swal({
					title: "로그인 성공.",
					text: "환영합니다. 성공적으로 로그인 되었습니다.",
					icon : "success",
				}, function(){
					window.location.href ="/home.do";					
				});
            }

         },
         error: function(error) {
            alert("error : " + error);
         }
      });

   }
}

function No_myPage(){
	swal('로그인 요청.', '로그인 후 이용가능합니다.', 'info');
}

function logout(){
	$.ajax({
         type: "POST",
         url: "/logout.do",
         success: function(data) {
	         swal({
						title: "로그아웃.",
						icon : "success",
						text: "성공적으로 로그아웃되었습니다."
					}, function(){
						window.location.href ="/home.do";					
					});
 			
         },
         error: function(error) {
            alert("error : " + error);
         }
      });
}

