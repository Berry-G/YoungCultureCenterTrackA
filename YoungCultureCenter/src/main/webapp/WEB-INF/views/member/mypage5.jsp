<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- head & meta tag include -->
<%@ include file="/WEB-INF/views/metahead.jsp"%>
<title>아이디/비밀번호 찾기</title>
<style>th { padding: 10px 20px 10px 20px; background-color: #F4F7F9; } td { padding: 10px 20px 10px 20px; }</style>
</head>
<body>
	<!-- header include -->
	<%@ include file="/WEB-INF/views/header.jsp"%>

	<!-- body -->
	<div class="container mt-5">
		<h2 class="text-start">아이디/비밀번호찾기</h2><hr>
		<div>
			<p>아이디 찾기 또는 비밀번호 찾기를 하실 경우 회원가입시 등록하신 이메일 주소로 안내메일이 발송됩니다.</p>
		</div>
		<ul class="nav nav-pills nav-fill" id="pills-tab" role="tablist">
			<li class="nav-item" role="presentation">
				<button class="nav-link active border-bottom" id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home"
				type="button" role="tab" aria-controls="pills-home" aria-selected="true">아이디 찾기</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link border-bottom" id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-profile"
				type="button" role="tab" aria-controls="pills-profile" aria-selected="false">비밀번호 찾기</button>
			</li>
		</ul>
		<br>
		<div class="tab-content" id="pills-tabContent">
			<!-- 아이디찾기 -->
			<div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab" tabindex="0">
				<h5 class="text-start">| 아이디 찾기</h5>
				<form action="loginForm.html">
					<div>
						<table class="table-group-divider container-fluid">
							<tbody>
							<colgroup>
								<col width="30%">
							</colgroup>
							<!-- 성명 -->
							<tr>
								<th scope="row">성명</th>
								<td>
									<div class="col-md-5">
										<input type="name" class="form-control" id="user_name" name="user_name" placeholder="이름을 입력해주세요." autofocus required>
									</div>
								</td>
							</tr>
							<!-- 생년월일 -->
							<tr>
								<th scope="row">생년월일</th>
								<td>
									<div class="col-md-5">
										<input class="form-control" type="date" id="date" name="user_birth" required>
									</div>
								</td>
							</tr>
							<!-- 회원 가입 시 등록한 이메일 -->
							<tr>
								<th scope="row">회원 가입 시 등록한 이메일</th>
								<td>
									<div class="col-md-12">
										<div class="row g-1">
											<div class="col-md-4">
												<input type="text" class="form-control" name="user_email" placeholder="abc123" aria-label="Username" required>
											</div>
											<div class="col-md-5">
												<div class="input-group">
													<span class="input-group-text">@</span>
													<!-- <input id='name' onchange='printName()' /><div id='result'></div> -->
													<select class="form-select form-select-sm" aria-label=".form-select-sm example" required>
														<option selected></option>
														<option value="1">naver.com</option>
														<option value="2">hanmail.net</option>
														<option value="3">google.com</option>
													</select>
													<!-- <input type="text" class="form-control" placeholder="example.com" aria-label="Server"> -->
												</div>
											</div>
										</div>
									</div>
								</td>
							</tr>
							<!-- 성별 -->
							<tr>
								<th scope="row">성별</th>
								<td>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="user_gender" id="inlineRadio1" value="option1">
										<label class="form-check-label" for="inlineRadio1">남</label>
									</div>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="user_gender" id="inlineRadio2" value="option2">
										<label class="form-check-label" for="inlineRadio2">여</label>
									</div>
								</td>
							</tr>
							</tbody>
						</table>
					</div>
					<hr>
					<div class="d-grid d-sm-block text-end">
						<!-- Button trigger modal -->
						<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal1">아이디찾기</button>
					</div>
				</form>
			</div>
			<!-- 비밀번호찾기 -->
			<div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab" tabindex="0">
				<h5 class="text-start">| 비밀번호 찾기</h5>
				<form action="#">
					<div class="d-flex justify-content-center">
						<table class="table-group-divider container-fluid">
							<tbody>
								<tr>
									<th scope="row">아이디</th>
									<td>
										<div class="col-sm-6">
											<input type="name" class="form-control" id="user_id" name="user_id" placeholder="아이디를 입력해주세요." autofocus required>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">이름</th>
									<td>
										<div class="col-sm-6">
											<input type="name" class="form-control" id="user_name" name="user_name" placeholder="이름을 입력해주세요." required>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">생년월일</th>
									<td>
										<div class="col-sm-6">
											<input class="col-sm-12 form-control" type="date" id="user_birth" name="user_birth" required>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<hr>
					<div>
						<p>비밀번호 찾기를 누르시면 <span class="text-danger">아이디에 등록된 이메일</span>로 새	비밀번호 발급절차가 진행됩니다.</p>
						<p>등록된 이메일 주소를 기억하지 못할 경우 관리자에게 연락 주십시오.</p>
					</div>
					<div class="d-grid gap-2 d-md-flex justify-content-md-end">
						<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal2">비밀번호찾기</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- footer include -->
	<%@ include file="/WEB-INF/views/footer.jsp"%>
	
	<!-- 아이디찾기 Modal -->
	<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel1" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel1">Modal title</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body text-center">
	        <p class="fs-5"><b>abcdef***</b></p>
	       	<p>개인정보 보호를 위해 아이디의 일부만 노출됩니다.</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	        <a href="/ycc/login" type="button" class="btn btn-primary">로그인하기</a>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 비밀번호찾기 Modal -->
	<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel2" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel2">Modal title</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body text-center">
	        <p>재설정된 비밀번호가 <b class="fs-5">e-mail로 전송</b>되었습니다.</p>
	        <p>로그인 후 비밀번호를 변경해주세요.</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	        <a href="/ycc/login" type="button" class="btn btn-primary">로그인하기</a>
	      </div>
	    </div>
	  </div>
	</div>
</body>
</html>