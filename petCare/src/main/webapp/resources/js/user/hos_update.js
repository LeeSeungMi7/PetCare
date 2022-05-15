$(document).ready(function () {
    var fileTarget = $('.filebox .upload-hidden');
    fileTarget.on('change', function () { // 값이 변경되면
        if (window.FileReader) { // modern browser
            var filename = $(this)[0].files[0].name;
        } else { // old IE
            var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출
        } // 추출한 파일명 삽입
        $(this)
            .siblings('.upload-name')
            .val(filename);
    });
    
    $("#jb-checkbox").change(function(){
      if($("#jb-checkbox").is(":checked")){
          $("#p_24hour").val("1");
          alert("24시간 병원");
      }
      else{
          alert("24시간 병원 아님");
      }
  });
  
});



/** 비밀번호 태그 **/
const inputUserPassword = getElement('user_password');
const inputUserCheckPassword = getElement('user_check_password');
/** 비밀번호 태그 **/

/** 연락처 태그 **/
const inputUserPhoneNumberPre = getElement('user_phone_number_pre');
const inputUserPhoneNumberIn = getElement('user_phone_number_in');
const inputUserPhoneNumberPost = getElement('user_phone_number_post');
/** 연락처 태그 **/

/** 주소 태그 **/
const inputUserPost = getElement('user_post');
const inputUserAddr = getElement('user_addr');
const inputUserAddrDetail = getElement('user_addr_detail');

/** 진료시간 태그 **/
const inputUserWeekdayStart = getElement('user_weekday_start');
const inputUserWeekdayEnd = getElement('user_weekday_end');
const inputUserWeekendStart = getElement('user_weekend_start');
const inputUserWeekendEnd = getElement('user_weekend_end');
const inputUserLunchStart = getElement('user_lunch_start');
const inputUserLunchEnd = getElement('user_lunch_end');



const errorTypes = {
    
    password: 'password',
    passwordCheck: 'passwordCheck',
    phoneNumber: 'phoneNumber',
    address: 'address',
    openingHours: 'openingHours',
}

function getElement(id) {
    return $(`#${id}`);
}



const user = {
   
    phoneNumber() {
        return `${inputUserPhoneNumberPre.val()}${inputUserPhoneNumberIn.val()}${inputUserPhoneNumberPost.val()}`
    },
    password() {
        return inputUserPassword.val()
    },
    
    address() {
        return inputUserAddr.val();
    },
    addressPost() {
        return inputUserPost.val();
    },
    addressDetail() {
        return inputUserAddrDetail.val();
    },
    weekdayStart() {
        return inputUserWeekdayStart.val();
    },
    weekdayEnd() {
        return inputUserWeekdayEnd.val();
    },
    weekendStart() {
        return inputUserWeekendStart.val();
    },
    weekendEnd() {
        return inputUserWeekendEnd.val();
    },
    lunchStart() {
        return inputUserLunchStart.val();
    },
    lunchEnd() {
        return inputUserLunchEnd.val();
    },
    mapId() {
        return inputUserMapId.val();
    },
    info() {
        return {
            
            phoneNumber: this.phoneNumber(),
            password: this.password(),
           
            address: this.address(),
            addressPost: this.addressPost(),
            addressDetail: this.addressDetail(),
            weekdayStart: this.weekdayStart(),
            weekdayEnd: this.weekdayEnd(),
            weekendStart: this.weekendStart(),
            weekendEnd: this.weekendEnd(),
            lunchStart: this.lunchStart(),
            lunchEnd: this.lunchEnd(),
            mapId: this.mapId()
        }
    }
}

function setError(id, message) {
    const el = document.getElementById(id);
    if (message) {
        el.innerText = message;
        el.style.display = 'block';
    } else {
        el.style.display = 'none';
    }
}

 function onInputInvalid(type) {
    let message = false;
    let errorId = '';

    switch (type) {
       
        case errorTypes.password:
            message = invalid.password();
            errorId = 'error_password';
            break;
        case errorTypes.passwordCheck:
            message = invalid.passwordCheck();
            errorId = 'error_password';
            break;
        case errorTypes.phoneNumber:
            message = invalid.phoneNumber();
            errorId = 'error_phone_number';
            break;
        case errorTypes.address:
            message = invalid.address();
            errorId = 'error_address';
            break;
        case errorTypes.openingHours:
            message = invalid.openingHours();
            errorId = 'error_time';
            break;
    }

    setError(errorId, message);
}

/** 유효성 체크 함수 **/
const invalid = {
    
    password() {
        const password = user.password();
        if (password.length < 7 || password.length > 15) {
            return '비밀번호는 7~15까지 가능 합니다.'
        }

        return;
    },

    passwordCheck() {
        const password = user.password();
        if (password.length < 7 || password.length > 15) {
            return '비밀번호는 7~15까지 가능 합니다.'
        }

        if (password !== inputUserCheckPassword.val()) {
            return '입력된 비밀번호가 다릅니다.'
        }

        return;
    },

    phoneNumber() {
    
        if (/^[0-9]+$/.test(user.phoneNumber())) {
            
            return
        }
       
        return '번호를 확인해주세요.';
    	
    },
    address() {
        if (user.address() && user.addressPost() && user.addressDetail()) {
            return;
        }

        return '주소를 모두 입력해주세요.';
    },
    openingHours() {
		const openingHours = `${user.weekdayStart()}${user.weekdayEnd()}${user.weekendStart()}${user.weekendEnd()}${user.lunchStart()}${user.lunchEnd()}`;
        if (/^((([0-1][0-9])|(2[0-3])):[0-5][0-9]){6}$/.test(openingHours)) {
            return
        }
        return '모든 진료시간을 00:00 형태로 입력해주세요';
      	
    },
    

    all() {
        return !this.name() && !this.phoneNumber() && !this.password() && !this.passwordCheck() && !this.address() && !this.openingHours();
    }
}


var alert = function (msg, type) {
    swal({
        title: '',
        text: msg,
        type: type,
        timer: 1500,
        customClass: 'sweet-size',
        showConfirmButton: false
    });
}




function Ok() {
    alert('신청이 완료되었습니다.', 'success');
}
function Cancel() {
    alert('취소되었습니다', 'error');
}



