<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <link href="/resources/css/user/index.css" rel="stylesheet">
    <link href="/resources/css/user/color.css" rel="stylesheet">
    <link href="/resources/css/user/text.css" rel="stylesheet">
    <link href="/resources/css/user/header.css" rel="stylesheet">
    <link href="/resources/css/user/footer.css" rel="stylesheet">
    <link href="/resources/css/user/button.css" rel="stylesheet">
    <link href="/resources/css/user/loginForm.css" rel="stylesheet">
    <link href="/resources/css/user/home.css" rel="stylesheet">
    <link href="/resources/css/user/signinForm.css" rel="stylesheet">
    <!--부트스트랩-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"  crossorigin="anonymous">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <!-- 제이쿼리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!--alert-->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
    <!-- 카카오 주소 -->
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <!-- 카카오 MAP API-KEY -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1e818982c81810e2470dd6b0b339e676&libraries=services"></script>
<link href="/resources/img/petcare_logo.png" rel="shortcut icon" type="image/x-icon">
<title>PetCare Page</title>
</head>

<body>
<div id="pet-layout" class="background--white">
    <!--헤더-->
	<%@ include file="/WEB-INF/page/user/views/header.jsp" %>

    <!--본문-->
              <div class="pet-body pet-home">

              <section name="f">
                <div class="outerBox" align="center">


                  <table>
                    <tr>
                    <td>
                    <h1>회원가입</h1>
                    </td>
                    </tr>
                    <tr>
                    <td>
                      <a href="/home.do"> <button type = "button"  class="button_class_cancel">취소하기</button></a>
                    </td>
                	</tr>
                     <tr>
                      <td>
                          
                          <!--이용약관 테이블 시작-->
                          <table>
                            <tr>
                              <td>
                                <div>
                                 <label class="fontclass">01</label> 
                                 <font>이용약관</font>
                                </div>
                             </td>
                           </tr>
                           <tr>
                             <td align=center>
                               <textarea class="form-control" style="width : 40rem; background-color:#F2FFED;" disabled>
본 약관은 다양한 PetCare 서비스의 이용과 관련하여 PetCare 서비스를 제공하는 PetCare 주식회사(이하 PetCare)와 이를 이용하는 PetCare 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 PetCare 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
                
 PetCare 서비스를 이용하시거나 PetCare 서비스 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다
                
PetCare는 기본적으로 여러분 모두에게 동일한 내용의 서비스를 제공합니다. 다만,'청소년보호법'등 관련 법령이나 기타 개별 서비스 제공에서의 특별한 필요에 의해서 연령 또는 일정한 등급을 기준으로 이용자를 구분하여 제공하는 서비스의 내용, 이용 시간, 이용 횟수 등을 다르게 하는 등 일부 이용을 제한하는 경우가 있습니다. 자세한 내용은 역시 각 서비스 상의 안내, 공지사항, 고객센터 도움말 등에서 확인하실 수 있습니다.
                
회원으로 가입하시면 PetCare는 서비스를 보다 편리하게 이용할 수 있습니다.
                
여러분은 본 약관을 읽고 동의하신 후 회원 가입을 신청하실 수 있으며, PetCare는 이에 대한 승낙을 통해 회원 가입 절차를 완료하고 여러분께 PetCare는 서비스 이용 계정(이하 ‘계정’)을 부여합니다. 계정이란 회원이 PetCare 서비스에 로그인한 이후 이용하는 각종 서비스 이용 이력을 회원 별로 관리하기 위해 설정한 회원 식별 단위를 말합니다.
                
회원은 자신의 계정을 통해 좀더 다양한 PetCare는 서비스를 보다 편리하게 이용할 수 있습니다.(제휴병원은 우선으로 회원들에게 정보가 제공됩니다) 이와 관련한 상세한 내용은 계정 운영정책 및 고객센터 내 PetCare는 회원가입 방법 등에서 확인해 주세요.
                
