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
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js">	</script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
  
  <%
  	String noticeURI = request.getParameter("board");
  	String eventURI = request.getParameter("board");
  %>
<title>Young문화센터 - 글 작성하기</title>
</head>

<body>
  <!-- header inlcude -->
<%@include file="/WEB-INF/views/header.jsp"%>
  <!--container start-->
  <div class="container mt-5">
    <h3 class="posttitle pt-3">글 작성하기</h3>
    <br>
    <input type="text" class="form-control mb-3" placeholder="제목을 입력해주세요" aria-label="title"
      aria-describedby="basic-addon1">
    <textarea class="summernote mb-3" name="editordata"></textarea>
    <script>
    $('.summernote').summernote({
      height: 400,
      lang: "ko-KR"

    });
  </script>
    <div class="input-group mb-3 mt-3">
      <input type="file" class="form-control" id="inputGroupFile02">
      <label class="input-group-text" for="inputGroupFile02">Upload</label>
    </div>
    <div style="text-align: center;">
      <input class="btn btn-primary mx-3" type="submit" value="등록하기" onClick="javascript:history.back();">
      <input class="btn btn-secondary" type="submit" value="취소하기">
    </div>

  </div><!--container end-->
  <!-- footer inlcude -->
<%@include file="/WEB-INF/views/footer.jsp"%>

</body>

</html>