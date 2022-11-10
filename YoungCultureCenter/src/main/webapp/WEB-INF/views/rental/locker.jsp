<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>	
  <!-- head & meta tag include -->
  <%@include file="/WEB-INF/views/metahead.jsp"%>
	<link href="/ycc/resources/css/locker.css" rel="stylesheet">
<title>사물함 신청</title>
</head>
<body>
  <!-- header inlcude -->
  <%@include file="/WEB-INF/views/header.jsp"%>
  <div class="container w-100 pt-5">
    <div class="col fs-3 fw-bold">사물함 신청
      <hr>
    </div>
  <div class="container w-100 mt-2 p-5 " style="overflow:auto; border: 1px solid #4f565d;">
    <ol>
      <li class="row row-horizon">
        <ol class="lockers btn-primary">
          <li class="locker">
            <input type="checkbox" id="1" name="locker" onclick="checkOnlyOne(this)" />
            <label for="1">1</label>
          </li>
          <li class="locker">
            <input type="checkbox" id="2" name="locker" onclick="checkOnlyOne(this)" />
            <label for="2">2</label>
          </li>
          <li class="locker">
            <input type="checkbox" id="3" name="locker" onclick="checkOnlyOne(this)" />
            <label for="3">3</label>
          </li>
          <li class="locker">
            <input type="checkbox" id="4" name="locker" onclick="checkOnlyOne(this)" />
            <label for="4">4</label>
          </li>
          <li class="locker">
            <input type="checkbox" id="5" name="locker" onclick="checkOnlyOne(this)" />
            <label for="5">5</label>
          </li>
          <li class="locker">
            <input type="checkbox" id="6" name="locker" onclick="checkOnlyOne(this)" />
            <label for="6">6</label>
          </li>
          <li class="locker">
            <input type="checkbox" disabled id="7" name="locker" onclick="checkOnlyOne(this)" />
            <label for="7">7</label>
          </li>
          <li class="locker">
            <input type="checkbox" id="8" name="locker" onclick="checkOnlyOne(this)" />
            <label for="8">8</label>
          </li>
          <li class="locker">
            <input type="checkbox" id="9" name="locker" onclick="checkOnlyOne(this)" />
            <label for="9">9</label>
          </li>
          <li class="locker">
            <input type="checkbox" id="10" name="locker" onclick="checkOnlyOne(this)" />
            <label for="10">10</label>
          </li>
        </ol>
        <!--lockers-->
      </li>
      <!--row-->
      <li class="row">
        <ol class="lockers">
          <li class="locker">
            <input type="checkbox" id="11" name="locker" onclick="checkOnlyOne(this)" />
            <label for="11">11</label>
          </li>
          <li class="locker">
            <input type="checkbox" id="12" name="locker" onclick="checkOnlyOne(this)" />
            <label for="12">12</label>
          </li>
          <li class="locker">
            <input type="checkbox" id="13" name="locker" onclick="checkOnlyOne(this)" />
            <label for="13">13</label>
          </li>
          <li class="locker">
            <input type="checkbox" id="14" name="locker" onclick="checkOnlyOne(this)" />
            <label for="14">14</label>
          </li>
          <li class="locker">
            <input type="checkbox" id="15" name="locker" onclick="checkOnlyOne(this)" />
            <label for="15">15</label>
          </li>
          <li class="locker">
            <input type="checkbox" id="16" name="locker" onclick="checkOnlyOne(this)" />
            <label for="16">16</label>
          </li>
          <li class="locker">
            <input type="checkbox" id="17" name="locker" onclick="checkOnlyOne(this)" />
            <label for="17">17</label>
          </li>
          <li class="locker">
            <input type="checkbox" id="18" name="locker" onclick="checkOnlyOne(this)" />
            <label for="18">18</label>
          </li>
          <li class="locker">
            <input type="checkbox" id="19" name="locker" onclick="checkOnlyOne(this)" />
            <label for="19">19</label>
          </li>
          <li class="locker">
            <input type="checkbox" id="20" name="locker" onclick="checkOnlyOne(this)" />
            <label for="20">20</label>
          </li>
        </ol>
        <!--lockers-->
      </li>
      <!--row-->
      <li class="row">
        <ol class="lockers">
          <li class="locker">
            <input type="checkbox" disabled id="21" name="locker" onclick="checkOnlyOne(this)" />
            <label for="21">21</label>
          </li>
          <li class="locker">
            <input type="checkbox" id="22" name="locker" onclick="checkOnlyOne(this)" />
            <label for="22">22</label>
          </li>
          <li class="locker">
            <input type="checkbox" id="23" name="locker" onclick="checkOnlyOne(this)" />
            <label for="23">23</label>
          </li>
          <li class="locker">
            <input type="checkbox" id="24" name="locker" onclick="checkOnlyOne(this)" />
            <label for="24">24</label>
          </li>
          <li class="locker">
            <input type="checkbox" id="25" name="locker" onclick="checkOnlyOne(this)" />
            <label for="25">25</label>
          </li>
          <li class="locker">
            <input type="checkbox" id="26" name="locker" onclick="checkOnlyOne(this)" />
            <label for="26">26</label>
          </li>
          <li class="locker">
            <input type="checkbox" disabled id="27" name="locker" onclick="checkOnlyOne(this)" />
            <label for="27">27</label>
          </li>
          <li class="locker">
            <input type="checkbox" id="28" name="locker" onclick="checkOnlyOne(this)" />
            <label for="28">28</label>
          </li>
          <li class="locker">
            <input type="checkbox" id="29" name="locker" onclick="checkOnlyOne(this)" />
            <label for="29">29</label>
          </li>
          <li class="locker">
            <input type="checkbox" id="30" name="locker" onclick="checkOnlyOne(this)" />
            <label for="30">30</label>
          </li>
        </ol>
      </li>
      <li class="row">
        <ol class="lockers">
          <li class="locker">
            <input type="checkbox" id="31" name="locker" onclick="checkOnlyOne(this)" />
            <label for="31">31</label>
          </li>
          <li class="locker">
            <input type="checkbox" id="32" name="locker" onclick="checkOnlyOne(this)" />
            <label for="32">32</label>
          </li>
          <li class="locker">
            <input type="checkbox" id="33" name="locker" onclick="checkOnlyOne(this)" />
            <label for="33">33</label>
          </li>
          <li class="locker">
            <input type="checkbox" id="34" name="locker" onclick="checkOnlyOne(this)" />
            <label for="34">34</label>
          </li>
          <li class="locker">
            <input type="checkbox" id="35" name="locker" onclick="checkOnlyOne(this)" />
            <label for="35">35</label>
          </li>
          <li class="locker">
            <input type="checkbox" id="36" name="locker" onclick="checkOnlyOne(this)" />
            <label for="36">36</label>
          </li>
          <li class="locker">
            <input type="checkbox" id="37" name="locker" onclick="checkOnlyOne(this)" />
            <label for="37">37</label>
          </li>
          <li class="locker">
            <input type="checkbox" id="38" name="locker" onclick="checkOnlyOne(this)" />
            <label for="38">38</label>
          </li>
          <li class="locker">
            <input type="checkbox" disabled id="39" name="locker" onclick="checkOnlyOne(this)" />
            <label for="39">39</label>
          </li>
          <li class="locker">
            <input type="checkbox" id="40" name="locker" onclick="checkOnlyOne(this)" />
            <label for="40">40</label>
          </li>
        </ol>
      </li>
    </ol>
  </div>
    
 <!-- 좌석 선택 정보 이미지 -->
  <div class="row">
    <div class="col-md-2">
      <div class="fs-6 pt-3 mb-4">
        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" style="fill: #39adffed;"
          class="bi bi-square-fill" viewBox="0 0 16 16">
          <path d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2z"></path>
        </svg>
        사용가능
      </div>
    </div>
    <div class="col-md-2">
      <div class="fs-6 pt-3  mb-3">
        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" style="fill: #dddddd" class="bi bi-square-fill"
          viewBox="0 0 16 16">
          <path d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2z"></path>
        </svg>
        사용중
      </div>
    </div>
    <div class="col-md-2">
      <div class="fs-6 pt-3  mb-3">
        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" style="fill: #bada55;"
          class="bi bi-square-fill" viewBox="0 0 16 16">
          <path d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2z"></path>
        </svg>
        선택
      </div>
    </div>
  </div>
  <div class="row justify-content-md-start">
    <div class="col fs-5 ">사물함 위치
    </div>
    <div class="row">
      <div class="col ">
      <select class="form-select-md col-5 w-auto fs-5 p-2"  id="location" aria-label="lockerLo">
        <option selected>본관 1층</option>
        <option value="1">본관 2층</option>
        <option value="2">본관 3층</option>
        <option value="3">수영장 로비</option>
        <option value="4">강당 입구</option>
      </select> 
      </div>
    </div>
  </div>
  <div class="row">  
    <h4 class="col-sm-3 fs-5 pt-3">신청일자</h4>
    <div class="row">
      <div class="col-md-7 mb-3">
        <div class="row">
          <input class="form-control-md col-6 w-auto" id="date1" type="date" value="startDate" />
          <label class="col-1 pl-2">~</label>
          <input class="form-control-md col-6 w-auto" id="date2" type="date" value="endDate" />
        </div>
      </div>
    </div>
  </div>
  </div>
  <!-- Modal -->
  <!-- 모달 버튼  -->
  <div class="text-center">
    <button type="button" class="btn btn-primary m-5 col-2" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
      확인
    </button>
  </div>
  <!-- 모달창 -->
  <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
    aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5 fw-bold" id="staticBackdropLabel">
            정보 확인 안내
          </h1>
        </div>
        <div class="modal-body text-center">
          <div class="d-flex justify-content-center">
            <table class="table container-fluid border">
              <tbody>
                <tr>
                  <th scope="row" class="col-sm-4">이름</th>
                  <td>
                    <div class="col-sm-8"></div>
                  </td>
                </tr>
                <tr>
                  <th scope="row">사물함 위치</th>
                  <td>
                    <div class="col-sm-8"></div>
                    본관 1층 사물함​
                  </td>
                </tr>
                <tr>
                  <th scope="row">사물함번호</th>
                  <td>
                    <div class="col-sm-8"></div>
                  </td>
                </tr>
                <tr>
                  <th scope="row">이용일</th>
                  <td>
                    <div class="col-sm-8"></div>
                  </td>
                </tr>
                <tr>
                  <th scope="row">결제금액</th>
                  <td>
                    <div class="col-sm-8"></div>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <p>해당 정보가 맞으십니까?</p>
        </div>

        <div class="modal-footer" style="justify-content: center;">
          <button type="button" class="btn btn-secondary " data-bs-dismiss="modal">
            취소
          </button>
          <button type="button" class="btn btn-primary">결제</button>
        </div>
      </div>
    </div>
  </div> <!-- container 1-->
  <script type="text/javascript">
    function checkOnlyOne(element) {

      const checkboxes
        = document.getElementsByName("locker");

      checkboxes.forEach((cb) => {
        cb.checked = false;
      })

      element.checked = true;
    }


  // 클래스 변경
  function changeClassName() {
    document.getElementById("location").classList.replace("col-md-4", "col-md-2");
  }

  function changeClassName2() {
    document.getElementById("location").classList.replace("col-md-2", "col-md-4");
  }

  window.onresize = function (event) {
    var innerWidth = window.innerWidth;
    innerWidth <= "1280" ? changeClassName() : changeClassName2();
  };
  </script>	
  	
		<!-- footer inlcude -->
	<%@include file="/WEB-INF/views/footer.jsp"%>

</body>
</html>