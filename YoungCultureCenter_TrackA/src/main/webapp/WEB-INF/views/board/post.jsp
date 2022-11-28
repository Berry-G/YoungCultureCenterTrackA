<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
					<div class="card mb-4">
	    				<div class="card-body">
	    					<form id="form" class="frm" action="" method="post">
	    						<!-- 게시글 정보 -->
	  							<h4 class="title" >${boardDto.article_title }</h4>
	  							<p class="writingInfo">작성자 : ${boardDto.user_id} |
	   								게시일 : <fmt:formatDate value="${boardDto.article_date }" pattern="yyyy-MM-dd" type="date"/> 
	  								| 조회수 : ${boardDto.article_viewcnt }
	 							</p>
	  						<hr>
	 							<!-- 내용 -->
	  							<p class="content" >${boardDto.article_contents }</p>
	    					</form>
	    				</div>
					</div>


			<div class="row pb-5" style="float:right">
				<div class="col-auto px-1">
	  				<a href="notice" id="listBtn" class="btn btn-outline-secondary">목록</a>	
				</div>
				<!-- 본인이 쓴 게시글에만 수정, 삭제 가능 -->
				<!-- 세션 아이디와 boardDto에 저장되 아이디가 같으면 수정, 삭제 버튼 활성화 -->
				<c:if test="${sessionScope.id == boardDto.user_id}">
				<div class="col-auto px-1">
	  				<a href="edit" class="btn btn-outline-success" onclick="return confirm('수정하시겠습니까?')">수정</a>
				</div>
				<div class="col-auto px-1">
	  				<a class="btn btn-outline-danger" id="deleteBtn">삭제</a>
	      		</div>
	      		</c:if>
	       </div>
	       
	       <div class="prevNext">
				<table class="table table-bordered " style="border-radius:5px; ">
					<colgroup>
						<col width="120px;">
						<col width="auto;">
					</colgroup>
		    			<tbody>
		    				<tr>
		    					<th scope="row" class="text-center" >이전글</th>
		    					<td class="pre" id="preView" >${boardDto.preView }
<%-- 		    						<a style="text-decoration: none; color: black;" href="<c:url value="/board/post${pr.sc.queryString }&article_id=${boardDto.article_id  }"/>"> --%>
<%-- 										${boardDto.article_title } --%>
<!--       								</a> -->
      							</td>
		    					
		    				</tr>
		    				<tr>

		    					<th scope="row" class="text-center">다음글</th>
		    					<td class="next" id="nextView"></td>
		    				</tr>
		    			</tbody>
	    		</table>
	    	</div>
	    	</div>
	</main>

		
	<script>
	$(document).ready(function(){
		

		$("#deleteBtn").click(function() {
			if(!confirm("삭제하시겠습니까?")) 
				return;
			
			let form = $("#form")
			form.attr("action", "<c:url value='/board/delete${searchItem.queryString}' />")
			form.attr("method","post")
			form.submit()
		})

	})
		

	
	</script>
    
  <!-- footer inlcude -->
<%@include file="/WEB-INF/views/footer.jsp"%>
</body>

</html>