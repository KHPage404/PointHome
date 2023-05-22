<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
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
div.content {
	min-height: 300px;
}
div.fr{
	text-align: right;
}
#cmt{
	border-right:0px;
	border-top:0px;
	boder-left:0px;
}
</style>
</head>
<body>

<div id="header">
<h1><a class="text-info" href="/">HEADER</a></h1>
</div>

<div class="container">

<h1 style="text-align: center">게시글 상세보기</h1>
<hr>
<!-- title JSTL로 가지고 오기 -->
<h3>${board.freeboardTitle }</h3>
<i class="bi bi-person-circle fs-1" style="height:200px"></i> writer_nick <br>
<!-- 날짜 -->
${board.freeboardDate }
<!-- 조회수 추천수 -->

<div class="fr">
	<span class="count">조회수 ${board.freeboardHit }</span>
	<span class="hit">추천수 8</span>
	<span class="cmtCount">댓글 4</span>
</div>
<hr>
<div id="content" style="text-align: center">
<!-- 본문 내용 가져오기 -->
${board.freeboardContent }
</div>o
<hr><br>
<div class="comments">
댓글 4개  <i class="bi bi-bar-chart-steps"></i>정렬기준
<!-- post 댓글 인서트 -->
<form action="./viewTest.do" method="post">
댓글작성자 <input type="text" name="user" size="80" id="cmt">
<button>작성</button><br><br>

<!-- i태그 이미지 >> 사용자 프로필 가져오기 로 코맨트 for each 출력-->
<i class="bi bi-person-circle"></i>사용자1<br>
댓용 입니다 댓글내용인데요? 댓글내용인<br><br>
<i class="bi bi-person-circle"></i>사용자<br>
댓글내용 입니다 댓글내용인데요? 댓글내용인데요 ㅋㅁㄴㅇㄹㄴㅁㅇㅋ 잿글입니다<br><br>
<i class="bi bi-person-circle"></i>사용자3<br>
댓글내용 입니다 댓ㅁㄴㅇㄹㅁㄹ글내용인데요? 댓글내용인데요 ㅋㅋ 잿글입니다<br><br>
<i class="bi bi-person-circle"></i>사용자4<br>
댓글내용 내용인데요? 댓글내용인데요 ㅋㅋ 잿글입니다<br><br><br>
</form>
</div>
</div><!-- div.container -->
<hr>
<div id="footer">
<h1><a class="text-info" href="/">FOOTER</a></h1>
</div>

</body>
</html>