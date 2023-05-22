<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/header.jsp"/>
<link href="/resources/join/user/css/join.css" rel="stylesheet">

<!-- 전체 배경화면 색 설정 -->
<div class="bg-light">
<!-- 전체 배경화면 색 설정 끝 -->

<div class="container">

<div class="row text-center">

<!-- 좌여백 -->
<div class="col-3"></div>
<!-- 좌여백 끝 -->
<div class="col-6">

	<!-- 로고 -->
	<div class="h1 mt-3 mb-5">
		<a class="navbar-brand h1 text-center col-5" href="/">점집닷컴</a>
	</div>
	<!-- 로고 시작 끝 -->

	<form action="/user/join" method="post">
	<!-- 이메일 입력 폼 -->
	<div class="row g-2 mb-3">
		<div class="col-md">
			<div class="form-floating">
				<input type="email" class="form-control" name="userEmail" id="userEmail" placeholder="이메일">
				<label for="userEmail">이메일</label>
			</div>
		</div>
		
		<div class="col-md">
			<div class="form-floating">
				<select class="form-select" name="userEmailSelect" id="userEmailSelect">
					<option selected>직접입력</option>
					<option value="@gmail.com">@gmail.com</option>
					<option value="@naver.com">@naver.com</option>
					<option value="@hanmail.net">@hanmail.net</option>
				</select> 
				<label for="userEmailSelect">선택</label>
			</div>
		</div>
	</div>
	<!-- 이메일 입력 폼 -->

	<!-- 비밀번호 시작 -->
	<div class="form-floating mb-3">
		<input type="text" class="form-control" name="userPw" id="userPw" placeholder="비밀번호">
		<label for="userPw">비밀번호</label>
	</div>

	<div class="form-floating mb-3">
		<input type="text" class="form-control" name="userPwChk" id="userPwChk" placeholder="비밀번호 확인">
		<label for="userPwChk">비밀번호 확인</label>
	</div>
	<!-- 비밀번호 시작 -->

	<!-- 이름 시작 -->
	<div class="form-floating mb-3">
		<input type="text" class="form-control" name="userNick" id="userNick" placeholder="닉네임">
		<label for="userName">닉네임</label>
	</div>
	<!-- 이름 끝 -->

	<!-- 이름 시작 -->
	<div class="form-floating mb-3">
		<input type="text" class="form-control" name="userName" id="userName" placeholder="이름">
		<label for="userName">이름</label>
	</div>
	<!-- 이름 끝 -->

	<!-- 성별 시작 -->
	<div class="form-floating mb-3">
		<select class="form-select" name="userGender" id="userGender">
			<option value="M" selected>남자</option>
			<option value="F">여자</option>
		</select> 
		<label for="userEmailSelect">선택</label>
	</div>
	<!-- 성별 끝 -->

	<!-- 연락처 시작 -->
	<div class="form-floating mb-3">
		<input type="text" class="form-control" name="userPhone" id="userPhone" placeholder="연락처">
		<label for="floatingInput">연락처</label>
	</div>
	<!-- 연락처 끝 -->

	<!-- 생일 시작 -->
	<div class="row g-2 mb-3">
		<div class="col-md">
			<div class="form-floating">
				<input type="text" class="form-control" name="userBirthYear" id="userBirthYear" placeholder="년">
				<label for="userBirthYear">년</label>
			</div>
		</div>
		<div class="col-md">
			<div class="form-floating">
				<select class="form-select" name="userBirthMonth" id="userBirthMonth">
					<option selected>선택</option>
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
				</select> 
				<label for="userBirthMonth">월</label>
			</div>
		</div>
		<div class="col-md">
			<div class="form-floating">
				<input type="text" class="form-control" name="userBirthDay" id="userBirthDay" placeholder="이메일">
				<label for="userBirthDay">일</label>
			</div>
		</div>
	</div>
	<!-- 생일 시작 -->

	<!-- 주소 시작 -->
	<div class="row g-2 mb-3">
		<div class="col-8">
			<div class="form-floating">
				<input type="text" class="form-control" name="userPostCode" id="userPostCode" placeholder="우편번호">
				<label for="">우편번호</label>
			</div>
		</div>
		
		<div class="col-4">
			<div class="form-floating">
				<button type="button" class="btn btn-primary btn-lg" onclick="kakaoPostcode()">우편번호 찾기</button>
			</div>
		</div>
	</div>

	<div class="form-floating mb-3">
		<input type="text" class="form-control" name="userAddress" id="userAddress" placeholder="주소">
		<label for="floatingInput">주소</label>
	</div>
	
	<div class="row g-2 mb-3">
		<div class="col-6">
			<div class="form-floating">
				<input type="text" class="form-control" name="userDetailAddress" id="userDetailAddress" placeholder="상세주소">
				<label for="">상세주소</label>
			</div>
		</div>
		
		<div class="col-6 mb-3">
			<div class="form-floating">
				<input type="text" class="form-control" name="userExtraAddress" id="userExtraAddress" placeholder="참고항목">
				<label for="">참고사항</label>
			</div>
		</div>
	</div>
		
	<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
		<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
	</div>
		
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="/resources/join/user/js/Kakao_postAPI.js"></script>
	<!-- 주소 끝 -->
		
	<div class="d-grid mb-5">
	  <button class="btn btn-primary btn-lg" type="submit">가입하기</button>
	</div>
	</form>
	
</div>

<!-- 우 여백 -->
<div class="col-3"></div>
<!-- 우 여백 끝 -->

</div>
</div>
</div>

<c:import url="../layout/footer.jsp"/>