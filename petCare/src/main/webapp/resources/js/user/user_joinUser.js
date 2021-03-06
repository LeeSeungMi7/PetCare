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
const selectUserPhoneNumberPre = getElement('user_phone_number_pre');
const inputUserPhoneNumberIn = getElement('user_phone_number_in');
const inputUserPhoneNumberPost = getElement('user_phone_number_post');
/** 연락처 태그 **/

/** 주소 태그 **/
const inputUserPost = getElement('user_post');
const inputUserAddr = getElement('user_addr');
const inputUserAddrDetail = getElement('user_addr_detail');
/**주소 태그 */

const errorTypes = {
    name: 'name',
    email: 'email',
    password: 'password',
    passwordCheck: 'passwordCheck',
    phoneNumber: 'phoneNumber',
    address: 'address'
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
        return `${selectUserPhoneNumberPre.val()}${inputUserPhoneNumberIn.val()}${inputUserPhoneNumberPost.val()}`
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
    info() {
        return {
            name: this.name(),
            phoneNumber: this.phoneNumber(),
            password: this.password(),
            email: this.email()
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
    }

    setError(errorId, message);
}

/** 유효성 체크 함수 **/
const invalid = {
    name() {
        /** 영/한 이외의 값이 있는지 체크(공백/특수문자/숫자 등등) **/
        const name = user.name();
        if (!name) {
            return '이름을 입력해주세요.';
        }

        if (name.length > 10) {
            return '이름은 10자리 이하여야 합니다.';
        }

        if (/[^a-zA-Z가-힣ㄱ-ㅎ]/g.test(name)) {
            return '이름에 영문/한글 이외의 값은 입력 할 수 없습니다.';
        }
        return;
    },
    email() {
        const emailFormat = /^([\w\.\_\-])*[a-zA-Z0-9]+([\w\.\_\-])*([a-zA-Z0-9])+([\w\.\_\-])+@([a-zA-Z0-9]+\.)+[a-zA-Z0-9]{2,8}$/.test(user.email())
        if (!emailFormat) {
            return '이메일 형식이 잘못됐습니다.';
        }

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
        if (/^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/.test(user.phoneNumber())) {
            return
        }

        return '핸드폰 번호를 확인해주세요.';
    },
    address() {
        if (user.address() && user.addressPost() && user.addressDetail()) {
            return;
        }

        return '주소를 모두 입력해주세요.';
    },
    all() {
        return !this.name() && !this.phoneNumber() && !this.password() && !this.passwordCheck() && !this.address() && !this.openingHours();
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
        }
    }).open();
}


function openModal(modalname){
		    document.get
		    $("#modal").fadeIn(300);
		    $("."+modalname).fadeIn(300);
		  } 
		  
         $("#modal, .close").on('click',function(){
		    $("#modal").fadeOut(300);
		    $(".modal-con").fadeOut(300);
		   	
});






