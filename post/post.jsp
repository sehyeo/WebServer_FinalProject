<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dto.Post" %>
<%@ page import="dao.PostRepository" %>
<%@ page errorPage="exceptionNoPostId.jsp" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <html>
    <head>
    	<title>Post</title>
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link href="<c:url value='/resources/css/board.css'/>" rel="stylesheet" />
        <title>글 상세 정보</title>
		<script type="text/javascript">
		    function addComment(event) {
                event.preventDefault();
                const commentText = document.getElementById('commentText').value.trim();
                if (commentText === '') return;
                
                const commentList = document.getElementById('commentList');
                const newComment = document.createElement('div');
                newComment.classList.add('d-flex', 'mb-4');
                
                const commentHTML = `
                    <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                    <div class="ms-3">
                        <div class="fw-bold">You</div>
                        <div>${commentText}</div>
                        <button class="btn btn-sm btn-danger ms-2" onclick="deleteComment(this)">삭제</button>
                    </div>
                `;
                newComment.innerHTML = commentHTML;
                commentList.appendChild(newComment);
                document.getElementById('commentText').value = '';
            }

            function deleteComment(button) {
                const comment = button.parentElement.parentElement;
                comment.remove();
            }
        </script>
    </head>
    <body class="d-flex flex-column">
        <main class="flex-shrink-0">
            <jsp:include page="/menu.jsp" />
            <!-- Page Content-->
            <section class="py-5">
                <div class="container px-5 my-5">
                    <div class="row gx-5">
                        <!-- 프로필 -->
                        <div class="col-lg-3">
                            <div class="d-flex align-items-center mt-lg-5 mb-4">
                                <img class="img-fluid rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." />
                                <div class="ms-3">
                                    <div class="fw-bold">yewon</div>
                                    <div class="text-muted">News, Business</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-9">
                            <!-- Post content-->
                            <%
						        String id=request.getParameter("id");
						       	PostRepository dao=PostRepository.getInstance();
						       	Post post=dao.getPostById(id);
						    %>
                            <article>
                                <!-- Post header-->
                                <header class="mb-4">
                                    <!-- Post title-->
                                    <h1 class="fw-bolder mb-1"><%=post.getTitle() %></h1>
                                    <!-- Post meta content-->
                                    <div class="text-muted fst-italic mb-2"><%=post.getReleaseDate() %></div>
                                    <!-- Post categories-->
                                    <a class="badge bg-secondary text-decoration-none link-light" href="#!"><%=post.getHashtag() %></a>
                                </header>
                                <!-- Preview image figure-->
                                <figure class="mb-4"><img class="img-fluid rounded" alt="..." src="<c:url value='/resources/imgs/<%=post.getReference() %>'/>" /></figure>
                                <%=post.getContents() %>
                            </article><br />
                        </div>
                
            <!-- Comments section-->
			<jsp:include page="/comment/comment.jsp" />    </div>
                </div>
                
            </section>
        </main>
        <jsp:include page="/footer.jsp" />
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="<c:url value='/resources/js/board.js'/>"></script>
    </body>
</html>
