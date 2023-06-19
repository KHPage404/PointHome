<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>운칠기삼</title>
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

<!-- Jquery CDN -->
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- css파일 목록 -->
<link href="/resources/join/user/css/join.css?d=<%= new Date() %>" rel="stylesheet">
<link href="/resources/common/css/font.css?d=<%= new Date() %>" rel="stylesheet">
<link href="/resources/join/user/css/ani-background.css?d=<%= new Date() %>" rel="stylesheet">

<!-- Email .js -->
<script type="text/javascript" src="/resources/join/user/js/Email.js?d=<%= new Date() %>"></script>
<script type="text/javascript" src="/resources/join/user/js/Validate.js?d=<%= new Date() %>"></script>

<script type="text/javascript">
$( ()=> {
	
	fn_validate();
	
	$(document).submit(function(){

        var rv = true;
        
        // 유효성 검사
        $.each($("input, select"), function(){
            if($(this).val() === null || $(this).val() === ' ' || $(this).val().length === 0){
                alert('입력이 유효하지 않습니다.');
                return rv = false;
            }
        })

        return rv;
	})
	
	
})
</script>
</head>
<body>

<!-- page 배경 start -->
<div class="background-ani">

<!-- form 배경 start -->
<div class="join-form-background text-dark">

<!-- ---------- -->
<!-- 로고 start -->	
<!-- ---------- -->
<a class="join-form-logo" href="/">
	<svg xmlns="http://www.w3.org/2000/svg" version="1.1" xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.com/svgjs" viewBox="1.7991995811462402 -96.91999816894531 462.00079345703125 105.29000091552734">
		<g fill="#7e00c2">
			<path d="M63.57 -18.13L63.57 -38.12C63.57 -39.9 63.04 -41.51 62 -42.94C60.95 -44.37 59.04 -45.09 56.25 -45.09L6.16 -45.09C3.22 -45.09 1.76 -43.13 1.8 -39.22C1.84 -35.31 3.29 -33.35 6.16 -33.35L48.69 -33.35C49.23 -33.35 49.54 -33.24 49.62 -33C49.7 -32.77 49.74 -32.5 49.74 -32.19L49.74 -18.13C49.74 -14.41 52.04 -12.55 56.65 -12.55C61.26 -12.55 63.57 -14.41 63.57 -18.13ZM29.52 5.69L87.04 5.69C89.99 5.69 91.44 3.74 91.4 -0.17C91.36 -4.09 89.91 -6.04 87.04 -6.04L37.07 -6.04C36.53 -6.04 36.22 -6.16 36.14 -6.39C36.06 -6.62 36.03 -6.9 36.03 -7.21L36.03 -23.01C36.03 -26.73 33.72 -28.59 29.11 -28.59C24.5 -28.59 22.2 -26.73 22.2 -23.01L22.2 -1.28C22.2 0.5 22.72 2.11 23.77 3.54C24.81 4.98 26.73 5.69 29.52 5.69ZM79.84 -72.75C79.84 -79.41 77.16 -85.11 71.82 -89.83C66.47 -94.56 59.97 -96.92 52.3 -96.92C44.55 -96.92 37.98 -94.56 32.6 -89.83C27.21 -85.11 24.52 -79.41 24.52 -72.75C24.52 -66.09 27.21 -60.39 32.6 -55.67C37.98 -50.94 44.55 -48.58 52.3 -48.58C59.97 -48.58 66.47 -50.96 71.82 -55.72C77.16 -60.49 79.84 -66.16 79.84 -72.75ZM66.01 -72.75C66.01 -69.26 64.67 -66.32 62 -63.92C59.33 -61.51 56.09 -60.31 52.3 -60.31C48.5 -60.31 45.26 -61.51 42.59 -63.92C39.92 -66.32 38.58 -69.26 38.58 -72.75C38.58 -76.23 39.92 -79.18 42.59 -81.58C45.26 -83.98 48.5 -85.18 52.3 -85.18C56.09 -85.18 59.33 -83.98 62 -81.58C64.67 -79.18 66.01 -76.23 66.01 -72.75Z M216.15 -17.43L216.15 -34.05C216.15 -35.83 215.63 -37.44 214.58 -38.87C213.54 -40.31 211.62 -41.02 208.83 -41.02L150.84 -41.02C147.9 -41.02 146.45 -39.07 146.48 -35.15C146.52 -31.24 147.98 -29.29 150.84 -29.29L201.28 -29.29C201.82 -29.29 202.13 -29.17 202.21 -28.94C202.29 -28.7 202.32 -28.43 202.32 -28.12L202.32 -23.36C202.32 -23.05 202.29 -22.78 202.21 -22.55C202.13 -22.31 201.82 -22.2 201.28 -22.2L154.44 -22.2C151.66 -22.2 149.74 -21.48 148.69 -20.05C147.65 -18.61 147.12 -17.01 147.12 -15.22L147.12 1.39C147.12 3.18 147.65 4.78 148.69 6.22C149.74 7.65 151.66 8.37 154.44 8.37L214.76 8.37C217.63 8.37 219.08 6.41 219.12 2.5C219.16 -1.41 217.7 -3.37 214.76 -3.37L162 -3.37C161.46 -3.37 161.15 -3.49 161.07 -3.72C160.99 -3.95 160.95 -4.22 160.95 -4.53L160.95 -9.3C160.95 -9.61 160.99 -9.88 161.07 -10.11C161.15 -10.34 161.46 -10.46 162 -10.46L208.83 -10.46C211.62 -10.46 213.54 -11.18 214.58 -12.61C215.63 -14.04 216.15 -15.65 216.15 -17.43ZM181.52 -52.76L159.21 -70.89L176.64 -70.89C179.58 -70.89 181.08 -72.85 181.12 -76.76C181.15 -80.67 179.66 -82.63 176.64 -82.63L155.96 -82.63L155.96 -91.34C155.96 -95.06 153.65 -96.92 149.04 -96.92C144.43 -96.92 142.13 -95.06 142.13 -91.34L142.13 -82.63L121.21 -82.63C118.26 -82.63 116.81 -80.67 116.85 -76.76C116.89 -72.85 118.34 -70.89 121.21 -70.89L139.57 -70.89L115.63 -25.68C113.62 -21.89 114.72 -19.14 118.94 -17.43C123.16 -15.73 126.24 -16.66 128.18 -20.22L150.15 -61.71L170.83 -44.28C173.93 -41.18 177.24 -41.1 180.77 -44.04C184.29 -46.99 184.54 -49.89 181.52 -52.76ZM207.9 -48.58L207.9 -90.3C207.9 -94.02 205.6 -95.87 200.99 -95.87C196.38 -95.87 194.07 -94.02 194.07 -90.3L194.07 -48.58C194.07 -44.86 196.38 -43 200.99 -43C205.6 -43 207.9 -44.86 207.9 -48.58Z M327.25 -2.56L327.25 -90.18C327.25 -93.9 324.95 -95.76 320.34 -95.76C315.73 -95.76 313.42 -93.9 313.42 -90.18L313.42 -2.56C313.42 1.16 315.73 3.02 320.34 3.02C324.95 3.02 327.25 1.16 327.25 -2.56ZM246.02 -8.48C262.44 -14.45 274.86 -22.91 283.27 -33.88C291.67 -44.84 295.87 -54.39 295.87 -62.52L295.87 -86.23C295.87 -88.01 295.35 -89.62 294.31 -91.05C293.26 -92.48 291.34 -93.2 288.55 -93.2L243.35 -93.2C240.4 -93.2 238.95 -91.25 238.99 -87.33C239.03 -83.42 240.48 -81.46 243.35 -81.46L281 -81.46C281.54 -81.46 281.85 -81.35 281.93 -81.12C282.01 -80.88 282.05 -80.61 282.05 -80.3L282.05 -66.12C282.05 -55.12 277.05 -45.38 267.05 -36.9C257.06 -28.41 247.8 -22.35 239.28 -18.71C236.18 -17.39 235.42 -14.95 237.01 -11.39C238.6 -7.82 241.6 -6.86 246.02 -8.48Z M463.22 -0.12L463.22 -28.59C463.22 -30.37 462.7 -31.98 461.65 -33.41C460.6 -34.84 458.69 -35.56 455.9 -35.56L401.51 -35.56C398.72 -35.56 396.8 -34.84 395.76 -33.41C394.71 -31.98 394.19 -30.37 394.19 -28.59L394.19 -0.12C394.19 1.67 394.71 3.27 395.76 4.71C396.8 6.14 398.72 6.86 401.51 6.86L455.9 6.86C458.69 6.86 460.6 6.14 461.65 4.71C462.7 3.27 463.22 1.67 463.22 -0.12ZM417.08 -45.9L402.79 -89.72C401.55 -93.28 398.76 -94.29 394.42 -92.74C392.48 -92.04 391.09 -91.15 390.24 -90.06C389.39 -91.15 387.99 -92.04 386.05 -92.74C381.72 -94.29 378.93 -93.28 377.69 -89.72L354.91 -21.15C353.67 -17.59 355.22 -15.07 359.56 -13.6C363.9 -12.12 366.69 -13.17 367.93 -16.73L390.24 -83.79L404.07 -41.49C405.31 -37.92 408.1 -36.88 412.43 -38.35C416.77 -39.82 418.32 -42.34 417.08 -45.9ZM449.39 -22.66L449.39 -6.04C449.39 -5.73 449.35 -5.46 449.27 -5.23C449.2 -5 448.89 -4.88 448.34 -4.88L409.06 -4.88C408.52 -4.88 408.21 -5 408.13 -5.23C408.06 -5.46 408.02 -5.73 408.02 -6.04L408.02 -22.66C408.02 -22.97 408.06 -23.24 408.13 -23.47C408.21 -23.71 408.52 -23.82 409.06 -23.82L448.34 -23.82C448.89 -23.82 449.2 -23.71 449.27 -23.47C449.35 -23.24 449.39 -22.97 449.39 -22.66ZM442.07 -43.58L442.07 -90.18C442.07 -93.9 439.76 -95.76 435.15 -95.76C430.54 -95.76 428.24 -93.9 428.24 -90.18L428.24 -43.58C428.24 -39.86 430.54 -38 435.15 -38C439.76 -38 442.07 -39.86 442.07 -43.58ZM463.8 -69.61C463.8 -72.09 462.93 -74.2 461.18 -75.94C459.44 -77.69 457.33 -78.56 454.85 -78.56C452.37 -78.56 450.26 -77.69 448.52 -75.94C446.77 -74.2 445.9 -72.09 445.9 -69.61C445.9 -67.13 446.77 -65.02 448.52 -63.28C450.26 -61.53 452.37 -60.66 454.85 -60.66C457.33 -60.66 459.44 -61.53 461.18 -63.28C462.93 -65.02 463.8 -67.13 463.8 -69.61Z"></path>
		</g>
	</svg>
