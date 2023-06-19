<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<link href="/resources/mypage/userInfo.css" rel="stylesheet">

<c:import url="/WEB-INF/views/layout/myprofile.jsp" />

<style>
	#profileImg2 {width: 100px; height: 100px;}
</style>

<style type="text/css">

	a {
		color: black;
		text-decoration: none;
	}
	
	.modal {
	  position: fixed;
	  top: 0;
	  left: 0;
	
	  width: 100%;
	  height: 100%;
	
	  display: none;
	
	  background-color: rgba(0, 0, 0, 0.4);
	}
	      
	.modal.show {
	  display: block;
	}
	
	
	.modal_body {
	  position: absolute;
	  top: 50%;
	  left: 50%;
	
	  width: 400px;
	  height: 100px;
	
	  padding: 40px;
	
	  text-align: center;
	
	  background-color: rgb(255, 255, 255);
	  border-radius: 10px;
	  box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
	
	  transform: translateX(-50%) translateY(-50%);
	}

body{
   font-family: 'SBAggroL';
}	

#userInfo {
	width: 1000px;
	background-color: white;
}


</style>



<div id="userInfo" class="container" style="padding: 30px; border-radius: 30px; border: 3px solid #c8c8c8; margin-bottom: 100px;">

<form action="./update" method="post" enctype="multipart/form-data">

<!-- 	<div id="userInfo" class="container mt-5" style="padding: 40px;"> -->
		<div style="font-size: 20px;"><i class="bi bi-person-vcard"></i>&nbsp;&nbsp;기본 회원정보</div>
		<hr id="line">

		<div id="photoDiv">
			<h6>사진</h6>
			
			
			
		</div>
		<div id="profile2">
			<c:choose>
			<c:when test="${userFile.userImg eq null }">
			<div id="image_container"><img id="profileImg2" alt="" src="https://t1.daumcdn.net/cfile/tistory/2513B53E55DB206927"></div>
			</c:when>
			<c:otherwise>
			<img id="profileImg2" src="/upload/${userFile.userImg }"  alt="">
			</c:otherwise>
			</c:choose>

			
			<div class="btn2">
				<label for="file" class="btn btn-outline-dark nickBtn2" style="font-size: 15px;">사진 변경</label>
				<input type="file" name="file" id="file" accept=".jpg, .png, .gif" style="display: none;" onchange="setThumbnail(event);">
			</div>
		

		</div>
		<hr>
		<div id="userName">
			<h6 style="margin-left: 13px;">이름(실명)</h6>
			<input type="text" class="form-control" id="floatingInput"
				style="width: 50%; margin-left: 215px; margin-top: -68px;"
				placeholder="${res.userName }" value="${res.userName }" disabled>
			<label for="floatingInput"></label>

		</div>
		<hr>
		<div id="userId">
			<h6 style="margin-left: 13px;">아이디(이메일)</h6>
			<input type="text" class="form-control" id="floatingInput"
				style="width: 50%; margin-left: 215px; margin-top: -68px;"
				placeholder="${res.userEmail }" disabled> <label
				for="floatingInput"></label>

		</div>
		<hr>


		<div id="divNick">
			<h6 style="margin-left: 13px;">닉네임</h6>
			<input type="text" class="form-control" id="floatingInput"
				style="width: 50%; margin-left: 215px; margin-top: -68px;"
				value="${res.userNick }" name="userNick">
			<label for="floatingInput"></label>

		</div>
		<hr>
		<div id="divPw">
			<h6 style="margin-left: 13px; ">비밀번호</h6>
<!-- 			<input type="text" class="form-control" id="floatingInput" name="userPw" -->
<!--             style="width: 20%; margin-left: 215px; margin-top: -72px; margin-bottom: 10px;" -->
<!--             placeholder="비밀번호 확인"> -->
			<input type = "password" class="form-control" id="floatingInput" name="userPw" value="${res.userPw }"
            style="width: 20%; margin-left: 215px; margin-top: -68px;"
            placeholder="비밀번호 수정">
            <label for="floatingInput"></label>
<!-- 			<input type="text" class="form-control" id="floatingInput" name="" -->
<!--             style="width: 20%; margin-left: 215px; margin-top: 0px; margin-bottom: 10px;" -->
<!--             placeholder="비밀번호 수정 확인"> -->
			
