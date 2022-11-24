<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head><!-- head & meta tag include -->
    <%@include file="/WEB-INF/views/metahead.jsp"%>
<title>Young문화센터 - 공지사항 게시판</title>


</head>
<body>
  <!-- header inlcude -->
<%@include file="/WEB-INF/views/header.jsp"%>
  <!--start container-->
  <div class="container">
    <br>
    <h3>공지사항</h3>
    <hr />
    <br>
	
    <!--게시판 부분-->
    <table class="table table-hover" style="table-layout: fixed;">
    <colgroup>
    	<col width="50%">
            <col width="10%">
            <col width="20%">
            <col width="10%">
           </colgroup>
      <thead>
        <tr>
          <th scope="col" class="title" style="text-align: center;">제목</th>
          <th scope="col" class="writer" style="text-align: center;">작성자</th>
          <th scope="col" class="regdate" style="text-align: center;">작성일</th>
          <th scope="col" class="viewcnt" style="text-align: center;">조회수</th>
        </tr>
      </thead>
    
      <c:forEach var="boardDto" items="${list }">
      	<tr>
      		<td class="title">
      			<a href="<c:url value="/board/view${pr.sc.queryString }&bno=${boardDto.article_id  }"/>">
      				${boardDto.article_title }
      			</a>	
      		</td>
      		<td class="writer">${boardDto.user_id }</td>
      		<td class="regdate"><fmt:formatDate value="${boardDto.article_date }" pattern="yyyy-MM-dd" type="date"/></td>
      		<td class="viewcnt">${boardDto.article_viewcnt }</td>
      	</tr>
      </c:forEach>
     </tbody>
     </table>
        


	 <!--작성하기 버튼-->
<!--     <div class="row"> -->
<!--     	<div class="col"> -->
<!-- 			<a class="btn btn-primary " style="float:right" href="write?board=event" role="button">작성하기</a>    	 -->
<!--     	</div> -->
<!--     </div> -->

	     
  
    <!--창 하단 페이지 숫자-->
    <nav aria-label="Page navigation">
      <ul class="pagination justify-content-center">
        <li class="page-item disabled">
          <a class="page-link" href="#" tabindex="-1" aria-disabled="true">이전</a>
        </li>
        <c:if test="${totalCnt != null || totalCnt != 0 }">
            <c:if test="${pr.showPrev }">
                 <a class="page" href="<c:url value="/board/list${pr.sc.getQueryString(pr.beginPage-1) }" />">&lt;</a>
            </c:if>
        	<c:forEach var="i" begin="${pr.beginPage }" end="${pr.endPage }">
                 <a class="page" href="<c:url value="/board/list${pr.sc.getQueryString(i)}"/>">${i }</a>
             </c:forEach>
 		 	<c:if test="${pr.showNext }">
                 <a class="page" href="<c:url value="/board/list${pr.sc.getQueryString(pr.endPage + 1) }" />">&gt;</a>
            </c:if>
         </c:if>
      	 <a class="page-link" href="#">다음</a>
      </ul>
    </nav>
    <form action="<c:url value= "/board/notice"/>" class="search-form" method="get">
    <div class="container text-center">
		<div class="row justify-content-md-center pt-2 pb-5">
			<div class = "col-sm-auto px-1">
				<select class="form-select"  style="width: 150px;">
				  	<option value="T" ${pr.sc.option == 'T' ? "selected" : ""}>제목</option>
				  	<option value="TC" ${pr.sc.option == 'TC' || pr.sc.option == '' ? "selected" : ""}>제목 + 내용</option>
				  	<option value="W" ${pr.sc.option == 'W' ? "selected" : ""}>작성자</option>
				</select>
			</div>
			<div class="col-sm-auto px-1">		
				<span>
					<input type="text" class="form-control"  name="keyword" value="${param.keyword }" 
					placeholder="검색어를 입력해주세요."  style="width: 340px;">
				</span>
			</div>	
			<div class="col-sm-auto px-1">
				<input type="submit" id="search_button" class="btn btn-secondary"  value="검색" >
			</div>
		</div>
	</div>
	</form>
    
    
    <!-- <div style="display: flex; margin-left: 30%; margin-top: 50px;">
      <select class="form-select form-select-sm" aria-label=".form-select-sm example"
        style="width: 90px; margin-right: 10px;">
        <option value="1">제목</option>
        <option value="2">작성자</option>
      </select>
      <input type="text" class="form-control" aria-label="title" aria-describedby="basic-addon1" style="width: 300px;">
      <button type="button" class="btn btn-primary" style="margin-left: 10px;">검색</button>
    </div> -->
  </div>  <!--end of container-->
  <!-- footer inlcude -->
<%@include file="/WEB-INF/views/footer.jsp"%>
 
 
</body>

</html>