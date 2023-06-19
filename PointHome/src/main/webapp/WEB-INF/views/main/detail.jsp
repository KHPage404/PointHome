<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp"/>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9ee1207dbdc41dc68f5d04b09a2bcafa&libraries=services"></script>

<!-- fullCalendar -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js"></script>
<!-- toss -->
<script src="https://js.tosspayments.com/v1/payment-widget"></script>

<script type="text/javascript">
function pickPart(th) {
	
	var partNo = $(th).parents(".pick").find(".partNo").val()
	console.log($(th).parents(".pick").find(".partNo").val())
	
	$.ajax({
		   type : 'get',           // 타입 (get, post, put 등등)
		   url : '/main/detailPick',  // 요청할 서버url
		   dataType : 'json',       // 데이터 타입 (html, xml, json, text 등등)
		   data : {  // 보낼 데이터 (Object , String, Array)
			   partNo : $(th).parents(".pick").find(".partNo").val()
		   }, 
		   success : function(result) { // 결과 성공 콜백함수
		    	console.log(result)
		        if( result.isPick ) { //찜 했음
// 					$(th).find("i").toggleClass("bi-heart")
// 					$(th).find("i").addClass("bi-heart-fill")
					$(th).html("구독 취소")
				} else { //찜 취소
// 					$(th).find("i").toggleClass("bi-heart-fill")
// 					$(th).find("i").addClass("bi-heart")
					$(th).html("구독")
				}
		   
		   },
		   error : function(request, status, error) { // 결과 에러 콜백함수
		        console.log(error)
		   }
	})
}
</script>

<!-- 예약 -->
<style type="text/css">
#calendarDiv {
	display: flex;
 	justify-content: center;
/*  	align-items: center; */
	margin-top: 40px;
/*  	margin-bottom: 80px;  */
}

.fc-day-sun a {
 	color: red;
 	text-decoration: none;
}

/* 토요일 날짜 파란색 */
.fc-day-sat a {
  color: blue;
  text-decoration: none;
}
.fc-day a {
  text-decoration: none;
</style>

<style type="text/css">
.nav-link {
	font-size: 20px;
	padding: 7px 20px;
	color: black;
}

#container{
	margin: 0 auto;
	margin-top: 190px;
	width:80%; 
	height:350px;
	display: flex;
  	justify-content: center;
  	align-items: center;
}

#container div {
	margin-right: 50px;
}

.content-pd {
	padding: 50px;
}
</style>

<style>
#commentTb th {
	padding: 15px 0px;
}

#commentTb td {
	padding: 15px 0px;
}

.star-ratings {
  color: #aaa9a9; 
  position: relative;
  unicode-bidi: bidi-override;
  width: max-content;
  -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
  -webkit-text-stroke-width: 1.3px;
  -webkit-text-stroke-color: #2b2a29;
}
 
.star-ratings-fill {
  color: #fff58c;
  padding: 0;
  position: absolute;
  z-index: 1;
  display: flex;
  top: 0;
  left: 0;
  overflow: hidden;
  -webkit-text-fill-color: gold;
}
 
.star-ratings-base {
  z-index: 0;
  padding: 0;
}

a {
	color: black;
	text-decoration: none;
}

.partner-tab-link {
	width: 258px;
}

.partner-tab-link:hover {
	color: black;
}

.partner-btn {
	background-color: #7e00c2; 
	border-color: #7e00c2;
	font-size: 22px;
	color: white; 
	width: 190px; 
	height: 47px; 
}

.partner-btn:hover {
	background-color: #7e00c2; 
	border-color: #7e00c2;
	color: white; 
}

.tab-title {
 	margin-left: 20px;  
 	font-size: 42px; 
/*  	font-weight: bold; */
}

.tab-border {
	border: 1px solid #ccc; 
/* 	border-radius: 18px;  */
	margin: 20px; 
/* 	padding: 30px; */
}

.tdCenter {
	position: relative;
	top: 50%;
	transform: translateY(32%);
}

table {
	text-align: center;
}

