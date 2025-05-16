<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<style>
        .sidebar {
            width: 20%;
            float: left;
            margin-right: 5%;
        }
        .sidebar ul {
            list-style-type: none;
            padding: 0;
        }
        .sidebar ul li {
            margin: 10px 0;
        }
        .sidebar ul li a {
            text-decoration: none;
            color: #333;
        }
        
    </style>
<title>메뉴-myPage</title>
</head>
<body>
	<fmt:setLocale value='<%=request.getParameter("language") %>' />
	<fmt:bundle basename="bundle.message">

	<!-- Navigation-->
	<div class="sidebar">
		<br />
	    <ul>
	        <li><a href="<c:url value='/profile/myPage.jsp'/>">대시보드</a></li>
	        <li><a href="#">게시글</a></li>
	    </ul>
	</div>
</fmt:bundle>
</body>
</html>