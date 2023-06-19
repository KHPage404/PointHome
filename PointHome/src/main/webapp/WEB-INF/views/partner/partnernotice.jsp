<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%-- 사용자 헤더 (읽기전용)--%>
<c:if test="${not empty login and login}">
	<c:import url="/WEB-INF/views/layout/header.jsp" />

</c:if>

<%-- 제휴사헤더 --%>
<c:if test="${not empty partnerLogin and partnerLogin}">
<c:import url="/WEB-INF/views/layout/partnerLayout/header.jsp"/>
</c:if>
<%-- 운영사헤더 --%>
<c:if test="${not empty adminLogin and adminLogin}">
	<c:import url="/WEB-INF/views/layout/adminLayout/adminHeader.jsp" />
	<c:import url="/WEB-INF/views/layout/adminLayout/sidebar.jsp" />
	<style type="text/css">* {cursor: url(https://cur.cursors-4u.net/cursors/cur-7/cur610.cur), auto !important;}</style><a href="https://www.cursors-4u.com/cursor/2010/12/17/oxygen-black-11.html" target="_blank" title="Oxygen Black"><img src="https://cur.cursors-4u.net/cursor.png" border="0" alt="Oxygen Black" style="position:absolute; top: 0px; right: 0px;" /></a>
	<style type="text/css">
	
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
</c:if>


<style type="text/css">
   .checkbox-table .checkbox-cell input[type="checkbox"] {
      width: 16px;
      height: 16px;
   }
</style>
<style type="text/css">
.partnernotice-div {
	margin-top: 100px;
	font-family: SBAggroM;
	
	width:1000px;
}

a {
	color: black;
	text-decoration: none;
}

#listTable {
	margin: 30px auto;
	font-size: 20px;
	text-align: center;
	width: 1000px;
}
td {
    /* 셀 가운데 정렬 */
    text-align: center;
  }
  table th {
  text-align: center;
}

</style>
<style type="text/css">
#container {
	margin-left: 20%;
}
</style>



<script type="text/javascript">
$(function() {
   console.log("${paging.curPage}")
})


</script>


<script type="text/javascript">
window.onload=function(){
   
   document.getElementById("searchBtn").onclick = function() {

      let searchType = document.getElementsByName("searchType")[0].value;
      let keyword = document.getElementsByName("keyword")[0].value;
      
      console.log(searchType)
      console.log(keyword)
      
      location.href = "/partner/partnernotice?curPage=1" + "&searchType=" + searchType + "&keyword=" + keyword;
   }
}
</script>

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
			var url = "/admin/removepartnernotice";    
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
				if (chk) {
				$.ajax({
				    url : url,                  
				    type : 'POST',              
				    traditional : true,
				    data : {
				    	valueArr : valueArr       
				    },
	                success: function(jdata){
	                        location.replace("partnernotice");
	                        
	                }
				});
		    } else {
	        	 location.replace("partnernotice");
	        }
	    }
	}
		
		
	</script>