</a>
<!-- ---------- -->
<!-- 로고 end -->	
<!-- ---------- -->

<!-- ---------- -->
<!-- form start -->
<!-- ---------- -->
<form action="/user/join" method="post">

<!-- 소셜 로그인일 경우, SNS에서 받은 정보를 넘길 파라미터 시작 -->
<c:if test="${userInfo ne null }">
	<input type="hidden" name="userPw" id="userPw" value="${userInfo.userPw}" readonly="readonly">
	<input type="hidden" name="socialId" id="socialId" value="${userInfo.userPw}" readonly="readonly">
	<input type="hidden" name="socialType" id="socialType" value="${socialType}" readonly="readonly">
</c:if>
<!-- 소셜 로그인일 경우, SNS에서 받은 정보를 넘길 파라미터 끝 -->

<!-- ------------------- -->
<!-- 이메일 입력 폼 시작 -->
<!-- ------------------- -->
<div class="row g-2 mb-3" id="input-Email">

	<!-- 소셜 로그인일 경우, 입력받을 이메일 시작 -->
	<c:if test="${userInfo.userNick ne null}">
		
		<div class="form-floating col-5">
			<input type="text" class="form-control" name="Email" id="Email" placeholder="이메일" value="${userInfo.userEmail}"> 
			<label for="Email">이메일</label>
		</div>
	
		<div class="form-floating col-5">
			<select class="form-select" name="userEmailSelect" id="userEmailSelect">
				<option selected>직접입력</option>
				<option value="@gmail.com">@gmail.com</option>
				<option value="@naver.com">@naver.com</option>
				<option value="@hanmail.net">@hanmail.net</option>
			</select>
			<label for="userEmailSelect">선택</label>
		</div>
	
		<div class="form-floating col-2">
			<button type="button" class="btn btn-secondary btn-lg btn-duplChk" id="chkDupEmail" value="중복">중복</button>
		</div>
	
	</c:if>
	<!-- 소셜 로그인일 경우, 입력받을 이메일 끝 -->

	<!-- 소셜가입이 아닐 경우, 입력받을 이메일 시작 -->
	<c:if test="${userInfo.userNick eq null}">
		
			<div class="form-floating col-5">
				<input type="text" class="form-control" name="Email" id="Email" placeholder="이메일"> 
				<label for="Email">이메일</label>
				<span class="invalid-feedback" id="msgEmail"></span>
			</div>
	
			<div class="form-floating col-5">
				<select class="form-select" name="userEmailSelect" id="userEmailSelect">
					<option selected>직접입력</option>
					<option value="@gmail.com">@gmail.com</option>
					<option value="@naver.com">@naver.com</option>
					<option value="@hanmail.net">@hanmail.net</option>
				</select>
				<label for="userEmailSelect">선택</label>
			</div>
	
			<div class="form-floating col-2">
				<a type="button" class="btn btn-secondary btn-lg btn-duplChk" id="chkDupEmail">중복</a>
			</div>
			
	</c:if>
	<!-- 소셜가입이 아닐 경우, 입력받을 이메일 시작 -->

	<input type="hidden" class="form-control" name="userEmail" id="userEmail" placeholder="이메일" value="${userInfo.userEmail}">
