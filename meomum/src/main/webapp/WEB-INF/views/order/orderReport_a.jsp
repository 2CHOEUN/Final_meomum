<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
 
<!-- 관리자 헤더 CSS -->  
<link id="theme-style" rel="stylesheet" href="assets/css/portal_a.css">
<link rel="stylesheet" type="text/css" href="css/mainLayout_a.css">

<!-- 데이터테이블 css&js -->
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" type="text/css">
<script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>
<script>
document.addEventListener("DOMContentLoaded", function() {
	  var table = document.getElementById("order-table");
	  if (table) {
	    $(table).DataTable({
	    	lengthChange: false,
	    	info: false,
	    	paging: false,
	    	order: [ [ 0, "desc" ] ],
	    	responsive: true,
	    	searching: false
	    });
	  }
});
</script>

<style>
.datatable-input{
	margin:0 4px 0 10px;
	width:250px;
	height:40px;
}
.datatable-selector{
	height:40px;
}
.button{
	border-radius:2px;
	height:40px;
}


.datatable-table{
	margin:20px 0 10px 0;
}
.datatable-table > tbody > tr > th{
	padding:1rem 0;
}
.datatable-table > tbody > tr > td{
	font-size: .875rem;
	padding:1rem 0;
}
thead th a{
	text-align: center;
	cursor: pointer;
}
.order-num{
	color: #0055FF;
}
.state div{
	padding: 0.2rem 0;
	width:40%;
	text-align: center;
}
.btn-sm{
	padding: 0.2rem 0.8rem;
}

.paging{
	margin:20px;
}


</style>

<script>
function orderInfoOpen(url, name, options) {
	  window.open(url, name, options);
	}
function shipFormOpen(url, name, options) {
  window.open(url, name, options);
}

function showTracker(t_key, t_code,t_invoice){
    var frmPop= document.getElementById('frmData');
    var url = 'http://info.sweettracker.co.kr/tracking/4';
    window.open(url,'showTracker','width=460,height=600');  
     
    frmPop.action = url;
    frmPop.target = 'showTracker';
    frmPop.t_key.value = t_key;
    frmPop.t_code.value = t_code;  
    frmPop.t_invoice.value = t_invoice;  
    frmPop.submit();   
     
}

</script>
</head>

<body class="app"> 

<%@include file="../header_a.jsp"%>  

<div class="app-wrapper">
	    
	<div class="app-content pt-3 p-md-3 p-lg-4">
		<div class="container pt-5">
			<h1 class="text-center mb-4">주문/배송 내역</h1>

			    
			<div class="card">
			<div class="card-body"> 
			
				<div class="datatable-container">
			    
				<table class="datatable-table" id="order-table">
				<thead>
					<tr>
						<th data-sortable="true"style="width:20%;" aria-sort="descending" class="datatable-descending" >
							<a href="#" class="datatable-sorter">주문번호</a>
						</th>
						<th data-sortable="true" style="width:18%;">
							<a href="#" class="datatable-sorter">구독상품</a>
						</th>
						<th data-sortable="true" style="width:10%">
							<a href="#" class="datatable-sorter">주문자</a></th>
						<th data-sortable="true" style="width:14%">
							<a href="#" class="datatable-sorter">주문자 연락처</a>
						</th>
						<th data-sortable="true" style="width:10%">
							<a href="#" class="datatable-sorter">주문날짜</a>
						</th>
						<th data-sortable="true" style="width:12%">
							<a href="#" class="datatable-sorter">주문수량</a>
						</th>
						<th data-filterable="true" style="width: 16%;">
							<a href="#" class="datatable-filter">상태</a>
						</th>
					</tr>
				</thead>
				
				<tbody>
					<c:if test="${empty lists}">
						<tr>
							<td colspan="6" class="text-center">
								주문/배송 내역이 없습니다.
							</td>
						</tr>
					</c:if>
					
					<c:forEach var="dto" items="${lists}" varStatus="status">
						<tr data-index="${status.count}">
							<td class="sorting_${status.count} order-num text-center">
								<c:url var="orderDetailUrl" value="orderInfoDetail.do">
									<c:param name="order_idx">${dto.order_idx}</c:param>
									<c:param name="pro_idx">${dto.pro_idx}</c:param>
								</c:url>
								<a href="#" onclick="orderInfoOpen('${orderDetailUrl}', 'orderInfoDetail', 'width=540,height=600'); return false;">
								${dto.order_idx}
								</a>
							</td>
							<td class="text-truncate">${dto.pro_name}</td>
							<td class="text-center">${dto.user_name}</td>
							<td class="text-center">${dto.user_tel}</td>
							<td class="text-center">${dto.order_date}</td>
							<td class="text-center">${dto.pro_amount}개</td>
							<td class="state d-flex justify-content-around">
								<c:choose>
									<c:when test="${dto.order_status eq 1}">
										<div class="text-warning">상품준비중</div>
										<a href="#" class="btn-sm app-btn-secondary" 
											onclick="shipFormOpen('shipForm.do?order_idx=${dto.order_idx}&pro_idx=${dto.pro_idx}', 'shipForm', 'width=540,height=600'); return false;">배송처리</a>
									</c:when>
									<c:when test="${dto.order_status eq 2}">
										<div class="text-success">배송중</div>
										<form name="frmData" id="frmData" method="post">
											<input type="hidden" id="t_key" name="t_key" value="sjLmbhJEhPXnO5neAx7FNg">
											<input type="hidden" id="t_code" name="t_code" value="04">
											<input type="hidden" id="t_invoice" name="t_invoice" value="566250609912">
											<input type="button" value="배송조회" onclick="showTracker('sjLmbhJEhPXnO5neAx7FNg', '04', '566250609912')" class="btn-sm app-btn-secondary">
										</form>
									</c:when>
									<c:when test="${dto.order_status eq 3}">
										<div class="text-danger">주문취소</div>
									</c:when>
									<c:when test="${dto.order_status eq 4}">
										<div class="text-primary">배송완료</div>
										<form name="frmData" id="frmData" method="post">
											<input type="hidden" id="t_key" name="t_key" value="sjLmbhJEhPXnO5neAx7FNg">
											<input type="hidden" id="t_code" name="t_code" value="04">
											<input type="hidden" id="t_invoice" name="t_invoice" value="566250609912">
											<input type="button" value="배송조회" onclick="showTracker('sjLmbhJEhPXnO5neAx7FNg', '04', '566250609912')" class="btn-sm app-btn-secondary">
										</form>
									</c:when>
									<c:when test="${dto.order_status eq 5}">										
										<div class="text-danger">반납신청</div>
									</c:when>
									<c:when test="${dto.order_status eq 6}"><div class="text-success">반납진행</div></c:when>
									<c:when test="${dto.order_status eq 7}"><div class="text-primary">반납완료</div></c:when>
									<c:when test="${dto.order_status eq 8}"><div class="text-danger"><strong>반납보류</strong></div></c:when>
								</c:choose>
							</td>
						</tr>									
							
						</c:forEach>
						
					</tbody>
				</table>
			
				</div>
			
			</div>
			</div>
				
				
							
		</div>
			
			
		<div class="container-xl paging">
				<nav aria-label="Page navigation example">
					<ul class="pagination pagination-sm justify-content-center">
					${pageStr}
					</ul>
				</nav>

		</div>
		
	</div>

<%@include file="../footer_a.jsp"%>    
</div><!--//app-wrapper-->    					

<!-- Javascript -->          
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>