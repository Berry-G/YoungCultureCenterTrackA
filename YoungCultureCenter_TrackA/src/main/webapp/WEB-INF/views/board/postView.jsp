<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css' />">
<title>게시판 상세페이지</title>
<!--summernote-->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.css">
    <!-- header-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
</head>
<body class="sb-nav-fixed">
    <!-- header -->
    <nav class="navbar navbar-expand-lg bg-light">
        <div class="container-fluid">
            <!-- 로고 이미지 -->
            <a href="#"><img src="<%=request.getContextPath()%>/resources/img/main_img/logo.png" alt="Young문화센터로고" class="logo" style="width: 40px; height: 40px;"></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
                aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <!-- 헤더 드롭다운 -->
            <div class="collapse navbar-collapse nav justify-content-center" id="navbarNavDropdown">
                <ul class="navbar-nav">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                            aria-expanded="false">시설안내</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">오시는 길</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                            aria-expanded="false">교육강좌</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">강좌신청안내</a></li>
                            <li><a class="dropdown-item" href="#">강좌일정</a></li>
                            <li><a class="dropdown-item" href="#">강좌검색</a></li>
                            <li><a class="dropdown-item" href="#">통합검색</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                            aria-expanded="false">시설예약</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">대관이용안내</a></li>
                            <li><a class="dropdown-item" href="#">대관현황</a></li>
                            <li><a class="dropdown-item" href="#">대관신청</a></li>
                            <li><a class="dropdown-item" href="#">사물함신청</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                            aria-expanded="false">커뮤니티</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">수강상세</a></li>
                            <li><a class="dropdown-item" href="#">동아리</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                            aria-expanded="false">이용안내</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">공지사항</a></li>
                            <li><a class="dropdown-item" href="#">이벤트/행사</a></li>
                            <li><a class="dropdown-item" href="#">자주하는질문</a></li>
                            <li><a class="dropdown-item" href="#">1:1문의</a></li>
                        </ul>
                    </li>
                </ul>
            </div>

            <!-- 로그인 / 회원가입 -->
            <ul class="nav justify-content-end">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">로그인</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">회원가입</a>
                </li>
            </ul>

        </div>
    </nav>
    
    <div class="container">
        <main class="mt-5 pt-5">
            <div class="container px-4">
                <h1 class="mt-4">공지사항</h1>
                <div class="card mb-4">
                    <div class="card-body">
                        <h1>저 오늘 치과갑니다</h1>
                        <hr>
                        <p>작성자 : 김지호 | 게시일 : yyyy-mm-dd</p>
                        <textarea class="summernote mb-3" name="editordata">내용내용내용내용</textarea>


                        <div class="position-absolute bottom-0 end-0 m-3">
                            <a href="noticeboard.html" class="btn btn-outline-secondary">목록으로</a>
                            <a href="postedit.html" class="btn btn-outline-success">수정하기</a>
                            <a href="remove?bno=${board.bno}" class="btn btn-outline-danger"
                                onclick="return confirm('삭제하시겠습니까?')">삭제하기</a>
                        </div>
                    </div>

                    <div class="mb-4 m-2">
                        <a href="" class="btn btn-outline-dark">이전글</a>
                        <a href="" class="btn btn-outline-dark">다음글</a>
                    </div>
                </div>
            </div>
        </main>
    </div>
    
    <div class="bg-light mt-5 border-top border-1 ">
        <div class="container">
            <footer class="d-flex flex-wrap justify-content-between align-items-center my-1">

                <p class="col-md-4 mb-0 text-muted">
                    <img class="img-fluid" src="<%=request.getContextPath()%>/resources/img/main_img/logo.png" style="width: 100px; height: 100px;"></a><br>
                    서울특별시 서초구 서초4 서초대로77길<br>
                    Tel : 02-123-1234 / Fax : 02-123-1235<br>
                    사업자등록번호 : 123-80-12345<br>
                    김영채 최나리 전수정 김성호 최선혜 김지호 최연희<br>
                    <br>
                    &copy; YOUNG’teve Jobs All rights reserved
                </p>

                <a href="/"
                    class="col-md-4 d-flex align-items-center justify-content-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
                    스크롤하는 이미지 구현 부
                    <svg class="bi me-2" width="40" height="32">
                        <use xlink:href="#bootstrap" />
                    </svg>
                </a>

                <ul class="nav col-md-4 justify-content-end">
                    <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Home</a></li>
                    <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Features</a></li>
                    <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Pricing</a></li>
                    <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">FAQs</a></li>
                    <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">About</a></li>
                </ul>
            </footer>
        </div>
    </div>
    <script>
        $('.summernote').summernote({
            height: 400,
            lang: "ko-KR",

        });
    </script>
</body>

</html>