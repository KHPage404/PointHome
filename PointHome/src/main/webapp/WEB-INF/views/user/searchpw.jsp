<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/header.jsp"/>

<div class="container">
<form class="form" action="./searchpw" method="post">
<div class="form-signin m-auto">
<div class="d-grid gap-2 col-4 mx-auto mb-5">
<div class="mt-5 mb-5"></div>

<h1 class="text-center mt-5 mb-5">비밀번호 찾기</h1>

<div class="form-floating mb-3">
  <input type="text" class="form-control" name="userEmail" id="userEmail" placeholder="이름">
  <label for="userEmail">이메일</label>
</div>

<div class="form-floating mb-3">
  <input type="text" class="form-control" name="userPhone" id="userPhone" placeholder="연락처">
  <label for="userPhone">연락처</label>
</div>

<div class="d-grid gap-2">
	<div class="btn-group">
	<button class="btn btn-primary btn-lg">&nbsp;&nbsp;&nbsp;확인&nbsp;&nbsp;&nbsp;</button>
	<a href="javascript:window.history.go(-1);" class="btn btn-outline-secondary btn-lg" type="button">뒤로가기</a>
	</div>
</div>

<div class="nav justify-content-center col">
	<div class="nav-item"><a class="nav-link" href="./searchid">&nbsp;&nbsp;&nbsp;아이디 찾기</a></div>	
	<div class="nav-item">|</div>	
	<div class="nav-item"><a class="nav-link" href="#">비밀번호 찾기</a></div>
</div>

</div>
</div>

</form>

</div>

<c:import url="../layout/footer.jsp"/>