<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String sessionId = (String) session.getAttribute("sessionId");
%>
<html>
<head>
<style>
        .search-box {
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 10px 20px;
        }
        .search-box input[type="text"] {
            width: 400px;
            height: 40px;
            border-radius: 25px;
            border: 1px solid #ccc;
            padding-left: 20px;
            font-size: 16px;
        }
        .search-box button {
            background: none;
            border: none;
            cursor: pointer;
            margin-left: -40px;
        }
        .search-box button img {
            width: 20px;
            height: 20px;
            margin-top: -5px;
        }
    </style>
<title>메뉴</title>
</head>
<body>
<!-- Navigation-->
            <nav class="navbar navbar-dark bg-dark">
                <div class="container px-4">
                <c:choose>
                	<c:when test="${empty sessionId}">
                		<a class="navbar-brand" href="<c:url value='/home.jsp'/>">L!FE</a>
                	</c:when>
                	<c:otherwise>
                		<a class="navbar-brand" href="<c:url value='/home.jsp'/>">L!FE</a>
                	</c:otherwise>
                </c:choose>
                    <div class="search-box">
                 <form action="<c:url value='/searchResult.jsp'/>" method="get">
                     <input type="text" name="query" placeholder="배우고 싶은 지식을 입력해보세요.">
                     <button type="submit">
                         <img src="<c:url value='/resources/assets/search.png' />" alt="검색">
                     </button>
                 </form>
               </div>   
                    
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav nav nav-pills">
    						<c:choose>
    							<c:when test="${empty sessionId}">
    								<li class="nav-item"><a class="nav-link" href="<c:url value='/main/about.jsp'/>">팀원소개</a></li>
    								<li class="nav-item dropdown">
    									<a class="nav-link dropdown-toggle" id="navbarDropdownLectureList" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">강의</a>
    									<ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownLectureList">
    										<li><a class="dropdown-item" href="<c:url value='/lecture/lectures.jsp?category=전체'/>">전체</a></li>
        									<li><a class="dropdown-item" href="<c:url value='/lecture/lectures.jsp?category=운동'/>">운동</a></li>
        									<li><a class="dropdown-item" href="<c:url value='/lecture/lectures.jsp?category=요리'/>">요리</a></li>
        									<li><a class="dropdown-item" href="<c:url value='/lecture/lectures.jsp?category=기타'/>">기타</a></li>
    									</ul>
									</li>
                            		<li class="nav-item"><a class="nav-link" href="<c:url value='/user/loginUser.jsp'/>">로그인</a></li>
                            	</c:when>
                            	<c:otherwise>
                            		<li class="nav-item"><a class="nav-link" href="<c:url value='/main/about.jsp'/>">팀원소개</a></li>
                            		<li class="nav-item dropdown">
    									<a class="nav-link dropdown-toggle" id="navbarDropdownLectureList" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">강의</a>
    									<ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownLectureList">
    									    <li><a class="dropdown-item" href="<c:url value='/lecture/lectures.jsp?category=전체'/>">전체</a></li>
        									<li><a class="dropdown-item" href="<c:url value='/lecture/lectures.jsp?category=운동'/>">운동</a></li>
        									<li><a class="dropdown-item" href="<c:url value='/lecture/lectures.jsp?category=요리'/>">요리</a></li>
        									<li><a class="dropdown-item" href="<c:url value='/lecture/lectures.jsp?category=기타'/>">기타</a></li>
    									</ul>
									</li>

                            <li class="nav-item"><a class="nav-link" href="<c:url value='/post/posts.jsp'/>">커뮤니티</a></li>
                             <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="navbarDropdownMyPage" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">[<%=sessionId %>님]</a>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownMyPage">
                                    <li><a class="dropdown-item" href="<c:url value='/profile/myPage.jsp'/>">프로필</a></li>
                                    <li><a class="dropdown-item" href="<c:url value='/main/promotion.jsp'/>">구독</a></li>
                                    <li><a class="dropdown-item" href="<c:url value='/wish/wishlist.jsp'/>">위시리스트</a></li>
                                    <li><a class="dropdown-item" href="<c:url value='/cart/cart.jsp'/>">장바구니</a></li>
                                    <li><a class="dropdown-item" href="#">결제내역</a></li>
                                    <li><a class="dropdown-item" href="<c:url value='/contact/contact.jsp'/>">고객센터</a></li>
                                    <li><a class="dropdown-item" href="<c:url value='/profile/settings.jsp'/>">설정</a></li>
                                    <li><a class="dropdown-item" href="<c:url value='/user/logoutUser.jsp'/>">로그아웃</a></li>
                                </ul>
                             </li>
                             <li class="nav-item"><a class="nav-link text-danger" href="<c:url value='/admin/adminPage.jsp'/>">관리자페이지</a></li>
                             </c:otherwise>
                            </c:choose>
                        </ul>
                    </div>
                </div>
            </nav>
</body>
</html>