</div>
<!-- ----------------- -->
<!-- 이메일 입력 폼 끝 -->
<!-- ----------------- -->

<!-- 인증번호 입력 시작 -->
<div class="row g-2 mb-3" id="input-Email-code">
	<div class="form-floating col-12">
		<input type="text" class="form-control" name="EmailCode" id="EmailCode" placeholder="인증번호"> 
		<label for="EmailCode">인증번호</label>
		<span id="msgEmailCode"></span>
	</div>	
</div>
<!-- 인증번호 입력 끝 -->


<!-- --------------------- -->
<!-- 비밀번호 입력 폼 시작 -->
<!-- --------------------- -->
<!-- 소셜 로그인이 아닐 경우, 비밀번호 입력숨김 -->	
<c:if test="${userInfo eq null}">
<div id="input-Pw">
	<div class="form-floating mb-3">
		<input type="text" class="form-control" name="userPw" id="userPw" placeholder="비밀번호"> 
		<label for="userPw">비밀번호</label>
		<span id="msgPw"></span>
	</div>
</div>
<div id="input-PwChk">
	<div class="form-floating mb-3">
		<input type="text" class="form-control" name="userPwChk" id="userPwChk" placeholder="비밀번호 확인"> 
		<label for="userPwChk">비밀번호 확인</label>
		<span id="msgPwChk"></span>
	</div>
