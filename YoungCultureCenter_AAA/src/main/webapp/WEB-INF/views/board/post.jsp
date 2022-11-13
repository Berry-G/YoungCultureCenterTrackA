<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<!-- header-->
<%@include file="/WEB-INF/views/metahead.jsp"%>
    <title>Young문화센터 - 게시글 상세 보기</title>
</head>
<body>
    <!-- header inlcude -->
<%@include file="/WEB-INF/views/header.jsp"%>
    

        <main class="mt-5 pt-5">
            <div class="container px-4">
                <h3 class="mt-4">공지사항</h3>
                <div class="card mb-4">
                    <div class="card-body">
                        <h4>저 오늘 치과갑니다</h4>
                        <p>작성자 : 김지호 | 게시일 : yyyy-mm-dd | 조회수 : 12824203</p>
                        <hr>
                        <p>내용내용내용내용</p>
                    </div>
                </div>
                <div class="row pb-5" style="float:right">
               		<div class="col-auto px-1">
                   		<a href="notice" class="btn btn-outline-secondary">목록</a>	
               		</div>
               		<div class="col-auto px-1">
                   		<a href="edit" class="btn btn-outline-success"
                   		onclick="return confirm('수정하시겠습니까?')">수정</a>
               		</div>
               		<div class="col-auto px-1">
                   		<a href="remove?bno=${board.bno}" class="btn btn-outline-danger"
                       onclick="return confirm('삭제하시겠습니까?')">삭제</a>
               		</div>
                </div>
       
              	
              	<table class="table table-bordered " style="border-radius:5px; ">
              	<colgroup>
              		<col width="120px;">
              		<col width="auto;">
              	</colgroup>
              		<tbody>
              		<tr>
              			<th scope="row" class="text-center">이전글</th>
              			<td>글이 없습니다.</td>
              		</tr>
              		<tr>
              			<th scope="row" class="text-center">다음글</th>
              			<td></td>
              		</tr>
              		</tbody>
              	</table>
              	</div>
		</main>

    
  <!-- footer inlcude -->
<%@include file="/WEB-INF/views/footer.jsp"%>
</body>

</html>