<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>


<head>
<meta charset="UTF-8">
<title>방문견적신청</title>
<!-- 부트스트랩 CSS 파일 추가 -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9gVRbX+6ePRepvpODvJy27JQ+wh2StsQJz9TYs2X0Pm6Rc8IljaUksdQRVvoxv3"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<!-- 예약 완료된 시간 비활성화 -->
<script src="js/svc/timeSelect.js"></script>

<!-- 입력 제약 -->
<script>
	function validate() {
		
	  var areaLabel = $('#areaLabel');
	  var areaLabelTop = areaLabel.offset().top;
	  var areaLabelHeight = areaLabel.height();
	  
	  var knowLabel = $('#knowLabel');
	  var knowLabelTop = knowLabel.offset().top;
	  var knowLabelHeight = knowLabel.height(); 
	  
	  var timeLabel = $('#timeLabel');
	  var timeLabelTop = timeLabel.offset().top;
	  var timeLabelHeight = timeLabel.height(); 
	  
	  var windowHeight = $(window).height();

	  if ($("input[name='svc_area']:checked").length === 0) {
	    $('html, body').animate({//해당 부분으로 스크롤 이동
	      scrollTop: areaLabelTop - windowHeight / 2 + areaLabelHeight / 2
	    }, 100, function() {
	      $('#areaLabel')[0].focus();
	      $('#areaError').text('서비스 영역을 선택해주세요').show();
	    });
	    return false;
	  }
	  
	  if ($("input[name='svc_know']:checked").length === 0) {
	    $('html, body').animate({
	      scrollTop: knowLabelTop - windowHeight / 2 + knowLabelHeight / 2
	    }, 100, function() {
	      $('#knowLabel')[0].focus();
	      $('#knowError').text('서비스 인지 경로를 선택해주세요').show();
	    });
	    return false;
	  }
	  
	  if ($("input[name='svc_time']:checked").length === 0) {
		    $('html, body').animate({
		      scrollTop: timeLabelTop - windowHeight / 2 + timeLabelHeight / 2
		    }, 100, function() {
		      $('#timeLabel')[0].focus();
		      $('#timeError').text('방문 견적 희망 시간을 선택해주세요').show();
		    });
		    return false;
		  }
	  
	  // 유효성 검사가 모두 통과한 경우 true 반환
	  return true;
	}
	$(document).ready(function() {
		  $('#svcForm').on('submit', function(event) {
		    event.preventDefault(); // 폼의 자동 전송 막기
		    if (validate()) {
		      this.submit(); // 폼 제출
		    }
		  });
		});

</script>