</div>
</c:if>
<!-- ------------------- -->
<!-- 비밀번호 입력 폼 끝 -->
<!-- ------------------- -->

<!-- 닉네임 시작 -->
<div id="input-nick">
<div class="form-floating mb-3">
	<input type="text" class="form-control" name="userNick" id="userNick" placeholder="닉네임"value="${userInfo.userNick}"> 
	<label for="userNick">닉네임</label>
	<span id="msgNick"></span>
</div>
</div>
<!-- 닉네임 끝 -->

<!-- 이름 시작 -->
<div id="input-name">
<div class="form-floating mb-3">
	<input type="text" class="form-control" name="userName" id="userName" placeholder="이름" value="${userInfo.userName}"> 
	<label for="userName">이름</label>
	<span id="msgName"></span>
</div>
</div>
<!-- 이름 끝 -->

<!-- 연락처 시작 -->
<div class="row g-2 mb-3" id="input-phone">
	<div class="col-12">
		<div class="form-floating">
			<input type="text" class="form-control" name="userPhone" id="userPhone" placeholder="연락처" value="${userInfo.userPhone }">
			<label for="userPhone">연락처</label>
			<span id="msgPhone"></span>
		</div>
	</div>
</div>
<!-- 연락처 끝 -->

<!-- 성별 시작 -->
<div class="form-floating mb-3">

	<!-- 소셜 로그인일 경우, 성별 처리 시작  -->
	<c:if test="${userInfo.userGender ne null}"> 
		<select class="form-select" name="userGender" id="userGender">
			<c:if test="${userInfo.userGender eq 'M'.charAt(0)}">
				<option value="M" selected>남자</option>
			</c:if>
		
			<c:if test="${userInfo.userGender eq 'F'.charAt(0)}">
				<option value="F" selected>여자</option>
			</c:if>
		</select> 
	</c:if>
	<!-- 소셜 로그인일 경우, 성별 처리 끝 -->
	
	<!-- 소셜 로그인이 아닐 경우, 성별 처리 시작 -->
	<c:if test="${userInfo.userGender eq null}"> 
	<select class="form-select" name="userGender" id="userGender">
		<option value="M" selected>남자</option>
		<option value="F">여자</option>
	</select> 
	</c:if>
	<!-- 소셜 로그인이 아닐 경우, 성별 처리 끝 -->

	<label for="userEmailSelect">성별</label>

