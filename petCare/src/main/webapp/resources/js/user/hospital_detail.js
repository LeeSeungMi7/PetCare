const urlParams = new URLSearchParams(window.location.search)
let hospitalInfo = {}

for (const entry of urlParams.entries()) {
    hospitalInfo[entry[0]] = entry[1];
}

console.error(hospitalInfo)

const mapContainer = document.getElementById('map'), // 지도를 표시할 div
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3, // 지도의 확대 레벨
    };

// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
const map = new kakao.maps.Map(mapContainer, mapOption);
const ps = new kakao.maps.services.Places();

function searchPlaces() {

    ps.keywordSearch(`${hospitalInfo.address_name || hospitalInfo.road_address_name} ${hospitalInfo.place_name}`, placesSearchCB);
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {
        const position = new kakao.maps.LatLng(data[0].y, data[0].x);

        new kakao.maps.Marker({
            map: map,
            position: position
        });
        map.panTo(position);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
        // 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요
    } else if (status === kakao.maps.services.Status.ERROR) {
        // 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요
    }
}

function createHospitalLayout() {
    const {
        place_url,
        place_name,
        road_address_name,
        address_name, phone,
        y, x,
        p_weekday, p_weekend,
        m_address_class,
        p_24hour,
        p_breaktime,
        m_number
    } = hospitalInfo;
    let contents = ``

    if (road_address_name) {
        contents += `<div class="pet-hospital-detail__text text--16-bold">도로명 주소: <span class="color--gray">${road_address_name}</span></div>`
    }

    if (address_name) {
        contents += `<div class="pet-hospital-detail__text text--16-bold">지번: <span class="color--gray">${address_name}</span></div>`
    }

    /** 나중에 평일,주말 점심시간 연동 되면 구현하기 **/
        contents += `
            <div class="pet-hospital-detail__times">
                <div class="pet-hospital-detail__text text--16-bold">진료시간</div>
                <ul>
                    ${!!m_address_class ? '' : `
                    <li>
                        <span class="text--14-bold color--red">제휴병원만 진료정보를 제공합니다.</span>
                    </li>`}
                    
                    ${p_24hour !== "1" ? '' : `
                    <li>
                        <div class="pet-row">
                            <span class="text--14-bold color--gray">365일</span>
                            <span class="text--14 color--gray">24시간</span>
                        </div>
                    </li>`}
                    
                    ${!p_weekday && p_24hour !== "1" ? '' : `
                    <li>
                        <div class="pet-row">
                            <span class="text--14-bold color--gray">평일</span>
                            <span class="text--14 color--gray">${p_weekday.replace(/\//g, '~')}</span>
                        </div>
                    </li>`}
                    
                    ${!p_weekend && p_24hour !== "1" ? '' : `
                    <li>
                        <div class="pet-row">
                            <span class="text--14-bold color--gray">주말</span>
                            <span class="text--14 color--gray">${p_weekend.replace(/\//g, '~')}</span>
                        </div>
                    </li>`}
                    
                    ${!p_breaktime ? '' : `
                    <li>
                        <div class="pet-row">
                            <span class="text--14-bold color--gray">점심시간</span>
                            <span class="text--14 color--gray">${p_breaktime.replace(/\//g, '~')}</span>
                        </div>
                    </li>`}
                </ul>
            </div>
        `

    if (phone) {
        contents += `<div class="pet-hospital-detail__text text--16-bold">전화번호: <a class="color--gray" href="tel:${phone}">${phone}</a></div>`
    }

    /** 예약 가능 버튼 **/
    if (m_address_class) {
        contents += `<
        button type="button" class="button--sm" style="margin-top: 10px">예약가능</button>`
    }

    document.getElementById('title').innerHTML = `${place_name} ${m_address_class ? '<span class="hos-badge">제휴</span>' : ''}`;
    document.getElementById('infos').innerHTML = contents;
}

searchPlaces();
createHospitalLayout();
