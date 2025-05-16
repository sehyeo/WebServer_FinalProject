<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%
	String sessionId = (String) session.getAttribute("sessionId");
%>
<html>
<head>
    <title>나의 강의 목록</title>
    <style>
        .body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .container {
            width: 90%;
            margin: 0 auto;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .profile {
            display: flex;
            align-items: center;
            padding-top: 40px;
        }
        .profile img {
            border-radius: 50%;
            margin-right: 20px;
            width: 100px;
            height: 100px;
        }
        .profile h2 {
            margin: 0;
        }
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
        .content {
            width: 75%;
            float: left;
        }
        .content h2 {
            border-bottom: 1px solid #ddd;
            padding-bottom: 10px;
            display: inline-block;
        }
        .category-dropdown {
            display: inline-block;
            float: right;
            margin-top: 20px;
        }
        .content p {
            color: #999;
        }
        .edit-btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 20px;
        }
    </style>
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="<c:url value='/resources/css/board.css'/>" rel="stylesheet" />
</head>
<body class="d-flex flex-column h-100">
<main class="flex-shrink-0">
    <jsp:include page="/menu.jsp" />
    <br />
    <div class="container">
    <div class="profile">
            <img class="rounded-circle me-3" src="https://dummyimage.com/100x100/000/fff" alt="profileimage" />
            <div>
                <h2>[<%=sessionId %>님]</h2>
                <p>수강평 작성수: -</p>
                <p>평균평점: -</p>
            </div>
        </div>
        <br />
        <%@ include file="./sideBar.jsp" %>
        <div class="content">
            <br />
            <div class="d-flex justify-content-between align-items-center">
                <h2>나의 강의목록</h2>
                <div class="category-dropdown">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle text-dark" id="navbarDropdownLectureList" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">카테고리</a>
                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownLectureList">
                            	<li><a class="dropdown-item" href="<c:url value='/lecture/lectures.jsp?category=전체'/>">전체</a></li>
                                <li><a class="dropdown-item" href="<c:url value='/lecture/lectures.jsp?category=운동'/>">운동</a></li>
                                <li><a class="dropdown-item" href="<c:url value='/lecture/lectures.jsp?category=요리'/>">요리</a></li>
                                <li><a class="dropdown-item" href="<c:url value='/lecture/lectures.jsp?category=코딩'/>">기타</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
            <br />
            <button><a href="<c:url value='/lecture/addLecture.jsp'/>">등록하기</a></button>
            <br /><br />
            <div class="list-group">
                <%
                    // 카테고리 파라미터를 받아옵니다.
                    String selectedCategory = request.getParameter("category");

                    // 동영상 정보가 저장된 디렉토리
                    String saveDirectory = "D:\\uploadVideo";
                    File dir = new File(saveDirectory);
                    File[] files = dir.listFiles((d, name) -> name.startsWith("videoList") && name.endsWith(".txt"));
                    Arrays.sort(files);  // 파일을 정렬하여 순서대로 출력

                    if (files != null && files.length > 0) {
                        boolean lectureFound = false;
                        for (File videoFile : files) {
                            BufferedReader br = null;
                            try {
                                br = new BufferedReader(new FileReader(videoFile));
                                String line;
                                while ((line = br.readLine()) != null) {
                                    String[] videoInfo = line.split("\\|");
                                    if (videoInfo.length == 6) {
                                        String lectureName = videoInfo[0];
                                        String title = videoInfo[1];
                                        String category = videoInfo[2];
                                        String description = videoInfo[3];
                                        String filename = videoInfo[4];
                                        String uploadDate = videoInfo[5];

                                        // 카테고리가 선택되지 않았거나, 선택된 카테고리와 일치하는 경우에만 출력
                                        if (selectedCategory == null || selectedCategory.equals(category)) {
                                            lectureFound = true;
                %>
                <a href="/lecture/<%= "lectureDetail.jsp?lecture=" + java.net.URLEncoder.encode(title, "UTF-8") %>" class="list-group-item list-group-item-action">
                    <div class="d-flex w-100 justify-content-between">
                        <h5 class="mb-1"><%= title %></h5>
                        <small>업로드 날짜: <%= uploadDate %></small>
                    </div>
                    <p class="mb-1">강의명: <%= lectureName %> | 카테고리: <%= category %></p>
                </a>
                <%
                                        }
                                    } else {
                %>
                <p>파일 형식이 올바르지 않습니다: <%= line %></p>
                <%
                                    }
                                }
                            } catch (IOException e) {
                                out.println("파일을 읽는 중 오류가 발생했습니다: " + e.getMessage());
                            } finally {
                                if (br != null) {
                                    try {
                                        br.close();
                                    } catch (IOException e) {
                                        out.println("파일을 닫는 중 오류가 발생했습니다: " + e.getMessage());
                                    }
                                }
                            }
                        }
                        if (!lectureFound) {
                %>
                <p>선택한 카테고리의 강의가 없습니다.</p>
                <%
                        }
                    } else {
                %>
                <p>업로드된 동영상이 없습니다.</p>
                <%
                    }
                %>
            </div>
        </div>
    </div>
</main>
<br />
<jsp:include page="/footer.jsp" />
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="<c:url value='/resources/js/board.js'/>"></script>
</body>
</html>
