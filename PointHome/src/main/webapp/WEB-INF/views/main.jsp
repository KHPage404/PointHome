<%@ page session="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.Date" %>

<c:import url="./layout/header.jsp"></c:import>

<link rel="stylesheet" href="/resources/main/css/main.css?d=<%= new Date() %>">

<div style="padding-bottom: 105px; margin-top: 80px;">

<!-- carosel -->
<div style="margin-top: 80px;">
    <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel" style="width: 100%;">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="../resources/main/img/notice_partnership.png" class="d-block w-100 h-auto" alt="...">
            </div>
            <div class="carousel-item">
                <a href="/main/detail?partNo=302"><img src="../resources/main/img/하나보살배너.png" class="d-block w-100 h-auto" alt="..."></a>
            </div>
            <div class="carousel-item">
                <img src="../resources/main/img/소원암.png" class="d-block w-100 h-auto" alt="...">
            </div>
            <div class="carousel-item">
                <img src="../resources/main/img/타로안내배너.png" class="d-block w-100 h-auto" alt="...">
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

<!-- card start -->
<div class="container">
	
	<!-- 인기 상담사 Text start -->
	<div class="d-flex popularity">
		<a href="#" class="popularity-text text-black">인기상담사</a>
		<span class="popularity-text-sub">TOP10</span>
	</div>
	<!-- 인기 상담사 Text end -->

	<!-- card list -->
	<div class="card-list justify-content-center d-flex">
	
		<!-- card 1개-->
		<div class="card">
			<!-- 카드 사진 start -->
			<a href="#"><img src="../resources/main/img/partner_01.png" class="card-img-top" alt="프로필사진"></a>
			<!-- 카드 사진 end -->

			<!-- 카드 사진 이하 내용 start-->
			<div class="card-content">
				<div>
					<!-- 카드 타입 start -->
					<div class="card-content-type ${'s'}">
<%-- 						<c:if test="${'t' eq 't'}">타로</c:if> --%>
						<c:if test="${'s' eq 's'}">신점</c:if>
<%-- 						<c:if test="${'c' eq 'c'}">철학</c:if> --%>
					</div>
					
					<div class="card-content-place">
						<i class="bi bi-geo-alt-fill"></i>
						경남 양산시 호포역
					</div>
				</div>

				<!-- card 제휴사 상호/이름 start -->
				<div class="card-title">
					<a href="#">
						<span class="card-title-name text-black">화련</span>
						<span class="card-title-shop">양산신당</span>
					</a>
				</div>
				<!-- card 제휴사 상호/이름 end -->
				
				<div>
					<!-- 카드 별점 end -->
					<div class="card-star"> 
						<a href="#">
							<!-- 별 갯수 start -->
							<span class="card-star-icon">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="none" viewBox="0 0 16 16">
								  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256 z" style="fill: yellow; stroke: black;"/>
								</svg>							
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="none" viewBox="0 0 16 16">
								  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256 z" style="fill: yellow; stroke: black;"/>
								</svg>							
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="none" viewBox="0 0 16 16">
								  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256 z" style="fill: yellow; stroke: black;"/>
								</svg>							
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="none" viewBox="0 0 16 16">
								  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256 z" style="fill: yellow; stroke: black;"/>
								</svg>							
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="none" viewBox="0 0 16 16">
								  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256 z" style="fill: yellow; stroke: black;"/>
								</svg>							
							</span>
							<!-- 별 갯수 end -->
							
							<!-- 별점 평균 start -->
							<span class="card-star-cnt">(5)</span>
							<!-- 별점 평균 end -->
						</a>
					</div>
					<!-- 카드 별점 end -->
					
					<!-- 카드 리뷰 start -->
					<div class="card-comment">
						<a href="#">
							<span><i class="bi bi-chat-left-dots-fill card-comment-icon"></i></span>
							<span class="card-comment-cnt">(200)</span>
						</a>
					</div>
					<!-- 카드 리뷰 end -->
				</div>
				
				<!-- 카드 가격 start -->
				<div class="card-price">
					<a href="#">
						<span class="card-price-discount">50%</span>
						<span class="card-price-dismon">50,000원</span>
						<span class="card-price-money">100,000원</span>
					</a>
				</div>
				<!-- 카드 가격 end -->
			</div>
			<!-- 카드 사진 이하 내용 end -->
		</div>
		<!-- card 1개 end -->
		<!-- card 1개-->
		<div class="card">
			<!-- 카드 사진 start -->
			<a href="#"><img src="../resources/main/img/partner_01.png" class="card-img-top" alt="프로필사진"></a>
			<!-- 카드 사진 end -->

			<!-- 카드 사진 이하 내용 start-->
			<div class="card-content">
				<div>
					<!-- 카드 타입 start -->
					<div class="card-content-type ${'s'}">
