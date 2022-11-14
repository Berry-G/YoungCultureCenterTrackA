<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- head & meta tag include -->
    <%@include file="/WEB-INF/views/metahead.jsp"%>
<title>Young문화센터 - 통합검색</title>
</head>
<body>
<!-- header inlcude -->
<%@include file="/WEB-INF/views/header.jsp"%>

<body>
  <div class="container">
    <div class="container">
      <form action="https://search.naver.com/search.naver" method="GET">
        <div class="row mt-5 mb-4">
          <div class="col-10">
            <input name="query" type="text" class="form-control" placeholder="검색어 입력" aria-label="search"
              aria-describedby="button-addon2">
          </div>
          <div class="col-2">
            <button class="btn btn-success m-1" type="submit" id="button-addon2" style="width: 100%;">검색</button>
          </div>
        </div>
      </form>
    </div>

    <div class="row pb-4" style="text-align: center; justify-content: space-between;">
      <div class="col-4 col-md-2">
        <button type="button" class="btn btn-primary">전체보기</button>
      </div>
      <div class="col-4 col-md-2">
        <button type="button" class="btn btn-primary">공지사항</button>
      </div>
      <div class="col-4 col-md-2">
        <button type="button" class="btn btn-primary">이벤트</button>
      </div>
      <div class="col-4 col-md-2 pt-2">
        <button type="button" class="btn btn-primary">강좌</button>
      </div>
      <div class="col-4 col-md-2 pt-2">
        <button type="button" class="btn btn-primary">동아리</button>
      </div>
      <div class="col-4 col-md-2 pt-2">
        <button type="button" class="btn btn-primary">FAQ</button>
      </div>
      <div class="input-group ms-auto pt-2" style="width: 20%;">
      <select class="form-select form-select-sm" aria-label=".form-select-sm example"
        style="width: 90px; margin-right: 10px;">
        <option value="1">최신순</option>
        <option value="2">조회순</option>
        <option value="3">관련순</option>
      </select>
    	</div>
      
    </div>

    <table class="table table-hover">
      <h1>전체보기</h1>
      <h3 style="float: right;"><a href="search/all">더보기</a></h3>
      <tr>
        <th scope="row">23년 수영장 일정 공지</th>
        <td>관리자</td>
        <td>2022-11-01</td>
        <td>112</td>
      </tr>
      <tr>
        <th scope="row">2022.10.30 대관 관련 공지</th>
        <td>관리자</td>
        <td>2022-10-30</td>
        <td>211</td>
      </tr>
      <tr>
        <th scope="row">수능 응시생들과 함께하는 기력 회복 이벤트</th>
        <td>관리자</td>
        <td>2022-10-01</td>
        <td>109</td>
      </tr>
      <tr>
        <th scope="row">[긴급]대관 시스템 오류 관련 공지</th>
        <td>관리자</td>
        <td>2022-09-12</td>
        <td>822</td>
      </tr>
    </table>

    <hr>
    <table class="table table-hover">
      <h1>공지사항</h1>
      <h3 style="float: right;"><a href="">더보기</a></h3>
      <tr>
        <th scope="row">23년 수영장 일정 공지</th>
        <td>관리자</td>
        <td>2022-11-01</td>
        <td>112</td>
      </tr>
      <tr>
        <th scope="row">2022.10.30 대관 관련 공지</th>
        <td>관리자</td>
        <td>2022-10-30</td>
        <td>211</td>
      </tr>
      <tr>
        <th scope="row">[긴급]대관 시스템 오류 관련 공지</th>
        <td>관리자</td>
        <td>2022-09-12</td>
        <td>822</td>
      </tr>
      <tr>
        <th scope="row">화장실 공사 안내</th>
        <td>관리자</td>
        <td>2022-08-24</td>
        <td>402</td>
      </tr>
    </table>

    <hr>
    <table class="table table-hover`">
      <h1>이벤트</h1>
      <h3 style="float: right;"><a href="">더보기</a></h3>
      <tr>
        <th scope="row">헬스장 이벤트 안내</th>
        <td>관리자</td>
        <td>2022-11-01</td>
        <td>112</td>
      </tr>
      <tr>
        <th scope="row">행운의 주인공을 찾아라!</th>
        <td>관리자</td>
        <td>2022-10-30</td>
        <td>211</td>
      </tr>
      <tr>
        <th scope="row">수능 응시생들과 함께하는 기력 회복 이벤트</th>
        <td>관리자</td>
        <td>2022-10-01</td>
        <td>10992</td>
      </tr>
      <tr>
        <th scope="row">설립 5주년 이벤트</th>
        <td>관리자</td>
        <td>2022-09-01</td>
        <td>109</td>
      </tr>

    </table>
    <hr class="pb-5">
  </div>
  <!-- footer inlcude -->
<%@include file="/WEB-INF/views/footer.jsp"%>
  
</body>

</html>