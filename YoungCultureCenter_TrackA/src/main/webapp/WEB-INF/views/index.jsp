<!DOCTYPE html>
<html lang="ko">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>
<!-- head & meta tag include -->
<%@include file="/WEB-INF/views/metahead.jsp"%>
<link rel="stylesheet" type="text/css" href="resources/css/main_page.css">

<!-- 슬라이드 배너 -->
	<style>
	/* 슬라이드 배너 이미지 크기 */
		.img_size01 {
		/* 슬라이드에 들어가는 이미지 크기 조절*/
		height: 450px;
		width: 100%;
	}
	</style>

<title>YOUNG문화체육센터</title>
</head>

<body>
	<!-- header include -->
	<%@include file="/WEB-INF/views/header.jsp"%>
	
	<!-- 슬라이드 배너 -->
	<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"
				aria-current="true" aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
				aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
				aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="resources\img\slide\Youngculturecenter.png" class="img_size01" alt="Youngculture바로가기">
			</div>
			<div class="carousel-item">
				<img src="resources\img\slide\baking.jpg" class="img_size01" alt="베이킹 수업 바로가기">
			</div>
			<div class="carousel-item">
				<img src="resources\img\slide\coingclass.png" class="img_size01" alt="코딩수업 바로가기">
			</div>
		</div>
		<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
			data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<span class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
			data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<span class="visually-hidden">Next</span>
		</button>
	</div>



	<!-- 중간 퀵메뉴 -->
	<div class="bannergroup">
		<div class="banner_list">
			<ul id="header_navi" style="text-align: center;">
				<li><a href="/ycc/course/courseinfo"><img class="quik_img" src="resources\img\main_img\application_icon.png"
							alt="수강신청" /><span>강좌신청안내</span></a></li>
				<li><a href="/ycc/rental/place"><img class="quik_img" src="resources\img\main_img\rental_icon.png"
							alt="대관신청" /><span>대관신청</span></a></li>
				<li><a href="/ycc/club"><img class="quik_img" src="resources\img\main_img\club_icon.png"
							alt="동아리" /><span>동아리</span></a></li>
				<li><a href="/ycc/rental/locker"><img class="quik_img" src="resources\img\main_img\Locker_icon.png"
							alt="사물함신청" /><span>사물함신청</span></a></li>
				<li><a href="/ycc/map"><img class="quik_img" src="resources\img\main_img\map_icon.png"
							alt="찾아오시는 길" /><span>찾아오시는 길</span></a></li>
			</ul>
		</div><!-- // banner_list -->
	</div><!-- // bannergroup -->

	<!-- 통합검색 -->
				

	<!-- 공지사항, 행사/이벤트, 캘린더 -->
	<div class="container" style="display: flex; ">
		<div class="row">

			<!-- 컬럼1 -->
			<div class="col-md-6 shadow p-3 border border-success mb-2 border-opacity-25">
				<div class="mcgs-box">
					<div class="mcgs_bg mc-height">
						<!-- 공지사항 탭 -->
						<ul class="nav nav-tabs" style="margin-bottom: 10px;">
							<li class="nav-item" style="font-size: 15px;">
								<a class="nav-link active" aria-current="page" href="#"><b>공지사항</b></a>
							</li>
							<li class="nav-item ms-auto">
								<a class="nav-link" href="/ycc/board/notice">더보기</a>
							</li>
						</ul>
						<!-- 공지사항 글 -->
						<div class="tab-content">
							<div id="menu3" class="tab-pane in active">
								<ul class="line fs14">
									<li>
										<a href="/ycc/board/post" target="_self">저 오늘 치과갑니다</a>
									</li>
									<li>
										<a href="/office/gfac/board/gfac_notice/482/view.do" target="_self">2022
											강남페스티벌 별마당패션쇼 운영업체 선정 공고</a>
									</li>
									<li>
										<a href="/office/gfac/board/gfac_notice/480/view.do" target="_self">2022년
											강남예술단 찾아가는 공연 『톡톡! 음악배달부』 7월 선정결과 안내</a>
									</li>
									<li>
										<a href="/office/gfac/board/gfac_notice/479/view.do" target="_self">렌티큘러와
											홀로그램으로 본 세상 - 기술입은 문화교육 프로그램 참가 어린이/청소년 모집(기간연장 ~7/20까지)</a>
									</li>
									<li>
										<a href="/office/gfac/board/gfac_notice/479/view.do" target="_blank">서울 강남도
											DMZ로...강남문화재단 문화체험 프로그램</a>
									</li>
								</ul>
							</div>
						</div> <!-- <div class="tab-content"> 끝 -->
					</div>
				</div>
			</div>

			<!-- 컬럼2 -->
			<div class="col-md-6 shadow p-3 border border-success mb-2 border-opacity-25">
				<div id="menu4" class="tab-pane ">
					<!-- 행사/이벤트 탭 -->
					<ul class="nav nav-tabs" style="margin-bottom: 10px;">
						<li class="nav-item" style="font-size: 15px;">
							<a class="nav-link active" aria-current="page" href="#"><b>행사/이벤트</b></a>
						</li>
						<li class="nav-item ms-auto">
							<a class="nav-link" href="/ycc/board/event">더보기</a>
						</li>
					</ul>
					<!-- 행사/이벤트 글 -->
					<ul class="line fs14">
						<li>
							<a href="https://www.gukjenews.com/news/articleView.html?idxno=2576400"
								target="_blank">강남문화재단, 할로윈데이, 도서관에서 즐기는 건 어때</a>
						</li>
						<li>
							<a href="https://www.jeonmae.co.kr/news/articleView.html?idxno=919721"
								target="_blank">강남문화재단, 도곡정보문화도서관 등 할로윈데이 이벤트 진행</a>
						</li>
						<li>
							<a href="https://www.gukjenews.com/news/articleView.html?idxno=2571540"
								target="_blank">강남구, 명사들과 함께하는 2022 브런치 인문학 개최!</a>
						</li>
						<li>
							<a href="https://www.gukjenews.com/news/articleView.html?idxno=2572083"
								target="_blank">강남문화재단, DMZ 생명, 생태, 평화, 문화체험 개최!</a>
						</li>
						<li>
							<a href="http://www.mediapen.com/news/view/762539" target="_blank">서울 강남도 DMZ로...강남문화재단
								문화체험 프로그램</a>
						</li>
						<li>
							<a href="http://www.mediapen.com/news/view/762539" target="_blank">서울 강남도 DMZ로...강남문화재단
								문화체험 프로그램</a>
						</li>
					</ul>
				</div>
			</div>

		</div>
	</div> <!-- <div class="container" style="display: flex; "> 끝 -->
	<!-- footer inlcude -->
	<%@include file="/WEB-INF/views/footer.jsp"%>
	</body>
</html>