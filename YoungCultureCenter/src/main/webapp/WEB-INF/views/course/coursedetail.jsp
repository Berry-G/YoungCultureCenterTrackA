<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<!-- head & meta tag include -->
	<%@ include file="/WEB-INF/views/metahead.jsp" %>
	<title>강좌상세</title>
	<link rel="stylesheet" href="/ycc/resources/css/starrating.css">
	<style>
		table { vertical-align: middle !important; }
		th { text-align: center; background-color: #F4F7F9 !important; }
		@media ( min-width : 768px) { #dcol { display: none; } }
		@media ( max-width : 768px) { #wcol { display: none; } }
		@media ( max-width : 514px) { #w-15 { width: 19% !important; } }
	</style>
</head>
<body>
	<!-- header include -->
	<%@ include file="/WEB-INF/views/header.jsp" %>

	<!-- body -->
	<div class="container-md mt-5">
		<h1>강의상세페이지</h1><hr>
		<h6>| 강좌상세정보</h6>
		<div class="row g-0">
			<div class="col-md-6">
				<div class="table table-bordered h-100 text-wrap">
					<table class="table h-100">
						<tbody>
						<colgroup><col width="25%"></colgroup>
						<tr>
							<th scope="row">강좌명</th>
							<td>(산대특)_AI플랫폼 활용 이커머스 웹서비스 개발_육성</td>
						</tr>
						<tr>
							<th scope="row">강사명</th>
							<td>추호진</td>
						</tr>
						<tr>
							<th scope="row">강의실</th>
							<td>강의실 4</td>
						</tr>
						<tr>
							<th scope="row">수강료</th>
							<td>6,851,200원 (전액지원)</td>
						</tr>
						<tr>
							<th scope="row">접수기간</th>
							<td>2022.02.01 ~ 2022.07.31</td>
						</tr>
						<tr>
							<th>수강대상</th>
							<td>관련분야 학력수준 및 관련분야 전공 제한 없음</td>
						</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="col-md-6">
				<div class="table table-bordered h-100">
					<table class="table h-100">
						<tbody>
						<colgroup><col width="25%"></colgroup>
						<tr>
							<th scope="row">수강요일</th>
							<td>월 화 수 목 금</td>
						</tr>
						<tr>
							<th>수강기간</th>
							<td>2022.08.10 ~ 2023.01.11</td>
						</tr>
						<tr>
							<th>수강시간</th>
							<td>08/10~08/26 [16:30~21:30], 08/29~12/29 [09:20~18:00] <br>
								12/30~01/11 [08:50~16:20] (점심 13:10~14:00)
							</td>
						</tr>
						<tr>
							<th>총정원</th>
							<td>30명</td>
						</tr>
						<tr>
							<th>신청인원</th>
							<td>25명</td>
						</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="d-grid gap-2 d-sm-block text-center mt-3">
			<a class="btn btn-primary" href="/ycc/course/regcomplete" role="button">수강신청</a> 
			<a class="btn btn-primary" href="/ycc/course/search" role="button">목록</a>
		</div><hr>

		<!-- tab -->
		<ul class="nav nav-tabs" id="myTab" role="tablist">
			<li class="nav-item" role="presentation">
				<button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane"
				type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true">강의계획서</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane"
				type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false">수강후기</button>
			</li>
		</ul>
		
		<div class="tab-content mt-2" id="myTabContent">
			<!-- 강의계획서 -->
			<div class="tab-pane fade show active" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0">
				<div class="row">
					<div class="col-lg-4 text-center">
						<img class="img-fluid" src="/ycc/resources/img/main_img/logo.png" alt="강좌이미지">
					</div>
					<div class="col-lg-8">
						<table class="container-fluid table table-bordered h-100">
							<tbody>
							<colgroup><col width="25%"></colgroup>
							<tr>
								<th>강사명</th>
								<td>
									<div class="row">
										<div class="col-6 align-self-center">추호진</div>
										<div class="col-6 text-end">
											<a href="#" type="button" class="btn btn-sm btn-outline-primary">강사소개</a> 
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th>강좌기간</th>
								<td>2022.08.10 ~ 2023.01.11</td>
							</tr>
							<tr>
								<th>강좌시간</th>
								<td>08/10~08/26 [16:30~21:30], 08/29~12/29 [09:20~18:00]<br>
									12/30~01/11 [08:50~16:20] (점심 13:10~14:00)
								</td>
							</tr>
							<tr>
								<th>횟수/수강료</th>
								<td>800시간 - 6,851,200원 (전액지원)</td>
							</tr>
							<tr>
								<th>재료비/교재비</th>
								<td>전액지원</td>
							</tr>
							<tr>
								<th>첫시간준비물</th>
								<td>노트북</td>
							</tr>
							</tbody>
						</table>
					</div>
				</div>

				<!-- 강좌정보 -->
				<h6>| 강좌정보</h6>
				<table class="container-fluid table table-bordered">
					<tbody>
					<colgroup>
						<col width="25%">
					</colgroup>
					<tr>
						<th scope="row">강의실</th>
						<td>달콤한방</td>
					</tr>
					<tr>
						<th scope="row">강좌 소개</th>
						<td>▶ 장보고 재료손질하고 반찬고민 끝~<br>MSG 걱정없이 자극적이지 않아 아이들도 안심하고
							먹을 수 있는<br>우리가족의 건강까지 책임지는 프리미엄 반찬입니다.<br>
						<br>▶ 매 주마다 새로운 식단으로 1~2인분의 프리미엄 음식을 가정에서 바로 드실 수 있습니다.<br>
						</td>
					</tr>
					<tr>
						<th scope="row">강좌 수강 Tip</th>
						<td>※ 본 강좌는 단기 강좌로 개강 후 환불이 불가합니다.<br>※ 취소는 3일 전일까지만 가능합니다.<br><br>
							★요리 강좌 당일 소진 재료로(재사용 및 재료로 지급 불가)<br>수업 미참여 후 취소시에도
							지나간 수업분 재료비 납부 필수!★<br><br>
							[함께 하는 문화센터 방역 수칙]<br>1. 마스크 착용 필수<br> 
							2. 수업 전 손 소독하기 <br> 3. 강의실 내 거리두기 및 취식 금지<br>
						</td>
					</tr>
					</tbody>
				</table>

				<!-- 강의 계획서 -->
				<h6>| 강의계획서</h6>
				<table class="table table-bordered text-center">
					<tbody>
					<thead>
						<tr>
							<th style="width: 10%;" id="w-15">회차</th>
							<th>강의내용</th>
							<th style="width: 20%;" id="wcol">수강생준비물</th>
							<th style="width: 10%;" id="wcol">비고</th>
						</tr>
					</thead>
					<tr>
						<td class="text-center align-self-center">1</td>
						<td>쇠고기 육전, 호박죽, 건새우 시금치 된장국
							<div class="row" id="dcol">
								<div class="col-md-12">수강생 준비물 :</div>
								<div class="col-md-12">비고 :</div>
							</div>
						</td>
						<td id="wcol"></td>
						<td id="wcol"></td>
					</tr>
					<tr>
						<td class="text-center align-self-center">2</td>
						<td>쇠고기 육전, 호박죽, 건새우 시금치 된장국
							<div class="row" id="dcol">
								<div class="col-md-12">수강생 준비물 :</div>
								<div class="col-md-12">비고 :</div>
							</div>
						</td>
						<td id="wcol"></td>
						<td id="wcol"></td>
					</tr>
					<tr>
						<td class="text-center align-self-center">3</td>
						<td>쇠고기 육전, 호박죽, 건새우 시금치 된장국
							<div class="row" id="dcol">
								<div class="col-md-12">수강생 준비물 :</div>
								<div class="col-md-12">비고 :</div>
							</div>
						</td>
						<td id="wcol"></td>
						<td id="wcol"></td>
					</tr>
					<tr>
						<td class="text-center align-self-center">4</td>
						<td>쇠고기 육전, 호박죽, 건새우 시금치 된장국
							<div class="row" id="dcol">
								<div class="col-md-12">수강생 준비물 :</div>
								<div class="col-md-12">비고 :</div>
							</div>
						</td>
						<td id="wcol"></td>
						<td id="wcol"></td>
					</tr>
					<tr>
						<td class="text-center align-self-center">5</td>
						<td>쇠고기 육전, 호박죽, 건새우 시금치 된장국
							<div class="row" id="dcol">
								<div class="col-md-12">수강생 준비물 :</div>
								<div class="col-md-12">비고 :</div>
							</div>
						</td>
						<td id="wcol"></td>
						<td id="wcol"></td>
					</tr>
					</tbody>
				</table>

				<!-- 안내사항 -->
				<h6>| 안내사항</h6>
				<div class="container-md bg-light p-4">
					<h5>꼭! 알아두세요.</h5><hr>
					<ul>
						<li>자녀 교육 프로그램 중 <em>'영아 강좌'의 수강료는 2인 기준 금액</em>입니다.</li>
						<li>'영아 강좌'의 수강 신청은 엄마와 자녀가 동시(2인)에 자동 신청되며, 결제 진행 과정에서 수강자 중 한 명을 자녀 이름으로 변경하십시오.</li>
						<li>쌍둥이 및 다둥이 자녀인 경우 수강신청 &gt; 강좌 바구니에서 수강자 추가 버튼을 클릭하여 수강자를 인원 수 만큼 추가하여 결제하시면 됩니다.</li>
						<li>쌍둥이 및 다둥이 자녀를 선택하여 결제하시면 개별 취소 및 강좌 변경이 불가능 하오니 신중히 검토하시어 결제해 주십시오.</li>
						<li>강좌가 마감되었어도 '대기신청'으로 표기되어 있을 때 신청해 주시면 강좌등록인원 변경이 발생할 경우 대기순번에 따라 연락 드리겠습니다.</li>
						<li>점포별로 유사한 강좌가 있사오니 수강 신청하시는 점포를 꼭 확인해 주시기 바랍니다.</li>
						<li>강좌 관련 궁금한 점이 생기시면 <em>'고객센터 &gt; 이용문의'</em>에서 문의하시기 바랍니다.</li>
						<li><em>일일특강과 요리강좌의 재료비,교재비 환불은 직접 수납시(센터결제) 개강 3일전까지 취소가 가능하며 개강 이후에는 중도환불이 불가합니다.</em></li>
						<li>신청하신 강좌는 <em>최소 정원에 미달되거나 사정에 의해 폐강</em> 될 수 있으니 양해 바랍니다.</li>
					</ul>
				</div>
			</div>

			<!-- 수강후기 -->
			<div class="container-md tab-pane fade" id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">
				<div class="row">
					<!-- 별점 -->
					<h6>| 평균평점</h6>
					<div class="col-sm-12">
						<div class="row text-center bg-light p-1">
							<div class="col-sm-3 fs-3 align-self-center">평균 평점</div>
							<div class="col-sm-3 fs-3 align-self-center">4.3/5.0</div>
							<div class="Stars col-sm-6" style="-rating: 4.3;" aria-label="Rating of this product is 4.3 out of 5."></div>
						</div>
					</div>

					<!-- 수강후기게시판 -->
					<h6 class="mt-3">| 수강후기</h6>
					<div class="col-md-12">
						<table class="table table-bordered text-center">
							<thead>
								<tr>
									<th scope="col" style="width: 10%;" id="w-15">번호</th>
									<th scope="col">제목</th>
									<th scope="col" style="width: 15%;" id="wcol">작성일</th>
									<th scope="col" style="width: 15%;" id="wcol">작성자</th>
									<th scope="col" style="width: 10%;" id="w-15">평점</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>5</td>
									<td class="text-start">
										<div class="accordion accordion-flush" id="accordionFlushExample">
											<div class="accordion-item">
												<h2 class="accordion-header" id="flush-headingOne">
													<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" 
													data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">제목제목제목제목제목</button>
												</h2>
												<div id="flush-collapseOne" class="accordion-collapse collapse"
													aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
													<div class="accordion-body">
														내용내용내용내용내용
														<div class="row text-center" id="dcol"><hr>
															<div class="col-sm-12">
																<div class="row">
																	<div class="col-sm-6 ">작성일 : 2022.05.30</div>
																	<div class="col-sm-6">작성자 : 김성호</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</td>
									<td id="wcol">2022.05.30</td>
									<td id="wcol">김성호</td>
									<td><span>4</span></td>
								</tr>
								<tr>
									<td>4</td>
									<td class="text-start">
										<div class="accordion accordion-flush" id="accordionFlushExample">
											<div class="accordion-item">
												<h2 class="accordion-header" id="flush-headingTwo">
													<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
													data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
													제목제목제목제목제목제목제목제목 제목제목제목제목제목제목제목제목</button>
												</h2>
												<div id="flush-collapseTwo" class="accordion-collapse collapse"
												aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
													<div class="accordion-body">
														내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용
														<div class="row text-center" id="dcol"><hr>
															<div class="col-sm-12">
																<div class="row">
																	<div class="col-sm-6 ">작성일 : 2022.05.05</div>
																	<div class="col-sm-6">작성자 : 김성호</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</td>
									<td id="wcol">2022.05.05</td>
									<td id="wcol">김성호</td>
									<td><span>5</span></td>
								</tr>
								<tr>
									<td>3</td>
									<td class="text-start">
										<div class="accordion accordion-flush" id="accordionFlushExample">
											<div class="accordion-item">
												<h2 class="accordion-header" id="flush-headingThree">
													<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
													data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
													Accordion Item #3</button>
												</h2>
												<div id="flush-collapseThree" class="accordion-collapse collapse"
												aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
													<div class="accordion-body">
														Placeholder content for this accordion, which is intended to demonstrate the
														<code>.accordion-flush</code>class. This is the third item's accordion body.
														Nothing more exciting happening here in terms of content, 
														but just filling up the space to make it look, at least at first glance,
														a bit more representative of how this would look in a real-world application.
														<div class="row text-center" id="dcol"><hr>
															<div class="col-sm-12">
																<div class="row">
																	<div class="col-sm-6 ">작성일 : 2022.05.05</div>
																	<div class="col-sm-6">작성자 : 김성호</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</td>
									<td id="wcol">2022.05.30</td>
									<td id="wcol">김성호</td>
									<td><span>5</span></td>
								</tr>
								<tr>
									<td>2</td>
									<td class="text-start">
										<div class="accordion accordion-flush" id="accordionFlushExample">
											<div class="accordion-item">
												<h2 class="accordion-header" id="flush-headingFour">
													<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
													data-bs-target="#flush-collapseFour" aria-expanded="false" aria-controls="flush-collapseFour">
													Accordion Item #3</button>
												</h2>
												<div id="flush-collapseFour" class="accordion-collapse collapse"
												aria-labelledby="flush-headingFour" data-bs-parent="#accordionFlushExample">
													<div class="accordion-body">
														Placeholder content for this accordion, which is intended to demonstrate the
														<code>.accordion-flush</code>class. This is the third item's accordion body.
														Nothing more exciting happening here in terms of content, 
														but just filling up the space to make it look, at least at first glance,
														a bit more representative of how this would look in a real-world application.
														<div class="row text-center" id="dcol"><hr>
															<div class="col-sm-12">
																<div class="row">
																	<div class="col-sm-6 ">작성일 : 2022.05.05</div>
																	<div class="col-sm-6">작성자 : 김성호</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</td>
									<td id="wcol">2022.05.30</td>
									<td id="wcol">김성호</td>
									<td><span>5</span></td>
								</tr>
								<tr>
									<td>1</td>
									<td class="text-start">
										<div class="accordion accordion-flush" id="accordionFlushExample">
											<div class="accordion-item">
												<h2 class="accordion-header" id="flush-headingFive">
													<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
													data-bs-target="#flush-collapseFive" aria-expanded="false" aria-controls="flush-collapseFive">
													Accordion Item #3</button>
												</h2>
												<div id="flush-collapseFive" class="accordion-collapse collapse" 
												aria-labelledby="flush-headingFive" data-bs-parent="#accordionFlushExample">
													<div class="accordion-body">
														Placeholder content for this accordion, which is intended to demonstrate the
														<code>.accordion-flush</code>class. This is the third item's accordion body.
														Nothing more exciting happening here in terms of content, 
														but just filling up the space to make it look, at least at first glance,
														a bit more representative of how this would look in a real-world application.
														<div class="row text-center" id="dcol"><hr>
															<div class="col-sm-12">
																<div class="row">
																	<div class="col-sm-6 ">작성일 : 2022.05.05</div>
																	<div class="col-sm-6">작성자 : 김성호</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</td>
									<td id="wcol">2022.05.30</td>
									<td id="wcol">김성호</td>
									<td><span>5</span></td>
								</tr>
							</tbody>
						</table>
						<!-- paging -->
						<nav aria-label="Page navigation example">
							<ul class="pagination justify-content-center">
								<li class="page-item"><a class="page-link" href="#" aria-label="Previous">
									<span aria-hidden="true">&laquo;</span></a></li>
								<li class="page-item"><a class="page-link" href="#">1</a></li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#">4</a></li>
								<li class="page-item"><a class="page-link" href="#">5</a></li>
								<li class="page-item"><a class="page-link" href="#" aria-label="Next">
									<span aria-hidden="true">&raquo;</span></a></li>
							</ul>
						</nav>
						<!-- 글쓰기 btn -->
						<div class="text-end"><a class="btn btn-primary" href="#">글쓰기</a></div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- footer include -->
	<%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>