<!-- 			<button type="button" class="btn btn-outline-dark proBtn">비밀번호 수정</button> -->
		</div>

		<hr>
		
 <div id="divBirth">
         <h6 style="margin-left: 13px;">생년월일</h6>
         <input type="text" class="form-control" id="floatingInput"
            style="width: 13%; margin-left: 215px; margin-top: -68px;"
            placeholder="${res.userBirthYear }${res.userBirthMonth  }${res.userBirthDay  }" disabled>
         <label for="floatingInput"></label>
      </div>
      <hr>

		<div id="divPhone">
			<h6 style="margin-left: 13px;">연락처</h6>
			<input type="text" class="form-control" id="floatingInput"
				style="width: 23%; margin-left: 215px; margin-top: -68px;"
				value="${res.userPhone}" name="userPhone">
			<label for="floatingInput"></label>
		</div>
		<hr>
		<div id="divPostCode">
			
			<h6 style="margin-left: 13px;">우편번호</h6>
			<span id="floatingInput"><input type="text" class="form-control" id="userPostCode"
				style="width: 23%; margin-left: 215px; margin-top: -68px;"
				value="${res.userPostCode}" name="userPostCode">
			<label for="floatingInput"></label>
		<button type="button" class="btn btn-outline-dark PostCodeBtn" style="font-size: 15px; margin-left: 480px;" onclick="kakaoPostcode()">우편번호 확인</button>
		</span>
		</div>

		<hr>
		
		<div id="divAddress">
			<h6 style="margin-left: 13px;">주소</h6>
			<input type="text" class="form-control" id="userAddress"
				style="width: 50%; margin-left: 215px; margin-top: -72px;"
				value="${res.userAddress }" name="userAddress">
			<input type="text" class="form-control" id="userDetailAddress"
				style="width: 50%; margin-left: 215px; margin-top: 0px;"
				value="${res.userDetailAddress }" name="userDetailAddress">
			<input type="text" class="form-control" id="userExtraAddress"
				style="width: 50%; margin-left: 215px; margin-top: 0px;"
				value="${res.userExtraAddress }" name="userExtraAddress">
			<label for="floatingInput"></label>
		</div>
		
				
	<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
		<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
	</div>
		
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="/resources/join/user/js/Kakao_postAPI.js"></script>
	<!-- 주소 끝 -->
		
		<!-- 모달창 -->
		
		
		<div class="modal">
	      <div class="modal_body" >정말 탈퇴하시겠습니까?&nbsp;&nbsp;&nbsp;    
	      <a href="./removeUser"><button type="button" class="btn btn-outline-primary btn-default btn-xs">확인</button></a>
	      <button type="button" class="btnModalCancle btn btn-outline-primary btn-default btn-xs " >취소</button>
	      </div>     
	    </div>

		<div id="actionBtn" style="text-align: center; padding-top: 30px;">
			<button class="btn btn-outline-dark proBtn">수정완료</button>
			<button type="button" class="btn-open-popup btn btn-outline-dark proBtn">회원탈퇴</button>
		</div>

	</div>

</form>

</div>

	 <script>
      const body = document.querySelector('body');
      const modal = document.querySelector('.modal');
      const btnOpenPopup = document.querySelector('.btn-open-popup');
      const btnModalCancle = document.querySelector('.btnModalCancle');
      btnOpenPopup.addEventListener('click', () => {
        modal.classList.toggle('show'); 

        if (modal.classList.contains('show')) {
          body.style.overflow = 'hidden';
          
        }
      });

      modal.addEventListener('click', (event) => {
        if (event.target === modal) {
          modal.classList.toggle('show');
          

          if (!modal.classList.contains('show')) {
            body.style.overflow = 'auto';
          }
        }
      });

      btnModalCancle.addEventListener('click', (event) => {
    	  modal.classList.remove('show'); 
      });
      
    </script>
	

    <script>
      function setThumbnail(event) {
        var reader = new FileReader();

        reader.onload = function(event) {
          var img = document.getElementById("profileImg2");
          img.setAttribute("src", event.target.result);
//           document.querySelector("div#image_container").appendChild(img);
        };

        reader.readAsDataURL(event.target.files[0]);
      }
    </script>

<c:import url="/WEB-INF/views/layout/footer.jsp" />