</div>
<!-- 성별 끝 -->

<!-- 생일 시작 -->
<div class="row g-2 mb-3" id="input-birth">
	<div class="col-md">
		<div class="form-floating">
			<input type="text" class="form-control" name="userBirthYear" id="userBirthYear" placeholder="년" value="${userInfo.userBirthYear}">
			<label for="userBirthYear">년</label>
			<span id="msgBirthYear"></span>
		</div>
	</div>
	<div class="col-md">
		<div class="form-floating">
			<select class="form-select" name="userBirthMonth" id="userBirthMonth">
				<c:if test="${userInfo ne null }">
					<option value="${userInfo.userBirthMonth }">${userInfo.userBirthMonth}</option>
				</c:if>
				<c:if test="${userInfo eq null }">
				<option selected></option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				<option value="6">6</option>
				<option value="7">7</option>
				<option value="8">8</option>
				<option value="9">9</option>
				<option value="10">10</option>
				<option value="11">11</option>
				<option value="12">12</option>
				</c:if>
			</select> 
			<label for="userBirthMonth">월</label>
			<span id="msgBirthMonth"></span>
		</div>
	</div>
	<div class="col-md">
		<div class="form-floating">
			<input type="text" class="form-control" name="userBirthDay" id="userBirthDay" placeholder="이메일" value="${userInfo.userBirthDay }">
			<label for="userBirthDay">일</label>
			<span id="msgBirthDay"></span>
		</div>
	</div>
</div>
<!-- 생일 시작 -->

<!-- 주소 시작 -->
<div class="row g-2 mb-3" id="input-address">
	<div class="col-10">
		<div class="form-floating">
			<input type="text" class="form-control" name="userPostCode" id="userPostCode" placeholder="우편번호">
			<label for="userPostCode">우편번호</label>
			<span id="msgPostCode"></span>
		</div>
	</div>
	
	<div class="col-2">
		<div class="form-floating">
			<button type="button" class="btn btn-secondary btn-lg btn-postcode" onclick="kakaoPostcode()" value="${userInfo.userPostCode }">검색</button>
		</div>
	</div>
</div>

<div class="form-floating mb-3">
	<input type="text" class="form-control" name="userAddress" id="userAddress" placeholder="주소" value="${userInfo.userAddress }">
	<label for="userAddress">주소</label>
	<span id="msgAddress"></span>
</div>

<div class="row g-2 mb-3">
	<div class="col-6">
		<div class="form-floating">
			<input type="text" class="form-control" name="userDetailAddress" id="userDetailAddress" placeholder="상세주소" value="${userInfo.userDetailAddress }">
			<label for="userDetailAddress">상세주소</label>
			<span id="msgDetailAddress"></span>
		</div>
	</div>
	
	<div class="col-6 mb-3">
		<div class="form-floating">
			<input type="text" class="form-control" name="userExtraAddress" id="userExtraAddress" placeholder="참고항목" value="${userInfo.userExtraAddress }">
			<label for="userExtraAddress">참고사항 (선택)</label>
			<span id="msgExtraAddress"></span>
		</div>
	</div>
</div>
	
<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
	<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
</div>

<!-- 우편번호 API script start -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/join/user/js/Kakao_postAPI.js"></script>
<!-- 우편번호 API script end -->

<div class="d-grid mb-5">
	<button class="btn btn-join btn-lg" onclick="fn_validate">가입하기</button>
	<a href="/user/login" class="btn btn-secondary btn-lg" type="button">취소</a>
</div>

</form>
<!-- form start -->
</div>
<!-- form 배경 end -->
</div>
<!-- page 배경 end -->

</body>
</html>