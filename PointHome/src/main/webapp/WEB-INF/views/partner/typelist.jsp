<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<style type="text/css">
 #header, #footer {
   text-align: center;

#header h1 {
   line-height: 3em;
}

.row {
   margin: 0px auto; /*가운데 정렬*/
}
</style>

<script type="text/javascript">
function pickPart(th) {
	
	var partNo = $(th).parents(".card").find(".partNo").val()
	console.log($(th).parents(".card").find(".partNo").val())
	
	$.ajax({
		   type : 'get',           // 타입 (get, post, put 등등)
		   url : '/mypage/mypick',  // 요청할 서버url
		   dataType : 'html',       // 데이터 타입 (html, xml, json, text 등등)
		   data : {  // 보낼 데이터 (Object , String, Array)
			   partnerNo : partNo
		   }, 
		   success : function(result) { // 결과 성공 콜백함수
		    	console.log(result)
		        $("#recommend").html(result)
		   },
		   error : function(request, status, error) { // 결과 에러 콜백함수
		        console.log(error)
		   }
	})
}
</script>



<div class="container-fluid" style="margin-top: 50px; padding-left: 100px; padding-right: 100px;" >
	<div class="row">
		<c:forEach var="board" items="${typelist }">
			<div class="col-md-3">
				<div class="thumbnail">
					<div class="card" style="width: 250px; margin-left: 10px; margin-top: 20px;">
					
						<img src="../resources/dog.jpeg" class="card-img-top"
							height="200px" style="width: 100%" alt="ex">
							
						<input class="partNo" type="hidden" value="${board.partnerNo}">
						
							<span id="recommend"></span>
						
						<div class="card-body">
							<h5 class="card-title">${board.partnerShopname}</h5>

							<p class="card-text">가격 ${board.partnerPrice }</p>
							<p class="card-text">별점(후기개수)</p>
							<a href="/main/detail?partNo=${board.partnerNo}" class="btn btn-primary">상세페이지</a>
							
							<span class="pick">
<%-- 								<c:if test="${pick이 안 되어있는 경우 }"> --%>
									<button type="button" onclick="pickPart(this)" class="btn btn-primary">찜</button>
<%-- 								</c:if> --%>
<%-- 								<c:if test="${pick이 되어있는 경우 }"> --%>
<!-- 									<button type="button" onclick="pickPart(this)" class="btn btn-primary">찜 취소</button> -->
<%-- 								</c:if> --%>
							</span>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>

	</div>
</div>


<!-- 페이징 -->
<div style="margin-bottom: 200px; margin-top: 50px;"><!-- href로 링크만 넣어주면 됨 -->
<ul class="pagination justify-content-center">

   <%--첫 페이지로 이동 --%>
   <!--1번이 아닐때 = ne  -->
   <c:if test="${paging.curPage ne 1 }">
      <li class="page-item"><a class="page-link" href="./typelist">&larr; 처음</a></li>
   </c:if>
   <c:if test="${paging.curPage eq 1 }">
      <li class="page-item disabled"><a class="page-link" href="./typelist">&larr; 처음</a></li>
   </c:if>

   <%--이전 페이징 리스트로 이동 --%>
<%--    <li class="page-item"><a class="page-link" href="./typelist?curPage=${paging.curPage - paging.pageCount }">&laquo;</a></li> --%>
<%--    <li class="page-item"><a class="page-link" href="./typelist?curPage=${paging.endPage- paging.pageCount }">&laquo;</a></li> --%>

   <c:if test="${paging.startPage ne 1 }">
      <li class="page-item"><a class="page-link" href="./typelist?partnerType=${partnerType}&typelist?curPage=${paging.startPage - paging.pageCount }">&laquo;</a></li>
   </c:if> 

   <c:if test="${paging.startPage eq 1 }">
      <li class="page-item disabled"><a class="page-link" href="./typelist?partnerType=${partnerType}&typelist?curPage=${paging.startPage - paging.pageCount }">&laquo;</a></li>
   </c:if> 



   <%--이전 페이지로 이동 --%>
   <c:if test="${paging.curPage gt 1 }">
   <li class="page-item"><a class="page-link" href="./typelist?partnerType=${partnerType}&curPage=${paging.curPage -1 }">&lt;</a></li>
   </c:if>

   <%--페이징 번호 리스트 --%>
   <c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
   <c:if test="${paging.curPage eq i }">
      <li class="page-item active">
         <a class="page-link" href="./typelist?partnerType=${partnerType}&curPage=${i }">${i }</a>
      </li>
   </c:if>
      
   <c:if test="${paging.curPage ne i }">
      <li class="page-item ">
         <a class="page-link" href="./typelist?partnerType=${partnerType}&curPage=${i }">${i }</a>
      </li>
   </c:if>
   
   </c:forEach>
   
   <%--다음 페이지로 이동 --%>
   <c:if test="${paging.curPage lt paging.totalPage }">
   <li class="page-item"><a class="page-link" href="./typelist?partnerType=${partnerType}&curPage=${paging.curPage +1 }">&gt;</a></li>
   </c:if>
   
   <%--다음 페이징 리스트로 이동 --%>
   <c:if test="${paging.endPage ne paging.totalPage}">
      <li class="page-item"><a class="page-link" href="./typelist?partnerType=${partnerType}&curPage=${paging.startPage + paging.pageCount }">&raquo;</a></li>
   </c:if> 

   <c:if test="${paging.endPage eq paging.totalPage }">
      <li class="page-item disabled"><a class="page-link" href="./typelist?partnerType=${partnerType}&curPage=${paging.startPage + paging.pageCount }">&raquo;</a></li>
   </c:if> 
   
   <%--마지막 페이지로 이동 --%>
   <c:if test="${paging.curPage ne paging.totalPage }">
      <li class="page-item"><a class="page-link" href="./typelist?partnerType=${partnerType}&curPage=${paging.totalPage }">마지막&rarr; </a></li>
   </c:if>
   <c:if test="${paging.curPage eq paging.totalPage }">
      <li class="page-item "><a class="page-link" > 마지막&rarr; </a></li>
   </c:if>   
</ul>

</div>





<c:import url="/WEB-INF/views/layout/footer.jsp" />