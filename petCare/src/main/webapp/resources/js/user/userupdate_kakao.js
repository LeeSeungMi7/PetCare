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
    
    phoneNumber() {
        return `${selectUserPhoneNumberPre.val()}${inputUserPhoneNumberIn.val()}${inputUserPhoneNumberPost.val()}`
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
            phoneNumber: this.phoneNumber()
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
        return !this.phoneNumber() && !this.address() && !this.openingHours();
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
