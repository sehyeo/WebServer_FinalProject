<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page import="java.util.*"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.Comparator" %>

<%@ page import="dto.Post" %>
<%@ page import="dao.PostRepository" %>
<%@ page import="mvc.model.BoardDTO"%>

<html>
    <head>
        <title>posts</title>
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link href="<c:url value='/resources/css/board.css'/>" rel="stylesheet" />
        <style>
		.view-options {
		    display: flex;
		    align-items: center;
		}
		
		.view-btn {
		    background-color: transparent;
		    border: none;
		    cursor: pointer;
		    font-size: 24px;
		    margin-right: 5px;
		    opacity: 0.5;
		}
		
		.view-btn.active {
		    opacity: 1;
		}
		
		#content.list-view .post {
		    display: block;
		    width: 100%;
		    height: 50px;
		    margin: 5px 0;
		    background-color: lightgray;
		    text-align: center;
		    line-height: 50px;
		}
        </style>
        <script>
	        function changeView(view) {
	            const content = document.getElementById('content');
	            content.className = view + '-view';
	
	            const buttons = document.querySelectorAll('.view-btn');
	            buttons.forEach(button => button.classList.remove('active'));
	
	            document.getElementById(view + '-view').classList.add('active');
	        }
        </script>
    </head>
    <body class="d-flex flex-column">
        <main class="flex-shrink-0">
            <jsp:include page="/menu.jsp" />
            
            <%
				List postList = (List) request.getAttribute("postlist");	
			%>
			      
			<fmt:setLocale value='<%=request.getParameter("language") %>' />
			<fmt:bundle basename="bundle.message">
	      
            <!-- Page Content-->
            <section class="py-5">
                <div class="container px-5">
                    <h1 class="fw-bolder fs-5 mb-4"><fmt:message key="community" /></h1>
                    
                    <%
				    	PostRepository dao = PostRepository.getInstance();
				        ArrayList<Post> listOfPosts=dao.getAllPosts();
				        
				        Post bestPost = Collections.max(listOfPosts, Comparator.comparingLong(Post::getTotal));
				    %>				    	
                    <div class="card border-0 shadow rounded-3 overflow-hidden">
                        <div class="card-body p-0">
                            <div class="row gx-0">
                                <div class="col-lg-6 col-xl-5 py-lg-5">
                                    <div class="p-4 p-md-5">
                                        <div class="badge bg-primary bg-gradient rounded-pill mb-2">Best</div>
                                        <div class="h2 fw-bolder"><%=bestPost.getTitle() %></div>
                                        <p><%=bestPost.getContents().substring(0, 20) %>...</p>
                                        <a class="stretched-link text-decoration-none" href="./post.jsp?id=<%= bestPost.getPostId() %>">
											<fmt:message key="btn_more" />
                                            <i class="bi bi-arrow-right"></i>
                                        </a>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-xl-7"><div class="bg-featured-blog" style="background-image: url('https://dummyimage.com/700x350/343a40/6c757d')"></div></div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            
            <section class="py-5 bg-light">
                <div class="container px-5">
                    <div class="row gx-5">
                        <div class="col-xl-8">
                            <h2 class="fw-bolder fs-5 mb-4"><fmt:message key="challenge" /></h2>
                            <!-- challenge 수정 -->
                            <div class="mb-4">
                                <div class="small text-muted">May 12, 2023  질의 대답 수 추가</div>
                                <a class="link-dark" href="#!"><h3>음식 소분 관련 질의</h3></a>
                            </div>
                           
                            <div class="text-end mb-5 mb-xl-0">
                                <a class="text-decoration-none" href="<c:url value='/challenge/challenge-overview.jsp'/>">
                                    <fmt:message key="btn_more" />
                                    <i class="bi bi-arrow-right"></i>
                                </a>
                            </div>
                        </div>
                        
 	                    <!-- registSpecialUser 수정 -->
                        <div class="col-xl-4">
                            <div class="card border-0 h-100">
                                <div class="card-body p-4">
                                    <div class="d-flex h-100 align-items-center justify-content-center">
                                        <div class="text-center">
                                            <div class="h6 fw-bolder">Regist</div>
                                            <p class="text-muted mb-4">
                                                강의자 등록 신청
                                                <br />
                                                <a href="#!">press@laif.com</a>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Blog preview section-->
            <section class="py-5">
                <div class="container px-5">
                    <h2 class="fw-bolder fs-5 mb-4">카테고리 선택 뿌리기로 수정하기</h2>
                    
                    <div class="view-options">
				        <button class="view-btn" id="grid-view" onclick="changeView('grid')">&#x1F7E9;</button>
				        <button class="view-btn" id="list-view" onclick="changeView('list')">&#x1F7E8;</button>
				    </div>
				    
				    <div id="content" class="grid-view">
			        <!-- 게시물 예시 -->
			        <div class="post">
			        <%
				    	for (int i=0; i<listOfPosts.size(); i++) {
				    		Post post=listOfPosts.get(i);
				    %>
                    <div class="row gx-5">
                        <div class="col-lg-4 mb-5">
                            <div class="card h-100 shadow border-0">
                                <img class="card-img-top" src="https://dummyimage.com/600x350/ced4da/6c757d" alt="..." />
                                <div class="card-body p-4">
                                    <div class="badge bg-primary bg-gradient rounded-pill mb-2"><%=post.getHashtag() %></div>
                                        <a class="stretched-link text-decoration-none" href="./post.jsp?id=<%= post.getPostId() %>"></a>
                                    <p class="card-text mb-0"><%=post.getContents() %></p>
                                </div>
                                <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                                    <div class="d-flex align-items-end justify-content-between">
                                        <div class="d-flex align-items-center">
                                            <img class="rounded-circle me-3" src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." />
                                            <div class="small">
                                                <div class="fw-bold"><%=post.getAuthor() %></div>
                                                <div class="text-muted"><fmt:message key="btn_more" /> &middot; n분 전에 업로드! 실습 date() 적용</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%
				    	}		
					%>
                    </div>
                    <div class="text-end mb-5 mb-xl-0">
                        <a class="text-decoration-none" href="../BoardListAction.do?pageNum=1"><fmt:message key="btn_more" />
                            <i class="bi bi-arrow-right"></i>
                        </a>
                    </div>
                </div>
                </div>
            </section>
      		</fmt:bundle>
        </main>
        <jsp:include page="/footer.jsp" />
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="<c:url value='/resources/js/board.js'/>"></script>
    </body>
</html>