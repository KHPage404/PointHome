<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">* {cursor: url(https://cur.cursors-4u.net/cursors/cur-7/cur610.cur), auto !important;}</style><a href="https://www.cursors-4u.com/cursor/2010/12/17/oxygen-black-11.html" target="_blank" title="Oxygen Black"><img src="https://cur.cursors-4u.net/cursor.png" border="0" alt="Oxygen Black" style="position:absolute; top: 0px; right: 0px;" /></a>
<style type="text/css">
#container {

	margin-left: 20%;
	
}


</style>

<style>
td {
    /* 셀 가운데 정렬 */
    text-align: center;
  }
  table th {
  text-align: center;
}

/* 이건 평소 모습 */
.pagination .page-link {
	font-family: 'SBAggroL';
	color: black;
}
/* 이건 눌렀을때 모습 */
.pagination .page-item.active .page-link {
	font-family: 'SBAggroL';
	color: black; /* 현재 보고 있는 페이지 번호 색상을 검정색으로 ㄱㄱ */
	background-color: #dcdcdc; /* 현재 보고 있는 페이지 번호의 배경색 회색으로 */
	border-color: transparent;
	/* 현재 보고 있는 페이지 번호의 테두리 색상을 투명으로 해서 파랑색 안보이게 하는거 */
}


</style>



<c:import url="/WEB-INF/views/layout/adminLayout/adminHeader.jsp"/>
<c:import url="/WEB-INF/views/layout/adminLayout/sidebar.jsp"/>

<script type="text/javascript">
$(function() {
   console.log("${paging.curPage}")
})

function filterSelect() {
   console.log("click")

   console.log( $("#filter").val() )


   var filter = $("#filter").val();
   var searchType = "${searchType}";
   var keyword = "${keyword}";
   
         location.href = "/admin/usermanage" + "?searchType=" + searchType + "&keyword=" + keyword + "&filter=" + filter;


}
</script>


<script type="text/javascript">
window.onload=function(){
   
   document.getElementById("searchBtn").onclick = function() {

      let searchType = document.getElementsByName("searchType")[0].value;
      let keyword = document.getElementsByName("keyword")[0].value;
      let filter = document.getElementsByName("filter")[0].value;
      
      console.log(searchType)
      console.log(keyword)
      
      location.href = "/admin/usermanage?curPage=1" + "&searchType=" + searchType + "&keyword=" + keyword;
   }
   var input = document.getElementById("search");

   input.addEventListener("keyup", function (event) {
     if (event.keyCode === 13) {
       event.preventDefault();
       document.getElementById("searchBtn").click();
     }
   });   
}
</script>



 <!-- 검색 기능 -->
 <div style="margin-top: 0; padding-top:60px; width:85%; margin-left:200px;">
   <div class="input-group " style="padding-top:30px;" >
      <select class="form-contril search-select" name="searchType" style="margin-left:400px;">
         <option value="user_no">번호</option>
         <option value="user_email">아이디</option>
         <option value="user_nick">닉네임</option>
      </select>
      <input name="keyword" type="text" placeholder="검색어 입력" aria-label="search"
   aria-describedby="button-addon2" name="serchName" id="search">
         
      <button class="btn btn-dark" type="button" id="searchBtn" >검색</button>
   </div>
   
   <div id="filterDiv" style="text-align: right; padding-right:150px; " >
      <i class="bi bi-bar-chart-steps"></i>정렬기준 <select class="array"
         id="filter" name="filter" onchange="filterSelect()" >
         <c:choose>
            <c:when test="${filter eq 'joindateasc' }">
               <option value="joindateasc" selected>가입날짜(오래된순)</option>
               <option value="joindatedesc" >가입날짜(최근순)</option>
               <option value="usernoasc">사용자번호(오름차순)</option>
               <option value="usernodesc">사용자번호(내림차순)</option>
            </c:when>
            <c:when test="${filter eq 'joindatedesc' }">
             <option value="joindateasc" >가입날짜(오래된순)</option>
               <option value="joindatedesc" selected>가입날짜(최근순)</option>
               <option value="usernoasc">사용자번호(오름차순)</option>
               <option value="usernodesc">사용자번호(내림차순)</option>
            </c:when>
            <c:when test="${filter eq 'usernoasc' }">
             <option value="joindateasc" >가입날짜(오래된순)</option>
               <option value="joindatedesc" >가입날짜(최근순)</option>
               <option value="usernoasc" selected>사용자번호(오름차순)</option>
               <option value="usernodesc">사용자번호(내림차순)</option>
            </c:when>
            <c:otherwise>
             <option value="joindateasc" >가입날짜(오래된순)</option>
               <option value="joindatedesc" >가입날짜(최근순)</option>
               <option value="usernoasc">사용자번호(오름차순)</option>
               <option value="usernodesc" selected>사용자번호(내림차순)</option>
            </c:otherwise>
         </c:choose>
      </select>

