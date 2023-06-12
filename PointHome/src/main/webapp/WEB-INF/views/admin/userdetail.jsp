<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.2.4.min.js"></script>




<!-- <script type="text/javascript">
$( () => {
	var userno = $("#userno").val();
	console.log(userno);
	
	var postname= "게시글 조회";
	var cmtname = "댓글 조회";
	
	$("#boardChk").click(function(){
      console.log("#ajax click")
      	
      $("#exampleModalLabel").text(postname);
      
      
      $.ajax({
         type: "get"
         , url: "./ajax/boardchkajax"
         , data: {userno: userno}
         , dataType: "html"
         , success: function(res) {
            console.log("AJAX 성공");
          
            $("#result").html(res)
            console.log(res);
            console.log("result", res.result);
         }
         , error: function(res) {
            console.log("AJAX 실패");
         }   
         
      })
   })

   	$("#cmtChk").click(function(){
      console.log("#ajax click")
      
      $("#exampleModalLabel").text(cmtname);
      
      $.ajax({
         type: "get"
         , url: "./ajax/cmtchkajax"
         , data: {userno: userno}
         , dataType: "html"
         , success: function(res) {
            console.log("AJAX 성공");
          
            $("#result").html(res)
            console.log(res);
            console.log("result", res.result);
         }
         , error: function(res) {
            console.log("AJAX 실패");
         }   
         
      })
   })
 
  
	   
	}) /* start func end */
</script>
 -->
<c:import url="/WEB-INF/views/layout/adminLayout/adminHeader.jsp" />

<c:import url="/WEB-INF/views/layout/adminLayout/sidebar.jsp" />




<div style="margin-left: 16%;">

	<div style="padding-top: 10px;">
		<h1>회원 정보</h1>
		<table class="table">
			<tr>
				<th>유저이름</th>
				<td>${detailList.USER_NAME}</td>
				<th>닉네임</th>
				<td>${detailList.USER_NICK}</td>
			</tr>

			<tr>
				<th>이메일</th>
				<td>${detailList.USER_EMAIL}</td>
				<th>성별</th>
				<td>${detailList.USER_GENDER}</td>
			</tr>

			<tr>
				<th>생일</th>
				<td>${detailList.USER_BIRTHYEAR}/${detailList.USER_BIRTHMONTH}
					/ ${detailList.USER_BIRTHDAY}</td>
				<th>연락처</th>
				<td>${detailList.USER_PHONE}</td>
			</tr>

			<tr>
				<th>게시글 수</th>

				<td>${detailList.FREEBOARD}
					<a href="./userboardpost?userNo=${param.userNo }"><button id="boardChk" type="button" class="btn btn-primary">
						게시글 확인</button></a>

				</td>

				<th>댓글 개수</th>
				<td>${detailList.FREEBOARDCOMMENT}
					<a href="usercmtpost?userNo=${param.userNo }"><button id="cmtChk" type="button" class="btn btn-primary">댓글
						확인</button></a>
				</td>
			</tr>

		</table>


<%-- 		<!-- Modal -->
		<div class="modal fade modal-xl" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<!-- jQuery로 제목 변경 -->
						<h1 class="modal-title fs-5" id="exampleModalLabel"></h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<input type="text" id="userno" name="userno"
							value="${detailList.USER_NO }" style="display: none;">
						<!-- Ajax 결과 출력 div -->
						<div id="result"></div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary">Save
							changes</button>
					</div>
				</div>
			</div>
		</div> --%>
		
    
	
    	<a href="./usermanage"><button type="button" class="btn btn-outline-dark proBtn">목록</button></a>
    	<a href="./removeuser?userNo=${param.userNo }"><button type="button" class="btn-open-popup btn btn-outline-dark proBtn">회원탈퇴</button></a>
		<a href="./userupdate?userNo=${param.userNo }"><button type="button" class="btn btn-outline-dark proBtn">회원수정</button></a>
	
		<br>
		<h1>예약 정보</h1>
</div>

</div>

	









</body>
</html>