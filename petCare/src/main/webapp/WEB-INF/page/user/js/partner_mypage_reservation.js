const pageList = 5; // 한개의 페이지에 보여질 목록 개수
const pageMax = 3; // 최대 생성될 페이지 개수 (페이지를 더보려면 이전, 다음 버튼 클릭해야함)    	
var idx = 0; //idx 값 확인 후 동적 페이지 전환 및 데이터 표시
var page = 1; //생성 시작할 페이지 번호



/* [페이징 처리 이벤트 수행 함수] */
function pageInsert(value){
    console.log("");
    console.log("[pageInsert] : [start] : " + value); 
    console.log("");


    // [페이징 목록 초기화 실시]
    $("#dyn_ul").empty();


    // [생성된 테이블 tr 개수 확인 >> 페이징 처리 5개씩 목록 자름]    		
    var startIndex = value; // 생성 시작 페이지    		
    var endIndex = $("#dyn_tbody tr").length; // tbody에 동적으로 추가된 tr 개수 확인


    // [tr 개수에 따라 페이징 해야할 개수 확인]
    var pageCount = 0;
    var pagePlus = 0;
    if(endIndex > pageList){ // tr 행 개수가 5 이상인 경우 (임의로 설정)
        pageCount = Math.floor(endIndex / pageList); //생성될 페이지 수 (소수점 버림)
        pagePlus = endIndex % pageList; //추가 나머지 자식 수
        if(pagePlus > 0){ //추가 자식수가 있는경우 >> 페이지 추가
            pageCount = pageCount + 1;
        }
    }


    // [생성될 페이지 번호가 전체 생성되야하는 길이보다 크거나 작은지 확인]
    if(startIndex > pageCount){ //길이 초과 시 기존꺼로 다시 저장
        startIndex = page;
    }
    else if(startIndex < 0){ //길이 미만 시 기존꺼로 다시 저장
        startIndex = page;
    }
    else {
        page = startIndex;
    }


    // [동적 ul 페이징 처리 실시]
    if(pageCount == 1){ //생성해야할 페이지가 1페이지인 경우
        var insertUl = "<li class='page-item'>"; // 변수 선언
        insertUl += insertUl + "<a class='page-link' href='javascript:void(0)' onclick = 'newPage(1);'>";
        insertUl += insertUl + i;
        insertUl += insertUl + "</a></li>";
        $("#dyn_ul").append(insertUl); //jquery append 사용해 동적으로 추가 실시      			
    }
    else if(pageCount >= 2){ //생성해야할 페이지가 2페이지 이상인 경우
        // 이전 페이지 추가 실시 
        var insertSTR = "<li class='page-item'>"; // 변수 선언
        insertSTR = insertSTR + "<a class='page-link' href='javascript:void(0)' onclick = 'newPage("+"-1"+");'>";
        insertSTR = insertSTR + "Previous";
        insertSTR = insertSTR + "</a></li>";
        $("#dyn_ul").append(insertSTR); //jquery append 사용해 동적으로 추가 실시      			

        // 특정 1, 2, 3 .. 페이지 추가 실시
        var count = 1;
        for(var i=startIndex; i<=pageCount; i++){
            if(count > pageMax){ //최대로 생성될 페이지 개수가 된 경우 
                page = i - pageMax; //생성된 페이지 초기값 저장 (초기 i값 4 탈출 인경우 >> 1값 저장)
                break; //for 반복문 탈출
            }
            var insertUl = "<li class='page-item'>"; // 변수 선언
            insertUl = insertUl + "<a class='page-link' href='javascript:void(0)' onclick = 'newPage("+i+");'>";
            insertUl = insertUl + String(i);
            insertUl = insertUl + "</a></li>";
            $("#dyn_ul").append(insertUl); //jquery append 사용해 동적으로 추가 실시  
            count ++;
        }

        // 다음 페이지 추가 실시
        var insertEND = "<li class='page-item'>"; // 변수 선언
        insertEND = insertEND + "<a class='page-link' href='javascript:void(0)' onclick = 'newPage("+"0"+");'>";
        insertEND = insertEND + "Next";
        insertEND = insertEND + "</a></li>";
        $("#dyn_ul").append(insertEND); //jquery append 사용해 동적으로 추가 실시
    }


    // [페이징 완료 후 >> tr 개수 전체 삭제 >> 페이징 개수에 맞게 다시 표시 실시]
    $("#dyn_tbody").empty(); //tbody tr 전체 삭제 실시


    // [새롭게 페이지 목록 리스트 처리 실시]
    newPage(startIndex);
};




/* [tbody tr 동적 삽입 이벤트 수행 함수] */    	
function newPage(pageCurrent){
    // [pageCurrent [-1] >> 이전 / pageCurrent [1 이상] >> 일반 / pageCurrent [0] >> 다음]
    console.log("");
    console.log("[newPage] : [start]"); 
    console.log("[newPage] : [page] : " + pageCurrent); 
    console.log("");

    // [새롭게 테이블 tbody tr 데이터 생성 실시]
    if(pageCurrent == -1){ // 이전 페이지
        $("#dyn_tbody").empty(); //tbody tr 전체 삭제 실시

        // [새롭게 페이징 처리 실시]
        var newIdx = page - pageMax;

        // [테이블 데이터에 따라 페이징 처리 실시]
        pageInsert(newIdx); //표시될 페이지 번호 전송
    } 
    else if(pageCurrent == 0){ // 다음 페이지
        $("#dyn_tbody").empty(); //tbody tr 전체 삭제 실시

        // [새롭게 페이징 처리 실시]
        var newIdx = page + pageMax;

        // [테이블 데이터에 따라 페이징 처리 실시]
        pageInsert(newIdx); //표시될 페이지 번호 전송
    }
    else { // 일반 테이블 목록 리스트 갱신
        $("#dyn_tbody").empty(); //tbody tr 전체 삭제 실시

        // 저장된 idx 에서 페이지 수를 곱해서 새로운 idx 지정
        // [1페이지 클릭 >> (1*5) -5 = 0 시작]
        // [2페이지 클릭 >> (2*5) -5 = 5 시작]
        idx = (pageCurrent * pageList) - pageList;
        						
    }
};

// 예약 가능 버튼
function deleteRowFunction(btn){

    var class_name = $(btn).attr('class');

    if (typeof(btn) == "object" && class_name == "btn save") {
        $(btn).closest("tr").remove();
        alert("예약이 확정되었습니다");
   
    } else if (typeof(btn) == "object" && class_name =="btn cancel"){
        $(btn).closest("tr").remove();
        alert("예약이 거절되었습니다");
    } else

    return false;
}

$(function() {
    //input을 datepicker로 선언
    $("#datepicker").datepicker({
        dateFormat: 'yy-mm-dd' 
        ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
        ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
        ,changeYear: true //콤보박스에서 년 선택 가능
        ,changeMonth: true //콤보박스에서 월 선택 가능                
        ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
        ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
        ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
        ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
        ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
        ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
        ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
        
    });                    
    
    //초기값을 오늘 날짜로 설정
    $('#datepicker').datepicker('setDate', 'today'); 
});