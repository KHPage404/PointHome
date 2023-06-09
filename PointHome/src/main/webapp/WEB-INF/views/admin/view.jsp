<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<%-- 사용자 헤더 (읽기전용)--%>
<c:if test="${not empty login and login}">
	<c:import url="/WEB-INF/views/layout/header.jsp" />
</c:if>

<%-- 운영사헤더 --%>
<c:if test="${not empty adminLogin and adminLogin}">
<style type="text/css">* {cursor: url(https://cur.cursors-4u.net/cursors/cur-7/cur610.cur), auto !important;}</style><a href="https://www.cursors-4u.com/cursor/2010/12/17/oxygen-black-11.html" target="_blank" title="Oxygen Black"><img src="https://cur.cursors-4u.net/cursor.png" border="0" alt="Oxygen Black" style="position:absolute; top: 0px; right: 0px;" /></a>
	<c:import url="/WEB-INF/views/layout/adminLayout/adminHeader.jsp"/>
	<c:import url="/WEB-INF/views/layout/adminLayout/sidebar.jsp"/>
</c:if>



<style type="text/css">
div.content {
	min-height: 300px;
}

div.fr {
	text-align: right;
}

#cmt {
	border-right: 0px;
	border-top: 0px;
	border-left: 0px;
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
	transform: translateX(-50%) translateY(-50%);
}

.container img {
  max-width: 100%;
  height: auto;
  display: block;
}
</style>



<div class="container" style="padding-top: 180px; margin-bottom: 200px; width:1000px;">

<h1 style="text-align: center">공지사항</h1>
<hr>
<!-- title JSTL로 가지고 오기 -->
<h3>${view.noticeTitle }</h3>
<i class="bi bi-person-circle fs-1" style="height:200px"></i>운영자 <br>

<!-- 날짜 -->
<fmt:formatDate value="${view.noticeDate }" pattern="yy/MM/dd hh:mm"/>



<hr>

<div id="content" >
<!-- 본문 내용 가져오기 -->
${view.noticeContent }

<c:forEach var="bfile" items="${file}"><br>

<c:choose>
<c:when test="${fn:contains(fn:toLowerCase(bfile.adminFileOrigin), 'gif') }">
<img src="/upload/${bfile.adminFileStored}"  alt="">
</c:when>
<c:when test="${fn:contains(fn:toLowerCase(bfile.adminFileOrigin), 'png') }">
<img src="/upload/${bfile.adminFileStored}"  alt="">
</c:when>
<c:when test="${fn:contains(fn:toLowerCase(bfile.adminFileOrigin), 'jpg') }">
<img src="/upload/${bfile.adminFileStored}"  alt="">
</c:when>


</c:choose>

</c:forEach>
</div>

<div style="font-size:12px;"  >

<c:choose>
<c:when test="${!empty file}">
<hr>
첨부파일
<c:forEach var="bfile" items="${file}">
<a href="./download?fileNo=${bfile.adminFileNo}">${bfile.adminFileOrigin }</a>
</c:forEach>
</c:when>
</c:choose>
</div>

</div>


<hr>



 <div class="modal2">
<div class="modal2_body" >게시글을 삭제하시겠습니까?

<a href="./delete?noticeNo=${view.noticeNo}"><button type="button" class="btn btn-outline-primary btn-default btn-xs">확인</button></a>
<button type="button" class="btnModalCancle2 btn btn-primary btn-default btn-xs">취소</button>
</div>
</div> 

<div class="text-end">

	<a href="./noticelist"><button class="btn btn-dark">목록</button></a>

<c:if test="${adminNo eq view.adminNo}">
<a href="./update?noticeNo=${view.noticeNo}"><button type="button" class="btn btn-dark" >수정</button></a>
<button type="button" class="btn-reset-popup btn btn-dark" >삭제</button>
</c:if> 
</div>




<!-- i태그 이미지 >> 사용자 프로필 가져오기 로 코맨트 for each 출력-->
</div>
<!-- div.container -->

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
      });
      
      
    </script>


<c:import url="/WEB-INF/views/layout/footer.jsp" />
