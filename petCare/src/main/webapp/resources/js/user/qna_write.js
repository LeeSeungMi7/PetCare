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

if (isConfirm) {
    swal('', '', "success");
} else {
    swal('', '', "failed");
}


function Ok() {
    alert('등록이 완료되었습니다.', 'success');
}
function Cancel() {
    alert('등록이 취소되었습니다', 'error');
}

