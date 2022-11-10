<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<!-- head & meta tag include -->
	<%@ include file="/WEB-INF/views/metahead.jsp" %>
	<title>수강신청완료</title>
	<style>@media ( max-width :429px) { #w-28 { width: 28%; } #d-col { display: none; } }</style>
</head>
<body>
	<!-- header include -->
	<%@ include file="/WEB-INF/views/header.jsp" %>

	<!-- body -->
	<div class="container mt-5">
		<h2>결제완료페이지</h2><hr>
		<div class="row">
			<div class="col-md-12 text-center">
				<p class="fs-5 bg-light p-4">신청하신 강좌가 등록 및 결제되었습니다.</p>
			</div>
			<div class="col-md-12 mt-3">
				<table class="table table-bordered text-center">
					<tbody>
					<thead class="bg-light align-middle">
						<th>강좌명</th>
						<th width="20%" id="d-col">수강자명</th>
						<th width="20%" id="d-col">요일</th>
						<th width="20%" id="w-28">결제금액(원)</th>
					</thead>
					<tr>
						<td>초코칩 쿠키 만들기</td>
						<td id="d-col">최선혜</td>
						<td id="d-col">월, 수, 금</td>
						<td>50000</td>
					</tr>
					</tbody>
				</table>
			</div>
			<div class="text-center d-grid d-sm-block gap-1">
				<a href="/ycc/course/search" class="btn btn-primary" type="button">다른강좌보기</a> 
				<a href="/ycc/mypage/mypage4" class="btn btn-primary" type="button">수강내역조회</a>
			</div>
		</div>
	</div>

	<!-- footer include -->
	<%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>