<%-- 						<c:if test="${'t' eq 't'}">타로</c:if> --%>
						<c:if test="${'s' eq 's'}">신점</c:if>
<%-- 						<c:if test="${'c' eq 'c'}">철학</c:if> --%>
					</div>
					
					<div class="card-content-place">
						<i class="bi bi-geo-alt-fill"></i>
						경남 양산시 호포역
					</div>
				</div>

				<!-- card 제휴사 상호/이름 start -->
				<div class="card-title">
					<a href="#">
						<span class="card-title-name text-black">화련</span>
						<span class="card-title-shop">양산신당</span>
					</a>
				</div>
				<!-- card 제휴사 상호/이름 end -->
				
				<div>
					<!-- 카드 별점 end -->
					<div class="card-star"> 
						<a href="#">
							<!-- 별 갯수 start -->
							<span class="card-star-icon">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="none" viewBox="0 0 16 16">
								  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256 z" style="fill: yellow; stroke: black;"/>
								</svg>							
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="none" viewBox="0 0 16 16">
								  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256 z" style="fill: yellow; stroke: black;"/>
								</svg>							
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="none" viewBox="0 0 16 16">
								  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256 z" style="fill: yellow; stroke: black;"/>
								</svg>							
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="none" viewBox="0 0 16 16">
								  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256 z" style="fill: yellow; stroke: black;"/>
								</svg>							
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="none" viewBox="0 0 16 16">
								  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256 z" style="fill: yellow; stroke: black;"/>
								</svg>							
							</span>
							<!-- 별 갯수 end -->
							
							<!-- 별점 평균 start -->
							<span class="card-star-cnt">(5)</span>
							<!-- 별점 평균 end -->
						</a>
					</div>
					<!-- 카드 별점 end -->
					
					<!-- 카드 리뷰 start -->
					<div class="card-comment">
						<a href="#">
							<span><i class="bi bi-chat-left-dots-fill card-comment-icon"></i></span>
							<span class="card-comment-cnt">(200)</span>
						</a>
					</div>
					<!-- 카드 리뷰 end -->
				</div>
				
				<!-- 카드 가격 start -->
				<div class="card-price">
					<a href="#">
						<span class="card-price-discount">50%</span>
						<span class="card-price-dismon">50,000원</span>
						<span class="card-price-money">100,000원</span>
					</a>
				</div>
				<!-- 카드 가격 end -->
			</div>
			<!-- 카드 사진 이하 내용 end -->
		</div>
		<!-- card 1개 end -->
		<!-- card 1개-->
		<div class="card">
			<!-- 카드 사진 start -->
			<a href="#"><img src="../resources/main/img/partner_01.png" class="card-img-top" alt="프로필사진"></a>
			<!-- 카드 사진 end -->

			<!-- 카드 사진 이하 내용 start-->
			<div class="card-content">
				<div>
					<!-- 카드 타입 start -->
					<div class="card-content-type ${'s'}">
<%-- 						<c:if test="${'t' eq 't'}">타로</c:if> --%>
						<c:if test="${'s' eq 's'}">신점</c:if>
