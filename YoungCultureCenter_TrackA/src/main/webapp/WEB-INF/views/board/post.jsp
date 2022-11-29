<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<!-- header-->
<%@include file="/WEB-INF/views/metahead.jsp"%>
    <title>게시글 상세 보기</title>
</head>
<body>
    <!-- header inlcude -->
<%@include file="/WEB-INF/views/header.jsp"%>
    
	<main class="mt-5 pt-5">
			<div class="container px-4">
				<!-- 제목 -->
				<h2 class="writing-header">공지사항</h2>
				<form id="form" class="frm" action="" method="post">
					<div class="card mb-4">
	    				<div class="card-body">
    						<!-- 게시글 정보 -->
    						<input type="hidden" name="article_id" value="${boardDto.article_id }">
  							<h4 class="title" >${boardDto.article_title }</h4>
  							<p class="writingInfo">작성자 : ${boardDto.user_id} |
   								게시일 : <fmt:formatDate value="${boardDto.article_date }" pattern="yyyy-MM-dd" type="date"/> 
  								| 조회수 : ${boardDto.article_viewcnt }
 							</p>
 							<!-- 내용 -->
  							<p class="content" >${boardDto.article_contents }</p>	    					
	    				</div>
					</div>				
					<div class="row pb-5" style="float:right">
						<div class="col-auto px-1">
			  				<a id="listBtn" class="btn btn-outline-secondary">목록</a>	
						</div>
						<!-- 본인이 쓴 게시글에만 수정, 삭제 가능 -->
						<!-- 세션 아이디와 boardDto에 저장되 아이디가 같으면 수정, 삭제 버튼 활성화 -->
						<c:if test="${sessionScope.id eq boardDto.user_id}">
						<div class="col-auto px-1">
			  				<a href="edit" class="btn btn-outline-success" onclick="return confirm('수정하시겠습니까?')">수정</a>
						</div>
						<div class="col-auto px-1">
			  				<button type="button" id="deleteBtn" class="btn btn-outline-danger">삭제</button>
			      		</div>
			      		</c:if>
			       </div>
		       </form>
			       <div class="prevNext">
						<table class="table table-bordered " style="border-radius:5px; ">
							<colgroup>
								<col width="120px;">
								<col width="auto;">
							</colgroup>
				    			<tbody>
				    				<tr>
				    					<th scope="row" class="text-center" >이전글</th>
				    					<td class="pre" id="preTitle" > ${preView.preTitle}
		      							</td>
				    				</tr>
				    				<tr>
				    					<th scope="row" class="text-center">다음글</th>
				    					<td  class="next" id="nextView">${nextView.nextTitle}
				    					</td>
				    				</tr>
				    			</tbody>
			    		</table>
			    	</div>
			    	</div>
			</main>
		
				
<script>

	$(document).ready(function(){
		

		$("#listBtn").on("click", function() {
			location.href ="<c:url value='/board/notice${searchItem.queryString}' />";
		})
		
		
		 
	
		$("#deleteBtn").on("click", function() {
			if(!confirm("정말로 삭제하시겠습니까?")) return;
			
			let form = $("#form")
			form.attr("action","<c:url value='/board/remove${searchItem.queryString}' />")
			form.attr("method", "post")
			form.submit()
		})	
		
	})
	
</script>
    
  <!-- footer inlcude -->
<%@include file="/WEB-INF/views/footer.jsp"%>
</body>

</html>