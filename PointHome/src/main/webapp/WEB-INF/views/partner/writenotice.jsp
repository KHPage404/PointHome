<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<!-- include libraries(jQuery, bootstrap) -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<!-- 부트스트랩 CDN -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>


<script type="text/javascript">
$(function() {      
      
	$("#partnerNoticeContent").summernote({
         height: 300,
        /*  placeholder: "본문 내용", */
         focus: true
      })
      
      $("#btnCancle").click(function(){
    		history.go(-1)();
    	});

	
      
})


</script>



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

.modal2 {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	display: none;
	background-color: rgba(0, 0, 0, 0.4);
}

.modal2.show {
	display: block;
}

.modal_body {
	position: fixed;
	top: 50%;
	left: 50%;
	width: 420px;
	height: 100px;
	padding: 40px;
	text-align: center;
	background-color: rgb(255, 255, 255);
	border-radius: 10px;
	box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
	transform: translateX(-50%) translateY(-50%);
}

.modal2_body {
	position: fixed;
	top: 50%;
	left: 50%;
	width: 420px;
	height: 100px;
	padding: 40px;
	text-align: center;
	background-color: rgb(255, 255, 255);
	border-radius: 10px;
	box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
	transform: translateX(-50%) translateY(-50%);
}

/* * { */
/* 	font-family: 'Gowun Batang', serif; */
/* } */
#writeContainter {
	margin-top: 54px;
}

#header, #footer {
	text-align: center;
}

.btn-info {
	font-family: 'SBAggroM';
	background-color: #7e00c2;
	border-color: transparent;
	color: white;
}

body {
	font-family: 'SBAggroL';
}

.container {
	margin: 0 auto;
}

.layer {
	display: none;
	position: absolute; /* 위치고정 임 */
	transform: translate(-50%, -50%);
	width: 300px;
	background-color: #fefefe;
	padding: 20px;
	border: 1px solid #888;
	z-index: 9999; /* 제일 위에 */
	outline: none;
}

.close-btn {
	color: #aaa;
	float: right;
	font-size: 20px;
	font-weight: bold;
	cursor: pointer;
}

.close-btn:hover, .close-btn:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

/* 레이어 창 위치 들 */
#copyright_law {
	left: 61%;
	top: 46%;
}

#post_guide {
	left: 69%;
	top: 49%;
}

/* 버튼 모양 없애기  */
.layer_show {
	background: none;
	border: none;
	text-decoration: none;
}

.layer_show:focus {
	outline: none;

}
body{
   font-family: 'SBAggroL';
}
.container {
   margin: 0 auto;
}

</style>



