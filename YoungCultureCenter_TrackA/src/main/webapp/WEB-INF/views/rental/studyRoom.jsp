<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
  <head>
    <!-- head & meta tag include -->
    <%@include file="/WEB-INF/views/metahead.jsp"%>

	<link rel="stylesheet" href="/ycc/resources/css/studyRoom.css" type="text/css"/>	
	<script type="text/javascript" src="/ycc/resources/js/studyRoom.js"></script>

    <title>독서실 예약</title>

    <style>
      th {
        background-color: bisque !important;
      }
    </style>
</head>

<body>
    <!-- include header -->
<%@include file="/WEB-INF/views/header.jsp"%>

        
 
<div class="container mt-3">
  <h4 class= "fw-bold">독서실 예약</h4>
  <hr>
</div>
    <!-- 좌석 선택 폼 -->
    <div class="container w-100 pt-1" >
      <div class="container-lg" style="border: solid 1px gray; border-radius: 10px; overflow: scroll;"
      >
        <ol class="rRoomTotal" style="margin-top: 3%">
          <ol class="rRoomUpper mb-5">
          <li class="row row--1">
            <ol class="seats" type="A">
              <li class="seat">
                <input
                  type="checkbox"
                  id="01"
                  name="indvSeat"
                  onclick="checkOnlyOne(this)"
                />
                <label for="01">01</label>
              </li>
              <li class="seat">
                <input
                  type="checkbox"
                  id="02"
                  name="indvSeat"
                  onclick="checkOnlyOne(this)"
                />
                <label for="02">02</label>
              </li>
              <li class="seat">
                <input
                  type="checkbox"
                  id="03"
                  name="indvSeat"
                  onclick="checkOnlyOne(this)"
                />
                <label for="03">03</label>
              </li>
              <li class="seat">
                <input
                  type="checkbox"
                  disabled
                  id="04"
                  name="indvSeat"
                  onclick="checkOnlyOne(this)"
                />
                <label for="04">04</label>
              </li>
              <li class="seat">
                <input
                  type="checkbox"
                  id="05"
                  name="indvSeat"
                  onclick="checkOnlyOne(this)"
                />
                <label for="05">05</label>
              </li>
              <li class="seat">
                <input
                  type="checkbox"
                  id="06"
                  name="indvSeat"
                  onclick="checkOnlyOne(this)"
                />
                <label for="06">06</label>
              </li>
              <li class="seat">
                <input
                  type="checkbox"
                  id="07"
                  name="indvSeat"
                  onclick="checkOnlyOne(this)"
                />
                <label for="07">07</label>
              </li>
              
              <li class="seat">
                <input
                  type="checkbox"
                  id="08"
                  name="indvSeat"
                  onclick="checkOnlyOne(this)"
                />
              <label for="08">08</label>
              </li>
              
              <li class="seat">
                <input
                  type="checkbox"
                  id="09"
                  name="indvSeat"
                  onclick="checkOnlyOne(this)"
                />
                <label for="09">09</label>
              </li>
              <li class="seat">
                <input
                  type="checkbox"
                  id="10"
                  name="indvSeat"
                  onclick="checkOnlyOne(this)"
                />
                <label for="10">10</label>
              </li>
              <li class="seat">
                <input
                  type="checkbox"
                  id="11"
                  name="indvSeat"
                  onclick="checkOnlyOne(this)"
                />
                <label for="11">11</label>
              </li>
              <li class="seat">
                <input
                  type="checkbox"
                  disabled
                  id="12"
                  name="indvSeat"
                  onclick="checkOnlyOne(this)"
                />
                <label for="12">12</label>
              </li>
            </ol>
          </li>

          <li class="row row--2">
            <ol class="seats" type="A">
              <li class="seat">
                <input
                  type="checkbox"
                  id="13"
                  name="indvSeat"
                  onclick="checkOnlyOne(this)"
                />
                <label for="13">13</label>
              </li>
              <li class="seat">
                <input
                  type="checkbox"
                  id="14"
                  name="indvSeat"
                  onclick="checkOnlyOne(this)"
                />
                <label for="14">14</label>
              </li>
              <li class="seat">
                <input
                  type="checkbox"
                  id="15"
                  name="indvSeat"
                  onclick="checkOnlyOne(this)"
                />
                <label for="15">15</label>
              </li>
              <li class="seat">
                <input
                  type="checkbox"
                  id="16"
                  name="indvSeat"
                  onclick="checkOnlyOne(this)"
                />
                <label for="16">16</label>
              </li>

              <li class="seat">
                <input
                  type="checkbox"
                  id="17"
                  name="indvSeat"
                  onclick="checkOnlyOne(this)"
                />
                <label for="17">17</label>
              </li>
              <li class="seat">
                <input
                  type="checkbox"
                  id="18"
                  name="indvSeat"
                  onclick="checkOnlyOne(this)"
                />
                <label for="18">18</label>
              </li>
              <li class="seat">
                <input
                  type="checkbox"
                  id="19"
                  name="indvSeat"
                  onclick="checkOnlyOne(this)"
                />
                <label for="19">19</label>
              </li>
              <li class="seat">
                <input
                  type="checkbox"
                  disabled
                  id="20"
                  name="indvSeat"
                  onclick="checkOnlyOne(this)"
                />
                <label for="20">20</label>
              </li>
              <li class="seat">
                <input
                  type="checkbox"
                  id="21"
                  name="indvSeat"
                  onclick="checkOnlyOne(this)"
                />
                <label for="21">21</label>
              </li>
              <li class="seat">
                <input
                  type="checkbox"
                  id="22"
                  name="indvSeat"
                  onclick="checkOnlyOne(this)"
                />
                <label for="22">22</label>
              </li>
              <li class="seat">
                <input
                  type="checkbox"
                  id="23"
                  name="indvSeat"
                  onclick="checkOnlyOne(this)"
                />
                <label for="23">23</label>
              </li>
              <li class="seat">
                <input
                  type="checkbox"
                  id="24"
                  name="indvSeat"
                  onclick="checkOnlyOne(this)"
                />
                <label for="24">24</label>
              </li>
            </ol>
          </li>
          </ol>

          <ol class="rRoomUnder" style="margin-bottom: 2%">
            <li class="row row--3">
              <ol class="seats" type="A">
                <li class="seat">
                  <input
                    type="checkbox"
                    id="25"
                    name="indvSeat"
                    onclick="checkOnlyOne(this)"
                  />
                  <label for="25">25</label>
                </li>
                <li class="seat">
                  <input
                    type="checkbox"
                    id="26"
                    name="indvSeat"
                    onclick="checkOnlyOne(this)"
                  />
                  <label for="26">26</label>
                </li>
                <li class="seat">
                  <input
                    type="checkbox"
                    id="27"
                    name="indvSeat"
                    onclick="checkOnlyOne(this)"
                  />
                  <label for="27">27</label>
                </li>
                <li class="seat">
                  <input
                    type="checkbox"
                    disabled
                    id="28"
                    name="indvSeat"
                    onclick="checkOnlyOne(this)"
                  />
                  <label for="28">28</label>
                </li>
                <li class="seat">
                  <input
                    type="checkbox"
                    id="29"
                    name="indvSeat"
                    onclick="checkOnlyOne(this)"
                  />
                  <label for="29">29</label>
                </li>
                <li class="seat">
                  <input
                    type="checkbox"
                    id="30"
                    name="indvSeat"
                    onclick="checkOnlyOne(this)"
                  />
                  <label for="30">30</label>
                </li>
                <li class="seat">
                  <input
                    type="checkbox"
                    id="31"
                    name="indvSeat"
                    onclick="checkOnlyOne(this)"
                  />
                  <label for="31">31</label>
                </li>
                <li class="seat">
                  <input
                    type="checkbox"
                    id="32"
                    name="indvSeat"
                    onclick="checkOnlyOne(this)"
                  />
                  <label for="32">32</label>
                </li>
                <li class="seat">
                  <input
                    type="checkbox"
                    id="33"
                    name="indvSeat"
                    onclick="checkOnlyOne(this)"
                  />
                  <label for="33">33</label>
                </li>
                <li class="seat">
                  <input
                    type="checkbox"
                    id="34"
                    name="indvSeat"
                    onclick="checkOnlyOne(this)"
                  />
                  <label for="34">34</label>
                </li>
                <li class="seat">
                  <input
                    type="checkbox"
                    id="35"
                    name="indvSeat"
                    onclick="checkOnlyOne(this)"
                  />
                  <label for="35">35</label>
                </li>
                <li class="seat">
                  <input
                    type="checkbox"
                    disabled
                    id="36"
                    name="indvSeat"
                    onclick="checkOnlyOne(this)"
                  />
                  <label for="36">36</label>
                </li>
              </ol>
            </li>

            <li class="row row--4">
              <ol class="seats" type="A">
                <li class="seat">
                  <input
                    type="checkbox"
                    id="37"
                    name="indvSeat"
                    onclick="checkOnlyOne(this)"
                  />
                  <label for="37">37</label>
                </li>
                <li class="seat">
                  <input
                    type="checkbox"
                    id="38"
                    name="indvSeat"
                    onclick="checkOnlyOne(this)"
                  />
                  <label for="38">38</label>
                </li>
                <li class="seat">
                  <input
                    type="checkbox"
                    id="39"
                    name="indvSeat"
                    onclick="checkOnlyOne(this)"
                  />
                  <label for="39">39</label>
                </li>
                <li class="seat">
                  <input
                    type="checkbox"
                    id="40"
                    name="indvSeat"
                    onclick="checkOnlyOne(this)"
                  />
                  <label for="40">40</label>
                </li>

                <li class="seat">
                  <input
                    type="checkbox"
                    id="41"
                    name="indvSeat"
                    onclick="checkOnlyOne(this)"
                  />
                  <label for="41">41</label>
                </li>
                <li class="seat">
                  <input
                    type="checkbox"
                    id="42"
                    name="indvSeat"
                    onclick="checkOnlyOne(this)"
                  />
                  <label for="42">42</label>
                </li>
                <li class="seat">
                  <input
                    type="checkbox"
                    id="43"
                    name="indvSeat"
                    onclick="checkOnlyOne(this)"
                  />
                  <label for="43">43</label>
                </li>
                <li class="seat">
                  <input
                    type="checkbox"
                    disabled
                    id="44"
                    name="indvSeat"
                    onclick="checkOnlyOne(this)"
                  />
                  <label for="44">44</label>
                </li>
                <li class="seat">
                  <input
                    type="checkbox"
                    id="45"
                    name="indvSeat"
                    onclick="checkOnlyOne(this)"
                  />
                  <label for="45">45</label>
                </li>
                <li class="seat">
                  <input
                    type="checkbox"
                    id="46"
                    name="indvSeat"
                    onclick="checkOnlyOne(this)"
                  />
                  <label for="46">46</label>
                </li>
                <li class="seat">
                  <input
                    type="checkbox"
                    id="47"
                    name="indvSeat"
                    onclick="checkOnlyOne(this)"
                  />
                  <label for="47">47</label>
                </li>
                <li class="seat">
                  <input
                    type="checkbox"
                    id="48"
                    name="indvSeat"
                    onclick="checkOnlyOne(this)"
                  />
                  <label for="48">48</label>
                </li>
              </ol>
            </li>
          </ol>
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
	
    </div>



	
	
    <!-- 예약 정보 폼 -->
    <form>
      <div class="container mt-5">
        <div class="row text-center" >
          <div class="col-md-6">
            <label for="time" >입실 예정 시간 : </label>
            <select id="time" class="form-control w-25" style="display: inline">
              <option value="9">9:00</option>
              <option value="10">10:00</option>
              <option value="11">11:00</option>
              <option value="12">12:00</option>
              <option value="13">13:00</option>
              <option value="14">14:00</option>
              <option value="15">15:00</option>
              <option value="16">16:00</option>
              <option value="17">17:00</option>
              <option value="18">18:00</option>
              <option value="19">19:00</option>
              <option value="20">20:00</option>
            </select>
          </div>
          <div class="col-md-6">
            <label for="usetime" class=" col-form-label">
              이용시간 :
            </label>
            <select
              id="usetime"
              class="form-control w-auto"
              style="display: inline"
            >
              <option value="1h">1</option>
              <option value="2h">2</option>
              <option value="3h">3</option>
              <option value="4h">4</option>
              <option value="5h">5</option>
              <option value="6h">6</option>
            </select>
            <label for="usetime" class="col-form-label"> 시간</label>
          </div>
        </div>
      </div>

      <br />
      <!-- 모달 버튼  -->
      <div class="text-center">
        <button
          type="button"
          class="btn btn-primary m-5"
          data-bs-toggle="modal"
          data-bs-target="#staticBackdrop"
        >
          확인
        </button>
      </div>
    </form>
    <!-- 결제 전 예약정보 확인 모달창 -->
    <div
      class="modal fade"
      id="staticBackdrop"
      data-bs-backdrop="static"
      data-bs-keyboard="false"
      tabindex="-1"
      aria-labelledby="staticBackdropLabel"
      aria-hidden="true"
    >
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
                    <th scope="row">시설명</th>
                    <td>
                      <div class="col-sm-8"></div>
                      YOUNG문화센터 독서실​
                    </td>
                  </tr>
                  <tr>
                    <th scope="row">좌석번호</th>
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
                    <th scope="row">이용시간</th>
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
            <button
              type="button"
              class="btn btn-secondary "
              data-bs-dismiss="modal"
            >
              취소
            </button>
            <button type="button" class="btn btn-primary">결제</button>
          </div>
        </div>
      </div>
    </div>


	<!-- footer include -->
<%@include file="/WEB-INF/views/footer.jsp"%>

  </body>
</html>