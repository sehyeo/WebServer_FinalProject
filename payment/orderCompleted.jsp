<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="dto.Lecture" %>
<%@ page import="dao.LectureRepository" %>

<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<link href="../resources/css/board.css" rel="stylesheet" />
<title>결제 완료</title>
</head>
<body>
	<main class="flex-shrink-0">
	<%
		String thank="결제 완료. 감사합니다!";
	
		request.setCharacterEncoding("UTF-8");

		String shipping_lectureId="";
		String shipping_cartId="";
		String shipping_name="";
		String shipping_shippingDate="";
		String shipping_country="";
		String shipping_zipCode="";
		String shipping_addressName="";
		
		Cookie[] thanksCookies=request.getCookies();
		
		if(thanksCookies!=null) {
			for(int i=0;i<thanksCookies.length;i++){
				Cookie thisCookie=thanksCookies[i];
				String n=thisCookie.getName();
				if(n.equals("Shipping_cartId"))
					shipping_cartId=URLDecoder.decode((thisCookie.getValue()), "utf-8");
				if(n.equals("Shipping_shippingDate"))
					shipping_shippingDate=URLDecoder.decode((thisCookie.getValue()), "utf-8");
			}
		}
	
		session.invalidate();
		
		for(int i=0;i<thanksCookies.length;i++){
			Cookie thisCookie=thanksCookies[i];
			String n=thisCookie.getName();
			if(n.equals("Shipping_cartId"))
				thisCookie.setMaxAge(0);
			if(n.equals("Shipping_name"))
				thisCookie.setMaxAge(0);
			if(n.equals("Shipping_shippingDate"))
				thisCookie.setMaxAge(0);
			if(n.equals("Shipping_country"))
				thisCookie.setMaxAge(0);
			if(n.equals("Shipping_zipCode"))
				thisCookie.setMaxAge(0);
			if(n.equals("Shipping_addressName"))
				thisCookie.setMaxAge(0);
				
			response.addCookie(thisCookie);
		}
	
		String cartId=session.getId();

		 shipping_cartId="";
		 shipping_name="";
		 shipping_shippingDate="";
		 shipping_country="";
		 shipping_zipCode="";
		 shipping_addressName="";
		
	
		Cookie[] oderConfirmCookies=request.getCookies();
		
		if(oderConfirmCookies!=null){
			for(int i=0;i<oderConfirmCookies.length;i++){
				Cookie thisCookie=oderConfirmCookies[i];
				String n=thisCookie.getName();
				if(n.equals("Shipping_cartId"))
					shipping_cartId=URLDecoder.decode((thisCookie.getValue()), "utf-8");
				if(n.equals("Shipping_name"))
					shipping_name=URLDecoder.decode((thisCookie.getValue()), "utf-8");
				if(n.equals("Shipping_shippingDate"))
					shipping_shippingDate=URLDecoder.decode((thisCookie.getValue()), "utf-8");
				if(n.equals("Shipping_country"))
					shipping_country=URLDecoder.decode((thisCookie.getValue()), "utf-8");
				if(n.equals("Shipping_addressName"))
					shipping_addressName=URLDecoder.decode((thisCookie.getValue()), "utf-8");
			}
		}
	%>	
	<div class="container py-4">
		<%@ include file="../menu.jsp" %>
		
		<div class="p-5 mb-4 bg-body-tertiary rounded-3">
			<div class="container-fluid py-5">
				<h1 class="display-5 fw-bold">결제 완료</h1>
				<p class="col-md-8 fs-4">Order Completed</p>
			</div>
		</div>
		<div class="row align-items-md-stretch alert alert-info">
			<h2 class="alert alert-danger"><%=thank%></h2>
			<p> 결제는 <% out.println(shipping_shippingDate); %>에 배송될 예정입니다!
			<p> 결제번호 :<% out.println(shipping_cartId); %>

			<div class="text-center">
				<h1>영수증</h1>
			</div>
			<div class="row justify-content-between">
				<div class="col-4" align="left">
					<strong>배송 주소</strong> <br> 성명 : <% out.println(shipping_name); %><br>
					우편번호 : <% out.println(shipping_zipCode); %><br>
					주소 : <% out.println(shipping_addressName); %>(<%out.println(shipping_country); %>)<br>
				</div>
				<div class="col-4" align="right">
					<p><em>배송일: <% out.println(shipping_shippingDate); %></em>
				</div>
			</div>
			<div class="py-5">
				<table class="table table-hover">
					<tr>
						<th class="text-center">강의</th>
						<th class="text-center">#</th>
						<th class="text-center">가격</th>
						<th class="text-center">소계</th>
					</tr>
					<%
						long sum=0;
						ArrayList<Lecture> cartList=(ArrayList<Lecture>) session.getAttribute("cartlist");
						if(cartList==null)
							cartList=new ArrayList<Lecture>();
							for(int i=0;i<cartList.size();i++){ // 상품리스트 하나씩 출력하기
								Lecture lecture=cartList.get(i);
								long total=lecture.getUnitPrice() * lecture.getQuantity();
								sum=sum+total;
					%>
					<tr>
						<td class="text-center"><em><%=lecture.getLectureName() %></em></td>
						<td class="text-center"><%=lecture.getQuantity() %></td>
						<td class="text-center"><%=lecture.getUnitPrice() %>원</td>
						<td class="text-center"><%=total %>원</td>
					</tr>
					<%
						}
					%>
					<tr>
						<td> </td>
						<td> </td>
						<td class="text-right"><strong>총액: </strong></td>
						<td class="text-center text-danger"><strong><%=sum %></strong></td>
					</tr>
				</table>
				
				<div class="container">
					<p>	<a href="./ShippingInfo.jsp?cartId=<%=shipping_cartId%>" class="btn btn-secondary" role="button"> 이전 </a>
					<p> <a href="./checkOutCancelled.jsp" class="btn btn-secondary" role="button"> 취소 </a>
					
					<p> <a href="./lectures.jsp" class="btn btn-secondary"> &laquo;강의 목록</a>
				</div>
			</div>
		</div>
	</div>
	</main>
	<%@ include file="../footer.jsp" %>
</body>
</html>