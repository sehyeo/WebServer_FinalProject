<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
    <link href="<c:url value='/resources/css/board.css'/>" rel="stylesheet" />
    <title>관리자 페이지</title>
    <style>
        .settings-option {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px;
            background: #f8f9fa;
            border-radius: 5px;
            margin-bottom: 15px;
            border: 1px solid #e0e0e0;
            text-decoration: none;
            color: #000;
        }
        .settings-option h5 {
            margin: 0;
            font-size: 18px;
        }
        .settings-option p {
            margin: 0;
            font-size: 14px;
            color: #6c757d;
        }
        .settings-option .arrow {
            font-size: 18px;
            color: #6c757d;
        }
    </style>
</head>
<body class="d-flex flex-column h-100">
<main class="flex-shrink-0">
    <jsp:include page="/menu.jsp" />
    <br />
    <div class="container">
        <a class="settings-option" href="<c:url value='/admin/manageUsers.jsp'/>">
            <div>
                <h5>전체 회원 조회</h5>
                <p>사이트에 등록된 모든 회원의 정보를 조회할 수 있는 페이지입니다. 회원의 아이디, 이름, 이메일, 가입일, 상태(활성/비활성) 등을 확인할 수 있습니다.</p>
            </div>
            <div class="arrow">&gt;</div>
        </a>
        <a class="settings-option" href="<c:url value='/admin/manageLectures.jsp'/>">
            <div>
                <h5>강의 관리</h5>
                <p>사이트에 등록된 모든 강의를 조회하고, 새로운 강의를 추가하거나 기존 강의를 수정, 삭제할 수 있는 페이지입니다. 강의의 제목, 내용, 가격, 강사 정보 등을 관리할 수 있습니다.</p>
            </div>
            <div class="arrow">&gt;</div>
        </a>
        <a class="settings-option" href="<c:url value='/admin/manageBoards.jsp'/>">
            <div>
                <h5>게시물 관리</h5>
                <p>회원들이 작성한 게시물들을 조회하고, 사이트의 규정에 어긋날 시 삭제할 수 있는 페이지입니다.</p>
            </div>
            <div class="arrow">&gt;</div>
        </a>
        <a class="settings-option" href="<c:url value='/admin/manageContacts.jsp'/>">
            <div>
                <h5>문의사항 관리</h5>
                <p>회원들이 제출한 문의사항을 조회하고, 답변할 수 있는 페이지입니다. 문의 내용, 회원 정보, 문의 날짜 등을 확인하고 답변을 작성할 수 있습니다.</p>
            </div>
            <div class="arrow">&gt;</div>
        </a>
        <a class="settings-option" href="<c:url value='/admin/manageReports.jsp'/>">
            <div>
                <h5>신고 내역 관리</h5>
                <p>회원들이 제출한 신고내역을 확인할 수 있는 페이지입니다.</p>
            </div>
            <div class="arrow">&gt;</div>
        </a>
    </div>
</main>
<jsp:include page="/footer.jsp" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="<c:url value='/resources/js/board.js'/>"></script>
</body>
</html>