<div id="writeContainter" class="container">

	<br> <br>

	<h1 style="text-align: center; font-family: 'SBAggroM';">
		<i class="bi bi-journal-text"></i>&nbsp;&nbsp;공지사항 작성
	</h1>
	<br> ※ 음란물, 차별, 비하, 혐오 및 초상권, 저작권 침해 게시물은 민, 형사상의 책임을 질 수 있습니다.
	<button type="button" class="layer_show" layer="copyright_law">[저작권법
		안내]</button>
	<button type="button" class="layer_show" layer="post_guide">[게시물
		활용 안내]</button>

	<div id="copyright_law" class="layer">
		<div class="layer-content">
			<span class="close-btn">&times;</span>
			<h3>저작권법 안내</h3>
			<hr>
			<p>이용자가 불법복제물을 게재, 유통하면 이에 대한 경고 및 불법복제물의 삭제 또는 전송 중단 조치를 할 수
				있으며, 경고를 받은 이용자에게 사용 정지를 할 수 있습니다. (관련 법률: 저작권법 제133조의 제1항 및 제2항)</p>
		</div>
	</div>

	<div id="post_guide" class="layer">
		<div class="layer-content">
			<span class="close-btn">&times;</span>
			<h3>게시물 활용 안내</h3>
			<hr>
			<p>이용자가 게시한 게시물의 저작권은 게시한 이용자에게 귀속됩니다. 단, 회사는 서비스의 운영, 전시, 전송,
				배포, 홍보의 목적으로 회원의 별도의 허락 없이 무상으로 저작권법에 규정하는 범위 내에서 이용자가 등록한 게시물을 사용할
				수 있습니다. (세부조항 '이용약관' 제13조와 동일)</p>
		</div>
	</div>
	<br>
	<hr>
	<form action="./writenotice" method="post" enctype="multipart/form-data">

		<input style="width: 450px;" name="partnerNoticeTitle" type="text"
			class="form-control" placeholder="제목" required><br>


		<textarea style="display: none" id="partnerNoticeContent"
			name="partnerNoticeContent"></textarea>

		<input type="file" name="dataMul" multiple="multiple">

		<div class="modal">
			<div class="modal_body">
				게시글을 등록하시겠습니까?&nbsp;&nbsp;&nbsp;
				<button type="submit" class="btn btn-info btn-sm">확인</button>
				<button type="button" class="btnModalCancle btn btn-info btn-sm ">취소</button>
			</div>
		</div>

		<div class="modal2">
			<div class="modal2_body">
				게시글작성을 중단하시겠습니까?&nbsp;&nbsp;&nbsp;
				<button type="button" class="btn btn-info btn-sm" id="btnCancle">확인</button>
				<button type="button" class="btnModalCancle2 btn btn-info btn-sm">취소</button>
			</div>
		</div>

		<div class="text-end">
			<button type="button" class="btn-open-popup btn btn-info">작성</button>
			<button type="button" class="btn-reset-popup btn btn-info">취소</button>
		</div>
	</form>
	<br>

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
         
         if (!modal.classList.contains('show')) {
             body.style.overflow = 'auto';
           }
      });
      
    </script>

<script>
      const body2 = document.querySelector('body');
      const modal2 = document.querySelector('.modal2');
      const btnOpenPopup2 = document.querySelector('.btn-reset-popup');
      const btnModalCancle2 = document.querySelector('.btnModalCancle2');
      

      btnOpenPopup2.addEventListener('click', () => {
        modal2.classList.toggle('show');

        if (modal2.classList.contains('show')) {
          body2.style.overflow = 'hidden';
        }
      });

      modal2.addEventListener('click', (event) => {
        if (event.target === modal2) {
          modal2.classList.toggle('show');

          if (!modal2.classList.contains('show')) {
            body2.style.overflow = 'auto';
          }
        }
      });
      
      btnModalCancle2.addEventListener('click', (event) => {
         modal2.classList.remove('show'); 
         
         if (!modal2.classList.contains('show')) {
             body2.style.overflow = 'auto';
           }
      });
      
      //레이어 창 구현
      
      // x 버튼 누르면 레이어 창 꺼진다
      var closeButtons = document.querySelectorAll('.close-btn');
      closeButtons.forEach(function (button) {
          button.addEventListener('click', function () {
              var layer = this.parentElement.parentElement;
              layer.style.display = 'none';
          });
      });

      // 버튼 클릭 시 해당 레이어 창 표시하는 코드
      var layerButtons = document.querySelectorAll('.layer_show');
      layerButtons.forEach(function (button) {
          button.addEventListener('click', function () {
              var layerId = this.getAttribute('layer');
              var layer = document.getElementById(layerId);
              layer.style.display = 'block';
          });
      });
      
      
      //여긴 버튼 클릭 했을 때 자동으로 옆에 꺼지게 구현하는 곳임 원래는 직접꺼야함
      var closeButtons = document.querySelectorAll('.close-btn');
      closeButtons.forEach(function (button) {
          button.addEventListener('click', function () {
              var layer = this.parentElement.parentElement;
              layer.style.display = 'none';
          });
      });

      var layerButtons = document.querySelectorAll('.layer_show');
      layerButtons.forEach(function (button) {
          button.addEventListener('click', function () {
              var layerId = this.getAttribute('layer');
              var layer = document.getElementById(layerId);
              
              // 모든 레이어 창을 숨김 처리
              var allLayers = document.querySelectorAll('.layer');
              allLayers.forEach(function (l) {
                  l.style.display = 'none';
              });
              
              // 선택한 레이어 창을 표시
              layer.style.display = 'block';
          });
      });

    </script>
    


<c:import url="/WEB-INF/views/layout/footer.jsp" />
