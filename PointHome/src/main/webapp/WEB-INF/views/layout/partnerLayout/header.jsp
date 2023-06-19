<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>점집닷컴</title>

<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<style type="text/css">
a {
	color: black;
	text-decoration: none;
}
</style>

<style type="text/css">
#sidebarContainer {
	margin-top:54px;
	width:15%;
	height: 100%;
	background-color: white;
	position: fixed;
}

#container{
	margin-left:16%;
	padding-top: 60px;
}

</style>

</head>
<body>

<nav class="navbar bg-light fixed-top" style="background-color: #ccc;">
  <div class="container-fluid">
    <a class="ms-3" href="/partner/main" style="font-size: 23px;">PointHouse(제휴사)</a>
	<c:if test="${not empty partnerLogin }">
    	<a href="./logout" style="font-weight: bold;">로그아웃</a>
    </c:if>
  </div>
</nav>

<div id="sidebarContainer" style="width: 15%;">
	<div class="accordion accordion-flush" id="accordionFlushExample">

	 <div class="accordion-body"><a href="/partner/main">대시보드</a></div>
	 <!-- #1 -->
	  <div class="accordion-item">
	    <h2 class="accordion-header" id="flush-headingOne">
	      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
	        상점관리
	        수정
	      </button>
	    </h2>
	    <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
	      <div class="accordion-body"><a href="./shopsetting">상점수정</a></div>
	    </div>
	    <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
	      <div class="accordion-body"><a href="./partnerinfo">회원수정</a></div>
	    </div>
	    <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
	      <div class="accordion-body"><a href="./viewVideo">영상수정</a></div>
	    </div>
	  </div>
	  <!-- #2 -->
	  <div class="accordion-item" id="flush-headingTwo">
	    <div class="accordion-body">
			<a href="./reservemanage">예약관리</a>			   		
	    </div>
	  </div>
	  
	  <!-- #3 -->
	  	  <div class="accordion-item">
	    <h2 class="accordion-header" id="flush-headingThree">
	      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
	        문의/리뷰
	      </button>
	    </h2>
	    <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
			<div class="accordion-body"><a href="./viewReview">리뷰 조회</a></div>				   		
	    </div>
	   
	  </div>
	  
	  <!-- #4 -->
	  <div class="accordion-item">
	  <h2 class="accordion-header" id="flush-headingFour">
	      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFour" aria-expanded="false" aria-controls="flush-collapseFour">
	        공지사항
	      </button>
	    </h2>
		<div id="flush-collapseFour" class="accordion-collapse collapse"
			aria-labelledby="flush-headingFour"
			data-bs-parent="#accordionFlushExample">
			<div class="accordion-body">
				<a href="./partnernotice">공지사항 작성</a>
				
			</div>
		</div>
		<div id="flush-collapseFour" class="accordion-collapse collapse"
			aria-labelledby="flush-headingFour"
			data-bs-parent="#accordionFlushExample">
			<div class="accordion-body">
				<a href="./adminnoticelist">운영사 공지사항 조회</a>
			</div>
		</div>

			</div>
	
	</div>
</div>



