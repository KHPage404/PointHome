<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />
    
    
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
$(function() {      
      
	$("#reviewContent").summernote({
// 		width: 700,
         height: 300,
         focus: true
      })
      
    $("#btnCancle").click(function(){
  		history.go(-1)();
  	});

     
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

#reviewContainter {
	margin-top: 54px;
}

.reviewStar {
  display: flex;
  flex-direction: row-reverse; 
  font-size: 3rem;
  justify-content: space-around; 
  padding: 0 1.2em;
  text-align: center;
  width: 9em;
}
 
.reviewStar input {
  display: none;
}
 
.reviewStar label {
  -webkit-text-fill-color: transparent;
  -webkit-text-stroke-width: 2.3px;
  -webkit-text-stroke-color: #2b2a29;
  cursor: pointer;
}
 
.reviewStar :checked ~ label {
  -webkit-text-fill-color: gold;
}
 
.reviewStar label:hover,
.reviewStar label:hover ~ label {
  -webkit-text-fill-color: #fff58c;
}

* {
 	font-family : 'NotoSansKR-Regular';
}

input[type=text] {
	width: 500px;
	height: 35px;
	font-size: 18px;
	border: 0;
	border-radius : 15px;
	outline: none;
	background-color: #F8F6F4;
	
}
</style>
</head>



<body>
<hr>
<div id="reviewContainter" class="container">

<div class="text-center">

<form action="./writeReview" method="post">
   
   
   <input type="text" id="reviewTitle" name="reviewTitle" required ><br><br>
	<div class="reviewStar space-x-4 mx-auto">
	<input type="radio" id="5-stars" name="reviewGrade" value="5" />
	<label for="5-stars" class="star">★</label>
	<input type="radio" id="4-stars" name="reviewGrade" value="4" />
	<label for="4-stars" class="star">★</label>
	<input type="radio" id="3-stars" name="reviewGrade" value="3"/>
	<label for="3-stars" class="star">★</label>
	<input type="radio" id="2-stars" name="reviewGrade" value="2"/>
	<label for="2-stars" class="star">★</label>
	<input type="radio" id="1-star" name="reviewGrade" value="1" />
	<label for="1-star" class="star">★</label>
	</div>
   <br>
   
   <div class="text-center"><textarea style="display: none" id="reviewContent" name="reviewContent" ></textarea></div>

   <div class="modal">
      <div class="modal_body" >게시글을 등록하시겠습니까?&nbsp;&nbsp;&nbsp;    
      <button type="submit" class="btn btn-outline-primary btn-default btn-xs">확인</button>
      <button type="button" class="btnModalCancle btn btn-outline-primary btn-default btn-xs " >취소</button>
      </div>     
    </div>

   <div class="text-end">
   <button type="button" class="btn-open-popup btn btn-secondary" >작성</button>
   <button type="button" class="btn-reset-popup btn btn-secondary" id="btnCancle" >취소</button>
   </div>
</form>
</div>
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

</body>
</html>