<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>payment.jsp</title>
<link
	href="${pageContext.request.contextPath }/resources/harVest_css/payment.css"
	rel="stylesheet">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description"
	content="Start your development with JoeBLog landing page.">
<meta name="author" content="Devcrud">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/assets/vendors/themify-icons/css/themify-icons.css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<!-- Bootstrap + JoeBLog main styles -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/assets/css/joeblog.css">
<style>
/* Make the image fully responsive */
.carousel-inner img {
	width: 100%;
	height: 100%;
}
</style>
</head>
<body data-spy="scroll" data-target=".navbar" data-offset="40" id="home">
<body>

	<!-- page-header -->
	<%--   	<jsp:include page="../inc/header.jsp"></jsp:include> --%>
	<!-- page First Navigation -->
	<nav class="navbar navbar-light bg-white">
		<div class="container">
			<a class="navbar-brand" href="#"> <img
				src="${pageContext.request.contextPath }/resources/harVest_img/harvest_logo.png">
			</a>
			<div class="socials">
				<a href="javascript:void(0)">프로젝트 올리기</a> <a
					href="${pageContext.request.contextPath }/resources/views/loginPage.jsp">로그인</a>
			</div>
		</div>
	</nav>
	<!-- End Of First Navigation -->


	<!-- Page Second Navigation -->
	<nav
		class="navbar custom-navbar navbar-expand-md navbar-light bg-white sticky-top shadow">
		<div class="container">
			<button class="navbar-toggler ml-auto" type="button"
				data-toggle="collapse" data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav">
					<li class="nav-item dropdown"><a
						class="nav-link text-dark dropdown-toggle" href="#"
						id="navbarDropdown" role="button" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> 카테고리 </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="#">1</a> <a class="dropdown-item"
								href="#">2</a> <a class="dropdown-item" href="#">3</a>
						</div></li>
					<li class="nav-item"><a class="nav-link text-dark"
						href="${pageContext.request.contextPath }/resources/views/mainPage.jsp">홈</a>
					</li>
					<li class="nav-item"><a class="nav-link text-dark"
						href="${pageContext.request.contextPath }/resources/views/popularPage.jsp">인기</a>
					</li>
					<li class="nav-item"><a class="nav-link text-dark" href="#">신규</a>
					</li>
					<li class="nav-item"><a class="nav-link text-dark" href="#">마감임박</a>
					</li>
					<li class="nav-item"><a class="nav-link text-dark" href="#">공개예정</a>
					</li>
				</ul>
				<div class="navbar-nav ml-auto">
					<div class="input-group">
						<input type="text" class="form-control form-control-sm"
							placeholder="Search" aria-label="Recipient's username"
							aria-describedby="button-addon2">
						<button class="btn btn-outline-secondary btn-sm" type="button"
							id="button-addon2">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
						<path
									d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
					</svg>
						</button>
					</div>

				</div>
			</div>
		</div>
	</nav>
	<!-- End Of Page Second Navigation -->
	<!-- header 들어갈 부분 -->


	<div id="wrapper">
		<div class="payment_container">
			<div class="payment_cont">
				<h1>프로젝트 후원하기</h1>
				<div>상품정보 넣는 곳<br>
					<span>프로젝트 이름</span>
					
					
				
				
				</div>
				
				<div>회원정보 넣는 곳 <br>
					${dto.name}<br>
					${dto.address}<br>
					${dto.phone}
				
				
				</div>
				<div>결제수단 넣는 곳</div>
			</div>
			<div class="payment_res">
				<!-- 				<div>최종결제 넣는 곳</div> -->
				<div>
					<!-- jQuery -->
					<script type="text/javascript"
						src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
					<!-- iamport.payment.js -->
					<script type="text/javascript"
						src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
					<P>아임포트 테스트</P>
					<script type="text/javascript">
							IMP.init("imp22281850"); 
							function requestPay() {
							  IMP.request_pay({
							    pg: "html5_inicis", 				//KG이니시스 코드값
							    pay_method: "card", 				//결제수단
							    merchant_uid : 'merchant_'+new Date().getTime(),
							    name: "펀딩제품",
							    amount: 100,    					//금액                     
							    buyer_email: "", 	//주문자 이메일
							    buyer_name: "김민영",					//주문자 이름
							    buyer_tel: "010-1234-5678", 		//주문자 전화번호
							    buyer_addr: "부산진구 동천로 어쩌구", 		//주문자 주소
						// 	    m_redirct_url : "", 				//모바일 결제시 사용할 url
							    
							  }, function (rsp) { // callback
						    	if (rsp.success) {
						    	    // 결제 성공 시 로직
						            var msg = "결제가 완료되었습니다.";
						            alert(msg);
						            
						            //후원페이지 다시 돌아가기
						            location.href = "";
							  	} else {
							  		
								// 결제 실패 시 로직
								alert("결제 실패: "+ rsp.error_msg);
								
								//돌아가기 후원결제목록 페이지
								location.href = "";
// 								${pageContext.request.contextPath }/payment/paySuccess)
							    }
							  });
						 	}
						</script>
					<button id="pay" type="button" onclick="requestPay()">결제테스트</button>
				</div>

			</div>
		</div>
	</div>





	<!--    <!-- Page Footer -->
	<!--     <footer class="page-footer"> -->
	<!--         <div class="container"> -->
	<!--             <div class="row align-items-center justify-content-between border-top"> -->
	<!--                 <div class="col-md-7 text-center text-md-left"> -->
	<!--                 <p class="mb-0 mt-4 small"> -->
	<!--                 회사명 텀블벅(주) 주소 서울 서초구 서초대로 398, 19층 (서초동, BNK디지털) -->
	<!--                 사업자등록번호 123-45-67890 -->
	<!--                 통신판매업 신고번호 대표번호 02-0000-0000 Tumblbug Inc.</p> -->
	<!--                 </div> -->
	<!--                 <div class="col-md-5 text-center text-md-right"> -->
	<!--                     <div class="socials"> -->
	<!--                         <a href="javascript:void(0)" class="font-weight-bold text-muted mr-4"><i class="ti-facebook pr-1"></i></a> -->
	<!--                         <a href="javascript:void(0)" class="font-weight-bold text-muted mr-4"><i class="ti-twitter pr-1"></i></a> -->
	<!--                         <a href="javascript:void(0)" class="font-weight-bold text-muted mr-4"><i class="ti-pinterest-alt pr-1"></i></a> -->
	<!--                         <a href="javascript:void(0)" class="font-weight-bold text-muted mr-4"><i class="ti-instagram pr-1"></i></a> -->
	<!--                         <a href="javascript:void(0)" class="font-weight-bold text-muted mr-4"><i class="ti-youtube pr-1"></i></a> -->
	<!--                     </div> -->
	<!--                 </div>   -->
	<!--             </div> -->
	<!--         </div>       -->
	<!--     </footer> -->
	<!-- End of Page Footer -->
	<!-- Page Footer -->
	<jsp:include page="../inc/footer.jsp"></jsp:include>
	<!-- core  -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/vendors/jquery/jquery-3.4.1.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/assets/vendors/bootstrap/bootstrap.bundle.js"></script>

	<!-- JoeBLog js -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/js/joeblog.js"></script>


</body>
</html>