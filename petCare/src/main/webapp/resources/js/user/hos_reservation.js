function deleteRowFunction(btn) {

    var class_name = $(btn).attr('class');

    if (typeof (btn) == "object" && class_name == "btn-success btn-sm") {
        $(btn)
            .closest("tr")
            .remove();
        swal('예약을 승인하였습니다.', '보호자에게 문자가 발송되었습니다.', 'success');

    } else if (typeof (btn) == "object" && class_name == "btn-danger btn-sm") {
        $(btn)
            .closest("tr")
            .remove();
        swal('예약을 기각하였습니다.', '보호자에게 문자가 발송되었습니다.', 'error');
    } else

        return false;
}
function ReportToExcelConverter() {
    $("#resevtable").table2excel({
        exclude: ".noExl", 
        name: "총 예약 현황", 
        filename: "총 예약 현황.xls", //확장자를 여기서 붙여줘야한다.
        fileext: ".xls",
        exclude_img: true,
        exclude_links: true,
        exclude_inputs: true
    });
};