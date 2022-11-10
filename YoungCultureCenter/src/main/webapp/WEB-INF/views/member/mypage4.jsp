<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<!-- head & meta tag include -->
	<%@ include file="/WEB-INF/views/metahead.jsp" %>
	<title>수강목록</title>
    <style>@media(max-width:768px){ #d-col { display: none; } #w-40 { width: 40%; } #w-17 { width: 17%; } }</style>	
</head>
<body>
	<!-- header include -->
	<%@ include file="/WEB-INF/views/header.jsp" %>

	<!-- body -->
	<div class="container mt-5">
		<h2>수강목록</h2>
		<hr>
		<table class="table table-bordered text-center align-middle">
			<tbody>
				<thead class="bg-light">
					<th class="col">강좌명</th>
					<th class="col" id="d-col">강사명</th>
					<th class="col" id="w-40">기간</th>
					<th class="col" id="d-col">결제금액(원)</th>
					<th class="col" id="w-17">상태</th>
				</thead>
				<tr>
					<td><a href="/ycc/course/detail">초코칩 쿠키 만들기</a></td>
					<td id="d-col">이젠</td>
					<td>2022-10-01 ~ 2022-11-07</td>
					<td id="d-col">25000</td>
					<td>수강중</td>
				</tr>
				<tr>
					<td><a href="/ycc/course/detail">(산대특)_AI플랫폼 활용 이커머스 웹서비스 개발_육성</a></td>
					<td id="d-col">추호진</td>
					<td>2022-08-10 ~ 2023-01-11</td>
					<td id="d-col">6,851,200원 (전액지원)</td>
					<td>수강중</td>
				</tr>
				<tr>
					<td><a href="/ycc/course/detail">초코칩 쿠키 만들기</a></td>
					<td id="d-col">이젠</td>
					<td>2022-03-01 ~ 2022-10-07</td>
					<td id="d-col">5000</td>
					<td>수강완료</td>
				</tr>
				<tr>
					<td><a href="/ycc/course/detail">초코칩 쿠키 만들기</a></td>
					<td id="d-col">이젠</td>
					<td>2022-03-01 ~ 2022-10-07</td>
					<td id="d-col">5000</td>
					<td>수강완료</td>
				</tr>
			</tbody>
		</table>
		<div class="d-grid gap-1 d-sm-block text-center">
			<a href="/ycc" class="btn btn-primary">홈으로</a>
			<a href="/ycc/course/search" class="btn btn-primary">다른강좌보기</a>
		</div>
	</div>

	<!-- footer include -->
	<%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>