PetCare는 단체에 속한 여러 구성원들이 공동의 계정으로 PetCare 서비스를 함께 이용할 수 있도록 단체회원 계정도 부여하고 있습니다. 단체회원 구성원들은 하나의 계정 및 아이디(ID)를 공유하되 각자 개별적으로 설정한 비밀번호를 입력하여 계정에 로그인하고 각종 서비스를 이용하게 됩니다. 단체회원은 관리자와 멤버로 구성되며, 관리자는 구성원 전부로부터 권한을 위임 받아 단체회원을 대표하고 단체회원 계정을 운용합니다. 따라서 관리자는 단체회원 계정을 통해 별도 약관 또는 기존 약관 개정에 대해 동의하거나 단체회원에서 탈퇴할 수 있고, 멤버들의 단체회원 계정 로그인 방법 및 이를 통한 게시물 게재 등 네이버 서비스 이용을 관리(게시물 삭제 포함)할 수 있습니다. 본 약관에서 규정한 사항은 원칙적으로 구성원 모두에게 적용되며, 각각의 구성원은 다른 구성원들의 단체회원 계정 및 아이디(ID)를 통한 서비스 이용에 관해 연대책임을 부담합니다.
                
병원 계정 사용에서의 권한 은 관리자가 승인 후 로그인 가능합니다.
                
여러분이 제공한 콘텐츠를 소중히 다룰 것입니다.
                
수집하는 개인정보의 항목
회사는 회원가입, 상담, 서비스 신청 및 제공 등을 위해 아래와 같은 개인정보를 수집하고 있습니다.
- 이름, 이메일, 주소, 연락처, 핸드폰 번호, 
                
개인정보의 수집 및 이용목적
                
나. 회원 관리
회원제 서비스 이용에 따른 본인확인, 개인식별, 불량회원의 부정 이용 방지와 비인가 사용 방지, 가입 의사 확인, 가입 및 
가입횟수 제한, 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인, 추후 법정 대리인 본인확인, 분쟁 조정을 위한
기록보존, 불만처리 등 민원처리, 고지사항 전달
                
개인정보의 보유/이용기간
                
이용자의 개인정보는 원칙적으로 개인정보의 수집 및 이용목적이 달성되면 지체 없이 파기합니다.
단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다.
가. 회사 내부 방침에 의한 정보보유 사유
- 부정이용기록
보존 이유 : 부정 이용 방지
보존 기간 : 1년
                
나. 관련법령에 의한 정보보유 사유
상법, 전자상거래 등에서의 소비자보호에 관한 법률 등 관계법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다. 이 경우 회사는 보관하는 정보를 그 보관의 목적으로만 이용하며 보존기간은 아래와 같습니다.
                
- 본인확인에 관한 기록
보존 이유 : 정보통신 이용촉진 및 정보보호 등에 관한 법률
보존 기간 : 6개월
방문에 관한 기록
보존 이유 : 통신비밀보호법
보존 기간 : 3개월
                
                
개인정보취급 위탁관련 / 개인정보제공 거부
                
가. 개인정보취급 위탁관련
                
- 개인정보취급위탁을 받는 자 : (주)펫케어서비스
- 개인정보취급위탁을 하는 업무의 내용 : 회원관리 회원제 서비스 이용에 따른 회원정보 관리 및 웹사이트 시스템 관리
                
나. 개인정보제공 거부에 관한 사항
- 귀하께서는 본 동의 안내 문구를 숙지하였으며, 안내문구에 대해 거절하실 수 있습니다. 단, 거절하신 경우에는 서비스 이용에 제한을 받을 수 있습니다.
                                </textarea>
                              </td>
                            </tr>
                            <tr>
                              <td>
                              <br>
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input" id="checkbox"> 
										<label class="custom-control-label" for="checkbox">
										&nbsp;&nbsp;&nbsp;이용약관에 동의합니다.<br><br><br><br></label>
									</div>
							  </td>
                            </tr>
                          </table>
                
                      </td>
                    </tr>
                </table>
                <button type = "button" class="button_class" onclick="user_signin()">일반 사용자 가입</button>
                <button type = "button" class="button_class"  onclick="partner_signin()">제휴병원 가입신청</button>
                
              </div>
              </section>
          </div>

    <!--푸터-->
    <%@ include file="/WEB-INF/page/user/views/footer.jsp" %>
    
    <script src="/resources/js/user/signinForm.js"></script>

</div>
</body>
</html>