<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/partnerLayout/header.jsp" />



<style type="text/css">

td {
	margin-right:30px;

}

</style>




<div id="container">

	<c:if test="${not empty partnerLogin }">
		<div style="margin: 100px">
			<h1>대시보드</h1>
			<div style="border: 1px solid; ">
				<h3>오늘 할 일</h3>

				<table>
					<tr>
						<th>신규예약</th>
						<td>1</td>

						<th>문의</th>
						<td>1</td>

						<th>???</th>
						<td>1</td>
					</tr>
				</table>
			</div>
		</div>
	</c:if>
	
	<c:if test="${empty partnerLogin }">
		<div style="padding: 80px;">
			<h2>로그인이 필요합니다</h2>
			<a href="/partner/login"><button>로그인</button></a>
		</div>
	</c:if>
	
</div>



<c:import url="../layout/footer.jsp" />
