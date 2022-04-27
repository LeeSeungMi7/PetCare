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