<%-- 						<c:if test="${'c' eq 'c'}">철학</c:if> --%>
					</div>
					
					<div class="card-content-place">
						<i class="bi bi-geo-alt-fill"></i>
						경남 양산시 호포역
					</div>
				</div>

				<!-- card 제휴사 상호/이름 start -->
				<div class="card-title">
					<a href="#">
						<span class="card-title-name text-black">화련</span>
						<span class="card-title-shop">양산신당</span>
					</a>
				</div>
				<!-- card 제휴사 상호/이름 end -->
				
				<div>
					<!-- 카드 별점 end -->
					<div class="card-star"> 
						<a href="#">
							<!-- 별 갯수 start -->
							<span class="card-star-icon">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="none" viewBox="0 0 16 16">
								  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256 z" style="fill: yellow; stroke: black;"/>
								</svg>							
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="none" viewBox="0 0 16 16">
								  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256 z" style="fill: yellow; stroke: black;"/>
								</svg>							
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="none" viewBox="0 0 16 16">
								  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256 z" style="fill: yellow; stroke: black;"/>
								</svg>							
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="none" viewBox="0 0 16 16">
								  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256 z" style="fill: yellow; stroke: black;"/>
								</svg>							
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="none" viewBox="0 0 16 16">
								  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256 z" style="fill: yellow; stroke: black;"/>
								</svg>							
							</span>
							<!-- 별 갯수 end -->
							
							<!-- 별점 평균 start -->
							<span class="card-star-cnt">(5)</span>
							<!-- 별점 평균 end -->
						</a>
					</div>
					<!-- 카드 별점 end -->
					
					<!-- 카드 리뷰 start -->
					<div class="card-comment">
						<a href="#">
							<span><i class="bi bi-chat-left-dots-fill card-comment-icon"></i></span>
							<span class="card-comment-cnt">(200)</span>
						</a>
					</div>
					<!-- 카드 리뷰 end -->
				</div>
				
				<!-- 카드 가격 start -->
				<div class="card-price">
					<a href="#">
						<span class="card-price-discount">50%</span>
						<span class="card-price-dismon">50,000원</span>
						<span class="card-price-money">100,000원</span>
					</a>
				</div>
				<!-- 카드 가격 end -->
			</div>
			<!-- 카드 사진 이하 내용 end -->
		</div>
		<!-- card 1개 end -->
		<!-- card 1개-->
		<div class="card">
			<!-- 카드 사진 start -->
			<a href="#"><img src="../resources/main/img/partner_01.png" class="card-img-top" alt="프로필사진"></a>
			<!-- 카드 사진 end -->

			<!-- 카드 사진 이하 내용 start-->
			<div class="card-content">
				<div>
					<!-- 카드 타입 start -->
					<div class="card-content-type ${'s'}">
<%-- 						<c:if test="${'t' eq 't'}">타로</c:if> --%>
						<c:if test="${'s' eq 's'}">신점</c:if>
<%-- 						<c:if test="${'c' eq 'c'}">철학</c:if> --%>
					</div>
					
					<div class="card-content-place">
						<i class="bi bi-geo-alt-fill"></i>
						경남 양산시 호포역
					</div>
				</div>

				<!-- card 제휴사 상호/이름 start -->
				<div class="card-title">
					<a href="#">
						<span class="card-title-name text-black">화련</span>
						<span class="card-title-shop">양산신당</span>
					</a>
				</div>
				<!-- card 제휴사 상호/이름 end -->
				
				<div>
					<!-- 카드 별점 end -->
					<div class="card-star"> 
						<a href="#">
							<!-- 별 갯수 start -->
							<span class="card-star-icon">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="none" viewBox="0 0 16 16">
								  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256 z" style="fill: yellow; stroke: black;"/>
								</svg>							
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="none" viewBox="0 0 16 16">
								  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256 z" style="fill: yellow; stroke: black;"/>
								</svg>							
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="none" viewBox="0 0 16 16">
								  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256 z" style="fill: yellow; stroke: black;"/>
								</svg>							
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="none" viewBox="0 0 16 16">
								  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256 z" style="fill: yellow; stroke: black;"/>
								</svg>							
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="none" viewBox="0 0 16 16">
								  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256 z" style="fill: yellow; stroke: black;"/>
								</svg>							
							</span>
							<!-- 별 갯수 end -->
							
							<!-- 별점 평균 start -->
							<span class="card-star-cnt">(5)</span>
							<!-- 별점 평균 end -->
						</a>
					</div>
					<!-- 카드 별점 end -->
					
					<!-- 카드 리뷰 start -->
					<div class="card-comment">
						<a href="#">
							<span><i class="bi bi-chat-left-dots-fill card-comment-icon"></i></span>
							<span class="card-comment-cnt">(200)</span>
						</a>
					</div>
					<!-- 카드 리뷰 end -->
				</div>
				
				<!-- 카드 가격 start -->
				<div class="card-price">
					<a href="#">
						<span class="card-price-discount">50%</span>
						<span class="card-price-dismon">50,000원</span>
						<span class="card-price-money">100,000원</span>
					</a>
				</div>
				<!-- 카드 가격 end -->
			</div>
			<!-- 카드 사진 이하 내용 end -->
		</div>
		<!-- card 1개 end -->
	</div>
	<!-- card list end -->

