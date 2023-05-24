<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

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
</style>

<div id="header" style="margin-top: 60px; margin-bottom: 80px;">
   <img src="/resources/images/gg.png" class="img-fluid" alt="점">
</div>


<div class="container text-center">

<h1 style="text-align: center">자유게시판</h1>
<div style="text-align: right">
   <i class="bi bi-bar-chart-steps"></i>정렬기준
   <select class="array">
      <option value="a">조회순</option>
      <option value="b">댓글순</option>
      <option value="c">추천순</option>
      <option value="d">날짜순</option>
   </select>
</div>

<hr>

<table class="table table-hover table-sm">
<thead>
<tr>
   <th>글번호</th>
   <th>제목</th>
   <th>닉네임</th>
   <th>조회수</th>
   <th>작성일</th>
   <th>댓글수</th>
   <th>추천수</th>
</tr>
</thead>
<c:forEach var="board" items="${list }">
<tr>
   <td>${board.FREEBOARD_NO }</td>
   <td class="text-start"><a href="./view?freeboardNo=${board.FREEBOARD_NO }">${board.FREEBOARD_TITLE }</a></td>
   <td>${board.USER_NICK}</td>
   <td>${board.FREEBOARD_HIT }</td>
   <td><fmt:formatDate value="${board.FREEBOARD_DATE }" pattern="yy/MM/dd hh:mm"/>
   <td>${board.COMMENTCNT }</td>
   <td>${board.RECOMMENDCNT }</td>
</tr>
</c:forEach>

</table>

<c:if test="${not empty login and login}">
<!-- 작성 버튼 -->
<div class="float-end mb-3">
   <a href="./write"><button id="btnWrite" class="btn btn-info">글쓰기</button></a>
</div>
<div class="clearfix"></div>
</c:if>
</div><!-- div.container -->


<!-- 페이징 -->
<div style="margin-bottom: 200px;"><!-- href로 링크만 넣어주면 됨 -->
<ul class="pagination justify-content-center">

   <%--첫 페이지로 이동 --%>
   <!--1번이 아닐때 = ne  -->
   <c:if test="${paging.curPage ne 1 }">
      <li class="page-item"><a class="page-link" href="./list">&larr; 처음</a></li>
   </c:if>
   <c:if test="${paging.curPage eq 1 }">
      <li class="page-item disabled"><a class="page-link" href="./list">&larr; 처음</a></li>
   </c:if>

   <%--이전 페이징 리스트로 이동 --%>
<%--    <li class="page-item"><a class="page-link" href="./list?curPage=${paging.curPage - paging.pageCount }">&laquo;</a></li> --%>
<%--    <li class="page-item"><a class="page-link" href="./list?curPage=${paging.endPage- paging.pageCount }">&laquo;</a></li> --%>

   <c:if test="${paging.startPage ne 1 }">
      <li class="page-item"><a class="page-link" href="./list?curPage=${paging.startPage - paging.pageCount }">&laquo;</a></li>
   </c:if> 

   <c:if test="${paging.startPage eq 1 }">
      <li class="page-item disabled"><a class="page-link" href="./list?curPage=${paging.startPage - paging.pageCount }">&laquo;</a></li>
   </c:if> 



   <%--이전 페이지로 이동 --%>
   <c:if test="${paging.curPage gt 1 }">
   <li class="page-item"><a class="page-link" href="./list?curPage=${paging.curPage -1 }">&lt;</a></li>
   </c:if>

   <%--페이징 번호 리스트 --%>
   <c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
   <c:if test="${paging.curPage eq i }">
      <li class="page-item active">
         <a class="page-link" href="./list?curPage=${i }">${i }</a>
      </li>
   </c:if>
      
   <c:if test="${paging.curPage ne i }">
      <li class="page-item ">
         <a class="page-link" href="./list?curPage=${i }">${i }</a>
      </li>
   </c:if>
   
   </c:forEach>
   
   <%--다음 페이지로 이동 --%>
   <c:if test="${paging.curPage lt paging.totalPage }">
   <li class="page-item"><a class="page-link" href="./list?curPage=${paging.curPage +1 }">&gt;</a></li>
   </c:if>
   
   <%--다음 페이징 리스트로 이동 --%>
   <c:if test="${paging.endPage ne paging.totalPage}">
      <li class="page-item"><a class="page-link" href="./list?curPage=${paging.startPage + paging.pageCount }">&raquo;</a></li>
   </c:if> 

   <c:if test="${paging.endPage eq paging.totalPage }">
      <li class="page-item disabled"><a class="page-link" href="./list?curPage=${paging.startPage + paging.pageCount }">&raquo;</a></li>
   </c:if> 
   
   <%--마지막 페이지로 이동 --%>
   <c:if test="${paging.curPage ne paging.totalPage }">
      <li class="page-item"><a class="page-link" href="./list?curPage=${paging.totalPage }">마지막&rarr; </a></li>
   </c:if>
   <c:if test="${paging.curPage eq paging.totalPage }">
      <li class="page-item "><a class="page-link" > 마지막&rarr; </a></li>
   </c:if>   
</ul>

</div>




<c:import url="/WEB-INF/views/layout/footer.jsp" />



