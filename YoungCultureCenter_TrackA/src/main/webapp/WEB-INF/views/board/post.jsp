<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

<!-- header-->
<%@include file="/WEB-INF/views/metahead.jsp"%>
    <title>Young문화센터 - 게시글 상세 보기</title>
</head>
<body>
    <!-- header inlcude -->
<%@include file="/WEB-INF/views/header.jsp"%>
    
	<main class="mt-5 pt-5">
			<div class="container px-4">
				<!-- 제목 -->
				<h2 class="writing-header">공지사항 ${mode== "new" ? "글쓰기" : "" }</h2>
					<div class="card mb-4">
	    				<div class="card-body">
	    					<form id="form" class="frm" action="" method="post">
	    						<!-- 게시글 정보 -->
	  							<h4 class="title" ${mode=="new" ? "" : "readonly='readonly'" }>${boardDto.article_title }</h4>
	  							<p class="writingInfo" ${mode=="new" ? "" : "readonly='readonly'" }>작성자 : ${boardDto.user_id} |
	   								게시일 : <fmt:formatDate value="${boardDto.article_date }" pattern="yyyy-MM-dd" type="date"/> 
	  								| 조회수 : ${boardDto.article_viewcnt }
	 							</p>
	  						<hr>
	 							<!-- 내용 -->
	  							<p class="content" ${mode=="new" ? "" : "readonly='readonly'" }>${boardDto.article_contents }</p>
	    					</form>
	    				</div>
					</div>


			<div class="row pb-5" style="float:right">
				<div class="col-auto px-1">
	  				<a href="notice" id="listBtn" class="btn btn-outline-secondary">목록</a>	
				</div>
				<div class="col-auto px-1">
	  				<a href="edit" class="btn btn-outline-success" onclick="return confirm('수정하시겠습니까?')">수정</a>
				</div>
				<div class="col-auto px-1">
	  				<a href="remove?article_id=${board.article_id}" class="btn btn-outline-danger" 
	  						onclick="return confirm('삭제하시겠습니까?')">삭제</a>
	      		</div>
	       </div>
	       
			<table class="table table-bordered " style="border-radius:5px; ">
				<colgroup>
					<col width="120px;">
					<col width="auto;">
				</colgroup>
	    			<tbody>
	    				<tr>
	    					<th scope="row" class="text-center">이전글</th>
	    					<td>글이 없습니다.</td>
	    				</tr>
	    				<tr>
	    					<th scope="row" class="text-center">다음글</th>
	    					<td></td>
	    				</tr>
	    			</tbody>
	    	</table>
	    	</div>
	</main>

		
	<script type="text/javascript">
		//목록 버튼 클릭시 
		$("#listBtn").on("click", function() {
			location.href ="<c:url value='/board/notice${searchItem.queryString}' />";
		})

		
	
	
	</script>
    
  <!-- footer inlcude -->
<%@include file="/WEB-INF/views/footer.jsp"%>
</body>

</html>