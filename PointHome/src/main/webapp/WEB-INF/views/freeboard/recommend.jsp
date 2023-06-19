<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<span class="hit me-2">추천수 ${cntRecommend }</span>
<span>
	<c:if test="${isRecommend eq 0 }">
		<button id="recommendBtn" class="btn btn-info btn-sm">추천</button>
	</c:if>
	<c:if test="${isRecommend eq 1 }">
		<button id="recommendBtn" class="btn btn-info btn-sm">추천 취소</button>
	</c:if>
</span>


</body>
</html>