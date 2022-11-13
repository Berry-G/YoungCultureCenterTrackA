<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- head & meta tag include -->
    <%@include file="/WEB-INF/views/metahead.jsp"%>
    <title>Young문화센터 - 이벤트/행사 게시판</title>
</head>

  <body>
  <!-- header inlcude -->
<%@include file="/WEB-INF/views/header.jsp"%>
  <!--start container-->
  <div class="container">
    <br>
    <h3>이벤트/행사</h3>
    <hr /><br>
    <div class="input-group ms-auto pb-3" style="width: 15%;">
      <select class="form-select form-select-sm" aria-label=".form-select-sm example"
        style="width: 50px; float:right">
        <option value="1">최신순</option>
        <option value="2">조회순</option>
        <option value="3">관련순</option>
      </select>
    </div>
    <!--게시판 부분-->
    <table class="table table-hover" style="table-layout: fixed;">
    <colgroup>
    	<col width="50%">
            <col width="10%">
            <col width="20%">
            <col width="10%">
           </colgroup>
      <thead>
        <tr>
          <th scope="col" style="text-align: center;">제목</th>
          <th scope="col" style="text-align: center;">글쓴이</th>
          <th scope="col" style="text-align: center;">날짜</th>
          <th scope="col" style="text-align: center;">조회수</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td scope="row" class="text-truncate"><a href="post" class="text-decoration-none"></a>치과 잘 다녀온 기념 이벤트</td>
          <td class="text-center">김지호</td>
          <td class="text-center">yyyy-mm-dd</td>
          <td class="text-center">12824203</td>
        </tr>
        <tr>
          <td scope="row" class="text-truncate">제에목</td>
          <td class="text-center">짱아</td>
          <td class="text-center">yyyy-mm-dd</td>
          <td class="text-center">12312</td>
        </tr>
        <tr>
          <td scope="row" class="text-truncate">제목</td>
          <td class="text-center">고경희</td>
          <td class="text-center">yyyy-mm-dd</td>
          <td class="text-center">1231</td>
        </tr>
        <tr>
          <td scope="row" class="text-truncate">제목15443534541111111111111111111111111</td>
          <td class="text-center">이서정</td>
          <td class="text-center">yyyy-mm-dd</td>
          <td class="text-center">222</td>
        </tr>
        <tr>
          <td scope="row" class="text-truncate">제목23432411111111111111111111111111111</td>
          <td class="text-center">이기적</td>
          <td class="text-center">yyyy-mm-dd</td>
          <td class="text-center">222</td>
        </tr>

        <tr>
          <td scope="row" class="text-truncate">제목1234234111111111111111111111111111</td>
          <td class="text-center">남덕환</td>
          <td class="text-center">yyyy-mm-dd</td>
          <td class="text-center">222</td>
        </tr>

        <tr>
          <td scope="row" class="text-truncate">제목111111111325132411111</td>
          <td class="text-center">김정욱</td>
          <td class="text-center">yyyy-mm-dd</td>
          <td class="text-center">222</td>
        </tr>

        <tr>
          <td scope="row" class="text-truncate">제목11111111111152311234324234111</td>
          <td class="text-center">진경아</td>
          <td class="text-center">yyyy-mm-dd</td>
          <td class="text-center">222</td>
        </tr>
        
        <tr>
          <td scope="row" class="text-truncate">제목11111111111152311234324234111</td>
          <td class="text-center">진경아</td>
          <td class="text-center">yyyy-mm-dd</td>
          <td class="text-center">222</td>
        </tr>
        
        <tr>
          <td scope="row" class="text-truncate">제목11111111111152311234324234111</td>
          <td class="text-center">진경아</td>
          <td class="text-center">yyyy-mm-dd</td>
          <td class="text-center">222</td>
        </tr>
      </tbody>
    </table>

    <!--작성하기 버튼-->
    <div class="row">
    	<div class="col">
			<a class="btn btn-primary " style="float:right" href="write?board=event" role="button">작성하기</a>    	
    	</div>
    </div>

   

    <!--창 하단 페이지 숫자-->
    <nav aria-label="Page navigation">
      <ul class="pagination justify-content-center">
        <li class="page-item disabled">
          <a class="page-link" href="#" tabindex="-1" aria-disabled="true">이전</a>
        </li>
        <li class="page-item"><a class="page-link" href="#">1</a></li>
        <li class="page-item"><a class="page-link" href="#">2</a></li>
        <li class="page-item"><a class="page-link" href="#">3</a></li>
        <li class="page-item"><a class="page-link" href="#">4</a></li>
        <li class="page-item"><a class="page-link" href="#">5</a></li>
        <li class="page-item">
          <a class="page-link" href="#">다음</a>
        </li>
      </ul>
    </nav>
   <!--  <div class="bottomsearch" style="display: flex; margin-left: 30%; margin-top: 50px;">
      <select class="form-select form-select-sm" aria-label=".form-select-sm example"
        style="width: 90px; margin-right: 10px;">
        <option value="1">제목</option>
        <option value="2">작성자</option>
      </select>
      <input type="text" class="form-control" aria-label="title" aria-describedby="basic-addon1" style="width: 300px;">
      <button type="button" class="btn btn-primary" style="margin-left: 10px;">검색</button>
    </div> -->
  </div> <!--end of container-->
  <!-- footer inlcude -->
<%@include file="/WEB-INF/views/footer.jsp"%>
  
  
</body>

</html>