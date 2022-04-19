/** 이름 태그 **/
const inputUserName = getElement('user_name');
/** 이름 태그 **/

/** 어떤 동물 태그 **/
const inputUserAnimal = getElement('user_animal');
/** 어떤 동물 태그 **/

/** 나이 태그 **/
const inputUserOld = getElement('user_old');
/** 나이 태그 **/

const errorTypes = {
    name: 'name',
    animal: 'animal',
    old: 'old'
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
    animal() {
        return inputUserAnimal.val()
    },
    old() {
        return inputUserOld.val();
    },
    info() {
        return {
            name: this.name(),
            animal: this.animal(),
            old: this.old(),
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

async function onInputInvalid(type) {
    let message = false;
    let errorId = '';

    switch (type) {
        case errorTypes.name:
            message = invalid.name();
            errorId = 'error_name';
            break;
        case errorTypes.animal:
            message = await invalid.animal();
            errorId = 'error_animal';
            break;
        case errorTypes.old:
            message = invalid.old();
            errorId = 'error_old';
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

        if (name.length > 20) {
            return '이름은 20자리 이하여야 합니다.';
        }

        if (/[^a-zA-Z가-힣ㄱ-ㅎ]/g.test(name)) {
            return '이름에 영문/한글 이외의 값은 입력 할 수 없습니다.';
        }
        return;
    },
    animal() {
        /** 영/한 이외의 값이 있는지 체크(공백/특수문자/숫자 등등) **/
        const animal = user.animal();
        if (!animal) {
            return '종류를 입력해주세요.';
        }

        if (animal.length > 20) {
            return '20자리 이하여야 합니다.';
        }

        if (/[^a-zA-Z가-힣ㄱ-ㅎ]/g.test(animal)) {
            return '이름에 영문/한글 이외의 값은 입력 할 수 없습니다.';
        }
        return;
    },

    old() {
        if (/^[0-9]+$/.test(user.old())) {
            return
        }
        return '숫자로만 입력가능합니다.';
    },
    all() {
        return !this.name() && !this.animal() && !this.old();
    }
}


/** 서브밋 함수 **/
function submit() {
    if (invalid.all()) {
        // TODO: 모든 값들에 대해 유효성 통과
        user.info();
    } else {
        for(let type in errorTypes) {
            onInputInvalid(type);
        }
    }
}