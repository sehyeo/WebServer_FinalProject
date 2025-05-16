<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="dto.Member" %>
<%@ page import="dao.MemberRepository" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<style>
h1 {
    text-align: center;
}
table {
    margin: 0 auto;
    width: 100%;
    border-collapse: collapse;
}
th, td {
    padding: 8px;
    text-align: center;
}
th {
    background-color: #f2f2f2 !important;
}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="<c:url value='/resources/css/board.css'/>" rel="stylesheet" />
<title>회원 정보 조회 페이지</title>
</head>
<body class="d-flex flex-column h-100">
<main class="flex-shrink-0">
<jsp:include page="/menu.jsp" />
<br />
<div class="container">
<h1>회원 정보 조회</h1>
<br />
<%
    MemberRepository dao = new MemberRepository();
    List<Member> membersList = dao.listMembers();
%>
<table class="table table-bordered">
    <tr class="text-center">
        <th>아이디</th>
        <th>비밀번호</th>
        <th>이름</th>
        <th>성별</th>
        <th>생일</th>
        <th>이메일</th>
        <th>전화번호</th>
        <th>가입일자</th>
    </tr>
    <%
        for (Member member : membersList) {
    %>
    <tr>
        <td><%= member.getId() %></td>
        <td><%= member.getPassword() %></td>
        <td><%= member.getName() %></td>
        <td><%= member.getGender() %></td>
        <td><%= member.getBirth() %></td>
        <td><%= member.getMail() %></td>
        <td><%= member.getPhone() %></td>
        <td><%= member.getTimestamp() %></td>
    </tr>
    <%
        }
    %>
</table>
</div>
</main>
<jsp:include page="/footer.jsp" />
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="<c:url value='/resources/js/board.js'/>"></script>
</body>
</html>
