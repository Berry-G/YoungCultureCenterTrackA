<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>	
		<!-- head & meta tag include -->
    <%@include file="/WEB-INF/views/metahead.jsp"%>
<title>회원정보입력</title>
</head>
<body>

	<!-- header inlcude -->
	<%@include file="/WEB-INF/views/header.jsp"%>



	<div class="container w-50">
    <h2 class="p-5" style="text-align: center;">회원가입</h2>
    <div class="container-lg pt-5">
      <div class="position-relative m-4">
        <div class="progress" style="height: 5px;">
          <div class="progress-bar bg-dark" role="progressbar" style="width: 50%;" aria-valuenow="50" aria-valuemin="0"
            aria-valuemax="100">
          </div>
        </div>
        <button type="button" class="position-absolute top-0 start-0 translate-middle btn btn-sm btn-dark rounded-pill"
          style="width: 3.5rem; height:3.5rem;">Step1</button>
        <button type="button"
          class="position-absolute top-0 start-50 translate-middle btn btn-sm btn-primary rounded-pill"
          style="width: 3.5rem; height:3.5rem;">Step2</button>
        <button type="button"
          class="position-absolute top-0 start-100 translate-middle btn btn-sm btn-secondary rounded-pill"
          style="width: 3.5rem; height:3.5rem;">Step3</button>
      </div>
    </div>


 <form action="member/signin3.jsp" name="signinform" method="post">
  <!-- 회원정보 입력 table -->
  <table class="table">
    <p class="col-lg-3 control-label pt-5 pb-3 fs-3 fw-bold">회원정보입력</p>
	<hr>
    <colgroup>
      <col width="20%">
      <col width="60%">
    </colgroup>
      
    <thead>
      <tr>
        <th class="col" style="vertical-align: middle !important;">아이디</th>
          <td><input type="text" class="form-control onlyAlphabetAndNumber" id="id" data-rule-required="true"
              placeholder="4~15자, 영문+숫자 입력" maxlength="20">
          </td>
      </tr>
        
      <tr>
        <th class="col" style="vertical-align: middle !important;">이름</th>
          <td><input type="text" class="form-control onlyHangul" id="name" data-rule-required="true" placeholder="한글입력"
            maxlength="10">
          </td>
      </tr>

      <tr>
        <th class="col" style="vertical-align: middle !important;">비밀번호</th>
          <td><input type="password" class="form-control" id="password" name="excludeHangul" data-rule-required="true"
              placeholder="8~15자, 영문+숫자 입력" maxlength="20">
          </td>
      </tr>
        
      <tr>
        <th class="col" style="vertical-align: middle !important;">비밀번호확인</th>
          <td> <input type="password" class="form-control" id="passwordCheck" data-rule-required="true" maxlength="20">
          </td>
      </tr>
        
      <tr>
        <th class="col" style="vertical-align: middle !important;">성별</th>
          <td>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
              <label class="form-check-label" for="inlineRadio1">남자</label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
              <label class="form-check-label" for="inlineRadio2">여자</label>
            </div>
          </td>
      </tr>
      
      <tr>
      	<th class="col" style="vertical-align: middle !important;">생년월일</th>
		  <td class="col-auto px-3" >
		  	<div class="row">
		  	<select class="form-select col-3 mx-1" id="birthYear" style="width: 130px; " >
			  <option selected>출생연도</option>
			</select >
			<select class="form-select col-3 mx-1" id="birthMonth"  style="width: 100px;" >
			  <option selected>월</option>
			</select>
			<select class="form-select col-3 mx-1" id="birthDay" style="width: 100px;" >
			  <option selected>일</option>
			</select>
			</div>
		  </td>
      </tr>
      
        
      <tr>
        <th class="col" style="vertical-align: middle !important;">이메일</th>
          <div class="row d- flex justify-content-center">
            <td class="pl-3 ">
              <div class="row mx-0">
                <input type="text" class="form-control " style="width: 180px;" id="divEmai" maxlength="40">
                <p class="col-auto fs-6">@</p>
                <select class="form-select col-4 " style="width: 180px;" aria-label="Default select example">
                  <option selected></option>
                  <option value="1">naver.com</option>
                  <option value="2">gmail.com</option>
                  <option value="3">hanmail.net</option>
                </select>
                <button type="submit" class="btn btn-outline-primary" style="width: 100px;">인증하기</button>
            </div>
          </td>
        </div>
      </tr>

      <tr>
        <th class="col" style="vertical-align: middle !important;">이메일인증</th>
        <td>
          <input type="text" class="form-control" id="email" data-rule-required="true" placeholder="인증번호6자리"
            maxlength="10">
        </td>
      </tr>
        
      <tr>
        <th class="col" style="vertical-align: middle !important;">휴대폰</th>
        <td>
          <input type="tel" class="form-control onlyNumber" id="phoneNumber" data-rule-required="true"
            placeholder="-를 제외하고 숫자만 입력하세요." maxlength="11">
        </td>
      </tr>
        
      <tr>
        <th class="col" style="vertical-align: middle !important;">주소</th>
          <div class="row d- flex justify-content-center">
            <td class="pl-3 ">
              <div class="row mx-0">
                <input type="text" class="col-lg-2 form-control" style="width: 180px;" id="sample6_postcode" placeholder="우편번호" required readonly="readonly">
                <input class="btn btn-outline-primary" onclick="sample6_execDaumPostcode()" type="button" style="width: 150px;" value="우편번호검색">
                <input type="text" class="col-lg-2 form-control" id="sample6_address" placeholder="도로명주소" required readonly="readonly">
                <input type="text" class="col-lg-2 form-control" id="sample6_detailAddress" placeholder="상세주소를 입력해주세요.">
                <input type="hidden" class="col-lg-2 form-control" id="sample6_extraAddress" placeholder="참고항목.">
              </div>
            </td>
          </div>
      </tr>
    </thead>
  </table>
  <div class="row">
    <div class="col text-center pt-5">
      <a href="/ycc/member/signin3" id="signinBtn" class="btn btn-primary" type="submit" role="button">회원가입</a>
      <a href="/ycc/" class="btn btn-secondary" role="button">취소</a>
    </div>
  </div>
  </form>
 </div>

	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	const birthYearEl = document.querySelector('#birthYear')
	//option 목록 생성 여부 확인
	isYearOptionExisted = false;
	birthYearEl.addEventListener('focus', function() {
	  //year 목록 최초 클릭시 
	  if(!isYearOptionExisted) {
	    isYearOptionExisted = true
	    for(var i = 1940; i < 2022; i++) {
	      // option element 생성
	      const YearOption = document.createElement('option')
	      YearOption.setAttribute('value', i)
	      YearOption.innerText = i
	      //birthYearEl의 자식 요소 추가
	      this.appendChild(YearOption);
	    }
	  }
	});
	const birthMonthEl = document.querySelector('#birthMonth')
	isMonthOptionExisted = false;
	birthMonthEl.addEventListener('focus', function(){
	  if(!isMonthOptionExisted) {
	    isMonthOptionExisted = true
	    for(var i = 1; i <= 12; i++) {
	      const MonthOption = document.createElement('option')
	      MonthOption.setAttribute('value', i)
	      MonthOption.innerText = i
	      this.appendChild(MonthOption);
	    }
	  }

	});

	const birthDayEl = document.querySelector('#birthDay')
	isDayOptionExisted = false;
	birthDayEl.addEventListener('focus', function(){
	  if(!isDayOptionExisted) {
	    isDayOptionExisted = true
	    for(var i = 1; i <= 31; i++) {
	      const DayOption = document.createElement('option')
	      DayOption.setAttribute('valye', i)
	      DayOption.innerText = i
	      this.appendChild(DayOption);
	    }
	  }
	});
	

	  function getvalue(){
	    var idx = document.getElementById('name').value;
	      var url = '?name='+idx;
	    location.href="join_member3.html"+url;
	    }


	  function sample6_execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var addr = ''; // 주소 변수
	            var extraAddr = ''; // 참고항목 변수

	            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                addr = data.roadAddress;
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                addr = data.jibunAddress;
	            }
	          
	            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	            if(data.userSelectedType === 'R'){

	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraAddr !== ''){
	                    extraAddr = ' (' + extraAddr + ')';
	                }
	                // 조합된 참고항목을 해당 필드에 넣는다.
	                document.getElementById("sample6_extraAddress").value = extraAddr;
	            
	            } else {
	                document.getElementById("sample6_extraAddress").value = '';
	            }

	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('sample6_postcode').value = data.zonecode;
	            document.getElementById("sample6_address").value = addr;
	            // 커서를 상세주소 필드로 이동한다.
	            document.getElementById("sample6_detailAddress").focus();
	        }
	    }).open();
	  }

	</script>


	<!-- footer inlcude -->
	<%@include file="/WEB-INF/views/footer.jsp"%>

</body>
</html>