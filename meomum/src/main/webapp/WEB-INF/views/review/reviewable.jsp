<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<!-- 아이콘 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<style>
/*헤더 이미지용 url에 이미지 추가하면 됩니다.*/
.page-header {
	background: linear-gradient(rgba(36, 39, 38, 0.5), rgba(36, 39, 38, 0.5)),
		rgba(36, 39, 38, 0.5)
		url(https://plus.unsplash.com/premium_photo-1669686968099-f3a8f355a8cc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1025&q=80)
		no-repeat center;
	background-size: cover;
	margin: 0;
	border-bottom: none;
	padding-bottom: 0px;
}

.page-caption {
	padding: 90px 0px;
	position: relative;
	z-index: 1;
	color: #fff;
	text-align: center;
}

thead tr{
	background-color: #f8f9fa;
	border-top: 1.2px solid #dadbe4;
}

.noreview h5{
	line-height:180px;
}

.col-auto {
	margin:0 0 10px 0;
}
.app-content {
	margin: 0 20px;
	padding: 0 20px;
}

.num{
	width: 25%;
}
.category{
	width:15%;
}
.svclist{
	width:40%;
}
.button{
	width:25%;
}
.review-star i {
    color:#FFD400;
}
</style>

</head>
<body>
<%@include file="/WEB-INF/views/header.jsp"%> 

<!-- 헤더 이미지 시작 -->
	<div class="page-header">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="page-caption">
						<h2 class="page-title">작성 가능한 후기</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- 헤더 이미지 끝 -->

<section class="shop spad">
<div class="container">
<div class="row"> 
	<%@include file="../myMenu.jsp"%> 
	<div class="col-xl-9 col-md-9">	
		<!-- ---------- 마이페이지 작업한 파일 페이지 여기에 넣어주세요!!(include) ---------- -->	
		
			<div class="container-xl text-center">

				<table class="table reviewable-table">
					<thead class="table-light">
						<tr class="table-borderless">
							<th scope="col" class="num">서비스/주문번호</th>
							<th scope="col">이용내역</th>
							<th scope="col" class="button">버튼</th>
						</tr>
					</thead>
					
					<tbody class="table-group-divider">
						<c:if test="${empty lists}">
							<tr>
								<td class="align-middle" colspan="4">
									<h5 class="text-center">작성 가능한 후기가 없습니다.</h5>
								</td>
							</tr>
						</c:if>
						<c:forEach var="dto" items="${lists}">
							<tr>
								<td class="align-middle num">${dto.activity_idx}</td>
								<td class="align-middle category">${dto.activity_idx.startsWith('S') ? '정리일상' : dto.activity_idx.startsWith('O') ? '구독일상' : ''}</td>
								<td class="align-middle button">
									<c:url var="contentUrl" value="reviewWrite.do">
										<c:param name="activity_idx">${dto.activity_idx}</c:param>
										<c:param name="writer">${sessionScope.ssInfo.user_name}</c:param>
										<c:param name="category">
										${dto.activity_idx.startsWith('S') ? '정리일상' : dto.activity_idx.startsWith('O') ? '구독일상' : ''}
										</c:param>										
									</c:url>
									<a href="${contentUrl}" class="btn btn-sm btn-primary">후기 작성하기</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

			</div>	
			
			<div class="container-xl">
				<nav aria-label="Page navigation example">
					<ul class="pagination pagination-sm justify-content-center">
						${pageStr}
					</ul>
				</nav>
			</div>	
		

		<!-- ---------- 마이페이지 각 페이지 여기에 넣어주세요!! 끝 지점 ---------- -->
	</div>
		
</div>
</div>
</section>

<%@include file="../footer.jsp"%> 

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

</body>
</html>