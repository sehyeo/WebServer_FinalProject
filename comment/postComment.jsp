<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dto.Post" %>
<%@ page import="dao.PostRepository" %>
<%@ page errorPage="exceptionNoPostId.jsp" %>
 
<html lang="en">
    <head>
    	<title>Comments</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../resources/css/board.css" rel="stylesheet" />
        <title>글 상세 정보</title>
        <script>
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
    <section>
        <div class="card bg-light">
            <div class="card-body">
                <%@include file="./addComment.jsp" %>
                <jsp:include page="./comments.jsp" />
                
            </div>
        </div>
    </section>
                            