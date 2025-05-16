<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>월별 이용권 결제</title>
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link href="<c:url value='/resources/css/board.css'/>" rel="stylesheet" />
    </head>
    <body class="d-flex flex-column">
        <main class="flex-shrink-0">
            <jsp:include page="/menu.jsp" />
            <!-- Pricing section-->
            <section class="bg-light py-5">
                <div class="container px-5 my-5">
                    <div class="text-center mb-5">
                        <h1 class="fw-bolder">L!FE 구독</h1>
                    </div>
                    <div class="row gx-5 justify-content-center">
                        <!-- Pricing card pro-->
                        <div class="col-lg-6 col-xl-12 text-center">
                            <div class="card mb-5 mb-xl-0">
                                <div class="card-body p-5">
                                    <div class="text-uppercase fw-bold display-6">
                                        <i class="bi bi-star-fill text-warning">한달</i>
                                        3만4천원
                                    </div>
                                    <div class="mb-3">
                                        <span class="fw-bold">7일 내 불만족 시 100% 환불*</span>
                                        <span class="text-muted">무료체험 미이용회원에 한함</span>
                                    </div>
                                    <br />
                                    <ul class="list-unstyled mb-4">
                                        <li class="mb-2">
                                            <i class="bi text-primary"></i>
                                            <h5>L!FE 월간구독권은</h5>
                                            <h5>한 달 단위로 등록가능한</h5>
                                            <h5><strong>인터넷강의 수강권 입니다.</strong></h5>
                                        </li>
                                        <br />
                                        <li class="mb-2">
                                            <h5>넷플릭스나 휴대폰 요금처럼</h5>
                                            <h5><strong>매 월 간편 자동결제</strong></h5>
                                        </li>
                                        <br />
                                        <li class="mb-2">
                                            <h5>불필요한 달에는</h4>
                                            <h5><strong>클릭 한번으로 해지</strong></h5>
                                        </li>
                                        <br />
                                        <li class="text-primary mb-2">
                                            <h5><strong>하루 천원정도의 돈으로</strong></h5>
                                            <h5><strong>모든 강의를</strong></h4>
                                            <h5><strong>무제한 수강할 수 있습니다.</strong></h5>
                                        </li>
                                        <br />
                                        <div class="bg-primary text-white">
                                        	<h3>6월 15일 등록회원부터</h3>
                                        	<h3>구독료가 인상됩니다!</h3>
                                        	<img src="<c:url value='/resources/assets/surprised.png' />" alt="놀란얼굴" width="150px" height="150px" />
                                        	<div class="text-warning">
                                        		<h4><strong>마음에 안들면 100% 환불되니</strong></h4>
                                        		<h4><strong>서둘러 등록하세요!*</strong></h4>
                                        	</div>
                                        </div>
                                    </ul>
                                    <div class="d-grid"><a class="btn btn-outline-primary" href="<c:url value='/payment/paymentInfo.jsp'/>">구독하기</a></div>
                                    <h7>*7일 내 전액환불 가능 • 언제든지 해지가능</h7><br />
                                    <h7>*L!FE 7일 전액환불 혜택은, 무료체험을 해본적이 없는 회원을 위한 것이며, 고객센터를 통해 전액환불을 진행할 수 있습니다.</h7><br />
                                    <h7>*오늘은 본 이용약관이 적용됩니다.</h7>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </div>
            </section>
        </main>
        <div class="bg-black text-white">
        	<br />
			<p> 이용권 구매 주의 사항
			<pre>• 이용권은 부가세(VAT) 포함 가격입니다.
• 이용권 가격은 변동될 수 있습니다.
• 자동결제는 1개월 주기로 매월 구매한 날과 동일한 날짜에 결제됩니다.
해당월에 동일한 날짜가 없으면 말일에 결제됩니다.
• 결제 당일을 제외한 이용기간 중 언제든지 자동결제를 해지하실 수 있습니다. 해지하면 더 이상 추가 결제되지 않으며, 다음 결제 예정일까지 서비스를 계속 이용하실 수 있습니다. <a class="underline text-white" href="#">구매내역 바로가기</a>
• 고객센터를 통한 자동결제해지 신청은 본인만 가능합니다.
<a class="underline text-white font-bold" href="<c:url value='/contact/contact.jsp'/>">• 이용권 구매 후 7일이 경과 되었거나 이용권을 사용한 경우 L!FE 고객센터를 통해 환불 절차를 문의해주시기 바랍니다.
• 이용권 구매 후 환불을 원하시면 L!FE 고객센터에 연락해 주시기 바랍니다.</a>
			</pre>
        	<br />
        	</div>
        <jsp:include page="/footer.jsp" />
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="<c:url value='/resources/js/board.js'/>"></script>
    </body>
</html>
