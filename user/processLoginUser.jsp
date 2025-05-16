<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String password = request.getParameter("password");
%>

<sql:setDataSource var="dataSource" url="jdbc:mysql://localhost:3306/LifeDB" driver="com.mysql.jdbc.Driver" user="root" password="1234" />

<sql:query dataSource="${dataSource}" var="resultSet">
   SELECT * FROM MEMBER WHERE ID=? and password=?  
   <sql:param value="<%=id%>" />
	<sql:param value="<%=password%>" />
</sql:query>

<c:choose>
    <c:when test="${not empty resultSet.rows}">
        <c:forEach var="row" items="${resultSet.rows}">
            <%
            	session.setAttribute("name", name);
                session.setAttribute("sessionId", id);
            	session.setAttribute("user_id", id);  // userId는 로그인한 사용자의 ID
            	session.setMaxInactiveInterval(60*60);
            %>
            <c:redirect url="resultUser.jsp?msg=2" />
        </c:forEach>
    </c:when>
    <c:otherwise>
        <c:redirect url="loginUser.jsp?error=1" />
    </c:otherwise>
</c:choose>