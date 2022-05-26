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
    <link href="/resources/css/user/home.css?after" rel="stylesheet">
    
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

<script type="text/javascript">
var imgs = 3;
var now = 0;

function slide() {
    now = now == imgs ? 0 : now += 1; 

    $(".imgs>img").eq(now - 1).css({"margin-left": "-800px"});
    $(".imgs>img").eq(now).css({"margin-left": "0px"});
}

function start() {
    $(".imgs>img").eq(0).siblings().css({"margin-left":"0px"});
    
    setInterval(function () { slide()}, 4000);
}
start();
</script>
</head>

<body>
	<div id="pet-layout" class="background--white">
		<!--헤더-->
		<%@ include file="/WEB-INF/page/user/views/header.jsp"%>

		<!--본문-->
		<!-- 홈 최상단 슬라이더 -->
		<div class="pet-home__slider pet-column imgs">
			<img src="https://cdn.imweb.me/thumbnail/20220413/4a11551a2ff7f.jpg" style="margin-left:0px;" />
			<img src="/resources/img/home_banner.img1.png" />
			<img src="/resources/img/home_banner.img2.jpg" />
			<img src="/resources/img/home_banner.img3.png" />
		</div>
		<!-- 홈 최상단 슬라이더 -->

		<!-- 제휴 병원 💊 -->
		<div class="pet-home__hospital">
			<div class="pet-home__title pet-row">
				<div class="text--18-bold">최근 등록 제휴 병원 💊</div>
			</div>
			<div class="pet-home__cards">
			
			<c:forEach var="hospital" items="${hospital}">
				<div class="pet-home__card pet-column" onclick="location.href='hospital_detail.do?m_number=${hospital.m_number}'">
					<div>
						<div class="pet-home__card-title text--16-bold">${hospital.m_name}</div>
						<div class="pet-home__card-info text--14-normal pet-row">
							<div class="pet-home__card-distance text--14-bold">${hospital.m_zipcode}</div>
							<c:if test="${hospital.p_24hour==1}">
							<div class="pet-home__card-address color--gray">&nbsp;<span style="color:red;">[24시 진료중]</span></div>
							</c:if>
						</div>
						<div class="pet-home__card-address color--gray">| ${hospital.m_address}</div>
					</div>
					

					<div class="pet-home__card-tel">
						전화번호: <a href="tel:${hospital.m_tel}">${hospital.m_tel}</a>
					</div>
				</div>
			</c:forEach>	
				
			</div>
		</div>
		<!-- 우리 동네병원 💊 -->
		<hr>
		<!-- 우리 가족 이야기 🐶😺 -->
		<div class="pet-home__boast">
			<div class="pet-home__title pet-row">
				<div class="text--18-bold">우리 가족 이야기 🐶😺</div>
				<div class="text--14-normal center" onclick="location.href='show.do'">더보기 ></div>
			</div>
			
				
				<div class="pet-home__boards pet-row">
				<c:forEach var="show" items="${show}">
					<div class="pet-home__board pet-column" onclick="location.href='show_board.do?board_num=${show.board_num}'">
						<img src="${show.b_file_path}" width="180" height="190"/>
						<div class="pet-home__board-title text--16-bold">${show.b_title}</div>
						<div class="pet-home__board-description text--14-normal">작성자 : ${show.b_writer}</div>
					
					</div>
				</c:forEach>
				</div>

		</div>
		<!-- 우리 가족 이야기 🐶😺 -->
		<hr>
		<!-- 도움이 필요해요... 😢 -->
		<div class="pet-home__qna">
			<div class="pet-home__title pet-row">
				<div class="text--18-bold">도움이 필요해요... 😢</div>
				<div class="text--14-normal center" onclick="location.href='qna.do'">더보기 ></div>
			</div>
			<div class="pet-home__boards pet-row">
			
				<c:forEach var="qna" items="${qna}">
					<div class="pet-home__board pet-column" onclick="location.href='qna_board.do?faq_num=${qna.faq_num}'">
						<img src="${qna.f_file_path}" width="180" height="190"/>
						<div class="pet-home__board-title text--16-bold">${qna.f_title}</div>
						<div class="pet-home__board-description text--14-normal">Date :${qna.f_date} </div>
					</div>
				</c:forEach>
				
			</div>
		</div>
		<!-- 도움이 필요해요...😢 -->
		<hr>
		<!-- 지식 백과사전 📚 -->
		<div class="pet-home__encyclopedia">
			<div class="pet-home__title pet-row">
				<div class="text--18-bold">지식 백과사전 📚</div>
				<div class="text--14-normal center" onclick="location.href='ency_BoardList.do'">더보기 ></div>
			</div>
			<div class="pet-home__boards pet-row">
			
			<c:forEach var="ency" items="${ency}">
				<div class="pet-home__board pet-column" onclick="location.href='ency_Board.do?en_number=${ency.en_number}'">
					<img src="${ency.en_file_path}" width="180" height="190"/>
					<div class="pet-home__board-title text--16-bold">${ency.en_title}</div>
					<div class="pet-home__board-description text--14-normal">${ency.en_content}</div>
				</div>
			</c:forEach>	
				
			</div>
		</div>
		<!-- 지식 백과사전 📚 -->

		<!--푸터-->
		<%@ include file="/WEB-INF/page/user/views/footer.jsp"%>

	</div>
</body>

</html>