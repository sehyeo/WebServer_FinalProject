<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%
    request.setCharacterEncoding("UTF-8");

    String id = request.getParameter("id");
    String password = request.getParameter("password");
    String name = request.getParameter("name");
    String gender = request.getParameter("gender");
    String year = request.getParameter("birthyy");
    String month = request.getParameter("birthmm");
    String day = request.getParameter("birthdd");
    String birth = year + "/" + month + "/" + day;
    String mail1 = request.getParameter("mail1");
    String mail2 = request.getParameter("mail2");
    String mail = mail1 + "@" + mail2;
    String phone = request.getParameter("phone");

    Date currentDatetime = new Date(System.currentTimeMillis());
    java.sql.Date sqlDate = new java.sql.Date(currentDatetime.getTime());
    java.sql.Timestamp timestamp = new java.sql.Timestamp(currentDatetime.getTime());

    // Debugging output
    System.out.println("ID: " + id);
    System.out.println("Password: " + password);
    System.out.println("Name: " + name);
    System.out.println("Gender: " + gender);
    System.out.println("Birth: " + birth);
    System.out.println("Mail: " + mail);
    System.out.println("Phone: " + phone);
%>

<sql:setDataSource var="dataSource" url="jdbc:mysql://localhost:3306/LifeDB" driver="com.mysql.jdbc.Driver" user="root" password="1234" />

<!-- ID 중복 확인 -->
<sql:query dataSource="${dataSource}" var="result">
    SELECT id FROM member WHERE id = ?
    <sql:param value="${id}" />
</sql:query>

<c:choose>
    <c:when test="${not empty result.rows}">
        <!-- 중복된 ID가 있을 경우 -->
        <script>
            alert('이미 존재하는 아이디입니다. 다시 시도해주세요.');
            history.back();
        </script>
    </c:when>
    <c:otherwise>
        <!-- 회원 가입 진행 -->
        <sql:update dataSource="${dataSource}" var="resultSet">
            INSERT INTO member VALUES (?, ?, ?, ?, ?, ?, ?, ?)
            <sql:param value="<%=id%>" />
            <sql:param value="<%=password%>" />
            <sql:param value="<%=name%>" />
            <sql:param value="<%=gender%>" />
            <sql:param value="<%=birth%>" />
            <sql:param value="<%=mail%>" />
            <sql:param value="<%=phone%>" />
            <sql:param value="<%=timestamp%>" />
        </sql:update>

        <c:if test="${resultSet >= 1}">
            <c:redirect url="/user/resultUser.jsp?msg=1" />
        </c:if>
        <c:if test="${resultSet < 1}">
            <script>
                alert('회원 가입에 실패했습니다. 다시 시도해주세요.');
                history.back();
            </script>
        </c:if>
    </c:otherwise>
</c:choose>
