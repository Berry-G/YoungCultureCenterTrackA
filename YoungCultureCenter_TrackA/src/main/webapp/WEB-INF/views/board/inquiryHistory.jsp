<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    
    <!-- head & meta tag include -->
    <%@include file="/WEB-INF/views/metahead.jsp"%>
    <link rel="stylesheet" href="/ycc/resources/css/studyRoom.css" type="text/css"/>
    
    
    <title>나의 문의 내역</title>
    
    <style>
      .table thead {
        background-color: #b0daeb;
      }
      .table{
        text-align: center;
      }
    </style>
    
    </head>
  <body>
      <!-- include header -->
	<%@include file="/WEB-INF/views/header.jsp"%>

    <div class="container mt-3">
    <h2>나의 문의 내역</h2>
  </div>
      <!-- 기간별 조회 박스 -->
      <div class="container p-3 text-center mb-3" style="background-color: #b0daeb;">
        <h4 class="mb-3">기간별 조회</h4>
        <div class="row">
          <div class="col-md-3 mb-3">
            <button type="submit" class="btn btn-light">1개월</button>
            <button type="submit" class="btn btn-light">3개월</button>
          </div>
          <div class="col-md-7 mb-3">
            <div class="row">
              <input
              class="form-control-md col-5 fs-5"
              type="date"
              value="startDate"
            />
            <label class="col-2">~</label>
            <input
              class="form-control-md col-5 fs-5"
              type="date"
              value="endDate"
            />
            </div>

          </div>
          <div class="col-md-2 mb-3">
            <button type="submit" class="btn btn-primary">조회</button>
          </div>

        </div>


        <div class="row" style="justify-content: center;">
          <div class="col-md-2 mb-3" >
            <select class="form-select-sm" style="height: 2rem;width:80%">
              <option value="title">제목</option>
              <option value="contents">내용</option>
            </select>
          </div>
          <div class="col-md-5 mb-3">
            <input class="form-control-md" type="text" id="search-bar" />
            <button type="submit" class="btn btn-primary" href="YCC_Inquiry.html">검색</button>
          </div>
        </div>
      </div>


      <!-- 게시판 테이블 -->
      <div class="container">
      <table class="table table-hover mt-3">
        <thead>
          <tr>
            <th scope="col">분류</th>
            <th scope="col">제목</th>
            <th scope="col">작성일</th>
            <th scope="col">상태</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>교육강좌</td>
            <td>수강 관련 문의</td>
            <td>2022.02.03</td>
            <td>답변대기</td>
          </tr>
          <tr>
            <td>결제</td>
            <td>결제 관련 문의</td>
            <td>2022.02.03</td>
            <td>답변대기</td>
          </tr>
          <tr>
            <td>결제</td>
            <td>영수증 문의</td>
            <td>2022.01.01</td>
            <td>답변완료</td>
          </tr>
          <tr>
            <td>교육강좌</td>
            <td>수강신청 변경 문의</td>
            <td>2022.01.01</td>
            <td>답변완료</td>
          </tr>
          <tr>
            <td>123</td>
            <td>123</td>
            <td>123</td>
            <td>123</td>
          </tr>
          <tr>
            <td>123</td>
            <td>123</td>
            <td>123</td>
            <td>1231</td>
          </tr>
        </tbody>
      </table>

      <button class="btn btn-primary mt-3 mb-3" onclick="location.href='./write'">글쓰기</button>
    </div>

    <!-- 페이지 네비게이션 -->
    <div class="container">
    <nav aria-label="Page navigation example">
      <ul class="pagination justify-content-center">
        <li class="page-item">
          <a class="page-link" href="#" aria-label="Previous">
            <span aria-hidden="true">&laquo;</span>
          </a>
        </li>
        <li class="page-item"><a class="page-link" href="#">1</a></li>
        <li class="page-item"><a class="page-link" href="#">2</a></li>
        <li class="page-item"><a class="page-link" href="#">3</a></li>
        <li class="page-item">
          <a class="page-link" href="#" aria-label="Next">
            <span aria-hidden="true">&raquo;</span>
          </a>
        </li>
      </ul>
    </nav>
  </div>
  
	<!-- footer inlcude -->
<%@include file="/WEB-INF/views/footer.jsp"%>	  
	  
  </body>
</html>