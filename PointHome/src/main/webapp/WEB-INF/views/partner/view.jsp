<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:import url="/WEB-INF/views/layout/partnerLayout/header.jsp" />
<style type="text/css">
.partnernoticeView {
	font-family: SBAggroM;
}

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




<div class="container partnernoticeView" style="padding-top: 180px; margin-bottom: 200px; width:1000px;">

<h1 style="text-align: center">게시글 상세보기</h1>
<hr>
<!-- title JSTL로 가지고 오기 -->
<h3>${notice.partnerNoticeTitle }</h3>
<i class="bi bi-person-circle fs-1" style="height:200px"></i> ${viewPartner.partnerNick } <br> 

<!-- 날짜 -->
<fmt:formatDate value="${notice.partnerNoticeDate }" pattern="yy/MM/dd hh:mm"/>



<hr>

<div id="content" >
<!-- 본문 내용 가져오기 -->
${notice.partnerNoticeContent }

<c:forEach var="bfile" items="${file}"><br>

<c:choose>
<c:when test="${fn:contains(fn:toLowerCase(bfile.partnerNoticeFileOrigin), 'gif') }">
<img src="/upload/${bfile.partnerNoticeFileStored}"  alt="">
</c:when>
<c:when test="${fn:contains(fn:toLowerCase(bfile.partnerNoticeFileOrigin), 'png') }">
<img src="/upload/${bfile.partnerNoticeFileStored}"  alt="">
</c:when>
<c:when test="${fn:contains(fn:toLowerCase(bfile.partnerNoticeFileOrigin), 'jpg') }">
<img src="/upload/${bfile.partnerNoticeFileStored}"  alt="">
</c:when>


</c:choose>

</c:forEach>

<!-- 첨부파일 다운로드 -->

 <div style="font-size:15px;"  >

<c:choose>
<c:when test="${!empty file}">
<hr>
첨부파일
<c:forEach var="bfile" items="${file}">
<a href="./download?fileNo=${bfile.partnerNoticeFileNo}">${bfile.partnerNoticeFileOrigin }</a>
</c:forEach>
</c:when>
</c:choose>
</div>

</div>



<hr>


<div class="modal2">
<div class="modal2_body" >게시글을 삭제하시겠습니까?

<a href="./delete?partnerNoticeNo=${notice.partnerNoticeNo}"><button type="button" class="btn btn-outline-primary btn-default btn-xs">확인</button></a>
<a href="/partner/partnernotice"><button type="button" class="btn btn-outline-primary btn-default btn-xs">취소</button></a>
</div>
</div>

<div class="text-end">

	<a href="./partnernotice"><button class="btn btn-info">목록</button></a>

<c:if test="${partnerNo eq notice.partnerNo}">
<a href="./update?partnerNoticeNo=${notice.partnerNoticeNo}"><button type="button" class="btn btn-info" >수정</button></a>
<button type="button" class="btn-reset-popup btn btn-info" >삭제</button>
</c:if>
</div>



<!-- i태그 이미지 >> 사용자 프로필 가져오기 로 코맨트 for each 출력-->
</div><!-- div.container -->

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
