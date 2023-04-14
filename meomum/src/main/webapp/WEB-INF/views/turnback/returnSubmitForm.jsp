<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
.row {
    --bs-gutter-x: 0;
}

.card{
	width:500px;
	margin:10px auto;
}
hr{
	margin:30px 0;
}

.orderMsg{
	resize:none;
}

.btn-primary {
    --bs-btn-color: #fff;
    --bs-btn-bg: #85745D;
    --bs-btn-border-color: #85745D;
    --bs-btn-hover-color: #fff;
    --bs-btn-hover-bg: #4F4538;
    --bs-btn-hover-border-color: #4F4538;
    --bs-btn-focus-shadow-rgb: 49,132,253;
    --bs-btn-active-color: #fff;
    --bs-btn-active-bg: #FE8A7F;
    --bs-btn-active-border-color: #FFC1B4;
    --bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
    --bs-btn-disabled-color: #fff;
    --bs-btn-disabled-bg: #85745D;
    --bs-btn-disabled-border-color: #85745D;
}

.form-btn button{
	margin:20px 10px 10px 10px;
}
</style>

</head>
  
<body> 
	<div class="row">
		<div class="col-sm-12">
	    <div class="card mb-4">
	    
			<div class="card-header d-flex justify-content-between align-items-center">
	        	<h5 class="mb-0">반납처리</h5> <small class="text-muted float-end">주문번호&nbsp;:&nbsp;${param.order_idx}</small>
	      	</div>
	      
			
			<div class="card-body">
			
				<input type="hidden" name="order_idx" value="${param.order_idx}">
				
				<div class="form-row mb-3">
					<div class="col-md-6 mb-3">
			          	<div class="form-group">
			          		<label class="form-label" for="user_name">반납상품</label>
			            	<input type="text" class="form-control" name="user_name" value="${dto.pro_name}" readonly>
			            </div>
		            </div>
				</div>
				
				<div class="form-row mb-3">
	           		<label class="form-label" for="order_msg">반납사유</label>
	           		<textarea name="order_msg" class="form-control h-25 reasonMsg" rows="4" readonly>${dto.return_reason}</textarea>
				</div>
	          
				<div class="form-row mb-3 form-btn d-flex justify-content-center">
					<form action="returnCancel.do" name="returnCancel" method="post">
						<input type="hidden" name="order_idx" value="${param.order_idx}">
						<input type="hidden" name="pro_idx" value="${dto.pro_idx}">
						<button type="submit" class="btn btn-secondary">반납보류</button>
					</form>
					
					<form action="returnSubmit.do" name="returnSubmit" method="post">
						<input type="hidden" name="order_idx" value="${param.order_idx}">
						<input type="hidden" name="pro_idx" value="${dto.pro_idx}">
	          			<button type="submit" class="btn btn-primary">반납승인</button>
	        		</form>
	          	</div>
				
	          	
	      	</div>
	        
      
    	</div>
		</div>   
	</div>
    


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
