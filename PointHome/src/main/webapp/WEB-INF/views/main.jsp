<%@ page session="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="./layout/header.jsp"></c:import>

<link rel="stylesheet" href="/resources/main/css/main.css">
<div style="padding-bottom: 105px; margin-top: 80px;">

<!-- carosel -->
<div>
	<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="../resources/panda.jpg" class="d-block w-70" height="400px" style="margin: 0 auto;" alt="...">
			</div>

			<div class="carousel-item">
				<img src="../resources/dog.jpeg" class="d-block" style="margin: 0 auto;" height="400px" alt="개">
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
		<a href="#" class="popularity-text">인기상담사</a>
		<span class="popularity-text-sub">TOP10</span>
	</div>
	<!-- 인기 상담사 Text end -->

	<!-- card list -->
	<div class="justify-content-center d-flex">
	
		<!-- card 1개-->
		<div class="card">
			<a href="#"><img src="../resources/dog.jpeg" class="card-img-top" alt="프로필사진"></a>

			<div class="card-content">
				<div>
					<div class="card-content-type t">타로</div>
					<div class="card-star"> 
						<a href="#">
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
							<span class="card-star-cnt">(5)</span>
						</a>
					</div>
					<div class="card-comment">
						<a href="#">
							<span><i class="bi bi-chat-left-dots-fill card-comment-icon"></i></span>
							<span class="card-comment-cnt">(200)</span>
						</a>
					</div>
				</div>

				<div class="card-title">
					<a href="#">
						<span class="card-title-shop">KH타로</span>
						<span class="card-title-name">지훈동자</span>
					</a>
				</div>
			</div>
		</div>
		<!-- card 1개 end -->
		
	</div>
	<!-- card list end -->

</div>
<!-- card end -->

<c:import url="./layout/footer.jsp"></c:import>