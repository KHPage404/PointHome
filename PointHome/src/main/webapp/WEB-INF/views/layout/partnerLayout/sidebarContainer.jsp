<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
#sidebarContainer {
	margin-top:54px;
	width:15%;
	height: 100%;
	background-color: white;
	position: fixed;
}



</style>

<body>


<div id="sidebarContainer">
	<div class="accordion accordion-flush" id="accordionFlushExample">
	
	 <div class="accordion-body"><a href="/partner/main">대시보드</a></div>
	 <!-- #1 -->
	  <div class="accordion-item">
	    <h2 class="accordion-header" id="flush-headingOne">
	      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
	        상점관리
	      </button>
	    </h2>
	    <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
	      <div class="accordion-body"><a href="./shopsetting">상점수정</a></div>
	       <div class="accordion-body"><a href="./videomanage">영상관리</a></div> <!-- 추가 -->
	    </div>
	    
	  </div>
	  <!-- #2 -->
	  <div class="accordion-item">
	    <h2 class="accordion-header" id="flush-headingTwo">
	      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
	       	예약관리
	      </button>
	    </h2>
	    <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
			<div class="accordion-body"><a href="./usermanage">회원관리</a></div>				   		
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
			<div class="accordion-body"><a href="./usermanage">회원관리</a></div>				   		
	    </div>
	  </div>
	  
	  <!-- #4 -->
	  	  <div class="accordion-item">
	    <h2 class="accordion-header" id="flush-headingFour">
	      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFour" aria-expanded="false" aria-controls="flush-collapseFour">
	        공지관리
	      </button>
	    </h2>
	    <div id="flush-collapseFour" class="accordion-collapse collapse" aria-labelledby="flush-headingFour" data-bs-parent="#accordionFlushExample">
			<div class="accordion-body"><a href="./partnernotice">공지사항</a></div>				   		
	    </div>
	    <div id="flush-collapseFour" class="accordion-collapse collapse" aria-labelledby="flush-headingFour" data-bs-parent="#accordionFlushExample">
			<div class="accordion-body"><a href="./usermanage">회원관리</a></div>				   		
	    </div>
	  </div>
	  
	</div>
</div>

</body>
</html>