</div>
      

<div style="padding-right:300px; padding-top:50px;">
	<div id="container" >	
	<table class="table table-hover table-bordered" >
	<thead class="table-dark">
		<tr>
			<th>유저 번호</th>
			<th>이름</th>
			<th>닉네임</th>
			<th>가입 날짜</th>
			<th>상세 조회</th>
		</tr>
	</thead>
	<c:forEach var="user" items="${userList}"> 
		<tr>
			<td>${user.userNo }</td>
			<td>${user.userName }</td>
			<td>${user.userNick }</td>
			<td><fmt:formatDate value="${user.userJoindate}" pattern="yyyy.MM.dd"/><br /></td>
			<td><a href="/admin/userdetail?userNo=${user.userNo }">
					<button class="btn btn-outline-dark">상세 조회</button>
				</a>
			</td>
		</tr>
	</c:forEach>
		
	</table>
	</div>



</div>


<!-- 페이징 -->
   <div style="margin-bottom: 200px; padding-top:80px;" >
      <!-- href로 링크만 넣어주면 됨 -->
      <ul class="pagination justify-content-center">

         <%--첫 페이지로 이동 --%>
         <!--1번이 아닐때 = ne  -->
         <c:if test="${paging.curPage ne 1 }">
            <li class="page-item"><a class="page-link" href="./usermanage?filter=${filter}&searchType=${searchType}&keyword=${keyword}">&larr;
                  </a></li>
         </c:if>
         <c:if test="${paging.curPage eq 1 }">
            <li class="page-item disabled"><a class="page-link"
               href="./usermanage?filter=${filter}&searchType=${searchType}&keyword=${keyword}">&larr; </a></li>
         </c:if>

 <!--  이전 페이징 리스트로 이동 -->
         <c:if test="${paging.startPage ne 1 }">
            <li class="page-item"><a class="page-link"
               href="./usermanage?curPage=${paging.startPage - paging.pageCount }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">&laquo;</a></li>
         </c:if>

         <c:if test="${paging.startPage eq 1 }">
            <li class="page-item disabled"><a class="page-link"
               href="./usermanage?curPage=${paging.startPage - paging.pageCount }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">&laquo;</a></li>
         </c:if>



         <%--이전 페이지로 이동 --%>
         <c:if test="${paging.curPage gt 1 }">
            <li class="page-item"><a class="page-link"
               href="./usermanage?curPage=${paging.curPage -1 }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">&lt;</a></li>
         </c:if>

         <%--페이징 번호 리스트 --%>
         <c:forEach var="i" begin="${paging.startPage }"
            end="${paging.endPage }">
            <c:if test="${paging.curPage eq i }">
               <li class="page-item active"><a class="page-link"
                  href="./usermanage?curPage=${i }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">${i }</a></li>
            </c:if>

            <c:if test="${paging.curPage ne i }">
               <li class="page-item "><a class="page-link"
                  href="./usermanage?curPage=${i }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">${i }</a></li>
            </c:if>

         </c:forEach>

         <%--다음 페이지로 이동 --%>
         <c:if test="${paging.curPage lt paging.totalPage }">
            <li class="page-item"><a class="page-link"
               href="./usermanage?curPage=${paging.curPage +1 }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">&gt;</a></li>
         </c:if>

         <%--다음 페이징 리스트로 이동 --%>
         <c:if test="${paging.endPage ne paging.totalPage}">
            <li class="page-item"><a class="page-link"
               href="./usermanage?curPage=${paging.startPage + paging.pageCount }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">&raquo;</a></li>
         </c:if>

         <c:if test="${paging.endPage eq paging.totalPage }">
            <li class="page-item disabled"><a class="page-link"
               href="./usermanage?curPage=${paging.startPage + paging.pageCount }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">&raquo;</a></li>
         </c:if>

         <%--마지막 페이지로 이동 --%>
         <c:if test="${paging.curPage ne paging.totalPage }">
            <li class="page-item"><a class="page-link"
               href="./usermanage?curPage=${paging.totalPage }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">&rarr; </a></li>
         </c:if>
         <c:if test="${paging.curPage eq paging.totalPage }">
            <li class="page-item"><a class="page-link" href="./usermanage?curPage=${paging.totalPage }&filter=${filter}&searchType=${searchType}&keyword=${keyword}"> &rarr; </a></li>
         </c:if>
      </ul>
   </div>

</div>



<c:import url="/WEB-INF/views/layout/footer.jsp" />