Morris.Bar({
    element: "bar-example", // bar를 넣을 div의 아이디를 적어주세요.
    data: [
        { // bar를 넣을 x축과 y축의 데이터를 적어줍니다.
            y: "월요일",
            a: 93,
            b: 80
        }, {
            y: "화요일",
            a: 75,
            b: 65
        }, {
            y: "수요일",
            a: 50,
            b: 40
        }, {
            y: "목요일",
            a: 50,
            b: 40
        }, {
            y: "금요일",
            a: 50,
            b: 40
        }, {
            y: "토요일",
            a: 50,
            b: 40
        }, {
            y: "일요일",
            a: 50,
            b: 40
        }
    ],
    xkey: "y", //x축에 들어갈 이름을 넣은 data이름을 넣어줍니다
    ykeys: [
        "a", "b"
    ], //y축에 들어갈 이름을 넣은 data이름을 넣어줍니다
    labels: ["질문", "답변"] // 라벨칸에 나타날 이름을 적어줍니다.
});
$(function () {
    //input을 datepicker로 선언
    $("#datepicker1").datepicker({
        dateFormat: 'yy-mm-dd', showOtherMonths: true, //빈 공간에 현재월의 앞뒤월의 날짜를 표시
        showMonthAfterYear: true, //년도 먼저 나오고, 뒤에 월 표시
        changeYear: true, //콤보박스에서 년 선택 가능
        changeMonth: true, //콤보박스에서 월 선택 가능
        showOn: "both", //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시
        buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif", //버튼 이미지 경로
        buttonImageOnly: true, //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
        buttonText: "선택", //버튼에 마우스 갖다 댔을 때 표시되는 텍스트
        yearSuffix: "년", //달력의 년도 부분 뒤에 붙는 텍스트
        monthNamesShort: [
            '1',
            '2',
            '3',
            '4',
            '5',
            '6',
            '7',
            '8',
            '9',
            '10',
            '11',
            '12'
        ], //달력의 월 부분 텍스트
        monthNames: [
            '1월',
            '2월',
            '3월',
            '4월',
            '5월',
            '6월',
            '7월',
            '8월',
            '9월',
            '10월',
            '11월',
            '12월'
        ], //달력의 월 부분 Tooltip 텍스트
        dayNamesMin: [
            '일',
            '월',
            '화',
            '수',
            '목',
            '금',
            '토'
        ], //달력의 요일 부분 텍스트
        dayNames: [
            '일요일',
            '월요일',
            '화요일',
            '수요일',
            '목요일',
            '금요일',
            '토요일'
        ] //달력의 요일 부분 Tooltip 텍스트

    });

    //초기값을 오늘 날짜로 설정
    $('#datepicker1').datepicker('setDate', 'today');
    $("#datepicker2").datepicker({
        dateFormat: 'yy-mm-dd', showOtherMonths: true, //빈 공간에 현재월의 앞뒤월의 날짜를 표시
        showMonthAfterYear: true, //년도 먼저 나오고, 뒤에 월 표시
        changeYear: true, //콤보박스에서 년 선택 가능
        changeMonth: true, //콤보박스에서 월 선택 가능
        showOn: "both", //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시
        buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif", //버튼 이미지 경로
        buttonImageOnly: true, //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
        buttonText: "선택", //버튼에 마우스 갖다 댔을 때 표시되는 텍스트
        yearSuffix: "년", //달력의 년도 부분 뒤에 붙는 텍스트
        monthNamesShort: [
            '1',
            '2',
            '3',
            '4',
            '5',
            '6',
            '7',
            '8',
            '9',
            '10',
            '11',
            '12'
        ], //달력의 월 부분 텍스트
        monthNames: [
            '1월',
            '2월',
            '3월',
            '4월',
            '5월',
            '6월',
            '7월',
            '8월',
            '9월',
            '10월',
            '11월',
            '12월'
        ], //달력의 월 부분 Tooltip 텍스트
        dayNamesMin: [
            '일',
            '월',
            '화',
            '수',
            '목',
            '금',
            '토'
        ], //달력의 요일 부분 텍스트
        dayNames: [
            '일요일',
            '월요일',
            '화요일',
            '수요일',
            '목요일',
            '금요일',
            '토요일'
        ] //달력의 요일 부분 Tooltip 텍스트

    });

    //초기값을 오늘 날짜로 설정
    $('#datepicker2').datepicker('setDate', 'today');
});