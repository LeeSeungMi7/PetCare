/** 주소 태그 **/
const inputAddress = getElement('input_address');
const hospitalList = getElement('pet-hospital__list')

function getElement(id) {
    return $(`#${id}`);
}

// 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
let placeOverlay = new kakao.maps.CustomOverlay({zIndex: 1});
let contentNode = document.createElement('div'); // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다
let markers = []; // 마커를 담을 배열입니다

let mapContainer = document.getElementById('map'); // 지도를 표시할 div
let mapOption = {
    center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
    level: 5 // 지도의 확대 레벨
};

// 지도를 생성합니다
let map = new kakao.maps.Map(mapContainer, mapOption);

// 장소 검색 객체를 생성합니다
let ps = new kakao.maps.services.Places(map);

// 지도에 idle 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'idle', searchPlaces);

// 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다
contentNode.className = 'placeinfo_wrap';

// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap 메소드를 등록합니다
addEventHandle(contentNode, 'mousedown', kakao.maps.event.preventMap);
addEventHandle(contentNode, 'touchstart', kakao.maps.event.preventMap);

// 커스텀 오버레이 컨텐츠를 설정합니다
placeOverlay.setContent(contentNode);

// 각 카테고리에 클릭 이벤트를 등록합니다
// addCategoryClickEvent();

// 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
function addEventHandle(target, type, callback) {
    if (target.addEventListener) {
        target.addEventListener(type, callback);
    } else {
        target.attachEvent('on' + type, callback);
    }
}

// 카테고리 검색을 요청하는 함수입니다
function searchPlaces(address) {
    // 커스텀 오버레이를 숨깁니다

    const keyword = (address ? address : '') + '동물병원'

    placeOverlay.setMap(null);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();

    ps.keywordSearch(keyword, placesSearchCB,
        {
            useMapCenter: !address
        });
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    console.error(data)
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
        displayPlaces(data);
        if (data.length > 0) {
            map.panTo(new kakao.maps.LatLng(data[0].y, data[0].x));
        }

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
        // 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요

    } else if (status === kakao.maps.services.Status.ERROR) {
        // 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요

    }
}

// 지도에 마커를 표출하는 함수입니다
function displayPlaces(places) {
    console.error(places);
    // 병원 리스트에 지도에 보이는 병원들을 표시한다.
    hospitalList.children().remove();

    for (let i = 0; i < places.length; i++) {
        addListItem(places[i]);
    }


    for (let i = 0; i < places.length; i++) {

        // 마커를 생성하고 지도에 표시합니다
        let marker = addMarker(new kakao.maps.LatLng(places[i].y, places[i].x));

        // 마커와 검색결과 항목을 클릭 했을 때
        // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
        (function (marker, place) {
            kakao.maps.event.addListener(marker, 'click', function () {
                displayPlaceInfo(place);
            });
        })(marker, places[i]);
    }
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, order) {
    marker = new kakao.maps.Marker({
        position: position, // 마커의 위치
        // image: markerImage
    });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for (var i = 0; i < markers.length; i++) {
        markers[i].setMap(null);
    }
    markers = [];
}

function addListItem({place_url, place_name, road_address_name, address_name, phone, y, x}) {
    const paramsToString = getParamsToString({place_url, place_name, road_address_name, address_name, phone, y, x});

    let item = `
        <div class="pet-hospital__list-item" onclick="moveHospitalDetail('${paramsToString}')">
            <div class="text--16-bold">${place_name}</div>
    `

    if (road_address_name) {
        item += `
            <div class="text--14-normal">${road_address_name}</div>
            <div class="text--12-normal color--gray">지번)${address_name}</div>
        `
    } else {
        item += `
            <div class="text--14-normal">${address_name}</div>
        `
    }

    item += `
            <div class="text--14-bold">${phone}</div>
        </div>    
    `

    hospitalList.append(item)
}

function getParamsToString(params) {
    let paramsUrl = '';

    for(let key in params) {
        if (!!params[key]) {
            paramsUrl += `${key}=${encodeURIComponent(params[key])}&`;
        }
    }

    return paramsUrl;
}

// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
function displayPlaceInfo({place_url, place_name, road_address_name, address_name, phone, y, x}) {
    let content = `
        <div class="pet-map-placeinfo pet-column background--white">
            <a class="text--16-bold color--black" href="${place_url}" target="_blank" title="${place_name}">${place_name}</a>
    `;

    if (road_address_name) {
        content += `
            <span class="text--14-normal" title="${road_address_name}">${road_address_name}</span>
            <span class="text--12-normal color--gray" title="${address_name}">(지번: ${address_name})</span>
        `;
    } else {
        content += `<span class="text--14-normal" title="${address_name}">${address_name}</span>`;
    }

    content += `
            <span class="text--14-normal" class="tel">${phone}</span>
        </div>
    `

    contentNode.innerHTML = content;
    placeOverlay.setPosition(new kakao.maps.LatLng(y, x));
    placeOverlay.setMap(map);
}

searchPlaces();

function findAddr() {
    new daum.Postcode({
        oncomplete: function (data) {

            console.log(data);

            const roadAddr = data.roadAddress; // 도로명 주소 변수
            const jibunAddr = data.jibunAddress; // 지번 주소 변수

            if (!!roadAddr || !!jibunAddr) {
                inputAddress.val(jibunAddr || roadAddr);
            }

            const keyword = (data.sigungu ? data.sigungu + ' ' : ' ') || (data.bname ? data.bname + ' ' : ' ');

            searchPlaces(keyword)
        }
    }).open();
}

function currentLocation() {

}

function moveHospitalDetail(params) {
    window.location.href = `./hospital_detail.html?${params}`
}

window.onload = function() {
    map.relayout();
}
