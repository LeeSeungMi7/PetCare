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



/** 이름 태그 **/
const inputUserName = getElement('user_name');
/** 이름 태그 **/

/** 이메일 태그 **/
const inputUserEmail = getElement('user_email');
/** 이메일 태그 **/

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

/** 병원 맵 고유 아이디 **/
const inputUserMapId = getElement('user_map_id');


const errorTypes = {
    name: 'name',
    email: 'email',
    password: 'password',
    passwordCheck: 'passwordCheck',
    phoneNumber: 'phoneNumber',
    address: 'address',
    openingHours: 'openingHours',
}

function getElement(id) {
    return $(`#${id}`);
}

function debounce(func, wait) {
    let inDebounce;
    return function () {
        const context = this;
        const args = arguments;

        // setTimeout이 실행된 Timeout의 ID를 반환하고, clearTimeout()으로 이를 해제할 수 있음을 이용
        clearTimeout(inDebounce);
        inDebounce = setTimeout(() => func.apply(context, arguments), wait);
    };
}


const user = {
    name() {
        return inputUserName.val();
    },
    phoneNumber() {
        return `${inputUserPhoneNumberPre.val()}${inputUserPhoneNumberIn.val()}${inputUserPhoneNumberPost.val()}`
    },
    password() {
        return inputUserPassword.val()
    },
    email() {
        return inputUserEmail.val();
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
            name: this.name(),
            phoneNumber: this.phoneNumber(),
            password: this.password(),
            email: this.email(),
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
        case errorTypes.name:
            resetMapId()
            message = invalid.name();
            errorId = 'error_name';
            break;
        case errorTypes.email:
            message = invalid.email();
            errorId = 'error_email';
            break;
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
    name() {
        /** 영/한 이외의 값이 있는지 체크(공백/특수문자/숫자 등등) **/
        const name = user.name();
        if (!name) {
            return '병원 이름을 입력해주세요.';
        }

        if (name.length > 20) {
            return '병원 이름은 20자리 이하여야 합니다.';
        }

        if (/[\s]/g.test(name)) {
            return '병원 이름에 공백은 입력할 수 없습니다.';
        }
        
        if (/[`~!@#$%^&*|\\\'\";:\/?]/gi.test(name)) {
            return '병원 이름에 특수문자는 입력할 수 없습니다.';
        }
        return;
    },
    email() {
        const emailFormat = /^([\w\.\_\-])*[a-zA-Z0-9]+([\w\.\_\-])*([a-zA-Z0-9])+([\w\.\_\-])+@([a-zA-Z0-9]+\.)+[a-zA-Z0-9]{2,8}$/.test(user.email())
        if (!emailFormat) {
            return '이메일 형식이 잘못됐습니다.';
        }
        return; 
    },
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
    mapId() {
        if (user.mapId()) {
            return
        }

        alert('병원 정보가 정확한지 조회해주세요.', 'error')
    },

    all() {
        return !this.name() && !this.phoneNumber() && !this.password() && !this.passwordCheck() && !this.address() && !this.openingHours() && !this.mapId();
    }
}

function findAddr() {
    new daum.Postcode({
        oncomplete: function (data) {

            console.log(data);

            const roadAddr = data.roadAddress; // 도로명 주소 변수
            const jibunAddr = data.jibunAddress; // 지번 주소 변수

            inputUserPost.val(data.zonecode);

            if (!!roadAddr || !!jibunAddr) {
                inputUserAddr.val(roadAddr || jibunAddr);
            }
            resetMapId()
        }
    }).open();
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

/*if (isConfirm) {
    swal('', '', "success");
} else {
    swal('', '', "failed");
}*/


function Ok() {
    alert('신청이 완료되었습니다.', 'success');
}
function Cancel() {
    alert('취소되었습니다', 'error');
}


const mapContainer = document.getElementById('map'), // 지도를 표시할 div
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3, // 지도의 확대 레벨
    };

// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
const map = new kakao.maps.Map(mapContainer, mapOption);
const ps = new kakao.maps.services.Places();

function searchPlaces() {
    ps.keywordSearch(`${user.address()} ${user.name()}`, placesSearchCB);
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    console.error(status)
    if (status === kakao.maps.services.Status.OK) {
        if (data.length > 0) {
            const position = new kakao.maps.LatLng(data[0].y, data[0].x);

            new kakao.maps.Marker({
                map: map,
                position: position
            });
            map.panTo(position);
            inputUserMapId.val(data[0].id)
        } else {
            alert('병원 정보를 찾을수 없습니다.', 'error')
        }

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
        alert('병원 정보를 찾을수 없습니다.', 'error')
    } else if (status === kakao.maps.services.Status.ERROR) {
        // 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요
    }
}

function resetMapId() {
    inputUserMapId.val('');
}
