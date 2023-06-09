<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:import url="/WEB-INF/views/layout/header.jsp" />

<link href="/resources/mypage/userInfo.css" rel="stylesheet">

<style type="text/css">
body {
	padding: 0;
	margin: 0;
	font-family: 'SBAggroL';
}

#userInfo {
	width: 1000px;
	background-color: white;
}

#reservedetail {
	height: 340px; 
	width: 800px;
	background-color: white;
}

#line {
	border-top: 3px solid;
}

.nickBtn2 {
	width: 150px;
	font-size: 18px;
	margin-top: 24px;
	margin-right: 145px;
}

#profileImg2{
	width: 60px;
	margin-left:20px;
	
}

.testImg{
  position : relative;
  }

.alert{
 position: absolute;
 z-index: 5;
 font-size: 10px;
 color: white;
 background-color: red;
 border-radius: 50%;
 height:5px;
 width: 5px;
}

.pagination {
	margin-top : 50px;
	margin-bottom : -150px;
}

.page-link {
  color: #483D8B; 
  background-color: white;
  border-color: #D2D2FF;
}

.page-item.active .page-link {
 z-index: 1;
 color: white;
 font-weight:bold;
 background-color: #A696CD;
  border-color: #CBB8EE;
 
}

.page-link:focus, .page-link:hover {
  color: white;
  background-color: #A696CD; 
  border-color: #CBB8EE;
}

table  {
    border-spacing: 0;
    border-collapse: separate;
}

td {
	height: 70px;
	vertical-align: middle;
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

.modal__content {
  position: fixed;
  top: 50%;
  left: 50%;

  width: 600px;
  height: 600px;

  padding: 40px;

  text-align: center;

  background-color: rgb(255, 255, 255);
  border-radius: 10px;
  box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);

  transform: translateX(-50%) translateY(-50%);
}

.reBtn{
	width: 100px;
	font-size: 15px;
	color: white;
	margin: 10px;
	background-color: #A696CD;
	border-color: #A696CD;
	vertical-align:middle;
}

.deBtn{
	width: 100px;
	font-size: 15px;
	color: white;
	margin: 10px;
	background-color: #FEBEBE;
	border-color: #FEBEBE;
	vertical-align:middle;
}

 </style> 

<div id="mypage">

<c:import url="/WEB-INF/views/layout/myprofile.jsp" />

<div id="userInfo" class="container" style="padding: 30px; border-radius: 30px; border: 3px solid #c8c8c8;">
	<h4 style="margin: 0;"><i class="bi bi-calendar2-check"></i>&nbsp;&nbsp;나의 예약 내역</h4>
	<hr id="line">
	
	
<table class="table table-hover table-sm text-center checkbox-table">
  <thead>
    <tr>
      <th scope="col">번호</th>
      <th scope="col">제휴사 이름</th>
      <th scope="col">예약시간</th>
      <th scope="col">예약번호</th>
      <th scope="col">예약현황</th>
    </tr>
  </thead>

<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm" var="today" />

    <tbody class="table-group-divider">
     <c:forEach var="list" items="${reservelist}">
		<fmt:parseDate value="${RESERVE_TIME}" var="resDate" pattern="yyyy-MM-dd HH:mm"/>
		<c:choose>

			<c:when test="${list.RESERVE_TIME < today && list.ISREVIEW eq 0}">
				 <tr>
			      <td scope="row">${list.RNUM}</td>
			      <td>${list.PARTNER_SHOPNAME}</td>
			      <td>${list.RESERVE_TIME}</td>
			      <td><a href="./myreserveDetail?resNo=${list.RES_NO }">${list.RES_RESERVENO }</a></td>
			      <td><a href="./writeReview?resNo=${list.RES_NO }"><button type="button" class="btn btn-outline-dark reBtn">리뷰쓰기</button></a></td> 
				 </tr>     
			</c:when>	 

			<c:when test="${list.RESERVE_TIME < today}">
				 <tr>
			      <td scope="row">${list.RNUM}</td>
			      <td>${list.PARTNER_SHOPNAME}</td>
			      <td>${list.RESERVE_TIME}</td>
			      <td><a href="./myreserveDetail?resNo=${list.RES_NO }">${list.RES_RESERVENO }</a></td>
			      <td><a href="./deleteReview?resNo=${list.RES_NO}"><button class="btn btn-outline-dark deBtn">삭제</button></a></td>
				 </tr>     
			</c:when>	 

			<c:otherwise>
				<tr>
			      <td scope="row">${list.RNUM}</td>
			      <td>${list.PARTNER_SHOPNAME}</td>
			      <td>${list.RESERVE_TIME}</td>
			      <td><a href="./myreserveDetail?resNo=${list.RES_NO}">${list.RES_RESERVENO }</a></td>
			      <td>예약완료</td>
			     </tr>
			</c:otherwise>
		
		</c:choose>
  	</c:forEach>
  </tbody>
