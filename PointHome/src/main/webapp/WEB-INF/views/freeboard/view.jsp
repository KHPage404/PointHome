<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:import url="../layout/header.jsp" />

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


<script type="text/javascript">
$(function() {
// 	$(".commContent").hide()
	$(".commInput").hide()
	$(".commBtnInput").hide()
	
	$("#recommend").on('click', "#recommendBtn", function(){
		console.log("click")
		$.ajax({
			   type : 'get',           // 타입 (get, post, put 등등)
			   url : './recommend',  // 요청할 서버url
			   dataType : 'html',       // 데이터 타입 (html, xml, json, text 등등)
			   data : {  // 보낼 데이터 (Object , String, Array)
				   freeboardNo : ${board.freeboardNo }
			   }, 
			   success : function(result) { // 결과 성공 콜백함수
			    	console.log(result)
			        $("#recommend").html(result)
			   },
			   error : function(request, status, error) { // 결과 에러 콜백함수
			        console.log(error)
			   }
		})
	})
	
})

function updateComment(th){
	console.log("updateComment")


	$(".commBtnInput").children(":nth-child(2)").each(function() {
		cancel(this)
	})

	var commentText = $(th).parents("tr").find(".commContent").text().trim()
	
	console.log(commentText)
	
	$(th).parents("tr").find(".commContent").hide()
	$(th).parents("tr").find(".commBtnComment").hide()
	
	$(th).parents("tr").find(".commInput").children().val( commentText )
	$(th).parents("tr").find(".commInput").show()
	$(th).parents("tr").find(".commBtnInput").show()
}

function cancel(th) {
	console.log("cancel")
	
	$(th).parents("tr").find(".commContent").show()
	$(th).parents("tr").find(".commBtnComment").show()
	
	$(th).parents("tr").find(".commInput").hide()
	$(th).parents("tr").find(".commBtnInput").hide()
}


function updateCom(th, commNo) {
	console.log("클릭")
	console.log(commNo)	
	console.log($(th).parents("#commentTr").find(".commUpdateContent"+commNo).val())
	
	
	var commentText = $(th).parents("#commentTr").find(".commUpdateContent"+commNo).val()
	
	if(commentText == ""){
		commentText = " "
	}
	
	console.log(commentText)

	
	$.ajax({
		type: "get"
		, url: "./updateComment"
		, dataType: "html"
		, data: {
			commNo: commNo
			, commContent: commentText
			, freeboardNo: ${board.freeboardNo} 
		}
		, success: function(data){
			$("#commentTr").html(data)
		}
		, error: function() {
			console.log("error")
		}
	})
}

</script>

<div class="container" style="margin-top: 180px; margin-bottom: 200px;">

<h1 style="text-align: center">게시글 상세보기</h1>
<hr>
<!-- title JSTL로 가지고 오기 -->
<h3>${board.freeboardTitle }</h3>
<i class="bi bi-person-circle fs-1" style="height:200px"></i> ${viewUser.userNick } <br>

<!-- 날짜 -->
<fmt:formatDate value="${board.freeboardDate }" pattern="yy/MM/dd hh:mm"/>

<!-- 조회수 추천수 -->
<div class="fr">
	<span class="count me-2">조회수 ${board.freeboardHit }</span>
	<span class="cmtCount me-2">댓글 ${commentCnt }</span>
	<span id="recommend">
		<span class="hit me-2">추천수 ${cntRecommend }</span>
		
		<c:if test="${userno ne board.userNo }">
		<span>
			<c:if test="${isRecommend eq 0 }">
				<button id="recommendBtn" class="btn btn-secondary">>추천</button>
			</c:if>
			<c:if test="${isRecommend eq 1 }">
				<button id="recommendBtn" class="btn btn-secondary">>추천 취소</button>
			</c:if>
		</span>
		</c:if>
		
	</span>
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


<div style="font-size:12px;"  >

<c:choose>
<c:when test="${!empty file}">
<hr>
첨부파일
<c:forEach var="bfile" items="${file}">
<a href="./download?fileNo=${bfile.freeboardfileNo}">${bfile.freeboardfileOrigin }</a>
</c:forEach>
</c:when>
</c:choose>
</div>

</div>

<!-- 첨부파일 -->

<!-- <div class="mb-3"> -->
<%-- 		<c:forEach var="boardFile" items="${file}"> --%>

<%-- 			<a href="./download?fileNo=${boardFile.freeboardfileNo}">${boardFile.freeboardfileOrigin }</a><br> --%>

<%-- 		</c:forEach> --%>
<!-- </div> -->

<hr>



<div class="modal2">
<div class="modal2_body" >게시글을 삭제하시겠습니까?

<a href="./delete?freeboardNo=${board.freeboardNo}"><button type="button" class="btn btn-outline-primary btn-default btn-xs">확인</button></a>
<button type="button" class="btnModalCancle2 btn btn-outline-primary btn-default btn-xs">취소</button>
</div>
</div>

<div class="text-end">

	<a href="./list"><button class="btn btn-secondary">목록</button></a>

<c:if test="${userno eq board.userNo || not empty adminLogin and adminLogin}">
<a href="./update?freeboardNo=${board.freeboardNo}"><button type="button" class="btn btn-secondary" >수정</button></a>
<button type="button" class="btn-reset-popup btn btn-secondary" >삭제</button>
</c:if>
</div>

<!--    <div class="text-end"> -->

<%--   		<a href="./update?freeboardNo=${board.freeboardNo}"><button type="button" class="btn-open-popup btn-secondary" >수정</button></a> --%>
<%--    		<a href="./delete?freeboardNo=${board.freeboardNo}"><button type="button" class="btn-reset-popup btn-secondary" >삭제</button></a> --%>

<!--    </div> -->

<div class="comments">
댓글 ${commentCnt }개



<c:if test="${not empty login and login || not empty adminLogin and adminLogin}">
<!-- post 댓글 인서트 -->
<form action="./view" method="post">
${userno} <input type="text" name="commContent" size="80" id="cmt">
<input type="hidden" value="${board.freeboardNo }" name="freeboardNo">
<button class="btn btn-secondary">작성</button><br><br>
</form>
</c:if>

<table id="commentTr">
<c:forEach var="boardCommentList" items="${boardCommentList }">
<tr>
	<td><i class="bi bi-person-circle"></i>${viewUser.userNick }<td> 
	<td class="comm">
		<div class="commContent">
			${boardCommentList.commContent }
		</div>
		<div class="commInput">
			<input class="commUpdateContent${boardCommentList.commNo}" type="text" name="commUpdateContent">
		</div>
	</td> 
	<td><fmt:formatDate value="${boardCommentList.commDate }" pattern="yy/MM/dd hh:mm"/></td>
	
	<td class="commBtn">
		<c:if test="${not empty userno and userno eq boardCommentList.userNo || not empty adminLogin and adminLogin}">
			<div class="commBtnComment">
				<button type="button" onclick="updateComment(this)" class="btn btn-secondary">수정</button>
				<a href="./commentDelete?commNo=${boardCommentList.commNo}&freeboardNo=${board.freeboardNo}"><button type="button" class="btn btn-secondary">>삭제</button></a>
			</div>
			<div class="commBtnInput">
				<button onclick="updateCom(this, ${boardCommentList.commNo})" class="btn btn-secondary">완료</button> 
				<button onclick="cancel(this)" class="btn btn-secondary">>취소</button>
			</div>
		</c:if>
	</td>
	
	<br><br>
</tr>
</c:forEach>
</table>

<!-- i태그 이미지 >> 사용자 프로필 가져오기 로 코맨트 for each 출력-->
</div>
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
