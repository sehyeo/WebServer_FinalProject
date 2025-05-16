<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>문의 접수 결과</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="<c:url value='/resources/css/board.css'/>" rel="stylesheet" />
</head>
<body class="d-flex flex-column">
<main class="flex-shrink-0">
    <jsp:include page="/menu.jsp" />
    <br />
    	<div class="container">
    		<h1>문의 접수 결과</h1>
                        <%
                            String title = request.getParameter("title");
                            String name = request.getParameter("name");
                            String email = request.getParameter("email");
                            String message = request.getParameter("message");

                            if (title != null && name != null && email != null &&  message != null) {
                                String contactDirectory = "D:\\contacts";
                                File dir = new File(contactDirectory);
                                if (!dir.exists()) {
                                    dir.mkdirs();
                                }
                                String contactFileName = "contact_" + System.currentTimeMillis() + ".txt";
                                File contactFile = new File(dir, contactFileName);
                                try (BufferedWriter writer = new BufferedWriter(new FileWriter(contactFile))) {
                                    writer.write("Title: " + title);
                                    writer.newLine();
                                    writer.write("Name: " + name);
                                    writer.newLine();
                                    writer.write("Email: " + email);
                                    writer.newLine();
                                    writer.write("Message: " + message);
                                    writer.newLine();
                                    writer.write("Contact Time: " + new Date().toString());
                                    writer.newLine();
                                } catch (IOException e) {
                                    out.println("<p>문의 내용을 저장하는 중 오류가 발생했습니다: " + e.getMessage() + "</p>");
                                }
                            } else {
                                out.println("<p>모든 필드를 작성해주세요.</p>");
                            }
                        %>
                        <p>문의가 접수되었습니다.</p>
                        <a class="btn btn-primary" href="<c:url value='/contact/contact.jsp'/>">고객센터로 돌아가기</a>
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