</table>
	
<!-- 페이징 -->
<div style="margin-bottom: 200px;"><!-- href로 링크만 넣어주면 됨 -->
<ul class="pagination justify-content-center">

   <%--첫 페이지로 이동 --%>
   <!--1번이 아닐때 = ne  -->
   <c:if test="${paging.curPage ne 1 }">
      <li class="page-item"><a class="page-link" href="./myreserve">&larr; 처음</a></li>
   </c:if>
   <c:if test="${paging.curPage eq 1 }">
      <li class="page-item disabled"><a class="page-link" href="./myreserve">&larr; 처음</a></li>
   </c:if>

   <%--이전 페이징 리스트로 이동 --%>
<%--    <li class="page-item"><a class="page-link" href="./myreserve?curPage=${paging.curPage - paging.pageCount }">&laquo;</a></li> --%>
<%--    <li class="page-item"><a class="page-link" href="./myreserve?curPage=${paging.endPage- paging.pageCount }">&laquo;</a></li> --%>

   <c:if test="${paging.startPage ne 1 }">
      <li class="page-item"><a class="page-link" href="./myreserve?curPage=${paging.startPage - paging.pageCount }">&laquo;</a></li>
   </c:if> 

   <c:if test="${paging.startPage eq 1 }">
      <li class="page-item disabled"><a class="page-link" href="./myreserve?curPage=${paging.startPage - paging.pageCount }">&laquo;</a></li>
   </c:if> 



   <%--이전 페이지로 이동 --%>
   <c:if test="${paging.curPage gt 1 }">
   <li class="page-item"><a class="page-link" href="./myreserve?curPage=${paging.curPage -1 }">&lt;</a></li>
   </c:if>

   <%--페이징 번호 리스트 --%>
   <c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
   <c:if test="${paging.curPage eq i }">
      <li class="page-item active">
         <a class="page-link" href="./myreserve?curPage=${i }">${i }</a>
      </li>
   </c:if>
      
   <c:if test="${paging.curPage ne i }">
      <li class="page-item ">
         <a class="page-link" href="./myreserve?curPage=${i }">${i }</a>
      </li>
   </c:if>
   
   </c:forEach>
   
   <%--다음 페이지로 이동 --%>
   <c:if test="${paging.curPage lt paging.totalPage }">
   <li class="page-item"><a class="page-link" href="./myreserve?curPage=${paging.curPage +1 }">&gt;</a></li>
   </c:if>
   
   <%--다음 페이징 리스트로 이동 --%>
   <c:if test="${paging.endPage ne paging.totalPage}">
      <li class="page-item"><a class="page-link" href="./myreserve?curPage=${paging.startPage + paging.pageCount }">&raquo;</a></li>
   </c:if> 

   <c:if test="${paging.endPage eq paging.totalPage }">
      <li class="page-item disabled"><a class="page-link" href="./myreserve?curPage=${paging.startPage + paging.pageCount }">&raquo;</a></li>
   </c:if> 
   
   <%--마지막 페이지로 이동 --%>
   <c:if test="${paging.curPage ne paging.totalPage }">
      <li class="page-item"><a class="page-link" href="./myreserve?curPage=${paging.totalPage }">마지막&rarr; </a></li>
   </c:if>
   <c:if test="${paging.curPage eq paging.totalPage }">
      <li class="page-item "><a class="page-link" > 마지막&rarr; </a></li>
   </c:if>   
</ul>

</div>

</div>

</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />













