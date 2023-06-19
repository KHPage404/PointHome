<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="/WEB-INF/views/layout/partnerLayout/header.jsp" />
<div style="margin-left: 400px;">
	<br>
	<br><br><br>
	<br>
	<h1>타로 영상 가져오기</h1>
	<hr>
	<br>
	<h3>유투브 URL을 입력하세요</h3>
	<form action="./insertVideo" method="post" onsubmit="return inputUrl()">
		<input type="text" name="partnerVideoUrl" id="partnerVideoUrl"
			placeholder="URL입력"
			style="width: 500px; height: 40px; font-size: 15px;">
		<button class="btn btn-secondary">완료</button>
		<br><br>
	</form>
	<br><br><br><br>
	<table class="table table-hover">
		<c:forEach var="video" items="${video}">
			<tr>
				<td><iframe width="560" height="315"
						src="https://www.youtube.com/embed/${video.partnerVideoUrl}"
						title="YouTube video player" frameborder="0"
						allow="accelerometer; autoplay; clipboard-write;
                        encrypted-media; gyroscope; picture-in-picture; web-share"
						allowfullscreen></iframe></td>

				<td><fmt:formatDate value="${video.partnerVideoDate}"
						pattern="yy/MM/dd HH:mm" /></td>
				<td>
					<form action="./deleteVideo" method="post">
						<input type="hidden" value="${video.partnerVideoNo}"
							name="partnerVideoNo">
						<button class="btn btn-secondary">삭제</button>
					</form>
				</td>
			</tr>
		</c:forEach>
	</table>
	<br><br><br><br><br>
</div>
<c:import url="/WEB-INF/views/layout/footer.jsp" />
<script>
    function inputUrl() {
        var input = document.getElementById('partnerVideoUrl').value;
        var youtubeUrl = /^(https?:\/\/)?(www\.)?youtube\.com\/watch\?v=([a-zA-Z0-9_-]{11})$/;

        if (!youtubeUrl.test(input)) {
            alert('올바른 YouTube URL이 아닙니다!');
            return false; // 폼 제출 중지
        }

        return true; // 폼 제출 계속 진행
    }
//     var testValue = ${test};
    
//     if (testValue > 0) {
//         alert('YouTube URL이 중복되었습니다');
//     }
</script>
