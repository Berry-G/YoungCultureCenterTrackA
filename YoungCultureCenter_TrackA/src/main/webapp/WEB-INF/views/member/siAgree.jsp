<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>	
		<!-- head & meta tag include -->
    <%@include file="/WEB-INF/views/metahead.jsp"%>
	<script type="text/javascript" src="/ycc/resources/js/singnincheck.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.slim.js" 
		integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>
	
 <title>회원가입약관동의</title>
</head>
<body>
	<!-- header inlcude -->
	<%@include file="/WEB-INF/views/header.jsp"%>

<div class="container w-50">
  <h2 class="p-5" style="text-align: center;">회원가입</h2>
    <div class="position-relative m-4">
        <div class="progress" style="height: 5px;">
            <div class="progress-bar bg-primary" role="progressbar" style="width: 50%;" aria-valuenow="50"
                aria-valuemin="0" aria-valuemax="100">
            </div>
        </div>
        <button type="button"
            class="position-absolute top-0 start-0 translate-middle btn btn-sm btn-primary rounded-pill"
            style="width: 3.5rem; height:3.5rem;">Step1</button>
        <button type="button"
            class="position-absolute top-0 start-50 translate-middle btn btn-sm btn-secondary rounded-pill"
            style="width: 3.5rem; height:3.5rem;">Step2</button>
        <button type="button"
            class="position-absolute top-0 start-100 translate-middle btn btn-sm btn-secondary rounded-pill"
            style="width: 3.5rem; height:3.5rem;">Step3</button>
    </div>
   


    <h4 class="pt-5">회원가입약관</h4>
    <hr>
   <form action="siForm.jsp" id="form_check" method="post">
    <label for="memberInfo" class="col control-label pt-2 pb-3 fw-bold fs-5">이용약관</label>
  

    <div class="row">
      <div class="col">
        <textarea class="form-control" rows="8" style="width: 100%;" readonly="readonly">
약관동의
홈페이지 서비스 이용약관
제1장   총  칙
제1조(목적) 이 약관은 YOUNG문화센터(이하 "센터"라 한다)가 제공하는 이메일 및 홈페이지구축서비스(이하 "서비스"라 한다)의 이용조건 및 절차에 관한 사항을 규정함을 목적으로 합니다. 

제2조(정의)이 약관에서 사용하는 용어의 정의는 다음 각호와 같습니다.
1. 회원 : 이용자 아이디를 부여받은 자
2. ID : 센터가 승인하는 문자 또는 숫자의 조합
3. 비밀번호 : 비밀 보호를 위해 회원 자신이 설정한 문자, 숫자의 조합

제3조(효력의 발생과 변경)
① 이 약관의 내용은 센터 홈페이지 화면에 게시하거나 기타의 방법으로 공지함으로써 효력이 발생됩니다.
② 센터는 이 약관을 변경할 수 있으며, 변경된 약관은 이용자에게 공지함으로써 효력이 발생됩니다.

제4조(준용규정)이 약관에 명시되지 않은 사항은 「전자상거래 등에서의 소비자 보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자거래기본법」, 「전자서명법」, 「정보통신망 이용 촉진 등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비자보호법」 등에서의 소비자 보호에 관한 법률 및 기타 관련법령의 규정에 따릅니다.


제2장  서비스 이용계약

제5조(이용계약의 성립)이용계약은 이용자의 이용신청에 대한 센터의 승낙과 이용자의 약관 내용에 대한 동의로 성립됩니다.

제6조(이용신청)이용신청은 인터넷을 통하여 이용자가 센터에서 정한 가입신청서에 기록하여 신청할 수 있습니다.


제3장  계약당사자의 의무

제7조(센터의 의무)센터는 서비스 제공과 관련해서 알고 있는 회원의 신상 정보를 본인의 승낙 없이 제3자에게 누설, 배포하지 않습니다. 단, 관련법률의 규정에 의해 국가기관의 요구가 있는 경우, 범죄에 대한 수사상의 목적이 있거나 또는 기타 관계법령에서 정한 절차에 의한 요청이 있을 경우에는 그러하지 않습니다 

제8조(회원의 의무)
① 회원은 서비스를 이용할 때 다음 각호의 행위를 하지 않아야 합니다.

1. 다른 회원의 ID를 부정하게 사용하는 행위
2. 서비스에서 얻은 정보를 복제, 출판 또는 제3자에게 제공하는 행위
3. 센터의 저작권, 제3자의 저작권 등 기타 권리를 침해하는 행위
4. 공공질서 및 미풍양속에 위반되는 내용을 유포하는 행위
5. 범죄와 결부된다고 객관적으로 판단되는 행위
6. 기타 관계법령에 위반되는 행위

② 회원은 서비스를 이용하여 영업활동을 할 수 없으며, 영업활동에 이용하여 발생한 결과에 대하여 센터는 책임을 지지 않습니다.
③ 회원은 서비스의 이용권한, 기타 이용계약상 지위를 타인에게 양도, 증여할 수 없으며, 이를 담보로도 제공할 수 없습니다.


제4장  서비스 이용 

제9조(회원의 게시물 관리 및 삭제)효율적인 서비스 운영을 위하여 회원의 메모리 공간, 메시지크기, 보관일수 등을 제한할 수 있으며 등록하는 내용이 다음 각 호의 1에 해당하는 경우에는 사전 통지없이 삭제할 수 있습니다.

