/** 주소 태그 **/
const inputAddress = getElement('input_address');
const hospitalList = getElement('pet-hospital__list')

function getElement(id) {
    return $(`#${id}`);
}

function debounce(func, wait) {
    let inDebounce;
    return function () {
        const context = this;
        const args = arguments;

        // setTimeout이 실행된 Timeout의 ID를 반환하고, clearTimeout()으로 이를 해제할 수 있음을 이용
        clearTimeout(inDebounce);
        inDebounce = setTimeout(() => func.apply(context, arguments), wait);
    };
}

// 'search-address', 'current-location', 'filter-24hour', 'reservation'
let filter = '';

// 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
let placeOverlay = new kakao.maps.CustomOverlay({zIndex: 1});
let contentNode = document.createElement('div'); // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다
let markers = []; // 마커를 담을 배열입니다

let mapContainer = document.getElementById('map'); // 지도를 표시할 div
let mapOption = {
    center: new kakao.maps.LatLng(37.5710194900321, 126.992526739499), // 지도의 중심좌표
    level: 5 // 지도의 확대 레벨
};

// 지도를 생성합니다
let map = new kakao.maps.Map(mapContainer, mapOption);

// 장소 검색 객체를 생성합니다
let ps = new kakao.maps.services.Places(map);

let geocoder = new kakao.maps.services.Geocoder();


// 지도에 idle 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'idle', searchKeyword);

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

function searchAddress(address) {
    geocoder.addressSearch(address, function(result, status) {
        if (status === kakao.maps.services.Status.OK) {

            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
            map.setCenter(coords);
        }
    })
}

// 카테고리 검색을 요청하는 함수입니다
function searchKeyword() {
    // 커스텀 오버레이를 숨깁니다

    placeOverlay.setMap(null);
    let bounds = map.getBounds()

    ps.keywordSearch('동물병원', placesSearchCB, {bounds: bounds});
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        const mapIds = data.map((info) => {
            return info.id
        })

        let hospitalInfos = data;

        $.ajax(`/hospital_alliance.do?mapIds=${mapIds.join(',')}`, {
            // contentType: 'application/json; charset=utf-8',
            // dataType: 'json',
            success: (response) => {
                // 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
                hospitalInfos = data.map(info => {
                    let mapInfo = info;
                    response.forEach(member => {
                        if (member.m_address_class === Number(info.id)) {
                            mapInfo = {
                                ...info,
                                ...member
                            }
                        }
                    })

                    return mapInfo
                })


                displayPlaces(hospitalInfos);
            },
            fail: (error) => {
                console.error('error', error)
            }}
        )


    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
        // 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요

    } else if (status === kakao.maps.services.Status.ERROR) {
        // 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요

    }
}

function resetMap() {
    hospitalList.children().remove();
    removeMarker();
}

// 지도에 마커를 표출하는 함수입니다
function displayPlaces(places) {
    resetMap()

    // 병원 리스트에 지도에 보이는 병원들을 표시한다.
    const filterPlaces = places.filter((place) => {
        if (filter === 'filter-24hour') {
            return place['p_24hour'] === '1';
        }

        if (filter === 'reservation') {
            return !!place['m_address_class'];
        }

        return true;
    });

    for (let i = 0; i < filterPlaces.length; i++) {
        addListItem(filterPlaces[i]);
    }


    for (let i = 0; i < filterPlaces.length; i++) {

        // 마커를 생성하고 지도에 표시합니다
        const isAlliance = !!filterPlaces[i]['m_address_class'];
        let marker = addMarker(new kakao.maps.LatLng(places[i].y, places[i].x), isAlliance);

        // 마커와 검색결과 항목을 클릭 했을 때
        // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
        (function (marker, place) {
            kakao.maps.event.addListener(marker, 'click', function () {
                displayPlaceInfo(place);
            });
        })(marker, filterPlaces[i]);
    }
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, isAlliance) {
    let marker
    if(isAlliance) {
        const imageSrc = '/resources/img/location.png', // 마커이미지의 주소입니다
            imageSize = new kakao.maps.Size(38, 42), // 마커이미지의 크기입니다
            imageOption = {offset: new kakao.maps.Point(27, 69)};
        const markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);

        marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage
        });
    } else {
        marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            // image: markerImage
        });
    }

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    marker.isAlliance = isAlliance;
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

