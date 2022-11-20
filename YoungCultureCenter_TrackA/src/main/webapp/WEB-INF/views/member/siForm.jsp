
<%@page import="com.youngtvjobs.ycc.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>	

	<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
		<!-- head & meta tag include -->
    <%@include file="/WEB-INF/views/metahead.jsp"%>
<title>회원정보입력</title>
	<script type="text/javascript">
	

    </script>
	
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


 <form action= '<c:url value="/signin/sicomple" />' name="signinform" method="post">
  <!-- 회원정보 입력 table -->
  <h2 class="mt-5">회원정보입력</h2>
	<hr>
  <table class="table">
    <colgroup>
      <col width="20%">
      <col width="60%">
    </colgroup>
      
    <thead>
      <tr>
        <th class="col" style="vertical-align: middle !important;">아이디</th>
          <td class="col-auto px-3"> 
          <div class="row">
         	<input type="text" class="form-control onlyAlphabetAndNumber" id="user_id"  name="user_id"
              placeholder="4~15자, 영문+숫자 입력" maxlength="20" style="width: 340px;">
          	<input type="button" id="idCheckBtn" name="idCheckBtn" class="btn btn-outline-primary mx-1" value="중복확인" style="width: 100px;">
          	<!-- 중복체크 검사결과  -->
          	<span id="result"></span>  
          	</div>
          </td>
      </tr>
        
      <tr>
        <th class="col" style="vertical-align: middle !important;">이름</th>
          <td>
          <input type="text" class="form-control onlyHangul" id="user_name" name="user_name" placeholder="한글입력"
            maxlength="10">
           <span id="name_result"></span>  
          </td>
      </tr>

      <tr>
        <th class="col" style="vertical-align: middle !important;">비밀번호</th>
          <td>
          <input type="password" class="form-control" id="user_pw" name="user_pw" 
              placeholder="8~15자, 영문+숫자 입력" maxlength="20">
           <span id="pw_result"></span> 
          </td>
      </tr>
        
      <tr>
        <th class="col" style="vertical-align: middle !important;">비밀번호확인</th>
          <td> 
          <input type="password" class="form-control"  id="passwordCheck" name="passwordCheck" maxlength="20">
          <span id="pwCheck_result"></span> 
           </td>
      </tr>
        
      <tr>
        <th class="col" style="vertical-align: middle !important;">성별</th>
          <td>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="user_gender" id="radioBtnM" value="M">
              <label class="form-check-label" for="inlineRadio1">남자</label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="user_gender" id="radioBtnW" value="W">
              <label class="form-check-label" for="inlineRadio2">여자</label>
            </div>
            <span id="gender_result"></span> 
          </td>
      </tr>
      
      <tr>
      	<th class="col" style="vertical-align: middle !important;">생년월일</th>
		  <td class="col-auto px-3" >
		  	<div class="row" id="birth_select">
		  	<select class="form-select col-3 mx-1" id="birthYear" name="birthYear"  onchange="javascript:lastday();" style="width: 130px; " >
			</select >
			<select class="form-select col-3 mx-1" id="birthMonth" name="birthMonth"  onchange="javascript:lastday();" style="width: 100px;" >
			</select>
			<select class="form-select col-3 mx-1" id="birthDay" name="birthDay" style="width: 100px;" >
			</select>
			<span class="error-msg"></span> 
			</div>

		</td>
      </tr>
        
	
        
      <tr>
        <th class="col" style="vertical-align: middle !important;">이메일</th>
           <td>
              <div class="row mx-0">
                <input type="text" class="form-control " style="width: 180px;" name="user_email" id="divEmai" maxlength="40">
                <p class="col-auto fs-6" >@</p>
                <select class="form-select col-4 " style="width: 180px;" name="user_email" aria-label="Default select example">
                  <option selected></option>
                  <option value="naver.com">naver.com</option>
                  <option value="gmail.com">gmail.com</option>
                  <option value="hanmail.net">hanmail.net</option>
                </select>
                <button type="button" class="btn btn-outline-primary mx-1" style="width: 100px;">인증하기</button>
            </div>
            <span id="email_result"></span> 
          </td>
      </tr>

      <tr>
        <th class="col" style="vertical-align: middle !important;">이메일인증</th>
        <td>
          <input type="text" class="form-control" id="email" data-rule-required="true" placeholder="인증번호6자리"
            maxlength="10">
          <span id="emailCheck_result"></span> 
        </td>
      </tr>
        
      <tr>
        <th class="col" style="vertical-align: middle !important;">휴대폰</th>
        <td>
          <input type="tel" class="form-control onlyNumber" id="phoneNumber" name="user_phone_number" 
            placeholder="-를 제외하고 숫자만 입력하세요." maxlength="11">
          <div class="eheck_font" id="phone_check"></div>
          <span id="pNum_result"></span> 
        </td>
      </tr>
   
      <tr>
        <th class="col" style="vertical-align: middle !important;">주소</th>
            <td>
              <div class="row mx-0">
                <input type="text" class="col-lg-2 form-control" style="width: 180px;" id="sample6_postcode" name="user_postcode" placeholder="우편번호" required readonly="readonly">
                <input class="btn btn-outline-primary mx-1" onclick="sample6_execDaumPostcode()" type="button" style="width: 150px;" value="우편번호검색">
                <input type="text" class="col-lg-2 form-control" id="sample6_address" name="user_rNameAddr" placeholder="도로명주소" required readonly="readonly">
                <input type="text" class="col-lg-2 form-control" id="sample6_detailAddress" name="user_detailAddr" placeholder="상세주소를 입력해주세요.">
                <input type="hidden" class="col-lg-2 form-control" id="sample6_extraAddress" placeholder="참고항목.">
              </div>
              <span id="add_result"></span> 
            </td>
      </tr>
    </thead>
  </table>
  	<div class="row">
    	<div class="col text-center pt-5">
      		<input type="submit" id="button"  class="btn btn-primary" value="회원가입" >
      		<a href="/ycc/"  class="cancle btn btn-secondary" role="button">취소</a>
    	</div>
  	</div>
  	</form>
 </div>
	
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>

		
	    $("#idCheckBtn").click(function(){
	     // alert("확인")
	       //user_id 입력값이 빈칸이 아니라면 
	       
	       
	        if($("#user_id").val()!='') {
	      
	        //아이디를 서버로 전송 > DB 유효성 검사 > 결과 받기
	        $.ajax({
	          type: 'post',
	          url: '/ycc/signin/idcheck',
	          data: {'user_id' : $('#user_id').val()}, 
	          dataType: 'text',
	          //Controller에서 요청받은 url의 return값을 function()에 넣어줌 
	          success: function(result) {
	            if(result==0) {
	              $("#result").text('사용 가능한 아이디입니다.').css('color','blue');	             
	            }
	            else  {
	              $("#result").text('이미 사용중인 아이디입니다.').css('color','red');
	             
	            }
	          },
	          error: function(){
	         // alert("code = " + request.status + "message = " + request.responseText +	"error = " + error);
	            alert ("error")
	          }
	          
	        })
 
	      } else {
	        $("#result").text('아이디를 입력하세요.').css('color','red');
	        $("#user_id").focus();
	      }

	    })
	    
	//모든 공백 체크 정규식
		var emp =/\s/g;
		//아이디 정규식
		var idJ =/^[a-z0-9]{4,15}$/;
		//비밀번호
		var pwJ=/^[A-Za-z0-9]{8,15}$/;
		//핸드폰
		var phoneJ =/^01([0|1|6|7|9]?)?([0-9]{4})?([0-9]{4})$/;
		
		
		
		//비밀번호 정규식
		$("#user_pw").blur(function(){
		  if(pwJ.test($("#user_pw").val())) {
		    console.log('true');
		    $("#pw_result").text('');
		  } else {
		    console.log('false');
		    $("#pw_result").text('영어,숫자로만 8~15자리 입력해주세요.').css('color','red');
		  }
		})
		//비밀번호확인
		$("#passwordCheck").blur(function(){
		  if($("#user_pw").val() != $(this).val()) {
		    $("#pwCheck_result").text('비밀번호가 일치하지 않습니다.').css('color','red')
		  } else if ($("#user_pw").val() = $(this).val()){
		    $("#pwCheck_result").text('비밀번호가 일치합니다.').css('color','blue')
		  }
		})
		//성별 체크박스 확인 
