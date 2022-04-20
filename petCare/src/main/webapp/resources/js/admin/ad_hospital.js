function deleteRowFunction(btn) {

    var class_name = $(btn).attr('class');

    if (typeof(btn) == "object" && class_name == "btn1 save") {
        $(btn)
            .closest("tr")
            .remove();
        swal('요청이 승인되었습니다.', '협력 병원 명단으로 이동되었습니다', 'success');

    } else if (typeof(btn) == "object" && class_name == "btn1 cancel") {
        $(btn)
            .closest("tr")
            .remove();
        swal('요청이 기각되었습니다.', '요청이 기각되어 문자가 발송되었습니다.', 'error');
    } else 

    return false;
}