#topbtn {
    position: fixed;
    right: 54%;
    bottom: 80px;
    transform: translateX(1150%);
    height: 70px;
    width: 70px;
    font-size: 20px;
    border-radius: 50%;
    text-align: center;
    box-shadow: 2px 2px 5px -1px gray;
    padding-top: 10px;
}

.scroll_top_btn {
    position: absolute;
    right: 30px;
    bottom: 30px;
    z-index: 999;
    border: 0;
    outline: none;
}
</style>


<script type="text/javascript">
var resDate = $("input[name=resDate]").val()
var resTime = $("input[name=resTime]").val()
var resDiv = $("input[name=resDiv]").val()
</script>

<!-- fullCanlendar JS Code -->
<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function() {
    	var calendarEl = document.getElementById('calendar');
    	var today = new Date().toISOString().split("T")[0];
        var calendar = new FullCalendar.Calendar(calendarEl, {
        	locale: 'kr',
        	dayCellContent : function( cal ) {
        		return ('0'+cal.date.getDate()).slice(-2)
// 				if ( ('0'+cal.date.getDate()) > 15) {
// 					return 'X'					
// 				}
//         		return ('0'+cal.date.getDate()).slice(-2)
        	},
        	dateClick: function(info) {
        		console.log(info.dateStr)
        		console.log(info.date)
        		console.log(new Date())
        		var date = new Date();
       		
        		$.ajax({
					   type : 'get',           // 타입 (get, post, put 등등)
					   url : './reserveDateAjax',  // 요청할 서버url
					   dataType : 'html',       // 데이터 타입 (html, xml, json, text 등등)
					   data : {  // 보낼 데이터 (Object , String, Array)
						   resDate : info.dateStr,
						   partNo : ${param.partNo},
					   	   partnerPrice : ${partner.partnerPrice}
					   }, 
					   success : function(result) { // 결과 성공 콜백함수
					        $("#reserveTime").html(result)
					   },
					   error : function(request, status, error) { 
					        console.log(error)
					   }
				})
        	},
        	
            validRange: {
            	start: today
            },
            selectable: true,
            selectMirror: true,

            navLinks: false, // can click day/week names to navigate views
            editable: false,
        });
        calendar.render();
    });
</script>

<script type="text/javascript">
$(document).ready(function() {
	$(".scroll_top_btn").bind('click', function() {
		$('html, body').animate({scrollTop: '0'}, 380);
	});
});
</script>



<div style="font-family: SBAggroM;">

<div id="container" style="padding-left: 130px;">
	<div style="margin-right: 80px;">
		<c:choose>
			<c:when test="${partnerFile.partnerImg eq null}">
				<div style="width:600px; height:400px;">
					<img id="profileImg" style="width:600px; height:400px;" alt="" src="https://t1.daumcdn.net/cfile/tistory/2513B53E55DB206927">
				</div>
			</c:when>
			<c:otherwise>
				<div style="width:600px; height:400px;">
					<img id="profileImg" style="width:600px; height:400px;" alt="" src="/upload/${partnerFile.partnerImg }">
				</div>
			</c:otherwise>
		</c:choose>
	</div>
	
	<div class="d-flex" style="height: 380px;">
	  <div class="vr"></div>
	</div>
	
	<div>
		<div>
			<button class="btn btn-secondary" style="font-size: 18px; margin-bottom: 5px;" disabled="disabled">
				<c:if test="${partner.partnerType eq 't'.charAt(0) }">
					타로
				</c:if>
				<c:if test="${partner.partnerType eq 's'.charAt(0) }">
					신점
				</c:if>
				<c:if test="${partner.partnerType eq 'c'.charAt(0) }">
					사주
				</c:if>
			</button>
		</div>
		<div style="font-size: 50px; margin-bottom: 10px;">
			${partner.partnerShopname }(${partner.partnerNick })
		</div>
		<div style="font-size: 28px;">
			${partner.partnerPrice }원
		</div>
		<div style="font-size: 25px;">
			후기(${reviewCnt })  
			<span class="star-ratings" style="font-family: Noto_Sans_KR400">
				<span class="star-ratings-fill space-x-2 text-lg" style="width: ${avgGrade * 20 }%;">
					<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
				</span>
				<span class="star-ratings-base space-x-2 text-lg">
					<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
				</span>
			</span>
			(${avgGrade })
		</div>
		<div style="font-size: 19px; width: 400px; padding-top: 10px;">
			${partner.partnerPr }
		</div>
		
		<div style="margin-top: 30px; text-align: center;">
			<a href="/chat/room"><button id="chatBtn"  class="btn partner-btn" style="margin-right: 10px; background-color: orange; border-color: orange;">1:1 채팅</button></a>

			<span class="pick" style="margin-top: 20px;"> 
				<input class="partNo" type="hidden" value="${partNo}">
				<c:if test="${isPick eq 0}">
					<button type="button" id="i" onclick="pickPart(this)" class="btn partner-btn">구독</button>
				</c:if>
				<c:if test="${isPick eq 1}">
					<button type="button" id="i" onclick="pickPart(this)" class="btn partner-btn">구독 취소</button>
				</c:if>
			</span>
		</div>
	</div>
