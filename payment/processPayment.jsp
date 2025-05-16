<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<html>
<head>
    <link href="../resources/css/board.css" rel="stylesheet" />
    <link href="../resources/css/bootstrap.min.css" rel="stylesheet" />
    <title>결제 처리</title>
    <style>
        .paycontainer {
            margin: 0 auto;
            padding: 20px;
        }
        h1 {
            font-size: 24px;
        }
        p {
            font-size: 18px;
            margin: 10px 0;
        }
    </style>
</head>
<body class="d-flex flex-column h-100">
<main class="flex-shrink-0">
<%@ include file="../menu.jsp" %>
    <div class="paycontainer">
        <h1>결제가 완료되었습니다.</h1>
        <%
            String name = request.getParameter("name");
            String phone1 = request.getParameter("phone1");
            String phone2 = request.getParameter("phone2");
            String phone3 = request.getParameter("phone3");
            String email1 = request.getParameter("email1");
            String email2 = request.getParameter("email2");
            String paymentMethod = request.getParameter("paymentMethod");

            String phone = phone1 + "-" + phone2 + "-" + phone3;
            String email = email1 + "@" + email2;

            // 결제 처리 로직 추가 (예: 데이터베이스 저장, 결제 API 호출 등)


			request.setCharacterEncoding("UTF-8");
			
			Cookie cartId=new Cookie("Shipping_cartId", URLEncoder.encode(request.getParameter("cartId"), "utf-8"));
			Cookie shippinfName=new Cookie("Shipping_name", URLEncoder.encode(request.getParameter("name"), "utf-8"));
			Cookie shippingDate=new Cookie("Shipping_shippingDate", URLEncoder.encode(request.getParameter("shippingDate"), "utf-8"));
			Cookie country=new Cookie("Shipping_country", URLEncoder.encode(request.getParameter("country"), "utf-8"));
			Cookie zipCode=new Cookie("Shipping_zipCode", URLEncoder.encode(request.getParameter("zipCode"), "utf-8"));
			Cookie addressName=new Cookie("Shipping_addressName", URLEncoder.encode(request.getParameter("addressName"), "utf-8"));
			
			cartId.setMaxAge(24 * 60 * 60);
			shippinfName.setMaxAge(24 * 60 * 60);
			zipCode.setMaxAge(24 * 60 * 60);
			country.setMaxAge(24 * 60 * 60);
			addressName.setMaxAge(24 * 60 * 60);
			
			response.addCookie(cartId);
			response.addCookie(shippinfName);
			response.addCookie(shippingDate);
			response.addCookie(country);
			response.addCookie(zipCode);
			response.addCookie(addressName);
			
			response.sendRedirect("orderConfirmation.jsp");
		%>
        <p>이름: <%= name %></p>
        <p>휴대폰 번호: <%= phone %></p>
        <p>이메일: <%= email %></p>
        <p>결제 방법: <%= paymentMethod %></p>
        <br />
        <div><a class="btn btn-outline-primary" href="#">결제내역 보러가기</a></div>
    </div>
    </main>
    <%@ include file="../footer.jsp" %>
	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="./resources/js/board.js"></script>

</body>
</html>
