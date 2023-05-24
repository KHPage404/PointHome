<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<!-- 부트스트랩 CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

<!-- 폰트 적용 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang&family=Nanum+Brush+Script&display=swap" rel="stylesheet">

<script type="text/javascript">


$(function() {      
      $("#freeboardContent").summernote({
         height: 300,
         placeholder: "본문 내용",
         focus: true
      })
})


</script>



<style type="text/css">



      .modal {
        position: absolute;
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
        position: absolute;
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

.modal2_body {
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



*{
font-family: 'Gowun Batang', serif;
}
</style>


</head>
<body>

<div class="container">

<br><br>

<h1 class="text-center">게시글 작성</h1><br>
<hr><br>

<form action="./update" method="post" enctype="multipart/form-data">
   
   
   <input type="text" id="freeboardTitle" name="freeboardTitle" placeholder= "제목" style="width:300px;" required ><br><br>
   

   <textarea style="display: none" id="freeboardContent" name="freeboardContent" ></textarea>

   <input type="file" name="dataMul" multiple="multiple">

   <div class="modal">
      <div class="modal_body" >게시글을 등록하시겠습니까?&nbsp;&nbsp;&nbsp;    
      <button type="submit" class="btn btn-outline-primary btn-default btn-xs">확인</button>
      <button type="submit" class="btn btn-outline-primary btn-default btn-xs">취소</button>
      </div>     
    </div>

   <div class="modal2">
      <div class="modal2_body" >게시글작성을 중단하시겠습니까?&nbsp;&nbsp;&nbsp;    
      <a href="/pro/main"><button type="button" class="btn btn-outline-primary btn-default btn-xs">확인</button></a>
      <a href="/pro/main"><button type="button" class="btn btn-outline-primary btn-default btn-xs">취소</button></a>
      </div>
    </div>

   <div class="text-end">
   <button type="button" class="btn-open-popup btn btn-secondary" >작성</button>
   <button type="button" class="btn-reset-popup btn btn-secondary" >취소</button>
   </div>
   <hr>
</form>







</div>

     <script>
      const body = document.querySelector('body');
      const modal = document.querySelector('.modal');
      const btnOpenPopup = document.querySelector('.btn-open-popup');

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
    </script>

     <script>
      const body2 = document.querySelector('body');
      const modal2 = document.querySelector('.modal2');
      const btnOpenPopup2 = document.querySelector('.btn-reset-popup');

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
    </script>
    


</body>
</html>