<style>
/*헤더 이미지용 url에 이미지 추가하면 됩니다.*/
.page-header {
	background: linear-gradient(rgba(36, 39, 38, 0.5), rgba(36, 39, 38, 0.5)),
		rgba(36, 39, 38, 0.5)
		url(https://images.unsplash.com/photo-1615876234886-fd9a39fda97f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1932&q=80)
		 no-repeat center;
	background-size: cover;
	margin: 0;
	border-bottom: none;
	padding-bottom: 0px;
	margin-bottom: 40px;
}

.page-caption {
	padding: 90px 0px;
	position: relative;
	z-index: 1;
	color: #fff;
	text-align: center;
}

.page-title {
	color: #fff;
	font-size: 40px;
	font-weight: 400;
	letter-spacing: -1px;
}

.btn-group .btn {
  margin-right: 10px;
}

label[for="input_svc"]::before{
  content: "*";
  color: #ff6666;
  margin-right: 5px;
}

label[for="areaLabel"]::before{
  content: "*";
  color: #ff6666;
  margin-right: 5px;
}

label[for="knowLabel"]::before{
  content: "*";
  color: #ff6666;
  margin-right: 5px;
}

footer {
  margin-top: 20px;
}

.input-group-append ml-2 {
	margin-left: 8px;
}
</style>
</head>

<body  id="#top">
	<%@include file="../header.jsp"%>
	<div class="page-header">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="page-caption">
						<h2 class="page-title">방문 견적 예약</h2>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-10 mx-auto">
				<form name="svcForm" id="svcForm" action="svcFormSubmit.do" method="post" onsubmit="return validate()">
				
					<input type="hidden" name="user_idx" value="${sessionScope.ssInfo.user_idx}">
				<!-- -------------------------------------거주형태------------------------------- -->	
						<div class="input-group mb-3">
							<label class="input-group-text col-3 text-center" for="input_svc" style="font-weight:bold;">거주형태</label> 
								<select class="form-select" id="svc_type" name="svc_type" required ="required">
								<option value="" selected disabled hidden>거주형태 선택</option>
								<option value="아파트">아파트</option>
								<option value="빌라">빌라</option>
								<option value="주택">주택</option>
								<option value="복층">복층</option>
								<option value="오피스텔">오피스텔</option>
								<option value="기타">기타</option>
							</select>
						</div>
	
				<!-- ----------------------------------서비스영역---------------------------------- -->
						<div class="input-group mb-3">
					    <label class="input-group-text col-3 text-center" for="input_svc" id="areaLabel" style="font-weight:bold;">서비스 영역</label>&nbsp;&nbsp;
					    <div class="form-check form-check-inline">
					        <input class="form-check-input" type="checkbox" name="svc_area" id="svc_area_all" value="전체"> 
					        <label class="form-check-label" for="svc_area_all">전체</label>
					    </div>
					    <div class="form-check form-check-inline">
					        <input class="form-check-input" type="checkbox" name="svc_area" id="svc_area_kitchen" value="주방"> 
					        <label class="form-check-label" for="svc_area_kitchen">주방</label>
					    </div>
					    <div class="form-check form-check-inline">
					        <input class="form-check-input" type="checkbox" name="svc_area" id="svc_area_bedroom" value="침실"> 
					        <label class="form-check-label" for="svc_area_bedroom">침실</label>
					    </div>
					    <div class="form-check form-check-inline">
					        <input class="form-check-input" type="checkbox" name="svc_area" id="svc_area_bathroom" value="화장실"> 
					        <label class="form-check-label" for="svc_area_bathroom">화장실</label>
					    </div>
					    <div class="form-check form-check-inline">
					        <input class="form-check-input" type="checkbox" name="svc_area" id="svc_area_children" value="자녀방"> 
					        <label class="form-check-label" for="svc_area_children">자녀방</label>
					    </div>
					    <div class="form-check form-check-inline">
					        <input class="form-check-input" type="checkbox" name="svc_area" id="svc_area_closet" value="옷장"> 
					        <label class="form-check-label" for="svc_area_closet">옷장</label>
					    </div>
					    <div class="form-check form-check-inline">
					        <input class="form-check-input" type="checkbox" name="svc_area" id="svc_area_etc" value="기타"> 
					        <label class="form-check-label" for="svc_area_etc">기타</label>
					    </div>
					    <span id="areaError" style="color: red;"></span>
					</div>

						


						<!-- ----------------------------------거주 평수--------------------------------- -->
						<div class="input-group mb-3">
							<label class="input-group-text col-3 text-center" for="input_svc" style="font-weight:bold;">거주 평수(공급면적)</label> 
								<input type="text" class="form-control input-group-text-fixed" name="svc_py" id="svc_py" required="required" placeholder="평수를 입력해주세요">
								<span class="input-group-text">평</span>
						</div>
						
						<!-- ----------------------------------성함--------------------------------- -->
						<div class="input-group mb-3">
							<label class="input-group-text col-3 text-center" for="input_svc" style="font-weight:bold;">성함</label> 
							<input type="text" class="form-control input-group-text-fixed" name="user_name" value="${sessionScope.ssInfo.user_name}" required="required" placeholder="성함을 입력해주세요">
						</div>
						
						<!-- ----------------------------------휴대전화--------------------------------- -->
						<div class="input-group mb-3">
							<label class="input-group-text col-3 text-center" for="input_svc" style="font-weight:bold;">휴대전화</label>
							<input type="text" class="form-control input-group-text-fixed" name="user_tel" required="required" value="${sessionScope.ssInfo.user_tel}" placeholder="010-1234-5678 형태로 기재해주세요">
						</div>
						
						<!-- ----------------------------------주소--------------------------------- -->
						<div class="input-group mb-3">
					    <label class="input-group-text col-3 text-center" for="input_svc" style="font-weight:bold;">주소</label> 
					    <div class="col-sm-9">
					        <div class="input-group">
					            <input id="user_pcode" type="text" class="form-control" name="user_pcode" placeholder="우편번호" value="${sessionScope.ssInfo.user_pcode}" required="required" onclick="findAddr()" readonly>
					            <div class="input-group-append">
					                <button class="btn btn-outline-secondary" type="button" onclick="findAddr()"  style="font-weight:bold;">우편번호 검색</button>
					            </div>
					        </div>
					        <div>
					            <input id="user_addr" type="text" class="form-control" name="user_addr" value="${sessionScope.ssInfo.user_addr}" required="required" readonly placeholder="기본주소"> 
					        </div>
					        <div>
					            <input type="text" class="form-control" name="user_detail" value="${sessionScope.ssInfo.addr_detail}" placeholder="상세주소를 입력해주세요">
					        </div>
					    </div>
					</div>
						<!-- ----------------------------------방문 희망일--------------------------------- -->
						<div class="input-group mb-3">
							<label class="input-group-text col-3 text-center" for="input_svc" style="font-weight:bold;">방문 희망일</label> 
							<input id="svc_days" type="date" class="form-control input-group-text-fixed" name="svc_days" required="required"
								onclick="setMinDate()">
						</div>
						<!-- ----------------------------------시간--------------------------------- -->
						<div class="input-group mb-3">
						  <label class="input-group-text col-3 text-center" for="input_svc" id="timeLabel" style="font-weight:bold;">시간</label>&nbsp;&nbsp;
						  <div class="btn-group" role="group">
						    <input type="radio" class="btn-check" name="svc_time" id="timeA" value="10:00" autocomplete="off">
						    <label class="btn btn-outline-primary " for="timeA">10:00</label>
												
						    <input type="radio" class="btn-check" name="svc_time" id="timeB" value="13:00" autocomplete="off">
						    <label class="btn btn-outline-primary  " for="timeB">13:00</label>
												
						    <input type="radio" class="btn-check" name="svc_time" id="timeC" value="16:00" autocomplete="off">
						    <label class="btn btn-outline-primary  " for="timeC">16:00</label>
						  </div>
						  <span id="timeError" style="color: red;"></span>
						</div>




						<!-- ----------------------------------요청사항--------------------------------- -->
						<div class="input-group mb-3" style="max-height: 600px; overflow-y: auto;">
							<label for="input_svc_req"
								class="input-group-text col-3 text-center" style="font-weight:bold;">요청사항<br>(2000자이내)</label>
							<textarea class="form-control input-group-text-fixed"
								id="svc_req" aria-label="With textarea"
								style="height: 300px; resize: none;" name="svc_req"
								placeholder="내용을 입력해주세요"></textarea>
						</div>
						<!-- ----------------------------------서비스 인지 경로--------------------------------- -->
						<div class="input-group mb-3">
							<label class="input-group-text col-3 text-center" for="knowLabel" id="knowLabel" style="font-weight:bold;">서비스 인지경로</label>&nbsp;&nbsp;
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="svc_know" value="블로그"> 
								<label class="form-check-label" for="블로그">블로그</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="svc_know" value="인터넷카페"> 
								<label class="form-check-label" for="인터넷 카페">인터넷 카페</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="svc_know" value="지인소개"> 
								<label class="form-check-label" for="지인소개">지인 소개</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="svc_know" value="인터넷검색"> 
								<label class="form-check-label" for="인터넷검색">인터넷 검색</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="svc_know" value="재이용고객"> 
								<label class="form-check-label" for="재이용고객">재이용 고객</label>
							</div>
							<span id="knowError" style="color: red; "></span>
						</div>
						
						<!-- ----------------------------------개인정보 수집 이용 동의--------------------------------- -->
						<div class="input-group mb-3" >
							<div class="card w-100">
  								<div class="card-header" style="font-weight:bold;"> 개인정보 수집 및 이용에 대한 안내</div>
 								 <div class="card-body">
    									<p class="card-text">
    									주식회사 머뭄은 기업/단체 및 개인의 정보 수집 및 이용 등 처리에 있어
										아래의 사항을 관계법령에 따라 고지하고 안내해 드립니다.<br>

										1. 정보수집의 이용 목적 : 상담 및 진행<br>
										2. 수집/이용 항목 : 이름, 연락처, 내용 등<br>
										3. 보유 및 이용기간 : 상담 종료후 6개월, 정보제공자의 삭제 요청시 즉시<br>
										4. 개인정보처리담당 : 전화 1234-1004 / 이메일 meomum@meomum.com</p>
  								</div>
							</div>
						</div>

						<!-- ----------------------------------동의 여부--------------------------------- -->
						<div class="input-group mb-3">
						  <div class="form-check">
						    <input class="form-check-input" type="checkbox" id="svc_pia" value="Y" name="svc_pia" required="required">
						    <label class="form-check-label" for="input_svc" style="font-weight: bold;">(필수)개인정보 수집 및 이용에 동의합니다</label>
						  </div>
						</div>

						<!-- ----------------------------------유의사항--------------------------------- -->
						<div class="input-group mb-3">
						  <div class="card w-100">
						    <div class="card-header" style="font-weight:bold;"> 유의사항</div>
						    <div class="card-body">
						      <p class="card-text">
						        방문 견적 신청 2일 전에는 수정 불가한 점 참고 부탁드립니다.<br>
						        피치 못할 사정으로 취소 시, 1234-1004로 전화부탁드립니다. </p>
						    </div>
						  </div>
						</div>
						<!-- ----------------------------------예약버튼--------------------------------- -->
						<div class="d-flex justify-content-between align-items-center">
							<div>
						        <input type="reset" value="초기화" class="btn btn-secondary btn-block" style="font-weight:bold;">
						    </div>
						    <div>
						        <input type="submit" value="예약" class="btn btn-primary btn-block" style="font-weight:bold;">
						    </div>

						</div>

				</form>
			</div>
		</div>
	</div>

	<!-- 현재 시간보다 이전 시간 선택 불가 제약 -->
	<script>
		var dateElement = document.getElementById('svc_days');
		var now = new Date();
		var date = new Date(now.getTime() + 24 * 60 * 60 * 1000
				- now.getTimezoneOffset() * 60000).toISOString().split("T")[0];
		dateElement.value = date;
		dateElement.setAttribute("min", date);

		function setMinDate() {
			if (dateElement.value < date) {
				dateElement.value = date;
			}
		}
	</script>

	<!-- 카카오 주소 API -->
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="js/svc/findAddr.js">
		
	</script>


	<%@include file="/WEB-INF/views/footer.jsp"%>
</body>

</html>