</div>

<div class="container" style="margin: 150px auto;">
	<ul class="nav nav-tabs justify-content-center" style="text-align:center; z-index: 2; background-color: white; position: sticky; top: 80px;" id="myTab" role="tablist">
	  <li class="nav-item">
	    <a class="nav-link partner-tab-link" href="#guide" style="font-size: 23px;">안내</a>
	  </li>
	  <li class="nav-item">
	  	<a class="nav-link partner-tab-link" href="#reserve" style="font-size: 23px;">예약</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link partner-tab-link" href="#review" style="font-size: 23px;">리뷰</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link partner-tab-link" href="#notice" style="font-size: 23px;">공지</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link partner-tab-link" href="#video" style="font-size: 23px;">영상</a>
	  </li>
	</ul>
	<div data-bs-spy="scroll" class="scrollspy-example p-5 rounded-3 tab-border" data-bs-target="#navbar-example2" data-bs-root-margin="0px 0px -40%" data-bs-smooth-scroll="true" tabindex="0">
		<div class="tab-title">안내</div>
		<hr>

		<div style="margin: 20px; margin-top: 40px; margin-bottom: 90px;" class="clearfix">
			<!-- 지도 -->
			<div id="map" style="width:550px; height:500px; float: left;"></div>
			<div style="width:530px; height: 500px; float: right; padding: 50px; font-size: 25px; padding-top: 90px;">
				<p style="font-size: 28px;">- 오시는 길</p>
				<div style="margin-bottom: 10px;">주소: ${partner.partnerAddress } ${partner.partnerDetailaddress }</div>
				<div style="margin-bottom: 2px;">신사역 8번 출구에서 300m</div>
				<div>미르빌딩 3층</div>
			<!-- 안내 -->
