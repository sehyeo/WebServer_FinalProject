<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>소개</title>
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link href="<c:url value='/resources/css/board.css'/>" rel="stylesheet" />
    </head>
    <body class="d-flex flex-column">
        <jsp:include page="/menu.jsp" />
    
    	<%!
	    	String introduce = "소개";
	    	String proj = "프로젝트 주제";
			String projSubject = "비전공자를 대상으로 한 자기계발 인터넷 강의 웹서비스";
	    	String keyword_1 = "아이디어";
			String kwExplain_1 = "공부용 인강이 아닌 운동, 요리 등 카테고리별 영상?을 모아 볼 수 있으면 좋을 것 같다는 생각.";
		 %>	      
    
        <main class="flex-shrink-0">

            <!-- Header-->
            <header class="py-5">
                <div class="container px-5">
                    <div class="row justify-content-center">
                        <div class="col-lg-8 col-xxl-6">
                            <div class="text-center my-5">
                                <h1 class="fw-bolder mb-3"><%=introduce %></h1>
                                <p class="lead fw-normal text-muted mb-4">내용</p>
                                <a class="btn btn-primary btn-lg" href="#scroll-target">이야기</a>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <!-- About section #-->
            <section class="py-5 bg-light" id="scroll-target">
                <div class="container px-5 my-5">
                    <div class="row gx-5 align-items-center">
                        <div class="col-lg-6"><img class="img-fluid rounded mb-5 mb-lg-0" src="https://dummyimage.com/600x400/343a40/6c757d" alt="..." /></div>
                        <div class="col-lg-6">
                            <h2 class="fw-bolder"><%=proj %></h2>
                            <p class="lead fw-normal text-muted mb-0"><%=projSubject %></p>
                        </div>
                    </div>
                </div>
            </section>
            
            <!-- Features section-->
            <section class="py-5" id="features">
                <div class="container px-5 my-5">
                    <div class="row gx-5">
                        <div class="col-lg-4 mb-5 mb-lg-0"><h2 class="fw-bolder mb-0">Learning is FElicity, &nbsp; &nbsp; 배움의 즐거움</h2></div>
                        <div class="col-lg-8">
                            <div class="row gx-5 row-cols-1 row-cols-md-2">
                                <div class="col mb-5 h-100">
                                    <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-building"></i><i class="bi bi-toggles2"></i><i class="bi bi-collection"></i><i class="bi bi-toggles2"></i></div>
                                    <h2 class="h5"><%=keyword_1 %></h2>
                                    <p class="mb-0"><%=kwExplain_1 %></p>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            
            <!-- Team members section-->
            <section class="py-5 bg-light">
                <div class="container px-5 my-5">
                    <div class="text-center">
                        <h2 class="fw-bolder">팀 소개</h2>
                        <p class="lead fw-normal text-muted mb-5">개발자 프로필</p>
                    </div>
                    
                    <div class="row gx-5 row-cols-1 row-cols-sm-2 row-cols-xl-4 justify-content-center">
                        <div class="col mb-5 mb-5 mb-xl-0">
                            <div class="text-center">
                                <img class="img-fluid rounded-circle mb-4 px-4" src="<c:url value='/resources/assets/jyw.png'/>" alt="jyw" />
                                <h5 class="fw-bolder">장예원</h5>
                                <div class="fst-italic text-muted">2022301070</div>
                                <div class="text-muted">INTP</div>
                            </div>
                        </div>
                        <div class="col mb-5 mb-5 mb-xl-0">
                            <div class="text-center">
                                <img class="img-fluid rounded-circle mb-4 px-4" alt="ksh" src="<c:url value='/resources/assets/ksh.png'/>" />
                                <h5 class="fw-bolder">김승현</h5>
                                <div class="fst-italic text-muted">2022301021</div>
                                <div class="text-muted">INFJ</div>
                            </div>
                        </div>
                   </div>
                </div>
            </section>
        </main>
        <jsp:include page="/footer.jsp" />
        <!-- Bootstrap core JS-->
        <script src="./resources/js/home.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
