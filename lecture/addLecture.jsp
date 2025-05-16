<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>강의 영상 업로드</title>
<style>
    .form-table {
        width: 100%;
        border-collapse: collapse;
    }
    .form-table th, .form-table td {
        padding: 10px;
        border: 1px solid #ddd;
    }
    .form-table th {
        width: 20%;
        text-align: left;
        background-color: #f2f2f2;
    }
    .form-table td {
        width: 80%;
    }
    .form-table input[type="text"], .form-table textarea {
        width: 95%;
        padding: 8px;
        margin: 4px 0;
        border: 1px solid #ccc;
        border-radius: 4px;
    }
    .form-table input[type="file"] {
        padding: 8px;
    }
    .form-table button {
        width: 100px;
        padding: 10px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }
    .form-table button:hover {
        background-color: #45a049;
    }
    /* 목록 버튼만 특별히 흰색 배경으로 설정 */
    .form-table .list-button {
        background-color: white;
        color: black; /* 텍스트 색상을 검은색으로 변경하여 가독성 향상 */
        border: 1px solid black;
    }
    .form-table .list-button:hover {
    	background-color: #f0f4f0;
    }
    select[name="category"] {
    width: 200px; /* 너비 조정 */
    height: 40px; /* 높이 조정 */
    font-size: 16px; /* 옵션의 글꼴 크기 조정 */
}
</style>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<link href="<c:url value='/resources/css/board.css'/>" rel="stylesheet" />

<script>
function validateForm() {
	var lectureName = document.forms["fileForm"]["lectureName"].value;
    var title = document.forms["fileForm"]["title"].value;
    var category = document.forms["fileForm"]["category"].value;
    var description = document.forms["fileForm"]["description"].value;
    var video = document.forms["fileForm"]["filename"].value;
    
    if (lectureName == "" || title == "" || category == "" || description == "" || filename == "") {
        alert("이름, 제목, 카테고리, 강의 소개, 동영상 파일 첨부, 가격은 필수 입력 사항입니다.");
        return false; // 폼 제출을 중단
    }
    return true; // 모든 검사를 통과하면 폼 제출을 계속 진행
}
</script>

</head>
<body class="d-flex flex-column h-100">
<fmt:setLocale value ='<%=request.getParameter("language") %>' />

<main class="flex-shrink-0">
    <jsp:include page="/menu.jsp" />
	<br />
	<fmt:setLocale value='<%=request.getParameter("language") %>' />
	<fmt:bundle basename="bundle.message">
	    <div class="container">
        <h1>강의 등록하기</h1><br />
    <form name="fileForm" method="post" enctype="multipart/form-data" onsubmit="return validateForm();" action="<c:url value='/lecture/addLecture_process.jsp'/>">
        <table class="form-table">
            <tr>
                <th><fmt:message key="l_title" /></th>
                <td><input type="text" name="lectureName"></td>
            </tr>
            <tr>
                <th><fmt:message key="category" /></th>
                <td>
                	<select name="category">
                		<option value="운동"><fmt:message key="ca_workOut" /></option>
                		<option value="요리"><fmt:message key="ca_cooking" /></option>
                		<option value="기타"><fmt:message key="ca_etc" /></option>
                	</select>
                </td>
            </tr>
            <tr>
                <th><fmt:message key="description" /></th>
                <td><textarea name="description" rows="4"></textarea></td>
            </tr>
            <tr>
                <th><fmt:message key="unitPrice" /></th>
                <td><input type="text" name="unitPrice"></td>
            </tr>
            <tr>
                <th><fmt:message key="filename" /></th>
                <td><input type="file" name="video"></td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;">
                    <button type="submit"><fmt:message key="btn_insert" /></button>
                    <button class="list-button"><a href="<c:url value='/profile/specialPage.jsp'/>"><fmt:message key="btn_list" /></a></button>
                </td>
            </tr>
        </table>
    </form>
    </div>
		</fmt:bundle>
    </main>
	<jsp:include page="/footer.jsp" />
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="<c:url value='/resources/js/board.js'/>"></script>
</body>
</html>
