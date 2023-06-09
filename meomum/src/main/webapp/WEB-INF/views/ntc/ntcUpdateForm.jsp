<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
<!-- ckeditor -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
</head>
<body class="app">

	<%@include file="/WEB-INF/views/header_a.jsp"%>
	<div class="app-wrapper">
		<div class="app-content pt-3 p-md-3 p-lg-4">
			<div class="container pt-5">
				<h1 class="text-center mb-4">공지사항 수정</h1>
				<div class="mb-3">
					<a href="/meomum/ntcList_a.do" class="text-decoration-none">목록으로
						돌아가기 &gt;</a>
				</div>
				<form name="ntcUpdate" action="ntcUpdate.do" method="post"
					enctype="multipart/form-data">
					<ul>
						<c:if test="${empty dto}">
							<li>존재하지 않거나 삭제된 게시글입니다.</li>
						</c:if>
						<c:if test="${not empty dto}">
							<li>제목:<input type="text" name="ntc_title"
								value="${dto.ntc_title}"></li>
							<li>카테고리: <select name="ntc_ctg">
									<option value="공지사항"
										<c:if test="${dto.ntc_ctg == '공지사항'}">selected</c:if>>공지사항</option>
									<option value="FAQ"
										<c:if test="${dto.ntc_ctg == 'FAQ'}">selected</c:if>>FAQ</option>
									<option value="이벤트"
										<c:if test="${dto.ntc_ctg == '이벤트'}">selected</c:if>>이벤트</option>
							</select></li>
							<textarea name="ntc_content" id="content">${dto.ntc_content}</textarea>
							<script>
								var ckeditor_config = {
									resize_enabled : false,
									enterMode : CKEDITOR.ENTER_BR,
									shiftEnterMode : CKEDITOR.ENTER_P,
									filebrowserUploadUrl : '${pageContext.request.contextPath}/ntc/ckUpload.do'
								};
								CKEDITOR.replace("content", ckeditor_config);
								var ntcContent = CKEDITOR.instances.content
										.getData();
							</script>
							<input type="hidden" name="ntc_idx" value="${dto.ntc_idx}">
						</c:if>
					</ul>
					<div>
						<input type="submit" value="수정하기"> <input type="reset"
							value="초기화">
					</div>
				</form>

			</div>
		</div>
		<%@include file="/WEB-INF/views/footer_a.jsp"%>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>
