<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title>자주 묻는 질문들</title>
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link href="<c:url value='/resources/css/board.css'/>" rel="stylesheet" />
        <style>
        	.sticky-container {
            position: -webkit-sticky; /* For Safari */
            position: sticky;
            top: 100px;
            overflow-y: auto;
            max-height: 100vh; /* Adjust this value as needed */
        	}
        	.question-group {
        		border-radius: 2.5rem;
        	}
        	.question-button {
        		font-size: 15px;
        		padding: 10px 30px;
        		border:1px solid blue;
        		margin-top: 10px;
        	}
    	</style>
    </head>
    <body class="d-flex flex-column h-100">
        <main class="flex-shrink-0">
            <jsp:include page="/menu.jsp" />
            <!-- Page Content-->
            <section class="py-5">
                <div class="container px-5 my-5">
                    <div class="text-center mb-5">
                        <h1 class="fw-bolder">자주 묻는 질문들</h1>
                        <p class="lead fw-normal text-muted mb-0">frequently asked questions</p>
                    </div>
                    <div class="row gx-5">
                        <div class="col-xl-8">
                            <!-- FAQ Accordion 1-->
                            <h2 class="fw-bolder mb-3">계정</h2>
                            <div class="accordion mb-5" id="accordionAccount">
                                <div class="accordion-item">
                                    <h3 class="accordion-header" id="headingAccountOne"><button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseAccountOne" aria-expanded="true" aria-controls="collapseAccountOne">구매했던 강의가 전부 사라졌어요</button></h3>
                                    <div class="accordion-collapse collapse show" id="collapseAccountOne" aria-labelledby="headingAccountOne" data-bs-parent="#accordionAccount">
                                        <div class="accordion-body">
                                            <strong>잠깐! 지금 로그인하신 계정으로 구매하신 것이 맞으신가요?</strong>
                                            L!FE는 여러 개의 계정을 동시에 사용할 수 있어요. 소유하신 다른 계정이 있다면 확인 부탁드려요.

                                            ※ 소유하신 다른 계정이 기억나지 않는다면,
                                            <a href="<c:url value='/user/findAccount.jsp'/>">[아이디(이메일) 찾기]</a>에서 전화번호 인증 후 계정을 찾으실 수 있어요 :-)
                                        </div>
                                    </div>
                                </div>
                                <div class="accordion-item">
                                    <h3 class="accordion-header" id="headingAccountTwo"><button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseAccountTwo" aria-expanded="false" aria-controls="collapseAccountTwo">이메일 계정을 변경하고 싶어요</button></h3>
                                    <div class="accordion-collapse collapse" id="collapseAccountTwo" aria-labelledby="headingAccountTwo" data-bs-parent="#accordionAccount">
                                        <div class="accordion-body">
                                            <strong>다른 이메일 주소로 변경하고 싶을 경우 방법은 아래와 같아요.</strong>
                                            1. [프로필 아이콘 > 설정 > 계정 정보 > 이메일]에서 새로운 이메일 입력
                                            2. 안내된 인증 절차를 거치면 계정 변경 완료

                                            ※ 소셜 계정으로 가입한 경우 로그아웃 상태에서 '비밀번호 찾기'를 통해 <strong>비밀번호를 먼저 설정</strong> 후 진행해 주셔야 해요.
                                            <br />
                                            <strong>소셜 계정을 일반 계정(L!FE)으로 전환하고 싶을 경우 방법은 아래와 같아요.</strong>
                                            1. 카카오톡, 구글 등 소셜 계정으로 가입하셨다면?
                                            2. 로그아웃 상태에서 '비밀번호 찾기'로 비밀번호 생성(단독 계정 생성)
                                            3. 소셜 연동 해지: 카카오톡/구글 등 소셜 설정에 들어가서 연동 해지
                                        </div>
                                    </div>
                                </div>
                                <div class="accordion-item">
                                    <h3 class="accordion-header" id="headingAccountThree"><button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseAccountThree" aria-expanded="false" aria-controls="collapseAccountThree">비밀번호를 찾고 싶어요</button></h3>
                                    <div class="accordion-collapse collapse" id="collapseAccountThree" aria-labelledby="headingAccountThree" data-bs-parent="#accordionAccount">
                                        <div class="accordion-body">
                                            <strong>로그인 화면에서 '비밀번호 찾기'를 클릭해주세요.</strong>
                                            사용 중인 계정을 입력하면 이메일을 통해 비밀번호 변경 링크를 보내드려요.
                                            <br />
                                            ※ 혹시, 소셜 계정으로 연동해 사용 중이신가요? (카카오톡/페이스북/구글/깃허브/애플)
                                            소셜 계정의 경우 L!FE에서는 여러분의 비밀번호를 보관하고 있지 않아요.
                                            L!FE에서 사용하는 별도의 비밀번호를 생성하고 싶으시다면 계정 정보에서 새로운 비밀번호를 발급받아주세요.
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- FAQ Accordion 2-->
                            <h2 class="fw-bolder mb-3">강의</h2>
                            <div class="accordion mb-5" id="accordionLecture">
                                <div class="accordion-item">
                                    <h3 class="accordion-header" id="headingLectureOne"><button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseLectureOne" aria-expanded="true" aria-controls="collapseLectureOne">수강 전인데 강의에 궁금한 점이 있어요</button></h3>
                                    <div class="accordion-collapse collapse show" id="collapseLectureOne" aria-labelledby="headingLectureOne" data-bs-parent="#accordionLecture">
                                        <div class="accordion-body">
                                            <strong>강의를 결제하기 전, 궁금한 점이 있으실 경우 [수강 전 문의 게시판]을 통해 강의자에게 직접 질문을 남길 수 있어요.</strong>
                                            ※ 수강 전 문의하기 기능을 설정한 강의에 한정하여 제공되니 꼭 확인해 주세요.
                                        </div>
                                    </div>
                                </div>
                                <div class="accordion-item">
                                    <h3 class="accordion-header" id="headingLectureTwo"><button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseLectureTwo" aria-expanded="false" aria-controls="collapseLectureTwo">강의자료는 어디에서 확인하나요?</button></h3>
                                    <div class="accordion-collapse collapse" id="collapseLectureTwo" aria-labelledby="headingLectureTwo" data-bs-parent="#accordionLecture">
                                        <div class="accordion-body">
                                            <strong>강의 동영상을 클릭 후 상단 바 혹은 커리큘럼 내에 구름 아이콘을 확인해 주세요.</strong>
                                            ※ 강의마다 강의자료가 위치한 섹션이 다르니 참고해 주세요.
                                            ※ 강의 영상 하단 수업노트에 자료 링크를 첨부해주시는 경우가 있으니 참고해 주세요.
                                        </div>
                                    </div>
                                </div>
                                <div class="accordion-item">
                                    <h3 class="accordion-header" id="headingLectureThree"><button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseLectureThree" aria-expanded="false" aria-controls="collapseLectureThree">비밀번호를 찾고 싶어요</button></h3>
                                    <div class="accordion-collapse collapse" id="collapseLectureThree" aria-labelledby="headingLectureThree" data-bs-parent="#accordionLecture">
                                        <div class="accordion-body">
                                            <strong>로그인 화면에서 '비밀번호 찾기'를 클릭해주세요.</strong>
                                            사용 중인 계정을 입력하면 이메일을 통해 비밀번호 변경 링크를 보내드려요.
                                            <br />
                                            ※ 혹시, 소셜 계정으로 연동해 사용 중이신가요? (카카오톡/페이스북/구글/깃허브/애플)
                                            소셜 계정의 경우 L!FE에서는 여러분의 비밀번호를 보관하고 있지 않아요.
                                            L!FE에서 사용하는 별도의 비밀번호를 생성하고 싶으시다면 계정 정보에서 새로운 비밀번호를 발급받아주세요.
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- FAQ Accordion 3-->
                            <h2 class="fw-bolder mb-3">서비스 오류</h2>
                            <div class="accordion mb-5 mb-xl-0" id="accordionService">
                                <div class="accordion-item">
                                    <h3 class="accordion-header" id="headingServiceOne"><button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseServiceOne" aria-expanded="true" aria-controls="collapseServiceOne">L!FE 서비스 이용 중 오류가 발생해요</button></h3>
                                    <div class="accordion-collapse collapse show" id="collapseServiceOne" aria-labelledby="headingServiceOne" data-bs-parent="#accordionService">
                                        <div class="accordion-body">
                                            <strong>L!FE는 구글 크롬 브라우저에 최적화되어 있어요.</strong>
                                            로그인, 강의 수강 등 서비스 이용 중 오류가 발생할 경우 크롬 브라우저에서 다시 진행해 주세요.
                                            ※ 혹시 크롬 브라우저에서도 오류가 발생한다면 아래 안내사항을 체크해보세요.

                                            ❶ 크롬 시크릿 모드에서 재실행합니다.
                                            시크릿 모드에서 정상 작동한다면, 확장 프로그램의 문제일 가능성이 높습니다.
                                            ※  시크릿 모드 경로 : 크롬 브라우저 오른쪽 상단 더보기 ( : )클릭 - 새 시크릿 창

                                            ❷ 강력 새로고침 후 재실행합니다.
                                            새로운 기능 배포 및 버전 업데이트로 인한 일시적 오류일 수 있습니다.
                                            ※ 강력 새로고침 단축키 : [윈도우 Ctrl + Shift + R] / [맥 Cmd + Shift + R]
                                        </div>
                                    </div>
                                </div>
                                <div class="accordion-item">
                                    <h3 class="accordion-header" id="headingServiceTwo"><button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseServiceTwo" aria-expanded="false" aria-controls="collapseServiceTwo">강의 결제 중 오류가 발생해요</button></h3>
                                    <div class="accordion-collapse collapse" id="collapseServiceTwo" aria-labelledby="headingServiceTwo" data-bs-parent="#accordionService">
                                        <div class="accordion-body">
                                            결제 시 오류가 발생하는 경우, <strong>현재 이용 중인 브라우저가 아닌 타 브라우저에서 다시 한번 결제를 진행해 주세요.</strong>
                                            ※ 다른 브라우저 환경에서도 결제 오류가 계속 발생한다면, 홈페이지 우측 하단 물음표 문의 버튼 [실시간 버그/서비스오류] 를 통해 상세 내용을 남겨주세요. 확인 후 안내 도와드리겠습니다.
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        

                        <div class="col-xl-4">
                        <div class="sticky-container">
                            <div class="card border-0 bg-light mt-xl-5">
                                <div class="card-body p-4 py-lg-5">
                                    <div class="d-flex align-items-center justify-content-center">
                                        <div class="text-center">
                                            <div class="h6 fw-bolder">궁금한 점이 있으신가요?</div><br />
                                            <div class="question-group">
                                            <p class="text-muted mb-4">
                                                <textarea id="commentText" class="form-control" rows="3" placeholder="궁금한 점..."></textarea>
                                                <button class="question-button bg-primary text-white" type="submit">전송</button>
                                                <br /><br />
                                                직접 문의 해주시면 최대한 빠르게
                                                <br />
                                                답변드리도록 하겠습니다!
                                            </p>
                                    	</div>
                                    	</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    </div>
                </div>
            </section>
        </main>
        <jsp:include page="/footer.jsp" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="<c:url value='/resources/js/board.js'/>"></script>
    </body>
</html>