function addListItem(places) {
    /** 다음 지도 기본 정보 **/
    const { place_url, place_name, road_address_name, address_name, phone, y, x } = places;
    /** 서버 정보 **/
    const { p_weekday, p_weekend, m_address_class, p_24hour, p_breaktime, m_number } = places;

    const paramsToString = getParamsToString({
            place_url,
            place_name,
            road_address_name,
            address_name, phone,
            y, x,
            p_weekday, p_weekend,
            m_address_class,
            p_24hour,
            p_breaktime,
            m_number: m_number ?? 0
    });

    let item = `
        <div class="pet-hospital__list-item" onclick="moveHospitalDetail('${paramsToString}')">
            <div class="text--16-bold">${place_name} ${m_address_class ? '<span class="hos-badge">제휴</span>' : ''}</div>
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

    /** 해당 값이 있으면 제휴 병원임 **/
    if (m_address_class) {
        if (p_24hour === "1") {
            item += `<div class="text--14-normal">365일 24시간 진료</div>`
        } else {
            item += `<div class="text--14-normal">평일 진료 시간 : ${p_weekday.replace(/\//g, '~')}</div>`
            item += `<div class="text--14-normal">주말 진료 시간 : ${p_weekend.replace(/\//g, '~')}</div>`
        }
        item += `<div class="text--14-normal">점심시간 : ${p_breaktime.replace(/\//g, '~')}</div>`
    }

    item += `
            <div class="text--14-bold">${phone}</div>
        </div>
    `

    hospitalList.append(item)
}

function getParamsToString(params) {
    let paramsUrl = '';

    for (let key in params) {
        if (!!params[key]) {
            paramsUrl += `${key}=${encodeURIComponent(params[key])}&`;
        }
    }

    return paramsUrl;
}

// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
function displayPlaceInfo(places) {
    const {place_url, place_name, road_address_name, address_name, phone, y, x} = places;
    const { p_weekday, p_weekend, m_address_class, p_24hour, p_breaktime } = places;

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

    if (m_address_class) {
        if (p_24hour === "1") {
            content += `<div class="text--14-normal">365일 24시간 진료</div>`
        } else {
            content += `<div class="text--14-normal">평일 진료 시간 : ${p_weekday.replace(/\//g, '~')}</div>`
            content += `<div class="text--14-normal">주말 진료 시간 : ${p_weekend.replace(/\//g, '~')}</div>`
        }
        content += `<div class="text--14-normal">점심시간 : ${p_breaktime.replace(/\//g, '~')}</div>`
    }


    content += `
            <span class="text--14-normal" class="tel">${phone}</span>
        </div>
    `

    contentNode.innerHTML = content;
    placeOverlay.setPosition(new kakao.maps.LatLng(y, x));
    placeOverlay.setMap(map);
}

function findAddr() {
    new daum.Postcode({
        oncomplete: function (data) {
            const roadAddr = data.roadAddress; // 도로명 주소 변수
            const jibunAddr = data.jibunAddress; // 지번 주소 변수

            if (!!roadAddr || !!jibunAddr) {
                inputAddress.val(jibunAddr || roadAddr);
            }

            searchAddress(jibunAddr || roadAddr)
        }
    }).open();
}

function onClickFilter(type) {
    setActiveFilter(filter === type ? '' : type);
    filter = filter === type ? '' : type;
    searchKeyword();
}

function setActiveFilter(type) {
    const filters = ['filter-24hour', 'reservation'];

    for (let i = 0; i < filters.length; i++) {
        const filterBtn = document.getElementById(filters[i]);
        if (filters[i] === type) {
            filterBtn.classList.add('active');
        } else {
            filterBtn.classList.remove('active');
        }
    }
}

function moveHospitalDetail(params) {
    window.location.href = `./hospital_detail.do?${params}`
}

function currentLocation() {
    const address = sessionStorage.getItem("address");
    if (address) {
        searchAddress(address);
    }
}


window.onload = function () {
    map.relayout();
}

debounce(searchKeyword, 1000);

searchKeyword();