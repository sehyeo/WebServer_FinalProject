<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%
    String sessionId = (String) session.getAttribute("sessionId");
    if (sessionId == null) {
        response.sendRedirect("/user/loginUser.jsp"); // 로그인 페이지로 리다이렉트
        return;
    }
%>
<sql:setDataSource var="dataSource" url="jdbc:mysql://localhost:3306/LifeDB" driver="com.mysql.jdbc.Driver" user="root" password="1234" />

<sql:update dataSource="${dataSource}" var="resultSet">
    DELETE FROM member WHERE id = ?
    <sql:param value="<%= sessionId %>" />
</sql:update>

<c:if test="${resultSet >= 1}">
    <%
        session.invalidate(); // 세션 무효화
    %>
    <c:redirect url="/user/resultUser.jsp?msg=deleted" />
</c:if>
<c:if test="${resultSet < 1}">
    <c:redirect url="<c:url value='/errorPage.jsp'/>" /> <!-- 삭제 실패 시 에러 페이지로 리다이렉트 -->
</c:if>
