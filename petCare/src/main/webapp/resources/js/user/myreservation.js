function deleteRowFunction(btn) {

    var class_name = $(btn).attr('class');

    if (typeof(btn) == "object" && class_name == "btn-success btn-sm") {
        $(btn)
            .closest("tr")
        swal('예약이 수정되었습니다.', '병원으로 수정된 예약시간이 전송되었습니다.', 'success');

    } else if (typeof(btn) == "object" && class_name == "btn-danger btn-sm") {
        $(btn)
            .closest("tr")
            .remove();
        swal('예약이 취소되었습니다.', '병원 페이지를 통해 재 예약이 가능합니다.', 'error');
    } else 

    return false;
}