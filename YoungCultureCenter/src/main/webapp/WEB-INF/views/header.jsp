<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<header>
	<!-- header -->
	<nav class="navbar navbar-expand-lg bg-light">
	  <div class="container-fluid">
			<!-- 로고 이미지 -->
			<a href="/ycc/"><img src="/ycc/resources/img/main_img/logo.png" alt="Young문화센터로고" style="width: 40px; height: 40px;"></a> 
	    <button class="navbar-toggler ms-auto" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    
	    <!-- 헤더 search창 -->
	    <nav class="navbar bg-light">
		  <div class="container-fluid">
		    <form class="d-flex" action="/ycc/search">
		      <input class="form-control me-2" placeholder="Search" aria-label="Search">
		      <button class="btn btn-outline-success" type="submit">Search</button>
		    </form>
		      
		  </div>
		</nav>
	    
			<!-- 헤더 드롭다운 -->
	    <div class="collapse navbar-collapse nav justify-content-center" id="navbarNavDropdown">
	      <ul class="navbar-nav mx-auto">
	        <li class="nav-item dropdown">
	          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">시설안내</a>
						<ul class="dropdown-menu">
	            <li><a class="dropdown-item" href="/ycc/map">오시는 길</a></li>
	          </ul>
	        </li>
	        <li class="nav-item dropdown">
	          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">교육강좌</a>
						<ul class="dropdown-menu">
	            <li><a class="dropdown-item" href="/ycc/course/courseinfo">강좌신청안내</a></li>
	            <li><a class="dropdown-item" href="/ycc/course/schedule">강좌일정</a></li>
	            <li><a class="dropdown-item" href="/ycc/course/search">강좌검색</a></li>
				<li><a class="dropdown-item" href="/ycc/search">통합검색</a></li>
	          </ul>
	        </li>
					<li class="nav-item dropdown">
	          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">시설예약</a>
						<ul class="dropdown-menu">
	            <li><a class="dropdown-item" href="/ycc/rental/place">대관신청</a></li>
	            <li><a class="dropdown-item" href="/ycc/rental/studyroom">독서실예약</a></li>
							<li><a class="dropdown-item" href="/ycc/rental/locker">사물함신청</a></li>
	          </ul>
	        </li>
	        <li class="nav-item dropdown">
	          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">커뮤니티</a>
	          <ul class="dropdown-menu">
	            <!-- <li><a class="dropdown-item" href="/ycc/course/detail">수강목록</a></li> -->
	            <li><a class="dropdown-item" href="/ycc/club">동아리</a></li>
	          </ul>
	        </li>
					<li class="nav-item dropdown">
	          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">이용안내</a>
	          <ul class="dropdown-menu">
	            <li><a class="dropdown-item" href="/ycc/board/notice">공지사항</a></li>
	            <li><a class="dropdown-item" href="/ycc/board/event">이벤트/행사</a></li>
	            <li><a class="dropdown-item" href="/ycc/board/faq">자주하는질문</a></li>
							<li><a class="dropdown-item" href="/ycc/board/inquiry/history">1:1문의</a></li>
	          </ul>
	        </li>
	      </ul>
	      
	      	<!-- 로그인 / 회원가입 -->
			<ul class="nav justify-content-end ms-auto">
				<li class="nav-item">
					<a class="nav-link active" aria-current="page" href="/ycc/login">로그인</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="/ycc/mypage">마이페이지</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="/ycc/member/signin1">회원가입</a>
				</li>
			</ul>
	    </div>
	

	
	  </div>
	</nav>
	
</header>
