<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <!DOCTYPE html>
            <html>

            <head>
                <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
                <!-- head & meta tag include -->
                <%@include file="/WEB-INF/views/metahead.jsp" %>

                    <title>Young문화센터 - 대관신청</title>
                    <style>
                        td {
                            text-align: center;
                        }
                    </style>
            </head>

            <body>
                <!-- header inlcude -->
                <%@include file="/WEB-INF/views/header.jsp" %>


                    <div class="container">
                        <div class="rentalnotice  border border-dark" style="margin: 20px auto 30px auto">
                            <ol class="fs-7">
                                <h3>대관 신청 시 주의사항</h3>
                                <li>대관 현황 메뉴에서 사용하시고자 하는 시간과 공간의 예약 현황을 먼저 확인하신 후 대관 신청해주십시오.</li>
                                <li>사용자가 사용예정일포함 4일 전에 계약 해지를 서면으로 통보하여 승인을 얻은 경우 납부액의 100% 환불이 가능합니다.</li>
                                <li>회비 및 참가비가 있는 수익성 사업이나 공연(1~2인 소규모 공연도 해당)이 포함된 행사 및 정치ㆍ종교성 행사는 대관할 수 없습니다.</li>
                                <li>대관료는 대관 희망일 포함 4일 전까지 입금 해주셔야 하며, 입금하지 않은 행사는 대관 취소 처리되어 사용이 불가능합니다.</li>
                                <li>행사 시 음식물이 포함된 케이터링은 불가합니다. (김밥, 샌드위치, 햄버거 등 냄새가 많이 나는 음식물 반입 불가)</li>
                            </ol>
                        </div>
                        <h3 style="margin-bottom: 50px;">
                                    <strong>[조건 설정]</strong>
                                </h3>
                                <p>
                                <h5>대관 장소 선택</h5>

                                <select id="pickplace" name="selectplace">
                                    <option value="">장소 선택</option>
                                    <optgroup label="외부">
                                        <!-- 외부 location code = 0 -->
                                        <c:forEach var="result" items="${placelist }">
                                            <option value="${result.croom_id }" <c:if
                                                test="${result.croom_location ne '외부'}">hidden</c:if>
                                                >${result.croom_name}</option>
                                        </c:forEach>
                                    </optgroup>
                                    <optgroup label="1층">
                                        <!-- 1층 location code = 1 -->
                                        <c:forEach var="result" items="${placelist }">
                                            <option value="${result.croom_id }" <c:if
                                                test="${result.croom_location ne '1층'}">hidden</c:if>
                                                >${result.croom_name}</option>
                                        </c:forEach>
                                    </optgroup>
                                    <optgroup label="2층">
                                        <!-- 2층 location code = 2 -->
                                        <c:forEach var="result" items="${placelist }">
                                            <option value="${result.croom_id }" <c:if
                                                test="${result.croom_location ne '2층'}">hidden</c:if>
                                                >${result.croom_name}</option>
                                        </c:forEach>
                                    </optgroup>
                                    <optgroup label="3층">
                                        <!-- 3층 location code = 3 -->
                                        <c:forEach var="result" items="${placelist }">
                                            <option value="${result.croom_id }" <c:if
                                                test="${result.croom_location ne '3층'}">hidden</c:if>
                                                >${result.croom_name}</option>
                                        </c:forEach>
                                    </optgroup>
                                </select>
                                </p>
                                
                                <!--추후 개발 시 수정할 부분(yyyy-mm-dd 에서 '-'제거 , T~ 제거)-->
                                <p>
                                    <label for="datetime-local">
                                        <h5>대여 일자 지정</h5>
                                    </label> <input type="date" id="datetime-local" name="rday">

                                </p>
                                <button id="viewBtn">조회하기</button>


                                <!--대관 장소 선택 끝-->

                        <div class="row mb-3">
                            <div class="col-12 col-md-6 " id="change">
                                <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
                                    <div class="embed-responsive embed-responsive-4by3">
                                        <div class="carousel-inner">
                                            <div class="carousel-item active">
                                                <img src="<%=request.getContextPath()%>/resources/img/rental/1f.jpg"
                                                    class="d-block w-100 embed-responsive-item" alt="1층 시설 안내">
                                            </div>
                                            <div class="carousel-item">
                                                <img src="<%=request.getContextPath()%>/resources/img/rental/2f.jpg"
                                                    class="d-block w-100 embed-responsive-item" alt="2층 시설 안내">
                                            </div>
                                            <div class="carousel-item">
                                                <img src="<%=request.getContextPath()%>/resources/img/rental/3f.jpg"
                                                    class="d-block w-100 embed-responsive-item" alt="3층 시설 안내">
                                            </div>
                                            <div class="carousel-item">
                                                <img src="<%=request.getContextPath()%>/resources/img/rental/4f.jpg"
                                                    class="d-block w-100 embed-responsive-item" alt="4층 시설 안내">
                                            </div>
                                        </div>
                                    </div>
                                    <button class="carousel-control-prev" type="button"
                                        data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                        <span class="visually-hidden">이전</span>
                                    </button>
                                    <button class="carousel-control-next" type="button"
                                        data-bs-target="#carouselExampleControls" data-bs-slide="next">
                                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                        <span class="visually-hidden">다음</span>
                                    </button>
                                </div>
                            </div>
                            <div class="col-12 col-md-6" style="text-align: center;">
                                <form id="form" class="frm" action="" method="post">
			                        <table class="table table-striped">
			                            <thead>
			                                <tr>
			                                    <th scope="col" style="text-align: center;">시간</th>
			                                    <th scope="col" style="text-align: center;">예약</th>
			                                </tr>
			                            </thead>
			                            <tbody>
				                            	<div id="Chktime">
													<c:forEach items="${timelist}" var="rentalDto">
														<tr>
														<td data-time=${rentalDto.prtime_schedule }><c:out value="${rentalDto.prtime_schedule }"/></td>
														<td><input type="checkbox"></td>
														</tr>
													</c:forEach>
												</div>
				                        </tbody>
			                        </table>
			                    </form>
                            </div>
                        </div>
                    </div>

                    <div class="container">
                        <!--대관 장소 선택 시작-->

                        <br>
                        <hr>
                        <br>
						
                        <div id="rentaltable">
                            <!-- ajax에서 값 나올 부분 -->
                        </div>

						
                        
                        <button id="Tstbutton">테스트 버튼</button>
                        <!-- Button trigger modal -->
                        <button type="button" id="modalBtn" class="btn btn-primary " data-bs-toggle="modal"
                            data-bs-target="#exampleModal">신청하기</button>
                    </div>

                    <!-- Modal -->
                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                        aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="exampleModalLabel">정보확인 안내</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="container-fluid">
                                        <table class="table">
                                            <tr>
                                                <h4>대여 장소</h4>
                                                <img src="<%=request.getContextPath()%>/resources/img/rental/auditorium.jpg"
                                                    class="img-fluid">
                                            </tr>
                                            <tr>
                                                <th>이름</th><!-- user_id = sessionScope.id -->
                                                <td colspan="3">${sessionScope.id }</td>
                                            </tr>
                                            <tr>
                                                <th>시설명</th> <!-- =croom_name -->
                                                <td id="Chkplace" colspan="3">
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>예약 날짜</th><!-- = prental_de -->
                                                <td id="Chkdate" colspan="3" onchange="printDate()">
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>예약 시간</th><!-- = prental_time_info -->
                                                <td id="Chktime" colspan="3" onchange="">
                                                    <!-- onchange 안에 새로운 함수 넣을 것 -->
                                                    <!-- 대관 테이블(하단)에서 체크박스로 체크한 시간들(1,2,...) -->
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>결제 금액</th>
                                                <td colspan="3" onchange="">
                                                    
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                                    <button type="button" class="btn btn-primary" id="renBtn">확인</button>
                                    <!-- 확인 버튼 누를 시 모달에서 보여준 값들 DB로 넘어감 -->
                                </div>
                            </div>
                        </div>
                    </div>

                    <script type="text/javascript">
                        $(document).ready(function () {


                            //let prental_id = 1

                            $("#viewBtn").click(function () {
                                alert("조회하기 버튼")

                                let croom_id = ($("select[name=selectplace]").val())
                                let prental_de = ($("input[name=rday]").val())


                                //console.log(croom_id);
                                //console.log(prental_de);
                                //작동확인
								

                                $.ajax({
                                    type: 'GET',
                                    url: '/ycc/rental/place.send?croom_id=' + croom_id + '&prental_de=' + prental_de, //수정요망
                                    headers: { "content-type": 'application/json' },
                                    dataType: 'json',
                                    success: function (result) {
                                    	
                                    	alert(result)
                                        let json = JSON.stringify(result)
                                        alert(json) 
                                        	
                                        $("#rentaltable").html(toHtml(result))//'22.11.22 여기까지 되는 거 확인, db에서 값까지 가져오는데 가져오는 값이 이상함

                                    },
                                    error: function () { alert("rental error") }
                                })

                            })

                            let toHtml = function(prints){
                            	
                                let tmp = "<table style='text-align: center;'>"
                                tmp += "<thead>"
                                tmp += "<tr>"
                                tmp += '<th scope="col">대관 장소</th>'
                                tmp += '<th scope="col">시간</th>'
                                tmp += '<th scope="col">예약일</th>'
                                tmp += '<th scope="col">예약</th>'
                                tmp += '</tr>'
                                tmp += '</thead>'
                                tmp += '<tbody>'
                                
                                	/* $.each(result,function(index, item) {
                                    	$("#rentaltable").append(index + "")
                                    	$("#rentaltable").append(item.croom_name + "")
                                    	$("#rentaltable").append(item.prental_time_info + "")
                                    	$("#rentaltable").append(item.prental_de + "")
                                    	$("#rentaltable").append(item.croom_name + "")
                                    	$("#rentaltable").append(item.user_id + "")
                                    }) 
                                
                                	
                                	 */

                                	 prints.forEach(function(print){
                                		tmp += '<tr>'
                                        tmp += '<td data-rentalarea= ' + print.croom_id + '>'+print.croom_id+'</td>'
                                        tmp += '<td>'+print.user_id+'</td>'
                                        tmp += '<td data-rentaldate= ' + print.prental_de + '>'+print.prental_de+'</td>'
                                        tmp += '<td><input type="checkbox" id="cbox" name="cbox"></td>' 
                                        tmp += '</tr>'

                                    
                                }) 
                                tmp += "</tbody>"

                                return tmp += '</table>'


                            }
                            
                            /* var selectBoxCheck = document.getElementByid("selectplace")
                            function onChange() {
                            	var text = selectBoxCheck.option[selectBoxCheck.selectedIndex].text
                            	console.log(text)
                            }
                            selectBoxCheck.onchange = onChange; */
                            
                            /*function checkSelectBox() {
                            	document.getElementById("rentalplace").value = document.getElementById("selectplace").value
                            }*/  //1트
                            
                      
                                                        
                            //showList(prental_id)
                            //체크박스가 체크되어 있는지 확인하는 기능
                            /* $("#Tstbutton").click(function(){
                                $("input[type=checkbox]:checked").each(function(){
                                    value = $(this).val()
                                    alert(value)
                                })
                            }) */

                            /* //체크된 부분의 값 가져오는 기능
                            $("#Tstbutton").click(function(){
                                const arr = []
                                var cbox = $("input[name='cbox']:checked")
                                $(cbox).each(function(){
                                    arr.push($(this).val())
                                    alert(arr[])
                                	
                                })
                            }) */

                            $("#modalBtn").on("click", function(){
                            	
                            	
                            	//클릭 시 장소값 넘겨주는 기능
                            	const area = document.getElementById('Chkplace')
                            	area.innerHTML = document.getElementById("pickplace").value
                            	
                            	//클릭 시 일자값 넘겨주는 기능
                            	const date = document.getElementById('Chkdate')
                            	date.innerHTML = document.getElementById("datetime-local").value
                            	
                            	/*
                            	//클릭 시 시간값 넘겨주는 기능
                            	const time = document.getElementById('Chktime')
                            	time.innerHTML = document.getElementById("시간이 들어갈 부분 ID".value)
                            	*/
                            	
                            	
                            
                            	
                            	/* const dateelement = document.getElementById('datetime-local')
                            	element.innerHTML = document.getElementByName("pickdate").value */
                            	
                            	/* let form = $("#form")
                            	form.attr("method", "post")
                            	
                            	if(formCheck())
                            		form.submit() */
                            	
                            })
                            
                            /* let formCheck = function() {
                            	let form = document.getElementById("form")
                            	if(form.selectplace.value=="") {
                            		alert("장소를 선택하세요")
                            		form.selectplace.focus()
                            		return false
                            	}
                            	
                            	if(form.rday.value=="") {
                            		alert("날짜를 선택하세요")
                            		form.rday.focus()
                            		return false
                            	}
                            	
                            	if(form.cbox.value=="") {
                            		alert("예약하실 부분에 체크해주세요")
                            		form.cbox.focus()
                            		return false
                            	}
                            	return true
                            } */


                            //현재 시간보다 이전의 시간은 선택할 수 없는 기능
                            /* let dateElement = document.getElementById('datetime-local');	//datetime-local의 값 가져옴
                            let date = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000).toISOString().slice(0, -5);
							let maxdate = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000).toISOString().slice(0, -5) + n일 이후 설정 할 부분
                            dateElement.value = date;	//현재 날짜로 date 설정
                            dateElement.setAttribute("min", date); 

                            //만약 선택 날짜가 오늘 날짜보다 예전일 경우 알람을 띄워주는 기능
                            function setMinValue() {
                                if (dateElement.value < date) {//선택한 날짜 < 현 날짜
                                    alert('현재 시간보다 이전의 날짜는 설정할 수 없습니다.');
                                    dateElement.value = date;
                                }
                            } */
                            
                            /*
                            //만약 선택 날짜가 오늘 날짜 + n일 이후(maxdate)이면 알람을 띄워주는 기능
                            function setMaxValue() {
                            	if(deteElement.value > maxdate) {
                            		alert('예약은 최대 n일 이후까지 가능합니다.');
                            		dateElement.value = date;
                            	}
                            }
                            */
                            
                            let msg = "${msg}"
                            if (msg == "REN_OK") alert("예약신청을 완료했습니다.")
                            if (msg == "REN_ERR") alert("예약신청에 실패했습니다.")
                        })
                    </script>

                    <!-- footer inlcude -->
                    <%@include file="/WEB-INF/views/footer.jsp" %>
            </body>

            </html>