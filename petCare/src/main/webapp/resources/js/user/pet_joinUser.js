/** 이름 태그 **/
const inputPetName = getpetElement('pet_name');
/** 이름 태그 **/

/** 어떤 동물 태그 **/
const inputUserAnimal = getpetElement('user_animal');
/** 어떤 동물 태그 **/

/** 나이 태그 **/
const inputUserOld = getpetElement('user_old');
/** 나이 태그 **/

const errorPetTypes = {
    pet: 'pet',
    animal: 'animal',
    old: 'old'
}

function getpetElement(id) {
    return $(`#${id}`);
}

function petdebounce(func, wait) {
    let inDebounce;
    return function () {
        const context = this;
        const args = arguments;

        // setTimeout이 실행된 Timeout의 ID를 반환하고, clearTimeout()으로 이를 해제할 수 있음을 이용
        clearTimeout(inDebounce);
        inDebounce = setTimeout(() => func.apply(context, arguments), wait);
    };
}


const petuser = {
    pet() {
        return inputPetName.val();
    },
    animal() {
        return inputUserAnimal.val()
    },
    old() {
        return inputUserOld.val();
    },
    info() {
        return {
            pet: this.pet(),
            animal: this.animal(),
            old: this.old(),
        }
    }
}

function petsetError(id, message) {
    const el = document.getpetElementById(id);
    if (message) {
        el.innerText = message;
        el.style.display = 'block';
    } else {
        el.style.display = 'none';
    }
}

async function onInputInvalids(type) {
    let message = false;
    let errorId = '';

    switch (type) {
        case errorPetTypes.pet:
            message = invalids.pet();
            errorId = 'error_pet';
            break;
        case errorPetTypes.animal:
            message = await invalids.animal();
            errorId = 'error_animal';
            break;
        case errorPetTypes.old:
            message = invalids.old();
            errorId = 'error_old';
            break;
    }

    setError(errorId, message);
}

/** 유효성 체크 함수 **/
const invalids = {
    pet() {
        /** 영/한 이외의 값이 있는지 체크(공백/특수문자/숫자 등등) **/
        const pet = petuser.pet();
        if (!pet) {
            return '이름을 입력해주세요.';
        }

        if (pet.length > 20) {
            return '이름은 20자리 이하여야 합니다.';
        }

        if (/[^a-zA-Z가-힣ㄱ-ㅎ]/g.test(pet)) {
            return '이름에 영문/한글 이외의 값은 입력 할 수 없습니다.';
        }
        return;
    },
    animal() {
        /** 영/한 이외의 값이 있는지 체크(공백/특수문자/숫자 등등) **/
        const animal = petuser.animal();
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
        if (/^[0-9]+$/.test(petuser.old())) {
            return
        }
        return '숫자로만 입력가능합니다.';
    },
    all() {
        return !this.pet() && !this.animal() && !this.old();
    }
}


/** 서브밋 함수 **/
function petsubmit() {
    if (invalids.all()) {
        // TODO: 모든 값들에 대해 유효성 통과
        petuser.info();
    } else {
        for(let type in errorPetTypes) {
            onInputInvalids(type);
        }
    }
}