</div>
<!-- card end -->
<!-- card start -->
<div class="container">
	
	<!-- 인기 상담사 Text start -->
	<div class="d-flex new">
		<a href="#" class="new-text text-black">신규상담사</a>
		<span class="new-text-sub">NEW</span>
	</div>
	<!-- 인기 상담사 Text end -->

	<!-- card list -->
	<div class="card-list justify-content-center d-flex">
	
		<!-- card 1개-->
		<div class="card">
			<!-- 카드 사진 start -->
			<a href="#"><img src="../resources/main/img/partner_01.png" class="card-img-top" alt="프로필사진"></a>
			<!-- 카드 사진 end -->

			<!-- 카드 사진 이하 내용 start-->
			<div class="card-content">
				<div>
					<!-- 카드 타입 start -->
					<div class="card-content-type ${'s'}">
<%-- 						<c:if test="${'t' eq 't'}">타로</c:if> --%>
						<c:if test="${'s' eq 's'}">신점</c:if>
<%-- 						<c:if test="${'c' eq 'c'}">철학</c:if> --%>
					</div>
					
					<div class="card-content-place">
						<i class="bi bi-geo-alt-fill"></i>
						경남 양산시 호포역
					</div>
				</div>

				<!-- card 제휴사 상호/이름 start -->
				<div class="card-title">
					<a href="#">
						<span class="card-title-name text-black">화련</span>
						<span class="card-title-shop">양산신당</span>
					</a>
				</div>
				<!-- card 제휴사 상호/이름 end -->
				
				<div>
					<!-- 카드 별점 end -->
					<div class="card-star"> 
						<a href="#">
							<!-- 별 갯수 start -->
							<span class="card-star-icon">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="none" viewBox="0 0 16 16">
								  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256 z" style="fill: yellow; stroke: black;"/>
								</svg>							
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="none" viewBox="0 0 16 16">
								  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256 z" style="fill: yellow; stroke: black;"/>
								</svg>							
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="none" viewBox="0 0 16 16">
								  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256 z" style="fill: yellow; stroke: black;"/>
								</svg>							
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="none" viewBox="0 0 16 16">
								  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256 z" style="fill: yellow; stroke: black;"/>
								</svg>							
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="none" viewBox="0 0 16 16">
								  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256 z" style="fill: yellow; stroke: black;"/>
								</svg>							
							</span>
							<!-- 별 갯수 end -->
							
							<!-- 별점 평균 start -->
							<span class="card-star-cnt">(5)</span>
							<!-- 별점 평균 end -->
						</a>
					</div>
					<!-- 카드 별점 end -->
					
					<!-- 카드 리뷰 start -->
					<div class="card-comment">
						<a href="#">
							<span><i class="bi bi-chat-left-dots-fill card-comment-icon"></i></span>
							<span class="card-comment-cnt">(200)</span>
						</a>
					</div>
					<!-- 카드 리뷰 end -->
				</div>
				
				<!-- 카드 가격 start -->
				<div class="card-price">
					<a href="#">
						<span class="card-price-discount">50%</span>
						<span class="card-price-dismon">50,000원</span>
						<span class="card-price-money">100,000원</span>
					</a>
				</div>
				<!-- 카드 가격 end -->
			</div>
			<!-- 카드 사진 이하 내용 end -->
		</div>
		<!-- card 1개 end -->
	</div>
	<!-- card list end -->

</div>
<!-- card end -->

</div>

<c:import url="./layout/footer.jsp"></c:import>