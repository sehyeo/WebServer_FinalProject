<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Footer-->
<footer class="bg-dark py-4 mt-auto">
    <div class="container px-5">
        <div class="row align-items-center justify-content-between flex-column flex-sm-row">
            <div class="col-auto"><div class="small m-0 text-white">Copyright &copy; L!FE 2024</div></div>
            <div class="col-auto">
                <a class="link-light small" href="<c:url value='/footer/privacy.jsp'/>">개인정보처리방침</a>
                <span class="text-white mx-1">&middot;</span>
                <a class="link-light small" href="<c:url value='/footer/terms.jsp'/>">이용약관</a>
                <span class="text-white mx-1">&middot;</span>
                <a class="link-light small" href="<c:url value='/footer/faq.jsp'/>">자주 묻는 질문</a>
            </div>
            
            <div class="col-auto">
				<a class="text-white" href="?language=ko">Korean</a> | <a class="text-white" href="?language=en">English </a>
			</div>			
            
        </div>
    </div>
</footer>