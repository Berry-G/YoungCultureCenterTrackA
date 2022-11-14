<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- head & meta tag include -->
    <%@include file="/WEB-INF/views/metahead.jsp"%>

<!--summernote-->
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.css"> <!-- header-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>

<style type="text/css">
@media(min-width:387px) {
	#d-none {
		display: none;
	}
}
</style>
    
<title>Young문화센터 - 게시글 수정</title>
</head>
<body>
  <!-- header inlcude -->
<%@include file="/WEB-INF/views/header.jsp"%>
  <div class="container mt-5">
                <h1>공지사항</h1>
                        <label for="title" class="form-label"></label> <input type="text" class="form-control"
                            id="title" name="title" value="저 오늘 치과갑니다">
                        <hr>
                        <p>작성자 : 김지호 | <br id="d-none"> 게시일 : yyyy-mm-dd</p>
                            <div>
                                    <textarea class="summernote" name="editordata" style="margin-bottom: 30px;">내용내용내용내용</textarea> 
	                                    <script>
										    $('.summernote').summernote({
										        height: 400,
										        lang: "ko-KR"
										    });
										</script>
                        <div class="mt-2 text-end">
                            <a class="btn btn-outline-secondary">목록으로</a>
                            <a class="btn btn-outline-success" onClick="javascript:history.back();">등록하기</a>
                        </div>
                            </div>



    </div><!--container end-->
    <!-- footer inlcude -->
<%@include file="/WEB-INF/views/footer.jsp"%>

 
</body>
</html>