<!-- 				<div style="margin-bottom: 30px;"> -->
<!-- 					<div style="font-size: 28px;">- 유의사항 안내</div> -->
<!-- 					<div style="font-size: 25px; padding: 5px;">유의사항사항사항</div> -->
<!-- 				</div> -->
				<div style="margin-top: 40px;">
					<p style="font-size: 28px;">- 환불 안내</p>
					<div>환불은 어렵습니다. 신중히 결정하세요.</div>
				</div>

			</div>
			<div id="guide"></div>
		</div>
	    <!-- 예약 -->
	    <div class="tab-title">예약</div>
	    <hr>
	  	<div id="calendarDiv" class="clearfix" >
			<div id='calendar' style="float:left; width: 600px; height: 500px; margin-right: 30px;"></div>
			<div id="reserveTime" style="float:right; width: 500px; height: 600px; padding-top: 80px;">
				<div style="font-size: 23px; text-align: center; margin-top: 170px;">원하는 날짜를 선택하세요</div> 
			</div>
		</div>
		<div id="reserve" style="margin-bottom: 90px;"></div>
		<div class="tab-title">리뷰</div>
		<hr>
	    <!-- 리뷰 -->
	  	<div id="review" style="border: 1px solid #ccc; padding: 20px 30px; margin: 10px; margin-top: 30px; margin-bottom: 90px;">
		  	<c:forEach var="review" items="${reviewList }">
		  		<div style="margin: 0 auto; font-size: 22px;">
			  		<div style="padding: 20px;">
			  			<span style="font-weight: bold; margin-right: 10px;"><i class="bi bi-person-circle"></i> ${review.USER_NICK }</span>
						<span style="float: right;"><fmt:formatDate value="${review.REVIEW_DATE }" pattern="yy/MM/dd hh:mm"/></span>
			  			<span class="star-ratings" style="font-family: Noto_Sans_KR400">
							<span class="star-ratings-fill space-x-2 text-lg" style="width: ${review.REVIEW_GRADE * 20 }%;">
								<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
							</span>
							<span class="star-ratings-base space-x-2 text-lg">
								<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
							</span>
						</span>
						<span>${review.REVIEW_GRADE }</span>
				  		<div style="margin-top: 10px; margin-left: 3px;">${review.REVIEW_CONTENT }</div>
			  		</div>
			  		<hr>
		  		</div>
		  	</c:forEach>
	  	</div>
	  	<!-- 공지사항 -->
	  	<div class="tab-title">공지</div>
		<hr>
		<div style="margin: 40px; margin-bottom: 90px;">
			<table class="table table-hover" style="font-size: 20px;">
				<thead style="height: 50px;">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>내용</th>
						<th>날짜 <a href="/partner/partnernotice"><button class="btn btn-secondary" style="float: right;">목록</button></a></th>
					</tr>
				</thead>
				<tbody class="table-group-divider">
				<c:forEach var="notice" items="${noticeList }">
					<tr>
						<td><div class="tdCenter">${notice.partnerNoticeNo }</div></td>
						<td><div class="tdCenter"><a href="/partner/view?partnerNoticeNo=${notice.partnerNoticeNo }">${notice.partnerNoticeTitle }</a></div></td>
						<td><div class="tdCenter">${notice.partnerNoticeContent }</div></td>
						<td><div class="tdCenter"><fmt:formatDate value="${notice.partnerNoticeDate }" pattern="yy/MM/dd hh:mm" /></div></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	  	<div class="tab-title">영상</div>
		<hr>
		<!-- 영상 -->
	  	<table id="notice" class="table table-hover" style="width: 1100px; margin: 20px auto;">
			<c:forEach var="video" items="${video}">
				<tr>
					<td><iframe width="560" height="315"
							src="https://www.youtube.com/embed/${video.partnerVideoUrl}"
							title="YouTube video player" frameborder="0"
							allow="accelerometer; autoplay; clipboard-write;
	                        encrypted-media; gyroscope; picture-in-picture; web-share"
							allowfullscreen></iframe></td>
							
					<td><fmt:formatDate value="${video.partnerVideoDate}"
							pattern="yy/MM/dd hh:mm" /></td>
				</tr>
			</c:forEach>
		</table>
		  <!-- 공지사항 -->
	  	<div id="video"></div>
	</div>
</div>

</div>

<div style="font-family: SBAggroM;">
	<button type="button" class="scroll_top_btn btn btn-warning" id="topbtn">
		<span>TOP</span>
	</button>
</div>




<!-- 지도 -->
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
  
    level: 3 // 지도의 확대 레벨
};  

//지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

function setDraggable(draggable) {
    // 마우스 드래그로 지도 이동 가능여부를 설정합니다
    map.setDraggable(draggable);    
}

//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

//주소로 좌표를 검색합니다
geocoder.addressSearch('${partner.partnerAddress}', function(result, status) {

// 정상적으로 검색이 완료됐으면 
 if (status === kakao.maps.services.Status.OK) {
    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

    // 결과값으로 받은 위치를 마커로 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: coords
    });

    // 인포윈도우로 장소에 대한 설명을 표시합니다
    var infowindow = new kakao.maps.InfoWindow({
        content: '<div style="width:150px;text-align:center;padding:6px 0;">${partner.partnerShopname}</div>'
    });
    infowindow.open(map, marker);

    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    map.setCenter(coords);
} 
});
</script>

<script type="text/javascript">
$("#chatBtn").on('click', function(e) {
	  e.preventDefault();
	  window.open("/chat/room", "chat/room", "width=500, height=700, top=200, left=200, resizable=no");
	});
</script>

<c:import url="/WEB-INF/views/layout/footer.jsp"/>