<div style="padding-right:300px; margin-left:200px; width: 100%; padding-top:60px;'" >

		<div style="margin-top: 60px; font-size: 40px; margin-left:460px;" >
		공지사항
		</div>

   <table id="listTable" class="table table-hover" style="margin-left: 130px;"> 
      <thead>
         <tr>
         <c:if test="${not empty adminLogin and adminLogin}">
         <th> <input id="allCheck" type="checkbox" name="allCheck" class="form-check-input" /></th>
         </c:if>	
            <th>글번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
         </tr>
      </thead>
      
      <tbody class="table-group-divider">
      <c:forEach var="notice" items="${noticelist }">
         <tr>
         <c:if test="${not empty adminLogin and adminLogin}">
         <td class="checkbox"><input name="RowCheck" type="checkbox" value="${notice.PARTNER_NOTICE_NO}"/></td>
         </c:if>
             <td>${notice.PARTNER_NOTICE_NO }</td>
            <td class=""><a
               href="./view?partnerNoticeNo=${notice.PARTNER_NOTICE_NO }">${notice.PARTNER_NOTICE_TITLE }</a></td>
            <td>${notice.PARTNER_SHOPNAME }</td>
            <td><fmt:formatDate value="${notice.PARTNER_NOTICE_DATE}" pattern="yy/MM/dd hh:mm" /></td>
         </tr>
      </c:forEach>
      </tbody>
      
   </table>


      <c:if test="${not empty partnerLogin and partnerLogin}">
         <!-- 작성 버튼 -->
         <div class="float-end mb-3">
            <a href="/partner/writenotice"><button id="btnWrite" class="btn btn-info">공지사항 작성</button></a>
         </div>
         <div class="clearfix"></div>
      </c:if>
       <c:if test="${not empty adminLogin and adminLogin}">    
         <div class="float-end mb-3">
         <input type="button" value="삭제" class="btn btn-dark" onclick="deleteValue();">
		</div>
	
      </c:if>
      
   <!-- div.container -->


   <!-- 페이징 -->
   <div style="margin-bottom: 200px;">
      <!-- href로 링크만 넣어주면 됨 -->
      <ul class="pagination justify-content-center">

         <%--첫 페이지로 이동 --%>
         <!--1번이 아닐때 = ne  -->
         <c:if test="${paging.curPage ne 1 }">
            <li class="page-item"><a class="page-link" href="./partnernotice">&larr;
                  처음</a></li>
         </c:if>
         <c:if test="${paging.curPage eq 1 }">
            <li class="page-item disabled"><a class="page-link"
               href="./partnernotice">&larr; 처음</a></li>
         </c:if>


         <c:if test="${paging.startPage ne 1 }">
            <li class="page-item"><a class="page-link"
               href="./partnernotice?curPage=${paging.startPage - paging.pageCount }">&laquo;</a></li>
         </c:if>

         <c:if test="${paging.startPage eq 1 }">
            <li class="page-item disabled"><a class="page-link"
               href="./partnernotice?curPage=${paging.startPage - paging.pageCount }">&laquo;</a></li>
         </c:if>



         <%--이전 페이지로 이동 --%>
         <c:if test="${paging.curPage gt 1 }">
            <li class="page-item"><a class="page-link"
               href="./partnernotice?curPage=${paging.curPage -1 }">&lt;</a></li>
         </c:if>

         <%--페이징 번호 리스트 --%>
         <c:forEach var="i" begin="${paging.startPage }"
            end="${paging.endPage }">
            <c:if test="${paging.curPage eq i }">
               <li class="page-item active"><a class="page-link"
                  href="./partnernotice?curPage=${i }">${i }</a></li>
            </c:if>

            <c:if test="${paging.curPage ne i }">
               <li class="page-item "><a class="page-link"
                  href="./partnernotice?curPage=${i }">${i }</a></li>
            </c:if>

         </c:forEach>

         <%--다음 페이지로 이동 --%>
         <c:if test="${paging.curPage lt paging.totalPage }">
            <li class="page-item"><a class="page-link"
               href="./partnernotice?curPage=${paging.curPage +1 }">&gt;</a></li>
         </c:if>

         <%--다음 페이징 리스트로 이동 --%>
         <c:if test="${paging.endPage ne paging.totalPage}">
            <li class="page-item"><a class="page-link"
               href="./partnernotice?curPage=${paging.startPage + paging.pageCount }">&raquo;</a></li>
         </c:if>

         <c:if test="${paging.endPage eq paging.totalPage }">
            <li class="page-item disabled"><a class="page-link"
               href="./partnernotice?curPage=${paging.startPage + paging.pageCount }">&raquo;</a></li>
         </c:if>

         <%--마지막 페이지로 이동 --%>
         <c:if test="${paging.curPage ne paging.totalPage }">
            <li class="page-item"><a class="page-link"
               href="./partnernotice?curPage=${paging.totalPage }">마지막&rarr; </a></li>
         </c:if>
         <c:if test="${paging.curPage eq paging.totalPage }">
            <li class="page-item "><a class="page-link" href="./partnernotice?curPage=${paging.totalPage }"> 마지막&rarr; </a></li>
         </c:if>
      </ul>

   </div>
   
</div>



	

</body>
</html>