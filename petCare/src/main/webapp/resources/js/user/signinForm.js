function user_signin(){

    var chk1= $("#checkbox").is(":checked");
   
    if(!chk1){
        swal('동의해주세요','약관 동의를 체크해주세요', 'info');
    }

    if(chk1){
        $(location).attr("href", "/user_joinUser.do");
    }
}

function partner_signin(){

    var chk1= $("#checkbox").is(":checked");

    if(!chk1){
        swal('동의해주세요','약관 동의를 체크해주세요', 'info');
    }

    if(chk1){
        $(location).attr("href", "/hos_joinUser.do");
    }
}

$(document).ready(function(){
	$(#btnSave).click(function(){
		var title= $("#title").val();
		var content = $("#ir1").val();
		var writer = $("#writer").val();
		if(title == ""){
			alert("제목을 입력하세요.");
			document.form1.title.focus();
			return;
		}
		if(content == ""){
			alert("내용을 입력하세요.");
			document.form1.content.focus();
			return;
		}
		alert("등록되었습니다.")
		document.form1.submit();
		
	});
});