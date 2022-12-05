<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="loginId" value="${sessionScope.id }" />

<!DOCTYPE html>
<html>
<head>
	<!-- head & meta tag include -->
	<%@ include file="/WEB-INF/views/metahead.jsp" %>
	
	<link rel="stylesheet" href="/ycc/resources/css/starrating.css">
	
	<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
	
	<title>강좌상세</title>
	
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
	
		<!-- 제목 -->
		<c:if test="${mode eq 'new' }">
			<h1 id="writing-header">강좌등록페이지</h1>
		</c:if>
		<c:if test="${mode ne 'new' }">
			<h1 id="writing-header">${mode=="modify" ? "강좌수정페이지" : "강좌상세페이지" }</h1>
		</c:if>
		<hr>
		<!-- // 제목 -->
		
		<form id="form" class="frm" action="" method="POST">
			<h6>| 강좌상세정보</h6>
			<div class="row g-0">
				<input type="hidden" name="course_id" value="${courseDto.course_id }">
				<div class="col-md-6">
					<div class="table table-bordered h-100">
						<input class="form-control" type="hidden" name="user_id" value="${courseDto.user_id }" ${mode=="new" || mode=="modify" ? "" : "readonly" } />
						<table class="table h-100">
							<tbody>
							<colgroup><col width="25%"></colgroup>
							<tr>
								<th>강좌명</th>
								<td><input class="form-control" type="text" name="course_nm" value="${courseDto.course_nm }" ${mode=="new" || mode=="modify" ? "" : "readonly" }></td>
							</tr>
							
							<!-- 출력값 -->
							<c:if test="${mode ne 'new' && mode ne 'modify' }">
								<tr>
									<th>강사명</th>
									<td>${courseDto.user_name }</td>
								</tr>
								<tr>
									<th>강의실</th>
									<td>${courseDto.croom_name }</td>
								</tr>
								<tr>
									<th>접수기간</th>
									<td>${courseDto.reg_sd() } ~ ${courseDto.reg_ed() }</td>
								</tr>
							</c:if>
							
							<!-- 입력값 -->
							<c:if test="${mode eq 'new' || mode eq 'modify' }">
								<tr>
									<th>강의실</th> <!-- 셀렉트박스로 변경 -->
									<td><input class="form-control w-50" type="text" name="croom_id" value="${courseDto.croom_id }"></td>
								</tr>
								<tr>
									<th>카테고리</th> <!-- 셀렉트박스로로 변경 -->
									<td><input class="form-control w-50" type="text" name="course_cate_cd" value="${courseDto.course_cate_cd }"></td>
								</tr>
								<tr>
									<th>접수시작일</th>
									<td><input class="form-control w-75" type="date" id="date" name="course_reg_start_date" value="${courseDto.reg_sd() }"></td>
								</tr>
								<tr>
									<th>접수마감일</th>
									<td><input class="form-control w-75" type="date" id="date" name="course_reg_end_date" value="${courseDto.reg_ed() }"></td>
								</tr>
								<tr>
									<th>수강시작일</th>
									<td><input class="form-control w-75" type="date" id="date" name="course_start_date" value="${courseDto.course_sd() }"></td>
								</tr>
								<tr>
									<th>수강종료일</th>
									<td><input class="form-control w-75" type="date" id="date" name="course_end_date" value="${courseDto.course_ed() }"></td>
								</tr>
							</c:if>
							<!-- //입력값 -->
							
							<tr>
								<th>수강료</th>
								<td><input class="form-control w-50 d-inline" type="text" name="course_cost" value="${courseDto.course_cost }" ${mode=="new" || mode=="modify" ? "" : "readonly" }>원</td>
							</tr>
							<tr>
								<th>수강대상</th> <!-- 셀렉트박스로 변경 -->
								<td><input class="form-control w-50" type="text" name="course_target" value="${courseDto.course_target }" ${mode=="new" || mode=="modify" ? "" : "readonly" }></td>
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
							<!-- 출력값 -->
							<tr>
								<th>수강요일</th> <!-- 체크박스로 변경 -->
								<td><input class="form-control w-75" type="text" name="course_day" value="${courseDto.course_day }" ${mode=="new" || mode=="modify" ? "" : "readonly" }></td>
							</tr>
							<tr>
								<th>수강시간</th>
								<td><input class="form-control w-75" type="text" name="course_time" value="${courseDto.course_time }" ${mode=="new" || mode=="modify" ? "" : "readonly" }></td>
							</tr>
							<c:if test="${mode ne 'new' && mode ne 'modify' }">
								<tr>
									<th>수강기간</th>
									<td>${courseDto.course_sd() } ~ ${courseDto.course_ed() }</td>
								</tr>
								<tr>
									<th>총정원</th>
									<td>${courseDto.croom_mpop }명</td>
								</tr>
								<tr>
									<th>신청인원</th>
									<td class="${courseDto.course_applicants >= courseDto.croom_mpop ? 'text-danger' : '' }">
										${courseDto.course_applicants }명${courseDto.course_applicants >= courseDto.croom_mpop ? '(정원이 마감되었습니다.)' : '' }
									</td>
								</tr>
							</c:if>
							<!-- //출력값 -->
							<c:if test="${mode eq 'new' || mode eq 'modify' }">
								<tr>
									<th>강좌 소개</th>
									<td><textarea class="form-control" rows="15" name="course_info">${courseDto.course_info }</textarea></td>
								</tr>
							</c:if>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="d-grid gap-2 d-sm-block text-center mt-3">
				<c:if test="${mode ne 'new' && mode ne 'modify'}">
					<a id="courseRegBtn" class="btn  ${courseDto.course_applicants >= courseDto.croom_mpop ? 'disabled btn-secondary' : 'btn-primary' }" 
						 role="button" ${courseDto.course_applicants >= courseDto.croom_mpop ? 'aria-disabled="true"' : '' }>수강신청</a> 
					<button type="button" id="listBtn" class="btn btn-primary btn-list">목록</button>
				</c:if>
			</div><hr>
		</form>
		
			<!-- tab -->
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane"
					type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true" >강의계획서</button>
				</li>
				<c:if test="${mode ne 'new' && mode ne 'modify' }">
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane"
						type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false">수강후기</button>
					</li>
				</c:if>
			</ul>
			
			<div class="tab-content mt-2" id="myTabContent">
				<!-- 강의계획서 -->
				<div class="tab-pane fade show active" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0">
					<form id="form" class="frm" action="" method="POST">
						<div class="row">
							<div class="col-lg-4 text-center">
								<img class="img-fluid" src="${courseDto.course_image }" alt="${courseDto.course_image }">
							</div>
							<div class="col-lg-8 mb-3">
								<table class="container-fluid table table-bordered h-100">
									<tbody>
									<colgroup><col width="25%"></colgroup>
									<tr>
										<th>강좌명</th>
										<td>${courseDto.course_nm }</td>
									</tr>
									<tr>
										<th>강사명</th>
										<td>
											<div class="row">
												<div class="col-6 align-self-center">${courseDto.user_name }</div>
												<div class="col-6 text-end">
													<a href="#" type="button" class="btn btn-sm btn-outline-primary" hidden>강사소개</a> 
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<th>수강기간</th>
										<td>${courseDto.course_sd() } ~ ${courseDto.course_ed() }</td>
									</tr>
									<tr>
										<th>수강요일</th>
										<td>${courseDto.course_day }</td>
									</tr>
									<tr>
										<th>수강시간</th>
										<td>${courseDto.course_time }</td>
									</tr>
									<tr>
										<th>수강료</th>
										<td>${courseDto.course_cost }원</td>
									</tr>
									</tbody>
								</table>
							</div>
							<c:if test="${mode eq 'new' }">	
								<div class="input-group mb-3">
								  <input type="file" class="form-control" id="inputGroupFile02" name="course_image">
								  <label class="input-group-text" for="inputGroupFile02">ImageUpload</label>
								</div>
							</c:if>							
						</div>
		
						<!-- 강좌정보 -->
						<c:if test="${mode ne 'new' && mode ne 'modify' }"> 
							<h6>| 강좌정보</h6>
							<table class="container-fluid table table-bordered">
								<tbody>
									<colgroup>
										<col width="25%">
									</colgroup>
									<tr>
										<th>강의실</th>
										<td>${courseDto.croom_name }</td>
									</tr>
									<tr>
										<th>강좌 소개</th>
										<td><textarea class="form-control-plaintext" rows="20" name="course_info" readonly>${courseDto.course_info }</textarea></td>
									</tr>
								</tbody>
							</table>
						</c:if>
						<!-- 안내사항 -->
						<c:if test="${mode ne 'new' }">
							<h6>| 안내사항</h6>
							<div class="container-md bg-light p-4 mb-3">
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
						</c:if>
						
						<div class="text-end">
							<c:if test="${mode eq 'modify'}">
								<button type="button" id="backtoDetail" class="btn btn-secondary btn-list">뒤로</button>
								<button type="button" id="courseModifyBtn" class="btn btn-primary btn-modify">수정하기</button>
							</c:if>
							
							<c:if test="${mode eq 'new' }">
								<button type="button" id="writeBtn" class="btn btn-primary btn-write">등록</button>
								<button type="button" id="listBtn" class="btn btn-secondary btn-list">뒤로</button>
							</c:if>
							
							<c:if test="${mode ne 'new' && sessionScope.grade == '강사' }">
								<button type="button" id="writeNewBtn" class="btn btn-primary btn-write">강좌등록</button>
							</c:if>
							
							<c:if test="${courseDto.user_id eq loginId || sessionScope.grade == '관리자' }"> 
								<c:if test="${mode ne 'modify' && mode ne 'new'}">
									<button type="button" id="courseModBtn" class="btn btn-primary btn-modify">수정</button>
								</c:if>
								<c:if test="${mode ne 'new' }">
									<button type="button" id="removeBtn" class="btn btn-danger btn-remove">삭제</button>
								</c:if>
							</c:if>
						</div>
					</form>
				</div>
				<!-- 수강후기 -->
				<div class="container-md tab-pane fade" id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">
					<div class="row">
						<!-- 별점 -->
						<h6>| 평균평점</h6>
						<div class="col-sm-12">
							<div class="row text-center bg-light p-1">
								<div class="col-sm-3 fs-3 align-self-center">평균 평점</div>
								<div class="col-sm-3 fs-3 align-self-center">${rating }/5.00</div>
								<div class="Stars col-sm-6" style="--rating: ${rating };" aria-label="Rating of this product is ${rating } out of 5."></div>
							</div>
						</div>
	
						<!-- 수강후기게시판 -->
						<h6 class="mt-3">| 수강후기 <span id="reviewCnt" class="text-primary">[${courseDto.review_cnt }개]</span></h6>
						<div class="col-md-12">
							<div id="${courseDto.review_cnt > 0 ? 'reviewList' : '' }" class="${courseDto.review_cnt > 0 ? '' : 'text-center mt-2 mb-5' }"
							style="${courseDto.review_cnt > 0 ? 'max-height:750px; overflow-y: auto;' : '' }">${courseDto.review_cnt > 0 ? '' : '첫 번째 수강후기를 등록하세요.' }</div>
							<div class="row mb-1 mt-3">
								<div class="col-sm-10">
									<textarea placeholder="후기를 작성해주세요." type="text" name="review_content" class="form-control mb-1" ></textarea>
								</div>
								<div class="col-sm-2">
									<select class="form-select" name="review_rating">
										<option value="" selected >별점 선택</option>
										<option value="5" >5</option>
										<option value="4" >4</option>
										<option value="3" >3</option>
										<option value="2" >2</option>
										<option value="1" >1</option>
									</select>
								</div>
							</div>
							<div class="gap-1 d-grid d-sm-block text-end">
								<button id="modifyBtn" type="button" class="btn btn-secondary">수정하기</button>
								<button id="insertBtn" type="button" class="btn btn-primary">후기작성</button>
							</div>
						</div>
					</div>
				</div>
			</div>
	</div>
	
	<script type="text/javascript">
		$(document).ready(function() {
			let course_id = $("input[name=course_id]").val()
			
			// 수강후기 '수정하기'버튼 클릭
			$("#modifyBtn").click(function() {
				let review_id = $(this).attr("data-review_id")
				let review_content = $("textarea[name=review_content]").val()
				let review_rating = $("select[name=review_rating]").val()
				
				if(review_content.trim() == '') {
					alert("수강후기을 입력해주세요.")
					$("textarea[name=review_content]").focus
					return
				}
				
				$.ajax({
					type : 'PATCH'
					, url : '/ycc/course/reviews/'+review_id
					, headers : { "content-type" : "application/json" }
					, data : JSON.stringify({review_id:review_id, review_content:review_content, review_rating:review_rating})
					, success : function(result) {
							alert(result)
							showList(course_id)
							$("textarea[name=review_content]").val("")
							$("select[name=review_rating]").val("")
					}
					, error : function() { alert("error") }
				})
			})
			
			// 수강후기 '수정'버튼 클릭
			$("#reviewList").on("click", "#modBtn", function() {
				// alert("수정버튼클릭")
				let review_id = $(this).parent().attr("data-review_id")
				let review_content = $("span[id=review]", $(this).parent().parent()).text()
				let review_rating = $(this).parent().attr("data-review_rating")
				//alert(review_id)
				//alert(review_content)
				//alert(review_rating)
				$("textarea[name=review_content]").val(review_content)
				$("select[name=review_rating]").val(review_rating)
				$("#modifyBtn").attr("data-review_id", review_id)
				$("textarea[name=review_content]").focus()
			})
			
			// 수강후기 '삭제'버튼 클릭
			$("#reviewList").on("click", "#delBtn", function() {
				//alert("삭제버튼클릭")
				var review_cnt = ${courseDto.review_cnt }
				//alert("review_cnt="+review_cnt)
				if(review_cnt > 0){
					//alert("if문진입")
					let review_id = $(this).parent().attr("data-review_id")
					let course_id = $(this).parent().attr("data-course_id")
					//alert(review_id)
					//alert(course_id)
					$.ajax({
						type : 'Delete'
						, url : '/ycc/course/reviews/'+review_id+'?course_id='+course_id
						, success : function(result) {
								alert(result)
								showList(course_id)
						}
						, error : function() { alert("error") }
					})
				}
			})
			
			// 수강후기 '후기작성'버튼 클릭
			$("#insertBtn").click(function() {
				// alert("댓글입력이벤트")
				let review = $("textarea[name=review_content]").val()
				let rating = $("select[name=review_rating]").val()
				
				if(review.trim()=='') {
					alert("댓글을 입력해주세요.")
					$("textarea[name=review_content]").focus()
					return
				}
				if(rating=='') {
					alert("별점을 선택해주세요.")
					$("select[name=review_rating]").focus()
					return
				}
				
				$.ajax({
					type : 'POST'
					, url : '/ycc/course/reviews?course_id='+course_id
					, headers : { "content-type" : "application/json" }
					, dataType : 'text'
					, data : JSON.stringify({review_content:review, review_rating:rating})
					, success : function(result) {
							alert(result)
							showList(course_id)
							$("textarea[name=review_content]").val("")
							$("select[name=review_rating]").val("")
					}
					, error : function() { alert("error") }
				})
			})
			
			// 수강후기리스트 출력
			let showList = function(course_id) {
				$.ajax({
					type : 'GET'
					, url : '/ycc/course/reviews?course_id='+course_id
					, success : function(result) {
							$("#reviewList").html(toHtml(result))
					}
					, error : function() { alert("error") }
				})
			}
			
			// alert("ajax")
			showList(course_id)
			
			let toHtml = function(reviews) {
				let i = 0
				let tmp = "<table class='table table-bordered text-center'>"
				tmp += " <thead>"
				tmp += "  <tr>"
				tmp += "   <th style='width: 10%;' id='w-15'>번호</th>"
				tmp += "   <th class='align-middle'>제목</th>"
				tmp += "   <th style='width: 15%;' id='wcol'>작성일</th>"
				tmp += "   <th style='width: 15%;' id='wcol'>작성자</th>"
				tmp += "   <th style='width: 10%;' id='w-15'>평점</th>"
				tmp += "  </tr>"
				tmp += " </thead>"
				
				reviews.forEach(function(review) {
					var userId = '${loginId}'
					var userIdCheck = ( review.user_id == userId )
					var sessionGradeCheck = ${sessionScope.grade == '관리자'}
					i = review.review_id
					tmp += '<tr>'
					tmp += ' <td>'+i+'</td>'
					tmp += ' <td class="text-start">'
					tmp += ' 	<div class="accordion accordion-flush" id="accordionFlushExample">'
					tmp += '   <div class="accordion-item">'
					tmp += ' 		<h2 class="accordion-header" id="flush-heading'+i+'">'
					tmp += ' 		 <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse'+i+'"'
					tmp += '		  aria-expanded="false" aria-controls="flush-collapse'+i+'"><span class="text-truncate" style="max-width: 128px;">'+review.review_content+'</span></button>'
					tmp += ' 		</h2>'
					tmp += ' 		<div id="flush-collapse'+i+'" class="accordion-collapse collapse" aria-labelledby="flush-heading'+i+'" data-bs-parent="#accordionFlushExample">'
					tmp += ' 		 <div class="accordion-body"><span id="review">'+review.review_content+'</span><hr id="dcol">'
					tmp += ' 			<div class="row" id="dcol">'
					tmp += ' 			 <div class="col-sm-12">'
					tmp += ' 				<div class="col-sm-6 fs-6">작성일:'+${review.review_datetime == review.review_updated_datetime ? "review.review_datetime":"review.review_updated_datetime"}+'</div>'
					tmp += ' 				<div class="col-sm-6 fs-6">작성자:'+review.user_id+'</div>'
					tmp += ' 			 </div>'
					tmp += ' 			</div>'
					
					if(userIdCheck || sessionGradeCheck) {
						tmp += ' 			<hr>'
						tmp += '   		 <div data-review_id='+review.review_id+' data-course_id='+review.course_id+' data-review_rating='+review.review_rating+' class="text-end d-grid d-md-block gap-1">'
						tmp += '			  <button id="modBtn" class="btn btn-secondary">수정</button>'
						tmp += '   		  <button id="delBtn" class="btn btn-danger">삭제</button>'
						tmp += '		   </div>'
					}
					
					tmp += ' 		 </div>'
					tmp += ' 		</div>'
					tmp += ' 	 </div>'
					tmp += ' 	</div>'
					tmp += ' </td>'
					tmp += ' <td id="wcol">${'+review.review_datetime+' == '+review.review_updated_datetime+' ? "'+review.review_datetime+'" : "'+review.review_updated_datetime+'"}</td>'
					tmp += ' <td id="wcol">'+review.user_id+'</td>'
					tmp += ' <td><span id="rating">'+review.review_rating+'</span></td>'
					tmp += '</tr>'
				})
				
				return tmp += "</table>"
			}

			// ==============================================강좌==============================================
			// 강좌 '수강신청'버튼 클릭
			$("#courseRegBtn").on("click", function() {
				if(!confirm("수강신청을 하시겠습니까?")) return
				
				location.href = "<c:url value='/course/regcomplete${pr.sc.queryString }&course_id=${courseDto.course_id }' />"
			})
				
			// 강좌 '수정하기'버튼 클릭
			$('#courseModifyBtn').on("click", function() {
				let form = $("#form")
				
				form.attr("action", "<c:url value='/course/modify${searchItem.queryString}' />")
				form.attr("method", "POST")
				
				form.submit()
			})
			
			// 강좌 '수정'버튼 클릭
			$("#courseModBtn").on("click", function() {
				location.href = "<c:url value='/course/modify${pr.sc.queryString }&course_id=${courseDto.course_id }' />"
				
			})
			
			// 강좌 '삭제'버튼 클릭
			$("#removeBtn").on("click", function() {
				if(!confirm("정말로 삭제하시겠습니까?")) return
				
				let form = $("#form")
				form.attr("action", "<c:url value='/course/remove${courseSearchItem.queryString}' />")
				form.attr("method", "POST")
				form.submit()
			})
			
			// 강좌 '등록'버튼 클릭
			$("#writeBtn").on("click", function() {
				let form = $('#form')
				form.attr("action", "<c:url value='/course/write' />")
				form.attr("method", "POST")
				
				if(formCheck())
					form.submit()
			})
			
			// 
			let formCheck = function() {
				let form = document.getElementById("form")
				if(form.course_nm.value == ""){
					alert("강좌명을 입력해주세요.")
					form.course_nm.focus()
					return false
				}
				if(form.course_info.value == ""){
					alert("강좌소개를 입력해주세요.")
					form.course_info.focus()
					return false
				}
				return true
			}
			
			// 강좌 '강좌생성'버튼 클릭
			$("#writeNewBtn").on("click", function() {
				location.href = "<c:url value='/course/write' />"
			})
			
			// 강좌 '목록'버튼 클릭
			$("#listBtn").on("click", function() {
				location.href = "<c:url value='/course/search${courseSearchItem.queryString}' />"
			})
			
			$("#backtoDetail").on("click", function() {
				location.href = "<c:url value='/course/detail${pr.sc.queryString }&course_id=${courseDto.course_id }' />"
			})
		})
	</script>
	
	<script type="text/javascript">
		let msg = "${msg}"
		if(msg == "WRT_ERR") alert("게시물 등록에 실패하였습니다. 다시 시도해주세요.")
		if(msg == "MOD_ERR") alert("게시물 수정에 실패하였습니다. 다시 시도해주세요.")
	</script>

	<!-- footer include -->
	<%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>