// 		document.user_genser.blur(function(){
//            if(!$(':input:radio[name=user_gender]:checked').val()) {
//     		alert("섹션을 선택해주세요.");
// 		}
// 		})
		
		//비밀번호확인 먼저 클릭시 
	 	document.querySelector('#passwordCheck').addEventListener("focus",function(){
            if(document.querySelector('#user_pw').value==""){
                alert("패스워드를 먼저 입력하세요");
                document.querySelector('#user_pw').focus()
            }
        })
	
        //생년월일 셀렉트박스 
		var start_year="1950";// 시작할 년도
		var today = new Date();
		var today_year= today.getFullYear();
		var index=0;
		for(var y = today_year; y >= start_year; y--){ //start_year ~ 현재 년도
			document.getElementById('birthYear').options[index] = new Option(y, y);
			index++;
		}
		index=0;
		for(var m=1; m<=12; m++){
			document.getElementById('birthMonth').options[index] = new Option(m, m);
			index++;
		}
		
		lastday();

		
		function lastday(){ //년과 월에 따라 마지막 일 구하기 
			var Year=document.getElementById('birthYear').value;
			var Month=document.getElementById('birthMonth').value;
			var day=new Date(new Date(Year,Month,1)-86400000).getDate();
		    /* = new Date(new Date(Year,Month,0)).getDate(); */
		    
			var dayindex_len=document.getElementById('birthDay').length;
			if(day>dayindex_len){
				for(var i=(dayindex_len+1); i<=day; i++){
					document.getElementById('birthDay').options[i-1] = new Option(i, i);
				}
			}
			else if(day<dayindex_len){
				for(var i=dayindex_len; i>=day; i--){
					document.getElementById('birthDay').options[i]=null;
				}
			}
		}
		//휴대폰번호 입력확인
		$("#phoneNumber").blur(function(){
		  if(phoneJ.test($(this).val())) {
		    console.log(phoneJ.test($(this).val()));
		    $("#pNum_result").text('');
		  } else { 
		    $("#pNum_result").text('휴대폰번호를 확인해주세요.').css('color','red');
		  }
		})

	
	
	//주소 
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