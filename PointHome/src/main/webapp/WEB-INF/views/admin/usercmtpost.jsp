<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/layout/adminLayout/adminHeader.jsp" />

<style type="text/css">
 #header, #footer {
   text-align: center;
}
#header h1 {
   line-height: 3em;
}

</style>

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
   var userNo = "${param.userNo}";
   

         location.href = "/admin/usercmtpost" +"?userNo="+userNo+ "&searchType=" + searchType + "&keyword=" + keyword + "&filter=" + filter;


}
</script>



<script type="text/javascript">
window.onload=function(){
   
   document.getElementById("searchBtn").onclick = function() {

      let searchType = document.getElementsByName("searchType")[0].value;
      let keyword = document.getElementsByName("keyword")[0].value;
      let filter = document.getElementsByName("filter")[0].value;
     let userNo = ${param.userNo};
     
      console.log(searchType)
      console.log(keyword)
      
      location.href = "/admin/usercmtpost?curPage=1&userNo="+userNo + "&searchType=" + searchType + "&keyword=" + keyword;
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

<style type="text/css">
   .checkbox-table .checkbox-cell input[type="checkbox"] {
      width: 16px;
      height: 16px;
   }
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
		$(function(){
			var chkObj = document.getElementsByName("RowCheck");
			var rowCnt = chkObj.length;
			
			$("input[name='allCheck']").click(function(){
				var chk_listArr = $("input[name='RowCheck']");
				for (var i=0; i<chk_listArr.length; i++){
					chk_listArr[i].checked = this.checked;
				}
			});
			$("input[name='RowCheck']").click(function(){
				if($("input[name='RowCheck']:checked").length == rowCnt){
					$("input[name='allCheck']")[0].checked = true;
				}
				else{
					$("input[name='allCheck']")[0].checked = false;
				}
			});
		});
		function deleteValue(){
			var url = "removeusercmt";    
			var valueArr = new Array();
		    var list = $("input[name='RowCheck']");
		    for(var i = 0; i < list.length; i++){
		        if(list[i].checked){ 
		            valueArr.push(list[i].value);
		        }
		    }
		    if (valueArr.length == 0){
		    	alert("선택된 글이 없습니다.");
		    }
		    else{
				var chk = confirm("정말 삭제하시겠습니까?");				 
				$.ajax({
				    url : url,                  
				    type : 'POST',              
				    traditional : true,
				    data : {
				    	valueArr : valueArr       
				    },
	                success: function(jdata){
	                    if(jdata = 1) {
	                        location.replace("usercmtpost?userNo=" + "${param.userNo}");
	                    }
	                    else{
	                        alert("삭제 실패");
	                    }
	                }
				});
			}
		}
		
		
	</script>

<div class="container text-center">

   <h1 style="text-align: center">자유게시판</h1>

   <!-- 검색 기능 -->
  <div class="input-group mt-2">
      <select class="form-contril search-select" name="searchType">
         <option value="comm_content">댓글내용</option>
      </select>
      <input name="keyword" type="text" 
         placeholder="검색어 입력" aria-label="search"
         aria-describedby="button-addon2" name="serchName" id="search">
         
      <button class="btn btn-info" type="button" id="searchBtn">검색</button>
   </div>


   <div id="filterDiv" style="text-align: right">
      <i class="bi bi-bar-chart-steps"></i>정렬기준 <select class="array"
         id="filter" name="filter" onchange="filterSelect()">

         <c:choose>
            <c:when test="${filter eq 'date' }">
               <option value="date" selected>날짜순</option>
               <option value="commNo" >번호순</option>
            </c:when>
            <c:otherwise>
               <option value="date" >날짜순</option>
               <option value="commNo" selected>번호순</option>
            </c:otherwise>
         </c:choose>
      </select>  

      <hr>

      <table id="listTable" class="table table-hover table-sm text-center checkbox-table">
         <thead>
            <tr>
           		<th> <input id="allCheck" type="checkbox" name="allCheck" class="form-check-input" /></th>	
               <th>댓글번호</th>
               <th>댓글이 작성된 게시글</th>
               <th>댓글내용</th>
               <th>작성일</th>
            </tr>
         </thead>
         <c:forEach var="board" items="${cmtList}">
            <tr>
            	<td class="checkbox"><input name="RowCheck" type="checkbox" value="${board.COMM_NO}"/></td>
               <td>${board.COMM_NO }</td>
               <td class="text-start"><a href="/freeboard/view?freeboardNo=${board.FREEBOARD_NO }">${board.FREEBOARD_TITLE }</a></td>
               <td>${board.COMM_CONTENT }</td>
               <td><fmt:formatDate value="${board.COMM_DATE }"
                     pattern="yy/MM/dd hh:mm" />
            </tr>
         </c:forEach>
      </table>

      <c:if test="${not empty adminLogin and adminLogin}">
       
         <div class="float-end mb-3">
         <input type="button" value="삭제" class="btn btn-outline-info" onclick="deleteValue();">
		</div>
	
      </c:if>

      <c:if test="${empty adminLogin and !adminLogin}">
         <br>
         <br>
      </c:if>

   </div>
   <!-- div.container -->

    <!-- 페이징 -->
   <div style="margin-bottom: 200px;">
      <!-- href로 링크만 넣어주면 됨 -->
      <ul class="pagination justify-content-center">

       <!--   첫 페이지로 이동 -->
         <!--1번이 아닐때 = ne  -->
         <c:if test="${paging.curPage ne 1 }">
            <li class="page-item"><a class="page-link" href="./usercmtpost?userNo=${param.userNo }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">&larr;
                  처음</a></li>
         </c:if>
         <c:if test="${paging.curPage eq 1 }">
            <li class="page-item disabled"><a class="page-link"
               href="./usercmtpost?userNo=${param.userNo }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">&larr; 처음</a></li>
         </c:if>

        <!--  이전 페이징 리스트로 이동 -->
         <c:if test="${paging.startPage ne 1 }">
            <li class="page-item"><a class="page-link"
               href="./usercmtpost?userNo=${param.userNo }&curPage=${paging.startPage - paging.pageCount }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">&laquo;</a></li>
         </c:if>

         <c:if test="${paging.startPage eq 1 }">
            <li class="page-item disabled"><a class="page-link"
               href="./usercmtpost?userNo=${param.userNo }&curPage=${paging.startPage - paging.pageCount }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">&laquo;</a></li>
         </c:if>



<!--          이전 페이지로 이동 -->
         <c:if test="${paging.curPage gt 1 }">
            <li class="page-item"><a class="page-link"
               href="./usercmtpost?userNo=${param.userNo }&curPage=${paging.curPage -1 }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">&lt;</a></li>
         </c:if>

<!--          페이징 번호 리스트 -->
         <c:forEach var="i" begin="${paging.startPage }"
            end="${paging.endPage }">
            <c:if test="${paging.curPage eq i }">
               <li class="page-item active"><a class="page-link"
                  href="./usercmtpost?userNo=${param.userNo }&curPage=${i }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">${i }</a></li>
            </c:if>

            <c:if test="${paging.curPage ne i }">
               <li class="page-item "><a class="page-link"
                  href="./usercmtpost?userNo=${param.userNo }&curPage=${i }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">${i }</a></li>
            </c:if>

         </c:forEach>

<!--          다음 페이지로 이동 -->
         <c:if test="${paging.curPage lt paging.totalPage }">
            <li class="page-item"><a class="page-link"
               href="./usercmtpost?userNo=${param.userNo }&curPage=${paging.curPage +1 }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">&gt;</a></li>
         </c:if>

<!--          다음 페이징 리스트로 이동 -->
         <c:if test="${paging.endPage ne paging.totalPage}">
            <li class="page-item"><a class="page-link"
               href="./usercmtpost?userNo=${param.userNo }&curPage=${paging.startPage + paging.pageCount }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">&raquo;</a></li>
         </c:if>

         <c:if test="${paging.endPage eq paging.totalPage }">
            <li class="page-item disabled"><a class="page-link"
               href="./usercmtpost?userNo=${param.userNo }&curPage=${paging.startPage + paging.pageCount }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">&raquo;</a></li>
         </c:if>

         <!-- 마지막 페이지로 이동 -->
         <c:if test="${paging.curPage ne paging.totalPage }">
            <li class="page-item"><a class="page-link"
               href="./usercmtpost?userNo=${param.userNo }&curPage=${paging.totalPage }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">마지막&rarr; </a></li>
         </c:if>
         <c:if test="${paging.curPage eq paging.totalPage }">
            <li class="page-item "><a class="page-link" href="./usercmtpost?userNo=${param.userNo }&curPage=${paging.totalPage }&filter=${filter}&searchType=${searchType}&keyword=${keyword}"> 마지막&rarr; </a></li>
         </c:if>
      </ul>

   </div>

</div> 
   


<c:import url="/WEB-INF/views/layout/footer.jsp" />
   