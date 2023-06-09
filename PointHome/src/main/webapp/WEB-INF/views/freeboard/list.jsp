<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- Font모음 css -->
<link href="/resources/common/css/font.css" rel="stylesheet">

<!-- css파일 -->
<link href="/resources/layout/css/list.css" rel="stylesheet">

<c:import url="/WEB-INF/views/layout/header.jsp" />


<style type="text/css">
#header, #footer {
	text-align: center;
}

select {
	font-family: 'SBAggroL';
}

input::placeholder {
	font-family: 'SBAggroL';
}

a {
	color: black;
	text-decoration: none;
}

a:hover {
	color: black;
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

.btn-info {
	font-family: 'SBAggroM';
	background-color: #7e00c2;
	border-color: transparent;
	color: white;
}

.container {
	margin: 0 auto;
}
</style>
<script type="text/javascript">
	$(function() {
		console.log("${paging.curPage}")
	})

	function filterSelect() {
		console.log("click")
		//    $.ajax({
		//          type : 'get',           // 타입 (get, post, put 등등)
		//          url : './listFilter',  // 요청할 서버url
		//          dataType : 'html',       // 데이터 타입 (html, xml, json, text 등등)
		//          data : {  // 보낼 데이터 (Object , String, Array)
		//                curPage : ${paging.curPage}
		//             , filter : $("#filter").val()
		//          }, 
		//          success : function(result) { // 결과 성공 콜백함수
		//               $("#listTable").html(result)
		//          },
		//          error : function(request, status, error) { // 결과 에러 콜백함수
		//          }
		//    })

		console.log($("#filter").val())

		//curPage 유지
		//    var curPage = ( ${not empty param.curPage} ) ?"curPage="+${param.curPage } + "&" : ""
		//    var filter = $("#filter").val();
		//    location.href = "?" + curPage + "filter=" + filter

		//curPage 초기화
		var filter = $("#filter").val();
		var searchType = "${searchType}";
		var keyword = "${keyword}";

		//       if(${not empty searchType }){
		location.href = "/freeboard/list" + "?searchType=" + searchType
				+ "&keyword=" + keyword + "&filter=" + filter;
		//       }else{
		//          location.href = "?filter=" + filter
		//       }

	}
</script>

<script type="text/javascript">
	
</script>

<script type="text/javascript">
	window.onload = function() {

		document.getElementById("searchBtn").onclick = function() {

			let searchType = document.getElementsByName("searchType")[0].value;
			let keyword = document.getElementsByName("keyword")[0].value;
			let filter = document.getElementsByName("filter")[0].value;

			console.log(searchType)
			console.log(keyword)

			location.href = "/freeboard/list?curPage=1" + "&searchType="
					+ searchType + "&keyword=" + keyword;

		}
		var input = document.getElementById("search");

		input.addEventListener("keyup", function(event) {
			if (event.keyCode === 13) {
				event.preventDefault();
				document.getElementById("searchBtn").click();
			}
		});
	}
</script>
<!-- carosel -->
<div style="margin-top: 80px;">
    <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel" style="width: 100%;">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="../resources/main/img/notice_partnership.png" class="d-block w-100 h-auto" alt="...">
            </div>
            <div class="carousel-item">
                <img src="../resources/main/img/소원암.png" class="d-block w-100 h-auto" alt="...">
            </div>
            <div class="carousel-item">
                <img src="../resources/main/img/타로안내_배너.png" class="d-block w-100 h-auto" alt="...">
            </div>
        </div>

        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
</div>
<!-- carosel end -->

<br><br>

<div class="container text-center">
	<a href="./list"><h1 style="text-align: center; font-family: 'SBAggroM';">
			<i class="bi bi-journal-text"></i>&nbsp;&nbsp;자유게시판
			</h1></a> <br>
	<!-- 검색 기능 -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-6 offset-sm-3">
				<div class="input-group mb-3">
					<select class="form-contril search-select"
						style="border-bottom-left-radius: 12%; border-top-left-radius: 12%;"
						name="searchType">
						<option value="freeboard_title">제목</option>
						<option value="freeboard_content">내용</option>
						<option value="user_nick">닉네임</option>
						<option value="freeboard_titcont">제목+내용</option>
					</select> <input style="width: 200px;" name="keyword" type="text"
						class="form-control" placeholder="검색어 입력" aria-label="search"
						aria-describedby="button-addon2" name="serchName" id="search">

					<button class="btn btn-info" type="button" id="searchBtn" style="font-family: 'SBAggroM';">검색</button>
				</div>
			</div>
		</div>
	</div>


	<div id="filterDiv" style="text-align: right">
		<p style="font-family: 'SBAggroM'; font-size: 20">
			정렬기준 / <select class="array" id="filter" name="filter"
				onchange="filterSelect()" style="border-radius: 1em; padding: 5;">
				<c:choose>
					<c:when test="${filter eq 'hit' }">
						<option value="date">날짜순</option>
						<option value="hit" selected>조회순</option>
						<option value="comment">댓글순</option>
						<option value="recommend">추천순</option>
					</c:when>
					<c:when test="${filter eq 'comment' }">
						<option value="date">날짜순</option>
						<option value="hit">조회순</option>
						<option value="comment" selected>댓글순</option>
						<option value="recommend">추천순</option>
					</c:when>
					<c:when test="${filter eq 'recommend' }">
						<option value="date">날짜순</option>
						<option value="hit">조회순</option>
						<option value="comment">댓글순</option>
						<option value="recommend" selected>추천순</option>
					</c:when>
					<c:otherwise>
						<option value="date" selected>날짜순</option>
						<option value="hit">조회순</option>
						<option value="comment">댓글순</option>
						<option value="recommend">추천순</option>
					</c:otherwise>
				</c:choose>
			</select>
		</p>
		<br>
		<table id="listTable" class="table table-hover table-sm text-center"
			style="margin-right: auto; margin-left: auto;">
			<thead>
				<tr style="font-family: 'SBAggroL'; font-size: 21px;">
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
				<tr
					onclick="location.href='./view?freeboardNo=${board.FREEBOARD_NO }'"
					style="text-align: center; vertical-align: middle; font-family: 'SBAggroL'; font-size: 15px;">
					<td style="height: 75px;">${board.FREEBOARD_NO }</td>
					<td class="text-start " style="font-weight: bold; font-size: 19px">${board.FREEBOARD_TITLE }			
					<c:set var="now" value="<%=new java.util.Date()%>" /><!-- 현재시간 -->
					<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="today" /><!-- 현재시간을 숫자로 -->
					<fmt:parseNumber value="${board.FREEBOARD_DATE.time / (1000*60*60*24)}" integerOnly="true" var="boardDate" /><!-- 게시글 작성날짜를 숫자로 -->
					<c:if test="${today - boardDate le 2}">
					<img src="../resources/new.png" style="margin: 0 auto; width: 13px;" alt="">
					</c:if>
					</td>
					<td>${board.USER_NICK}</td>
					<td>${board.FREEBOARD_HIT }</td>
					<td><fmt:formatDate value="${board.FREEBOARD_DATE }"
							pattern="yy/MM/dd HH:mm" />

						<td>${board.COMMENTCNT }</td>
									<td>${board.RECOMMENDCNT }</td>
								</tr>
							</c:forEach>
						</table>


		<c:if test="${not empty login and login}">
			<!-- 작성 버튼 -->
	<div class="float-end mb-3">
							<a href="./write"><button id="btnWrite" class="btn btn-info"
									style="font-family: 'SBAggroM';">글쓰기</button></a>
			</div>
			<div class="clearfix"></div>
		</c:if>

		<c:if test="${empty login and !login}">
			<br>
			<br>
		</c:if>

	
					</div>
	<!-- div.container -->


	<!-- 페이징 -->
	<div style="margin-bottom: 200px;">
		<!-- href로 링크만 넣어주면 됨 -->
		<ul class="pagination justify-content-center">

			<%--첫 페이지로 이동 --%>
			<!--1번이 아닐때 = ne  -->
			<c:if test="${paging.curPage ne 1 }">
				<li class="page-item"><a class="page-link"
					href="./list?filter=${filter}&searchType=${searchType}&keyword=${keyword}">
						처음</a></li>
			</c:if>
			<c:if test="${paging.curPage eq 1 }">
				<li class="page-item disabled"><a class="page-link"
					href="./list?filter=${filter}&searchType=${searchType}&keyword=${keyword}">
						처음</a></li>
			</c:if>

			<%--이전 페이징 리스트로 이동 --%>
			<%--    <li class="page-item"><a class="page-link" href="./list?curPage=${paging.curPage - paging.pageCount }">&laquo;</a></li> --%>
			<%--    <li class="page-item"><a class="page-link" href="./list?curPage=${paging.endPage- paging.pageCount }">&laquo;</a></li> --%>

			<c:if test="${paging.startPage ne 1 }">
				<li class="page-item"><a class="page-link"
					href="./list?curPage=${paging.startPage - paging.pageCount }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">&laquo;</a></li>
			</c:if>

			<c:if test="${paging.startPage eq 1 }">
				<li class="page-item disabled"><a class="page-link"
					href="./list?curPage=${paging.startPage - paging.pageCount }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">&laquo;</a></li>
			</c:if>



			<%--이전 페이지로 이동 --%>
			<c:if test="${paging.curPage gt 1 }">
				<li class="page-item"><a class="page-link"
					href="./list?curPage=${paging.curPage -1 }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">&lt;</a></li>
			</c:if>

			<%--페이징 번호 리스트 --%>
			<c:forEach var="i" begin="${paging.startPage }"
				end="${paging.endPage }">
				<c:if test="${paging.curPage eq i }">
					<li class="page-item active"><a class="page-link"
						href="./list?curPage=${i }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">${i }</a></li>
				</c:if>

				<c:if test="${paging.curPage ne i }">
					<li class="page-item "><a class="page-link"
						href="./list?curPage=${i }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">${i }</a></li>
				</c:if>

			</c:forEach>

			<%--다음 페이지로 이동 --%>
			<c:if test="${paging.curPage lt paging.totalPage }">
				<li class="page-item"><a class="page-link"
					href="./list?curPage=${paging.curPage +1 }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">&gt;</a></li>
			</c:if>

			<%--다음 페이징 리스트로 이동 --%>
			<c:if test="${paging.endPage ne paging.totalPage}">
				<li class="page-item"><a class="page-link"
					href="./list?curPage=${paging.startPage + paging.pageCount }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">&raquo;</a></li>
			</c:if>

			<c:if test="${paging.endPage eq paging.totalPage }">
				<li class="page-item disabled"><a class="page-link"
					href="./list?curPage=${paging.startPage + paging.pageCount }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">&raquo;</a></li>
			</c:if>

			<%--마지막 페이지로 이동 --%>
			<c:if test="${paging.curPage ne paging.totalPage }">
				<li class="page-item"><a class="page-link"
					href="./list?curPage=${paging.totalPage }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">마지막
				</a></li>
			</c:if>
			<c:if test="${paging.curPage eq paging.totalPage }">
				<li class="page-item "><a class="page-link"
					href="./list?curPage=${paging.totalPage }&filter=${filter}&searchType=${searchType}&keyword=${keyword}">
						마지막 </a></li>
			</c:if>
		</ul>

	</div>


</div>



<c:import url="/WEB-INF/views/layout/footer.jsp" />