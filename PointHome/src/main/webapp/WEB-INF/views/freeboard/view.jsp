<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<style type="text/css">
#header, #footer {
	text-align: center;
}

#header h1 {
	line-height: 3em;
}

#footer {
	margin-top: 30px;
}

#header a {
	text-decoration: none;
}
div.content {
	min-height: 300px;
}
div.fr{
	text-align: right;
}
#cmt{
	border-right:0px;
	border-top:0px;
	border-left:0px;
}


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

  width: 500px;
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

  width: 500px;
  height: 100px;

  padding: 40px;

  text-align: center;

  background-color: rgb(255, 255, 255);
  border-radius: 10px;
  box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);

  transform: translateX(0%) translateY(0%);
}




</style>
</head>
<body>

<div id="header">
<h1><a class="text-info" href="/">HEADER</a></h1>
</div>

<div class="container">

<h1 style="text-align: center">게시글 상세보기</h1>
<hr>
<!-- title JSTL로 가지고 오기 -->
<h3>${board.freeboardTitle }</h3>
<i class="bi bi-person-circle fs-1" style="height:200px"></i> writer_nick <br>
<!-- 날짜 -->
${board.freeboardDate }
<!-- 조회수 추천수 -->

<div class="fr">
	<span class="count">조회수 ${board.freeboardHit }</span>
	<span class="hit">추천수 8</span>
	<span class="cmtCount">댓글 4</span>
</div>
<hr>
<div id="content" >
<!-- 본문 내용 가져오기 -->
${board.freeboardContent }



<c:forEach var="bfile" items="${file}"><br>

<%-- ${fn:contains(fn:toLowerCase(bfile.freeboardfileOrigin), "gif") } --%>
<%-- ${fn:contains(bfile.freeboardfileOrigin, 'gif') } --%>
<c:choose>
	<c:when test="${fn:contains(fn:toLowerCase(bfile.freeboardfileOrigin), 'gif') }">
		<img src="/upload/${bfile.freeboardfileStored}"  alt="">
	</c:when>
	<c:when test="${fn:contains(fn:toLowerCase(bfile.freeboardfileOrigin), 'png') }">
		<img src="/upload/${bfile.freeboardfileStored}"  alt="">
	</c:when>
	<c:when test="${fn:contains(fn:toLowerCase(bfile.freeboardfileOrigin), 'jpg') }">
		<img src="/upload/${bfile.freeboardfileStored}"  alt="">
	</c:when>
	
<%-- 		<a href="./download?fileNo=${bfile.freeboardfileNo}">${bfile.freeboardfileOrigin }</a> --%>

</c:choose>

</c:forEach>

<hr>

<div style="font-size:12px;"  >
첨부파일
<c:forEach var="bfile" items="${file}">
	<a href="./download?fileNo=${bfile.freeboardfileNo}">${bfile.freeboardfileOrigin }</a>
</c:forEach>
</div>

</div>

<!-- 첨부파일 -->

<!-- <div class="mb-3"> -->
<%-- 		<c:forEach var="boardFile" items="${file}"> --%>
		
<%-- 			<a href="./download?fileNo=${boardFile.freeboardfileNo}">${boardFile.freeboardfileOrigin }</a><br> --%>
			
<%-- 		</c:forEach> --%>
<!-- </div> -->


<hr>

  <div class="modal">
     <div class="modal_body" >게시글을 수정하시겠습니까?&nbsp;&nbsp;&nbsp;    
     <a href="./update?freeboardNo=${board.freeboardNo}"><button type="submit" class="btn btn-outline-primary btn-default btn-xs">확인</button></a>
     <button type="button" class="btn btn-outline-primary btn-default btn-xs">취소</button>
     </div>     
  </div>

   <div class="modal2">
      <div class="modal2_body" >게시글을 삭제하시겠습니까?&nbsp;&nbsp;&nbsp;    
      <a href="./delete?freeboardNo=${board.freeboardNo}"><button type="button" class="btn btn-outline-primary btn-default btn-xs">확인</button></a>
      <a href="/freeboard/list"><button type="button" class="btn btn-outline-primary btn-default btn-xs">취소</button></a>
      </div>
    </div>

   <div class="text-end"> 
	   <c:if test="${userno eq board.userNo}">
	   <button type="button" class="btn-open-popup btn btn-secondary" >수정</button>
	   <button type="button" class="btn-reset-popup btn btn-secondary" >삭제</button>
	   </c:if>
   </div>

<!--    <div class="text-end"> -->
  
<%--   		<a href="./update?freeboardNo=${board.freeboardNo}"><button type="button" class="btn-open-popup btn-secondary" >수정</button></a> --%>
<%--    		<a href="./delete?freeboardNo=${board.freeboardNo}"><button type="button" class="btn-reset-popup btn-secondary" >삭제</button></a> --%>
   
<!--    </div> -->
<br>
<div class="comments">
댓글 4개 

<div style="text-align: left">
<i class="bi bi-bar-chart-steps"></i>정렬기준
<select class="array">
	<option value="a">조회순</option>
	<option value="b">댓글순</option>
	<option value="c">추천순</option>
	<option value="d">날짜순</option>
</select>
</div>

<!-- post 댓글 인서트 -->
<form action="./view" method="post">
댓글작성자 <input type="text" name="commContent" size="80" id="cmt">
<input type="text" value="${board.freeboardNo }" name="freeboardNo">

<button>작성</button><br><br>

<c:forEach var="boardCommentList" items="${boardCommentList }">
<tr>
	<td><i class="bi bi-person-circle"></i>사용자${boardCommentList.userNo }<td>
	<td>${boardCommentList.commContent }</td>
	<td>${boardCommentList.commDate }</td>
	<br><br>
</tr>
</c:forEach>


<!-- i태그 이미지 >> 사용자 프로필 가져오기 로 코맨트 for each 출력-->
</form>
</div>
</div><!-- div.container -->
<hr>
<div id="footer">
<h1><a class="text-info" href="/">FOOTER</a></h1>
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