1. 다른 회원 또는 제3자를 비방하거나 중상모략으로 명예를 손상시키는 내용인 경우
2. 공공질서 및 미풍양속에 위반되는 내용인 경우
3. 범죄적 행위에 결부된다고 인정되는 내용인 경우
4. 센터의 저작권, 제3자의 저작권 등 기타 권리를 침해하는 내용인 경우
5. 회원이 자신의 홈페이지와 게시판에 음란물을 게재하거나 음란 사이트를 링크하는 경우
6. 기타 관계법령에 위반된다고 판단되는 경우


제10조(서비스 이용 책임)서비스를 이용하여 해킹, 음란사이트 링크, 상용S/W 불법배포 등의 행위를 하여서는 아니되며 이를 위반으로 인해 발생한 영업활동의 결과 및 손실, 관계기관에 의한 법적 조치 등에 관하여는 센터는 책임을 지지 않습니다.

제11조(서비스 제공의 중지)다음 각호의 1에 해당하는 경우에는 서비스 제공을 중지할 수 있습니다.
1. 서비스용 설비의 보수 등 공사로 인한 부득이한 경우
2. 시스템 점검이 필요한 경우
3. 기타 불가항력적 사유가 있는 경우


제5장  계약해지 및 이용제한

제12조(계약해지 및 이용제한)
① 회원이 이용계약을 해지하고자 하는 때에는 회원 본인이 인터넷을 통하여 해지신청을 하여야 하며, 센터에서는 본인 여부를 확인 후 조치합니다.
② 센터는 회원이 다음 각호의 1에 해당하는 행위를 하였을 경우 사전 통지없이 이용계약을 해지하거나 또는 서비스 이용을 중지할 수 있습니다.

1. 타인의 이용자ID 및 비밀번호를 도용한 경우
2. 서비스 운영을 고의로 방해한 경우
3. 허위로 가입 신청을 한 경우
4. 같은 사용자가 다른 ID로 이중 등록을 한 경우
5. 공공질서 및 미풍양속에 저해되는 내용을 유포시킨 경우
6. 타인의 명예를 손상시키거나 불이익을 주는 행위를 한 경우
7. 서비스의 안정적 운영을 방해할 목적으로 다량의 정보를 전송하거나 광고성 정보를 전송하는 경우
8. 정보통신설비의 오작동이나 정보 등의 파괴를 유발시키는 컴퓨터바이러스 프로그램 등을 유포하는 경우
9. 센터 또는 다른 회원이나 제3자의 지적재산권을 침해하는 경우
10. 타인의 개인정보, 이용자ID 및 비밀번호를 부정하게 사용하는 경우
11. 회원이 자신의 홈페이지나 게시판 등에 음란물을 게재하거나 음란 사이트를 링크하는 경우
12. 기타 관련법령에 위반된다고 판단되는 경우


제6장  면  책

제13조(면책 조항)
① 센터는 회원이 서비스를 이용하여 얻은 정보 및 자료 등에 대하여 책임을 지지 않습니다.
② 센터는 회원이 서비스에 게재한 정보, 자료, 사실의 신뢰도, 정확성 등 기타 어떠한 내용에 관하여서도 책임을 지지 않습니다.
제14조(재판 관할) 서비스 이용으로 발생한 분쟁에 대해 소송이 제기 될 경우 센터는 본청 소재지를 관할하는 법원을 전속 관할법원으로 합니다.


부    칙
이 약관은 2022년 1월 4일부터 시행합니다. 
        </textarea>
      <input class="inputcheck" type="checkbox" id="check1" name="check" value="check1" onclick="checkSelectAll()" />(필수)동의합니다<br />
    </div>
  </div>

  <div class="form-group">
    <label for="memberInfo" class="col control-label pt-5 pb-3 fw-bold fs-5">개인정보취급방침</label>
      <div class="col" id="memberInfo">
        <textarea class="form-control" rows="8" style="width: 100%;" readonly="readonly">개인정보수집 및 이용에 대한 안내
1. 개인정보의 수집 및 이용 목적 : 회원가입 및 관리

2. 수집하는 개인정보의 항목
- 필수정보 : 아이디, 성명, 비밀번호, 성별, 생년월일, 이메일
- 선택정보 : 전화번호, 주소

3. 개인정보의 보유 · 이용 기간 : 회원가입일로부터 회원 탈퇴 시까지

4. 귀하는 개인정보 수집 · 이용에 동의하지 않으실 수 있습니다. 동의 거부시에도 회원가입은 가능하나 서비스는제한될 수 있습니다. (단, 회원가입을 위한 최소한의 정보인 필수정보는 미입력시 회원가입 불가)
  		</textarea>

	<input class="inputcheck" type="checkbox" id="check2" name="check" value="check2" onclick="checkSelectAll()" />(필수)동의합니다<br />
    <input class="inputcheck" type="checkbox" id="selectall" name="selectall" value="selectall" onclick="selectAll(this)" /> <b>모든 약관에 동의합니다.</b>

  	</div>
  
  <div class="row">
    <div class="col text-center">
      <input type="button" id="button"  class="btn btn-primary" value="확인" onclick="/member/siForm"  >
      <a href="/ycc/" class="btn btn-secondary" role="button">취소</a>
    </div>
  </div>
  </div>
  </form>
</div>  

<script type="text/javascript">
$(document).ready(function(){
    
    $("#button").click(function(){    
        if($("#selectall").is(":checked") == false){
            alert("필수 약관에 동의 하셔야 다음 단계로 진행 가능합니다.");
            return false;
      
        } 
        else if($("#selectall").is(":checked") != false){
            $(location).attr('href', '<c:url value='/signin/form'/>');
            return true;
      
        }
    
    })  
})
</script>

<!-- footer inlcude -->
<%@include file="/WEB-INF/views/footer.jsp"%>
	
</body>
</html>
